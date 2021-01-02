package com.qst.utils;

import com.qst.bean.Dd;
import com.qst.bean.Schedule;
import com.qst.bean.User;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

    public static void main(String[] args) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date = "2020-01-10";
        Date date1 = null;
        Schedule schedule = null;
        boolean flag = false;
        try {
            date1 = formatter.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
