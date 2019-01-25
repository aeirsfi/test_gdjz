package com.gdjz.controller;

import com.gdjz.model.User;
import com.gdjz.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private IUserService iUserService;

    @RequestMapping(value = "/addUser.do",method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String addUser(String username, String password, String note){
        Date now = new Date();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNote(note);
        user.setCreateDate(now);
        user.setUpdateDate(now);

        if (iUserService.insertUser(user)) {
            return "添加成功！";
        } else {
            return "添加失败，用户已存在！";
        }
    }

    @RequestMapping(value = "/toChangeUser.do")
    @ResponseBody
    public User toChangeUser(int id){
        User user = iUserService.getUserById(id);
        return user;
    }

    @RequestMapping(value = "/changeUser.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String changeUser(int id, String username, String note){
        User user = iUserService.getUserById(id);
        user.setUsername(username);
        user.setNote(note);
        user.setUpdateDate(new Date());

        if (iUserService.updateUser(user)) {
            return "修改成功！";
        } else {
            return "修改失败，用户名已存在！";
        }
    }

    @RequestMapping(value = "/deleteUser.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String deleteUser(int id){
        int userId = id;
        iUserService.deleteUser(userId);
        return "删除成功!";
    }

    @RequestMapping(value = "/changePwd.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String changePwd(String originalPwd, String newPwd, String newPwdAgain, HttpSession session){
        int id = Integer.parseInt(session.getAttribute("userId").toString());
        User user = iUserService.getUserById(id);

        if (!user.getPassword().equals(originalPwd)) {
            return "原密码错误！";
        }

        if (!newPwd.equals(newPwdAgain)) {
            return "2个新密码不一致！";
        }

        user.setPassword(newPwd);
        iUserService.updatePassword(user);
        return "密码修改成功！";
    }
}
