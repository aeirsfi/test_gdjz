package com.gdjz.service.impl;

import com.gdjz.dao.ILinkDao;
import com.gdjz.model.Link;
import com.gdjz.service.ILinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iLinkService")
public class LinkServiceImpl implements ILinkService {
    @Autowired
    ILinkDao iLinkDao;

    public void insertLink(Link link) {
        iLinkDao.insertLink(link);
    }

    public List<Link> listAllLink() {
        return iLinkDao.listAllLink();
    }

    public List<Link> listLinkByName(String name) {
        return iLinkDao.listLinkByName(name);
    }

    public void updateLink(Link link) {
        iLinkDao.updateLink(link);
    }

    public void deleteLink(int id) {
        iLinkDao.deleteLink(id);
    }

    public Link getLinkById(int id) {
        return iLinkDao.getLinkById(id);
    }
}
