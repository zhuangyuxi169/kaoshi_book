package cn.kgc.demo.service;

import cn.kgc.demo.pojo.Users;

import java.util.List;

public interface UserService {
    int insert(Users record);

    List<Users> selectUserByName(Users record);
    Users login(Users record);
    int deleteByPrimaryKey(Integer id);
    Users selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Users record);
}