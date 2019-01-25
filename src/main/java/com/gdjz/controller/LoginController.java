package com.gdjz.controller;

import com.gdjz.model.User;
import com.gdjz.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private IUserService iUserService;

    @RequestMapping(value = "/toLogin.do")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/toLogout.do")
    public String toLogout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/toLogin.do";
    }

    @RequestMapping(value = "/login.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String login(String username, String password, HttpServletRequest request){
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        String error = null;

        try {
            subject.login(token);
        }   catch (UnknownAccountException e) {
            error = "用户名/密码错误";
        } catch (IncorrectCredentialsException e) {
            error = "用户名/密码错误";
        } catch (AuthenticationException e) {
            //其他错误，比如锁定，如果想单独处理请单独catch处理
            error = "其他错误：" + e.getMessage();
        }

        if (error != null) {
            return error;
        }

        User user = iUserService.getUser(username);
        request.getSession().setAttribute("userId", user.getId());
        request.getSession().setAttribute("loginName", user.getUsername());
        return "登录成功！";
    }

    @RequestMapping(value = "/toManagePage.do")
    public String toManagePage(){
        return "managePage";
    }

    @RequestMapping(value = "/toUserManage.do")
    public String toUserManage(HttpServletRequest request) {
        List<User> userList = iUserService.listAllUser();
        request.getSession().setAttribute("userList",userList);
        return "userManage";
    }

    @RequestMapping(value = "/toChangePwd.do")
    public String toChangePwd(){
        return "changePwd";
    }

    @RequestMapping(value = "/toUserInfor.do")
    public String toUserInfor(Model model, HttpSession session){
        int id = Integer.parseInt(session.getAttribute("userId").toString());
        User user = iUserService.getUserById(id);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        System.out.println(sdf.format(user.getUpdateDate()));
//        String s = sdf.format(user.getUpdateDate());
        model.addAttribute("user", user);
        return "userInfor";
    }

    @ResponseBody
    @RequestMapping(value = "/userList.do", method = RequestMethod.GET)
    public Map<String, Object> userList(int pageNumber, int pageSize, User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",iUserService.listUser(user.getUsername()).size());
        PageHelper.startPage(pageNumber, pageSize);
        List<User> userList = iUserService.listUser(user.getUsername());
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        map.put("rows",pageInfo.getList());
        return map;
    }

}
