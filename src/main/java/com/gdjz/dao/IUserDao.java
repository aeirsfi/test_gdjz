package com.gdjz.dao;

import com.gdjz.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {
    User selectUser(int id);
    User login(@Param("username") String username, @Param("password") String password);
    List<User> listAllUser();
    User getUser(String username);
    void insertUser(User user);
    User getUserById(int id);
    void updateUser(User user);
    void deleteUser(int id);
    //根据用户名模糊查询
    List<User> listUser(String username);
    void updatePassword(User user);
}
