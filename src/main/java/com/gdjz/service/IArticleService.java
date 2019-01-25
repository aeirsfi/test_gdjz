package com.gdjz.service;

import com.gdjz.model.Article;

import java.util.List;

public interface IArticleService {
    boolean insertArticle(Article article);
    Article getArticle(String title);
    void deleteArticle(int id);
    boolean updateArticle(Article article);
    List<Article> listAllArticle();
    Article getArticleById(int id);
    List<Article> listArticle(String title);
}
