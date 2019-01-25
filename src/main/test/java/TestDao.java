import com.gdjz.dao.IArticleDao;
import com.gdjz.dao.INewsDao;
import com.gdjz.dao.IUserDao;
import com.gdjz.model.Article;
import com.gdjz.model.Link;
import com.gdjz.model.News;
import com.gdjz.model.User;
import com.gdjz.service.IArticleService;
import com.gdjz.service.ILinkService;
import com.gdjz.service.INewsService;
import com.gdjz.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestDao {
    @Autowired
    private IUserService iUserService;

    @Autowired
    private IArticleService iArticleService;

    @Autowired
    private IArticleDao iArticleDao;

    @Autowired
    private ILinkService iLinkService;

    @Autowired
    private INewsService iNewsService;

    @Autowired
    private INewsDao iNewsDao;

    @Test
    public void testSelectUser(){
        int id = 1;
        User user = iUserService.selectUser(id);
        User user1 = iUserService.login("zhang","123456");
        System.out.println(user.getUsername());
        System.out.println(user1.getUsername());
    }

    @Test
    public void testListArticle(){
        List<Article> list = iArticleDao.listArticle("23");

        for (Article article : list) {
            System.out.println(article.getTitle());
        }
    }

    @Test
    public void testInsertArticle(){
        Article article = new Article();
//        article.setId(2);
        article.setContent("djfaghghah");
        article.setTitle("ahgh1");
        article.setSummary("hagh");
        article.setCreateDate(new Date());
        article.setUpdateDate(new Date());
        boolean flag = iArticleService.insertArticle(article);
        System.out.println(flag);

    }

    @Test
    public void testList(){
        List<User> list = iUserService.listAllUser();

        for (User user : list) {
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
        }

    }

    @Test
    public void testUpdateArticle(){
        Article article = new Article();
        article.setId(14);
        article.setTitle("4444");
        article.setContent("4444");
        article.setUpdateDate(new Date());

        iArticleService.updateArticle(article);
    }

    @Test
    public void testInsertUser(){
        User user = new User();
        user.setUsername("zhang1");
        user.setPassword("1234");
        user.setNote("123");
        user.setUpdateDate(new Date());
        user.setCreateDate(new Date());

        System.out.println(iUserService.insertUser(user));

    }

    @Test
    public void testUpdateLink(){
        Link link = new Link();
        link.setName("zaz");
        link.setUrl("sss");
        link.setId(2);
        link.setUpdateDate(new Date());
        link.setNote("232");

        iLinkService.updateLink(link);

        System.out.println(iLinkService.getLinkById(2).getName());
    }

    @Test
    public void testInsertNews(){
        News news = new News();
        news.setMainPicture("http://localhost:8081/ueditor/jsp/upload/image/20190110/bg.jpg");
        news.setContent("fa");
        news.setSummary("ds");
        news.setTitle("fds1");
        news.setUpdateDate(new Date());
        news.setCreateDate(new Date());

        boolean flag = iNewsService.insertNews(news);
        System.out.println(flag);
    }

    @Test
    public void testListNews(){
        List<News> list = iNewsDao.listTopTwoNews();
        System.out.println(list.size());
    }
}
