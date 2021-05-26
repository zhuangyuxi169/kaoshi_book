package cn.kgc.demo.service.impl;
import cn.kgc.demo.dao.UsersMapper;
import cn.kgc.demo.pojo.Users;
import cn.kgc.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class  UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper mapper;

    public  int insert(Users record){
        return mapper.insert(record);
    }
    public List<Users> selectUserByName(Users record){
        return mapper.selectUserByName(record);
    }
    public Users login(Users record){
        return mapper.login(record);
    }
    public int deleteByPrimaryKey(Integer id){
        return mapper.deleteByPrimaryKey(id);
    }
    public Users selectByPrimaryKey(Integer id){
        return  mapper.selectByPrimaryKey(id);
    }
    public int updateByPrimaryKey(Users record){
        return mapper.updateByPrimaryKey(record);
    }
}