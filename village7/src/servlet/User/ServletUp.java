package servlet.User;

import dao.userDao;
import dao.zhuhuTableDao;
import vo.user;
import vo.zhuhuTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletUp",urlPatterns = "/user.up")
public class ServletUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String S=request.getParameter("id");
        Integer id=Integer.parseInt(S);
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        user u=new user(id,username,password);
        Integer count= userDao.updateUser(u);

        String returnStr="";
        if (count>0)
            returnStr="成功修改"+count+"条数据";
        else
            returnStr="修改失败,请重新进行操作";
        response.setHeader("contentType", "text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(returnStr);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
