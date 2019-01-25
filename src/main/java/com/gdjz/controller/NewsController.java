package com.gdjz.controller;

import com.gdjz.model.News;
import com.gdjz.service.INewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NewsController {
    @Autowired
    private INewsService iNewsService;

    @RequestMapping(value = "/toNewsManage.do")
    public String toNewsManage(HttpServletRequest request) {
        List<News> newsList = iNewsService.listAllNews();
        request.getSession().setAttribute("newsList", newsList);
        return "newsManage";
    }

    @RequestMapping(value = "/addNews.do", produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String addNews(MultipartFile file, News news, HttpServletRequest request){
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            news.setMainPicture("http://188.188.3.167:8084/upload/" + fileName);

            try{
                file.transferTo(dir);
            }catch (Exception e){
                return e.toString();
            }
        }

        Date now = new Date();
        news.setCreateDate(now);
        news.setUpdateDate(now);

        if (iNewsService.insertNews(news)) {
            return "添加成功！";
        }

        return "添加失败！";
    }

    @RequestMapping(value = "/toChangeNews.do", method = RequestMethod.POST)
    @ResponseBody
    public News toChangeNews(int id){
        News news = iNewsService.getNewsById(id);
        return news;
    }

    @RequestMapping(value = "/changeNews.do", method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String changeNews(MultipartFile file, News news, HttpServletRequest request) throws IOException {
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            news.setMainPicture("http://188.188.3.167:8084/upload/" + fileName);
            file.transferTo(dir);
        } else {
            News news1 = iNewsService.getNewsById(news.getId());
            news.setMainPicture(news1.getMainPicture());
        }

        Date now = new Date();
        news.setUpdateDate(now);

        if (iNewsService.updateNews(news)) {
            return "修改成功！";
        } else {
            return "修改失败！";
        }
    }

    @RequestMapping(value = "/deleteNews.do", method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String deleteNews(int id){
        try {
            iNewsService.deleteNews(id);
        } catch (Exception e) {
            return e.toString();
        }

        return "删除成功！";
    }

    @RequestMapping(value = "/searchNews.do")
    public String searchNews(String title, HttpServletRequest request){
        List<News> newsList = iNewsService.listNewsByTitle(title);
        request.getSession().setAttribute("newsList", newsList);
        return "newsManage";
    }

    @ResponseBody
    @RequestMapping(value = "/newsList.do", method = RequestMethod.GET)
    public Map<String, Object> newsList(int pageNumber, int pageSize, News news){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", iNewsService.listNewsByTitle(news.getTitle()).size());
        PageHelper.startPage(pageNumber, pageSize);
        List<News> newsList = iNewsService.listNewsByTitle(news.getTitle());
        PageInfo<News> pageInfo = new PageInfo<News>(newsList);
        map.put("rows", pageInfo.getList());
        return map;
    }

    @RequestMapping(value = "/toAddNewsPage.do", method = RequestMethod.GET)
    public String toAddNewsPage(){
        return "addNewsPage";
    }

}
