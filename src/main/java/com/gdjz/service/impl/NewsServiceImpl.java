package com.gdjz.service.impl;

import com.gdjz.dao.INewsDao;
import com.gdjz.model.News;
import com.gdjz.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iNewsService")
public class NewsServiceImpl implements INewsService {
    @Autowired
    private INewsDao iNewsDao;

    public boolean insertNews(News news) {
        News news1 = iNewsDao.getNews(news.getTitle());

        if (news1 == null) {
            iNewsDao.insertNews(news);
            return true;
        }

        return false;
    }

    public List<News> listAllNews() {
        return iNewsDao.listAllNews();
    }

    public News getNewsById(int id) {
        return iNewsDao.getNewsById(id);
    }

    public boolean updateNews(News news) {
        News originalNews = iNewsDao.getNewsById(news.getId());
        News news1 = iNewsDao.getNews(news.getTitle());

        if (!originalNews.getTitle().equals(news.getTitle()) && news1 != null) {
            return false;
        }

        iNewsDao.updateNews(news);
        return true;
    }

    public void deleteNews(int id) {
        iNewsDao.deleteNews(id);
    }

    public List<News> listNewsByTitle(String title) {
        return iNewsDao.listNewsByTitle(title);
    }

    public List<News> listTopTwoNews() {
        return iNewsDao.listTopTwoNews();
    }
}
