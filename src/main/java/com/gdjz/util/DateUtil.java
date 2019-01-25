package com.gdjz.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String dateFormat(String date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

//    public static void main(String[] args){
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        System.out.println(sdf.format(new Date()));
//    }
}
