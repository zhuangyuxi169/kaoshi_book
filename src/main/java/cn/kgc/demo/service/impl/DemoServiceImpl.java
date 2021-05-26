package cn.kgc.demo.service.impl;

import cn.kgc.demo.dao.ProductMapper;
import cn.kgc.demo.dao.SaleMapper;
import cn.kgc.demo.pojo.Product;
import cn.kgc.demo.pojo.Sale;
import cn.kgc.demo.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = false)
public class DemoServiceImpl implements DemoService {

    @Autowired
    private SaleMapper saleMapper;

    @Autowired
    private ProductMapper productMapper;

    @Override
    public PageInfo findBookInfoByPage( String searchName, Integer pageNum, Integer pageSize) {
        //1.开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //2.查询数据
        List<Sale> list = saleMapper.selBookInfoByParams(searchName);
        //3.分装pageInfo
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public boolean removeBookInfoAndBookTypeById(Integer bookId) {
        try{
            //根据帖子id删除帖子信息
            saleMapper.deleteByPrimaryKey(bookId);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean saveBookInfo(Sale sale) {
        if(saleMapper.insert(sale) > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<Product> getBookType() {
        List<Product> list = productMapper.selBookTypeAll();
        return list;
    }

    @Override
    public PageInfo findReplyDetailByPage(Integer invId, Integer pageNum, Integer pageSize) {
        //1.开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //2.查询数据
        //根据帖子id查询回复信息列表
        List<Product> list = productMapper.selReplyDetailByInvId(invId);
        //3.封装pageInfo
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

}
