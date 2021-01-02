package com.qst.servlet;

import com.qst.bean.Collection;
import com.qst.bean.Movie;
import com.qst.bean.PageBean;
import com.qst.dao.CollectionDAO;
import com.qst.dao.MovieDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CollectServlet", urlPatterns = "/CollectServlet")
public class CollectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取用户id
        String id = request.getParameter("id");
//       1、每页多少行 pageSize
        Integer pageSize = 3;
//      2、当前是第几页 currentPage
        String currentPageStr = request.getParameter("currentPage");
        Integer currentPage = null;//当前查询第几页
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.valueOf(currentPageStr);
        } else {
            currentPage = 1;
        }
//      3、一共有多少行数据 totalRows
        CollectionDAO collectDao = new CollectionDAO();
        String sqlCount = "select count(*) from collection where c_id=?";
        Integer totalRows = collectDao.getCollectCount(sqlCount, id);
////    4、一共多少页 totalPages

//      5、起始行 startRow
        Integer startRow = (currentPage - 1) * pageSize;
        StringBuffer sqlRow = new StringBuffer("SELECT " +
                "movie.id id," +
                "movie.name name," +
                "movie.star star," +
                "movie.director director," +
                "movie.duration duration," +
                "movie.type type," +
                "movie.description description," +
                "movie.price price," +
                "movie.poster poster," +
                "movie.startdate startdate " +
                "FROM " +
                "movie where movie.id in(select collection.m_id from collection where c_id =?)");
        sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
        // System.out.println(sqlRow);
        //把所有电影信息查询出来
        MovieDAO movieDao = new MovieDAO();
        List<Movie> movieList = movieDao.getMovieListByPage(sqlRow.toString(),id);

        PageBean pageBean = new PageBean(currentPage, pageSize, totalRows, movieList);
        System.out.println(pageBean);
        request.setAttribute("pageBeancoll", pageBean);
        request.getRequestDispatcher("collectionlist.jsp").forward(request, response);
    }
}