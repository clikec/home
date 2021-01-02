package com.qst.servlet;

import com.qst.bean.Movie;
import com.qst.bean.PageBean;
import com.qst.bean.Sale;
import com.qst.bean.Schedule;
import com.qst.dao.MovieDAO;
import com.qst.dao.SaleDAO;
import com.qst.dao.ScheduleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ScheduleServlet", urlPatterns = "/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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

//        3、一共有多少行数据 totalRows
        ScheduleDAO scheduleDao = new ScheduleDAO();
        Integer totalRows = totalRows = scheduleDao.getscheduleCount();

        //5、起始行 startRow
        Integer startRow = (currentPage - 1) * pageSize;

        StringBuffer  sql = new StringBuffer("SELECT " +
                "schedule.time_id time_id," +
                "schedule.f_id f_id," +
                "schedule.room_id room_id," +
                "schedule.date date," +
                "schedule.start_h start_h," +
                "schedule.start_m start_m," +
                "schedule.end_h end_h," +
                "schedule.end_m end_m " +
                "FROM " +
                "schedule");
        sql.append(" limit ").append(startRow).append(",").append(pageSize);
        List<Schedule> scheduleList = scheduleDao.getscheduleList(sql.toString());
////        4、一共多少页 totalPages
////        10,3,4页  , 10,5,2页 limit startRow,pageSize
        PageBean pageBeanSchedule = new PageBean(currentPage, pageSize, totalRows, scheduleList);
        request.setAttribute("pageBeanSchedule", pageBeanSchedule);
        request.getRequestDispatcher("arrange.jsp").forward(request, response);
    }
}
