package com.qst.servlet;

import com.qst.bean.Movie;
import com.qst.bean.PageBean;
import com.qst.bean.User;
import com.qst.bean.ddmessage;
import com.qst.dao.CollectionDAO;
import com.qst.dao.DdDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String power = request.getParameter("power");
//       1、每页多少行 pageSize
        Integer pageSize = 10;
//      2、当前是第几页 currentPage
        String currentPageStr = request.getParameter("currentPage");
        Integer currentPage = null;//当前查询第几页
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.valueOf(currentPageStr);
        } else {
            currentPage = 1;
        }
//      3、一共有多少行数据 totalRows
        DdDAO ddDao = new DdDAO();
//      4、一共多少页 totalPages
        String sqlCount =null;
        StringBuffer sqlRow =null;
        List<ddmessage> ddmList=null;
        Integer totalRows = null;
        //      5、起始行 startRow
        Integer startRow = (currentPage - 1) * pageSize;
        if(power.equals("1")){
            sqlCount = "select count(*) from dd";
            totalRows = ddDao.getddCount(sqlCount);
            sqlRow = new StringBuffer("select \n" +
                    "m.`name`,\n" +
                    "o.c_id,\n" +
                    "o.date buydate,\n" +
                    "o.o_id,\n" +
                    "o.time_id,\n" +
                    "o.s_id,\n" +
                    "o.way_of_pay,\n" +
                    "s.end_h,\n" +
                    "s.end_m,\n" +
                    "s.start_h,\n" +
                    "s.start_m,\n" +
                    "s.date watchdate,\n" +
                    "s.room_id\n" +
                    "from dd AS o\n" +
                    "join schedule as s on s.time_id=o.time_id\n" +
                    "join movie as m on m.id=s.f_id");
            sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
            ddmList = ddDao.getddmListByPage(sqlRow.toString());
        }else{
            sqlCount = "select count(*) from dd where c_id=?";
            totalRows = ddDao.getddCount(sqlCount, id);
            sqlRow = new StringBuffer("select \n" +
                    "m.`name`,\n" +
                    "o.c_id,\n" +
                    "o.date buydate,\n" +
                    "o.o_id,\n" +
                    "o.time_id,\n" +
                    "o.s_id,\n" +
                    "o.way_of_pay,\n" +
                    "s.end_h,\n" +
                    "s.end_m,\n" +
                    "s.start_h,\n" +
                    "s.start_m,\n" +
                    "s.date watchdate,\n" +
                    "s.room_id\n" +
                    "from dd AS o\n" +
                    "join schedule as s on s.time_id=o.time_id\n" +
                    "join movie as m on m.id=s.f_id and o.c_id=?");
            sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
            ddmList = ddDao.getddmListByPage(sqlRow.toString(),id);
        }
        //把所有订单信息查询出来
        PageBean pageBeandd = new PageBean(currentPage, pageSize, totalRows, ddmList);
        System.out.println(pageBeandd);
        request.setAttribute("pageBeandd", pageBeandd);
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}
