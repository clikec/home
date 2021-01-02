package com.qst.servlet;

import com.qst.bean.Collection;
import com.qst.bean.Movie;
import com.qst.bean.PageBean;
import com.qst.bean.Schedule;
import com.qst.dao.CollectionDAO;
import com.qst.dao.MovieDAO;
import com.qst.dao.ScheduleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieIDServlet", urlPatterns = "/MovieIDServlet")
public class MovieIDServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取id
        String id = request.getParameter("id");
        String way = request.getParameter("way");
        String c_id = request.getParameter("c_id");
        MovieDAO movieDao = new MovieDAO();
        Movie movie = movieDao.getMovieById(id);
        request.setAttribute("MOVIE", movie);
        if(way.equals("1"))//电影细节
        {
            CollectionDAO collectiondao = new CollectionDAO();
            Collection coll=collectiondao.findbyidandcid(id,c_id);
            if(coll!= null){
                request.setAttribute("COLLed", 1);
            }
            request.getRequestDispatcher("Movie01.jsp").forward(request, response);
        }else if(way.equals("2")){//购买影票
            ScheduleDAO scheduleDao = new ScheduleDAO();
            List<Schedule> scheduleList = scheduleDao.getSchedulebyMovieId(movie.getId());
            request.setAttribute("ScheduleLIST", scheduleList);
            request.getRequestDispatcher("buy.jsp").forward(request, response);
        }else if(way.equals("3")){//收藏电影
            CollectionDAO collectiondao = new CollectionDAO();
            if(collectiondao.addCollection(Integer.valueOf(c_id),Integer.valueOf(id))){
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
