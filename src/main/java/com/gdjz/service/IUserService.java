package com.gdjz.service;

import com.gdjz.model.User;

import java.util.List;

public interface IUserService {
    User selectUser(int id);
    User login(String username, String password);
    List<User> listAllUser();
    User getUser(String username);
    boolean insertUser(User user);
    User getUserById(int id);
    boolean updateUser(User user);
    void deleteUser(int id);
    List<User> listUser(String username);
    void updatePassword(User user);
}
