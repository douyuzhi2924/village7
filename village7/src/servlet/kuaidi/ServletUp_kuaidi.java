package servlet.kuaidi;

import dao.kuaidiDao;
import dao.zhuhuTableDao;
import vo.kuaidi;
import vo.zhuhuTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletUp_kuaidi",urlPatterns = "/kuaidi.up")
public class ServletUp_kuaidi extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String S=request.getParameter("id");
        Integer id=Integer.parseInt(S);
        Integer zhuhuid=Integer.parseInt(request.getParameter("zhuhuid"));
        String kuaidiNum=request.getParameter("kuaidiNum");
        Integer qujianNum=Integer.parseInt(request.getParameter("qujianNum"));


        kuaidi k=new kuaidi(id,zhuhuid,kuaidiNum,qujianNum,"default");
        Integer count= kuaidiDao.updateKuaidi(k);

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
