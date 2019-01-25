package com.gdjz.dao;

import com.gdjz.model.Link;

import java.util.List;

public interface ILinkDao {
    void insertLink(Link link);
    void deleteLink(int id);
    void updateLink(Link link);
    Link getLink(String name);
    Link getLinkById(int id);
    List<Link> listAllLink();
    List<Link> listLinkByName(String name);
}
