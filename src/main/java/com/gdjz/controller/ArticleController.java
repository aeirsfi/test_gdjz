package com.gdjz.controller;

import com.gdjz.model.Article;
import com.gdjz.model.Link;
import com.gdjz.service.IArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ArticleController {
    @Autowired
    private IArticleService iArticleService;

    @RequestMapping(value = "/toArticleManage.do")
    public String toArticleManage(HttpServletRequest request){
        List<Article> articleList = iArticleService.listAllArticle();
        request.getSession().setAttribute("articleList", articleList);
        return "articleManage";
    }

    @RequestMapping(value = "/addArticle.do",method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String addArticle(Article article){
        Date now = new Date();
        article.setCreateDate(now);
        article.setUpdateDate(now);

        if (iArticleService.insertArticle(article)) {
            return "添加成功！";
        }

        return "添加失败！";
    }

    @RequestMapping(value = "/toChangeArticle.do")
    @ResponseBody
    public Article toChangeArticle(int id){
        Article article = iArticleService.getArticleById(id);
        return article;
    }

    @RequestMapping(value = "/changeArticle.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String changeArticle(Article article){
        article.setUpdateDate(new Date());

        if (iArticleService.updateArticle(article)) {
            return "修改成功！";
        }

        return "修改失败！";
    }

    @RequestMapping(value = "/deleteArticle.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String deleteArticle(int id){
        try {
            iArticleService.deleteArticle(id);
        } catch(Exception e){
            return e.toString();
        }

        return "删除成功！";
    }

    @ResponseBody
    @RequestMapping(value = "/articleList.do", method = RequestMethod.GET)
    public Map<String, Object> articleList(int pageNumber, int pageSize, Article article){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", iArticleService.listArticle(article.getTitle()).size());
        PageHelper.startPage(pageNumber, pageSize);
        List<Article> articleList = iArticleService.listArticle(article.getTitle());
        PageInfo<Article> pageInfo = new PageInfo<Article>(articleList);
        map.put("rows", pageInfo.getList());
        return map;
    }
}
