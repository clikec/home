package com.qst.servlet;

import com.qst.bean.Dd;
import com.qst.bean.User;
import com.qst.dao.DdDAO;
import com.qst.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

@WebServlet(name = "BuyServlet", urlPatterns = "/BuyServlet")
public class BuyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //1.得到 客户编号id
        String c_id = request.getParameter("c_id");
        //2.得到 排期编号
        String time_id = request.getParameter("time_id");
        //3.得到 座位编号
        String s_id = request.getParameter("s_id");
        //4.得到日期
        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss a");// a为am/pm的标记
        Date date = new Date();// 获取当前时间
        //5.得到金额
        String price = request.getParameter("price");
        DdDAO ddDao = new DdDAO();
        //6.得到张数
        String num = request.getParameter("num");
        Dd dd = null;
        boolean flag = false;

        String cut = " ";
        String[] newStr = s_id.split(cut);
        for (String string:newStr) {
            dd = new Dd(Integer.valueOf(c_id), Integer.valueOf(time_id), Integer.valueOf(string),1, date);
            flag = ddDao.addDd(dd);
        }
        if (flag) {
            request.setAttribute("PRICE", price);
            request.getRequestDispatcher("pay.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }
}
