package com.qst.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.qst.bean.User;
import com.qst.dao.UserDAO;

@WebServlet(urlPatterns = "/LoginServlet", name="LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email和密码
        String useremail = request.getParameter("email");
        String userPwd = request.getParameter("password");
        //根据email和密码查询申请人
        UserDAO userDAO = new UserDAO();

        User user = userDAO.getApplicantByEmailAndPassword(useremail,userPwd);

        Map<String, Object> map = new HashMap<String, Object>();
        if(user != null){
            //将登录用户对象保存到session
            request.getSession().setAttribute("USER",user);
            if(user.getUsername()==null){
                map.put("status",1);
            }else if(user.getPower()==1){
                map.put("status",2);
            }else{
                map.put("status",3);
            }

        }else {
            map.put("status",0);
        }
        JSONObject jsonObject = JSONObject.fromObject(map);
        PrintWriter out = response.getWriter();
        out.print(jsonObject.toString());

        /*PrintWriter writer = response.getWriter();
        //判断User == null，返回登录页面，不为空，就进入主页面
        if(user!=null){
            //将登录用户对象保存到session
            request.getSession().setAttribute("USER",user);
            //用户名密码输入正确，是否填写用户名
            if(user.getUsername()==null){
                writer.write("my");
            }else if(user.getPower()==1){
                writer.write("movie");
            }else{
                writer.write("home");
            }

        }else{
            writer.write("false");
            writer.flush();
            writer.close();
        }*/
    }
}
