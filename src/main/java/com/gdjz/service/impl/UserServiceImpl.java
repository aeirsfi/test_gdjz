package com.gdjz.service.impl;

import com.gdjz.dao.IUserDao;
import com.gdjz.model.User;
import com.gdjz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iUserService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao iUserDao;

    public User selectUser(int id) {
        return iUserDao.selectUser(id);
    }

    public User login(String username, String password) {
        return iUserDao.login(username, password);
    }

    public List<User> listAllUser() {
        List<User> userList = iUserDao.listAllUser();
        return userList;
    }

    public User getUser(String username) {
        return iUserDao.getUser(username);
    }

    public boolean insertUser(User user) {
        User temp = iUserDao.getUser(user.getUsername());

        if (temp == null) {
            iUserDao.insertUser(user);
            return true;
        }

        return false;
    }

    public User getUserById(int id) {
        return iUserDao.getUserById(id);
    }

    public boolean updateUser(User user) {
        User original = iUserDao.getUserById(user.getId());
        User tempUser = iUserDao.getUser(user.getUsername());

        if (!original.getUsername().equals(user.getUsername()) && tempUser != null) {
            return false;
        }

        iUserDao.updateUser(user);
        return true;
    }

    public void deleteUser(int id) {
        iUserDao.deleteUser(id);
    }

    public List<User> listUser(String username) {
        return iUserDao.listUser(username);
    }

    public void updatePassword(User user) {
        iUserDao.updatePassword(user);
    }
}
