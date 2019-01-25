package com.gdjz.service;

import com.gdjz.model.News;

import java.util.List;

public interface INewsService {
    boolean insertNews(News news);
    List<News> listAllNews();
    News getNewsById(int id);
    boolean updateNews(News news);
    void deleteNews(int id);
    List<News> listNewsByTitle(String title);
    List<News> listTopTwoNews();

}
