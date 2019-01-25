package com.gdjz.service;

import com.gdjz.model.Picture;

import java.util.List;

public interface IPictureService {
    List<Picture> listAllPicture();
    boolean insertPicture(Picture picture);
    void deletePicture(int id);
    boolean updatePicture(Picture picture);
    Picture getPictureByPosition(String position);
    Picture getPictureById(int id);
    List<Picture> listPictureByPosition(String position);

}
