package com.gdjz.service.impl;

import com.gdjz.dao.IPictureDao;
import com.gdjz.model.Picture;
import com.gdjz.service.IPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("iPictureService")
public class PictureServiceImpl implements IPictureService {
    @Autowired
    private IPictureDao iPictureDao;

    public List<Picture> listAllPicture() {
        return iPictureDao.listAllPicture();
    }

    public boolean insertPicture(Picture picture) {
        Picture p = iPictureDao.getPictureByPosition(picture.getPosition());

        if (p == null) {
            iPictureDao.insertPicture(picture);
            return true;
        }

        return false;
    }

    public void deletePicture(int id) {
        iPictureDao.deletePicture(id);
    }

    public boolean updatePicture(Picture picture) {
        Picture originalPic = iPictureDao.getPictureById(picture.getId());
        Picture picture1 = iPictureDao.getPictureByPosition(picture.getPosition());

        if (!originalPic.getPosition().equals(picture.getPosition()) && picture1 != null) {
            return false;
        }

        iPictureDao.updatePicture(picture);
        return true;
    }

    public Picture getPictureByPosition(String position) {
        return iPictureDao.getPictureByPosition(position);
    }

    public Picture getPictureById(int id) {
        return iPictureDao.getPictureById(id);
    }

    public List<Picture> listPictureByPosition(String position) {
        return iPictureDao.listPictureByPostion(position);
    }
}
