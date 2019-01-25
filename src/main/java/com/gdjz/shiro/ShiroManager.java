package com.gdjz.shiro;

import com.gdjz.model.User;
import com.gdjz.service.IUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroManager extends AuthorizingRealm {
    @Autowired
    private IUserService iUserService;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

//    登录认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
       String username = authenticationToken.getPrincipal().toString();
       String password = new String ((char[]) authenticationToken.getCredentials());
       User user = iUserService.login(username, password);

       if (user != null) {
           AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(username, password, "shiroManager");
           return authenticationInfo;
       }

        return null;
    }
}
