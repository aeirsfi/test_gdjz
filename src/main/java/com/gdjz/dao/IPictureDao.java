package com.gdjz.dao;

import com.gdjz.model.Picture;

import java.util.List;

public interface IPictureDao {
    void insertPicture(Picture picture);
    void deletePicture(int id);
    void updatePicture(Picture picture);
    Picture getPictureByPosition(String position);
    Picture getPictureById(int id);
    List<Picture> listAllPicture();
    List<Picture> listPictureByPostion(String position);
}
