package servlet.User;

import dao.userDao;
import dao.zhuhuTableDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletAdd",urlPatterns = "/useradd.do")
public class ServletAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");

        Integer count=0;
        String sql="INSERT INTO user VALUES (default,\""+username+"\",\""+password+"\")";
        System.out.println(sql);


        count= userDao.add(sql);
        String returnStr="";
        if (count>0)
            returnStr="成功增加"+count+"条数据";
        else
            returnStr="添加失败,请检查是否填写完整";

        response.setHeader("contentType", "text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(returnStr);

        System.out.println(username+" "+password);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
