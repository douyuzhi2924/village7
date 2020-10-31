package servlet.Weixiu;

import dao.weixiuTableDao;
import dao.zhuhuTableDao;
import vo.weixiuTable;
import vo.zhuhuTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletUp_weixiu",urlPatterns = "/weixiu.up")
public class ServletUp_weixiu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String S=request.getParameter("id");
        Integer id=Integer.parseInt(S);
        Integer zhuhuid=Integer.parseInt(request.getParameter("zhuhuid"));
        String guzhang=request.getParameter("guzhang");
        String baoxiuTime=request.getParameter("baoxiuTime");


        weixiuTable w=new weixiuTable(id,zhuhuid,guzhang,baoxiuTime);
        Integer count= weixiuTableDao.updateWeixiu(w);

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
