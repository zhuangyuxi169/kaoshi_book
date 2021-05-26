package cn.kgc.demo.dao;

import cn.kgc.demo.pojo.Product;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selBookTypeAll();

    @Select("select * from product where id = #{id}")
    List<Product> selReplyDetailByInvId(@Param("id") Integer invId);
}
