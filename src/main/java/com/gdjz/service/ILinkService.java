package com.gdjz.service;

import com.gdjz.model.Link;

import java.util.List;

public interface ILinkService {
    void insertLink(Link link);
    List<Link> listAllLink();
    List<Link> listLinkByName(String name);
    void updateLink(Link link);
    void deleteLink(int id);
    Link getLinkById(int id);
}
