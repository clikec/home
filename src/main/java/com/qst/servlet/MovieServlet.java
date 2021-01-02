package com.qst.servlet;

import com.qst.bean.Movie;
import com.qst.bean.PageBean;
import com.qst.dao.MovieDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = "/MovieServlet")
public class MovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //获取选择
        String choose = request.getParameter("choose");
        request.setAttribute("choose", choose);
        //获取用户权限信息
        String power = request.getParameter("power");
//       1、每页多少行 pageSize
        Integer pageSize;
        if(power.equals("1")){
            pageSize = 10;//每页多少
        }else{
            pageSize = 3;//每页多少
        }
//      2、当前是第几页 currentPage
        String currentPageStr = request.getParameter("currentPage");
        Integer currentPage = null;//当前查询第几页
        if (currentPageStr != null && currentPageStr.length() > 0) {
            currentPage = Integer.valueOf(currentPageStr);
        } else {
            currentPage = 1;
        }
//        3、一共有多少行数据 totalRows
        Integer totalRows = 0;
        MovieDAO movieDao = new MovieDAO();
        String sqlCount = null;
        StringBuffer sqlRow =null;
        List<Movie> movieList = null;
        //5、起始行 startRow
        Integer startRow = (currentPage - 1) * pageSize;
        if(choose.equals("all")){
            sqlCount = "select count(*) from movie";
            totalRows = movieDao.getMovieCount(sqlCount);
            sqlRow = new StringBuffer("SELECT " +
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
                    "movie");
            sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
            movieList = movieDao.getMovieListByPage(sqlRow.toString());
        }else{
            sqlCount = "select count(*) from movie where type like '%"+ choose+"%'";
            totalRows = movieDao.getMovieCount(sqlCount);
            sqlRow = new StringBuffer("SELECT " +
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
                    "movie where type like '%"+choose+"%'");
            sqlRow.append(" limit ").append(startRow).append(",").append(pageSize);
            movieList = movieDao.getMovieListByPage(sqlRow.toString());
        }
////        4、一共多少页 totalPages
////        10,3,4页  , 10,5,2页 limit startRow,pageSize
        PageBean pageBean = new PageBean(currentPage, pageSize, totalRows, movieList);

        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("movie.jsp").forward(request, response);
    }

}
