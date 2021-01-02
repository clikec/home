package com.qst.servlet;

import com.qst.bean.Schedule;
import com.qst.dao.ScheduleDAO;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ScheServlet", urlPatterns = "/ScheServlet")
public class ScheServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        ScheduleDAO scheduleDao = new ScheduleDAO();
        //删除排期
        if (action != null && action.equals("delete")) {
            String id = request.getParameter("time_id");
            int sid = Integer.parseInt(id);
            scheduleDao.deleteyId(sid);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        //获取排期信息
        else if (action != null && action.equals("update")) {
            String id = request.getParameter("time_id");
            int sid = Integer.parseInt(id);
            Schedule schedule = scheduleDao.getScheById(sid);
            PrintWriter writer = response.getWriter();
            writer.write("ok");
            request.getSession().setAttribute("SCHEDULE", schedule);
            writer.flush();
            writer.close();
        }
        //更新与添加信息
        else{
            String time_id = request.getParameter("time_id");
            String f_id = request.getParameter("f_id");
            String room_id = request.getParameter("room_id");
            String date = request.getParameter("date");
            String start_m = request.getParameter("start_m");
            String start_h = request.getParameter("start_h");
            String end_m = request.getParameter("end_m");
            String end_h = request.getParameter("end_h");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

            Date date1 = null;
            Schedule schedule = null;
            boolean flag = false;
            try {
                date1 = formatter.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if (time_id == null) {
                schedule = new Schedule(Integer.valueOf(f_id), Integer.valueOf(room_id), date1, Integer.valueOf(start_h),
                        Integer.valueOf(start_m), Integer.valueOf(end_h), Integer.valueOf(end_m));
                flag = scheduleDao.addSchedule(schedule);
            } else {
                schedule = new Schedule(Integer.valueOf(time_id),Integer.valueOf(f_id), Integer.valueOf(room_id), date1, Integer.valueOf(start_h),
                        Integer.valueOf(start_m), Integer.valueOf(end_h), Integer.valueOf(end_m));
                flag = scheduleDao.updateScheduleBYId(schedule);
            }
            if (flag) {
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        }
    }
}
