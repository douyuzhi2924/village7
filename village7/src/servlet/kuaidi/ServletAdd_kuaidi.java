package servlet.kuaidi;

import dao.zhuhuTableDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletAdd_kuaidi",urlPatterns = "/kuaidi.add")
public class ServletAdd_kuaidi extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer zhuhuid=Integer.parseInt(request.getParameter("zhuhuid"));
        String kuaidiNum=request.getParameter("kuaidiNum");
        Integer qujianNum=Integer.parseInt(request.getParameter("qujianNum"));

        String sql="INSERT INTO kuaiditable VALUES (null,"+zhuhuid+",\""+kuaidiNum+"\","+qujianNum+",default)";

        System.out.println(sql);
        Integer count=0;
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
