package com.gdjz.service.impl;

import com.gdjz.dao.IArticleDao;
import com.gdjz.model.Article;
import com.gdjz.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iArticleService")
public class ArticleServiceImpl implements IArticleService {
    @Autowired
    private IArticleDao iArticleDao;

    public boolean insertArticle(Article article) {
        Article article1 = iArticleDao.getArticle(article.getTitle());

        if (article1 == null) {
            iArticleDao.insertArticle(article);
            return true;
        }

        return false;
    }

    public Article getArticle(String title) {
        return iArticleDao.getArticle(title);
    }

    public void deleteArticle(int id) {
        iArticleDao.deleteArticle(id);
    }

    public boolean updateArticle(Article article) {
        Article originalArc = iArticleDao.getArticleById(article.getId());
        Article article1 = iArticleDao.getArticle(article.getTitle());

        if (!originalArc.getTitle().equals(article.getTitle()) && article1 != null) {
            return false;
        }

        iArticleDao.updateArticle(article);
        return true;
    }

    public List<Article> listAllArticle() {
        return iArticleDao.listAllArticle();
    }

    public Article getArticleById(int id) {
        return iArticleDao.getArticleById(id);
    }

    public List<Article> listArticle(String title) {
        return iArticleDao.listArticle(title);
    }
}
