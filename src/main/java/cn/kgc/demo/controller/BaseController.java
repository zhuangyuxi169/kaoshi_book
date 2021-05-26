package cn.kgc.demo.controller;

import cn.kgc.demo.pojo.Sale;
import cn.kgc.demo.service.DemoService;
import cn.kgc.utils.Consants;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("goods")
public class BaseController {

    @Autowired
    private DemoService demoService;

    /**
     *  根据搜索条件进行分页查询图书信息列表
     * @param searchName  搜索条件
     * @param model  封装数据
     * @param pageNum 当前页码
     * @return list.jsp
     */
    @RequestMapping("list")
    public String list(@RequestParam(required = false) String searchName,
                       Model model,
                       @RequestParam(defaultValue = "1") Integer pageNum){
        //分页查询
        PageInfo pageInfo = demoService.findBookInfoByPage(searchName,pageNum, Consants.PAGE_SIZE);
        //封装数据
        model.addAttribute("pageInfo",pageInfo);
        //回显查询条件

        model.addAttribute("searchName",searchName);

        return "list";
    }

    //根据帖子id，删除帖子列表和回复信息
    @RequestMapping("del/{bookId}")
    public String delInvAndReplayDetail(@PathVariable("bookId") Integer bookId, Model model){
        boolean b = demoService.removeBookInfoAndBookTypeById(bookId);
        //判断提示消息
        if(b){
            model.addAttribute("delMsg","删除成功！");
        }else{
            model.addAttribute("delMsg","删除失败！");
        }
        return "forward:/bookInfo/list";
    }

    //根据Id新增图书信息
    @RequestMapping("add")
    public String add(
            // @PathVariable("bookId") Integer bookId,
            Sale sale,
            Model model){
        //封装bookInfo实体信息
        sale.setSaledate(new Date());
        //设置当前回复信息的帖子id

        // bookInfo.setBookId(bookId);
        //保存
        boolean b =  demoService.saveBookInfo(sale);
        //判断提示消息
        if(b){
            model.addAttribute("saveMsg","添加成功！");
        }else{
            model.addAttribute("saveMsg","添加失败！");
        }
        //转发
        return "forward:/bookInfo/list";
    }

    //根据帖子id分页查看回复信息列表
    @RequestMapping("cat/{id}")
    public String catReplyDetail(
            @PathVariable("id") Integer id,
            Model model,
            @RequestParam(defaultValue = "1") Integer pageNum){
        //根据帖子id分页查看回复信息列表
        PageInfo pageInfo = demoService.findReplyDetailByPage(id, pageNum, Consants.PAGE_SIZE);
        model.addAttribute("pageInfo",pageInfo);
        //回显invId
        model.addAttribute("id",id);
        return "replyDetail";
    }
}
