package com.gdjz.dao;

import com.gdjz.model.Article;

import java.util.List;

public interface IArticleDao {
    void insertArticle(Article article);
    Article getArticle(String title);
    Article getArticleById(int id);
    void deleteArticle(int id);
    void updateArticle(Article article);
    //根据标题名来模糊查找文章
    List<Article> listArticle(String keyword);
    //找到所有文章
    List<Article> listAllArticle();
}
