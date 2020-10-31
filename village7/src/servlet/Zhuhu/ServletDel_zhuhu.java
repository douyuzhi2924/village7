package servlet.Zhuhu;

import dao.zhuhuTableDao;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletDel_zhuhu",urlPatterns = "/submitz.del")
public class ServletDel_zhuhu extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer count=0;
        String id=request.getParameter("myid");
        System.out.println(id);
        String sql="DELETE FROM zhuhutable WHERE id="+id;
        System.out.println(sql);
        count=zhuhuTableDao.addZhuhu(sql);

        System.out.println(sql);
        String returnStr="";
        if (count>0)
            returnStr="成功删除"+count+"条数据";
        else
            returnStr="删除失败,请重新进行操作";
        System.out.println("count:"+count);
        response.setHeader("contentType", "text/html; charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(returnStr);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
