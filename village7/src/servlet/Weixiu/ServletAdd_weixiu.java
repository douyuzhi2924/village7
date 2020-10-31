package servlet.Weixiu;

import dao.zhuhuTableDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletAdd_weixiu",urlPatterns = "/weixiu.add")
public class ServletAdd_weixiu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String zhuhuid=request.getParameter("zhuhuid");
        String guzhang=request.getParameter("guzhang");
        String baoxiuTime=request.getParameter("baoxiuTime");

        Integer count=0;

        String sql="INSERT INTO weixiutable VALUES (null,\""+zhuhuid+"\",\""+guzhang+"\",\""+baoxiuTime+"\")";
        System.out.println(sql);
        count=zhuhuTableDao.addZhuhu(sql);

        String returnStr="";
        if (count>0)
            returnStr="成功增加"+count+"条数据";
        else
            returnStr="添加失败,请检查是否填写完整";

        response.setHeader("contentType", "text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(returnStr);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
