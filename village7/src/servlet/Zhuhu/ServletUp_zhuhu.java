package servlet.Zhuhu;

import dao.zhuhuTableDao;
import vo.zhuhuTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletUp_zhuhu",urlPatterns = "/submitz.up")
public class ServletUp_zhuhu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String S=request.getParameter("id");
        Integer id=Integer.parseInt(S);
        String name=request.getParameter("myname");
        String sex=request.getParameter("sex");
        String phone=request.getParameter("phone");
        String size=request.getParameter("size");
        size+="平米";
        String dan=request.getParameter("dan");
        dan+="单元";
        String men=request.getParameter("men");

        zhuhuTable z=new zhuhuTable(id,name,sex,phone,size,dan,men,"default");
        Integer count=zhuhuTableDao.updateZhuhu(z);

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
