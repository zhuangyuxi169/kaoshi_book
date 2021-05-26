package cn.kgc.demo.dao;

import cn.kgc.demo.pojo.Sale;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SaleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sale record);

    int insertSelective(Sale record);

    Sale selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sale record);

    int updateByPrimaryKey(Sale record);

    //分页模糊查询
    List<Sale> selBookInfoByParams(@Param("name") String searchName);
}