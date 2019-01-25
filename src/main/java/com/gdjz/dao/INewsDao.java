package com.gdjz.dao;

import com.gdjz.model.News;

import java.util.List;

public interface INewsDao {
    void insertNews(News news);
    void deleteNews(int id);
    void updateNews(News news);
    News getNews(String title);
    News getNewsById(int id);
    //得到所有新闻
    List<News> listAllNews();

    List<News> listNewsByTitle(String title);

    List<News> listTopTwoNews();

}
