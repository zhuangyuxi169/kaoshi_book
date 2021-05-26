package cn.kgc.demo.service;

import cn.kgc.demo.pojo.Product;
import cn.kgc.demo.pojo.Sale;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface  DemoService {

    //根据搜索条件进行分页查询图书列表
    PageInfo findBookInfoByPage(String searchName, Integer pageNum, Integer pageSize);

    //根据主键ID删除图书信息和图书类型信息
    boolean removeBookInfoAndBookTypeById(Integer bookId);

    boolean saveBookInfo(Sale sale);

    List<Product> getBookType();

    //根据帖子id分页查看回复信息列表
    PageInfo findReplyDetailByPage(Integer invId, Integer pageNum, Integer pageSize);
}
