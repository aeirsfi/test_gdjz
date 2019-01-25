package com.gdjz.controller;

import com.gdjz.model.Picture;
import com.gdjz.service.IPictureService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PictureController {
    @Autowired
    private IPictureService iPictureService;

    @RequestMapping(value = "/toPictureManage.do")
    public String toPictureManage(HttpServletRequest request){
        List<Picture> pictureList = iPictureService.listAllPicture();
        request.getSession().setAttribute("pictureList", pictureList);
        return "pictureManage";
    }

    @RequestMapping(value = "/addPicture.do", method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String addPicture(MultipartFile file, Picture picture, HttpServletRequest request) throws IOException {
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            picture.setUrl("http://188.188.3.167:8084/upload/" + fileName);
            file.transferTo(dir);
        }

        Date now = new Date();
        picture.setCreateDate(now);
        picture.setUpdateDate(now);

        if (iPictureService.insertPicture(picture)) {
            return "添加成功！";
        } else {
            return "添加失败！";
        }
    }

    @RequestMapping(value = "/toChangePicture.do", method = RequestMethod.POST)
    @ResponseBody
    public Picture toChangePicture(int id){
        Picture picture = iPictureService.getPictureById(id);
        return picture;
    }

    @RequestMapping(value = "/changePicture.do", method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String changePicture(MultipartFile file, Picture picture, HttpServletRequest request){
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = file.getOriginalFilename();
            File dir = new File(path, fileName);
            picture.setUrl("http://188.188.3.167:8084/upload/" + fileName);
            try {
                file.transferTo(dir);
            } catch (Exception e) {
                return e.toString();
            }
        } else {
            Picture picture1 = iPictureService.getPictureById(picture.getId());
            picture.setUrl(picture1.getUrl());
        }

        Date now = new Date();
        picture.setUpdateDate(now);
        boolean flag = iPictureService.updatePicture(picture);

        if (flag) {
            return "修改成功！";
        } else {
            return "修改失败！";
        }
    }

    @RequestMapping(value = "/deletePicture.do", method = RequestMethod.POST, produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String deletePicture(int id){
        iPictureService.deletePicture(id);
        return "删除成功!";
    }

    @ResponseBody
    @RequestMapping(value = "/pictureList.do", method = RequestMethod.GET)
    public Map<String, Object> pictureList(int pageNumber, int pageSize, Picture picture) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total",iPictureService.listPictureByPosition(picture.getPosition()).size());
        PageHelper.startPage(pageNumber, pageSize);
        List<Picture> pictureList = iPictureService.listPictureByPosition(picture.getPosition());
        PageInfo<Picture> pageInfo = new PageInfo<Picture>(pictureList);
        map.put("rows",pageInfo.getList());
        return map;
    }
}
