package com.gdjz.controller;

import com.gdjz.model.Link;
import com.gdjz.service.ILinkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LinkController {
    @Autowired
    private ILinkService iLinkService;

    @RequestMapping(value = "/toLinkManage.do")
    public String toLinkManage(HttpServletRequest request){
        List<Link> linkList = iLinkService.listAllLink();
        request.getSession().setAttribute("linkList", linkList);
        return "linkManage";
    }

    @RequestMapping(value = "/addLink.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String addLink(Link link){
        Date now = new Date();
        link.setCreateDate(now);
        link.setUpdateDate(now);

        try {
            iLinkService.insertLink(link);
        } catch (Exception e) {
            return e.toString();
        }

        return "添加成功！";
    }

    @RequestMapping(value = "/toChangeLink.do")
    @ResponseBody
    public Link toChangeLink(int id){
        Link link = iLinkService.getLinkById(id);
        return link;
    }

    @RequestMapping(value = "/changeLink.do", produces = {"text/html; charset=utf-8"})
    @ResponseBody
    public String changeLink(Link link){
        link.setUpdateDate(new Date());

        try{
            iLinkService.updateLink(link);
        } catch (Exception e) {
            return e.toString();
        }

        return "修改成功！";
    }

    @RequestMapping(value = "/deleteLink.do", produces = {"text/html; charset=utf-8"})
    @ResponseBody
    public String deleteLink(int id){
        try {
            iLinkService.deleteLink(id);
        } catch (Exception e) {
            return e.toString();
        }

        return "删除成功！";
    }

    @ResponseBody
    @RequestMapping(value = "/linkList.do", method = RequestMethod.GET)
    public Map<String, Object> linkList(int pageNumber, int pageSize, Link link) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",iLinkService.listLinkByName(link.getName()).size());
        PageHelper.startPage(pageNumber, pageSize);
        List<Link> linkList = iLinkService.listLinkByName(link.getName());
        PageInfo<Link> pageInfo = new PageInfo<Link>(linkList);
        map.put("rows",pageInfo.getList());
        return map;
    }
}
