package servlet.Zhuhu;

import dao.zhuhuTableDao;
import util.ServletUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletAdd_zhuhu",urlPatterns = "/zhuhuadd.do")
public class ServletAdd_zhuhu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("我来了");
        request.setCharacterEncoding("UTF-8");
        String headimg=request.getParameter("headimg");
        ServletUtil s=new ServletUtil();
        String imgUrl=s.uploadImg(request);
        System.out.println(imgUrl);

        String name=request.getParameter("myname");
        System.out.println("啦啦啦:"+name);
        String sex=request.getParameter("sex");
        String phone=request.getParameter("phone");
        String size=request.getParameter("size");
        size+="平米";
        String dan=request.getParameter("dan");
        dan+="单元";
        String men=request.getParameter("men");

        if (name!=null){
            String myimgurl="/upload/"+request.getParameter("myimgurl");

            String sql="INSERT INTO zhuhutable VALUES (default,\""+name+"\",\""+sex+"\",\""+phone+"\",\""+size+"\",\""+dan+"\",\""+men+"\",\""+myimgurl+"\")";
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
        response.sendRedirect("Table_zhuhu.jsp");

        System.out.println(name+" "+sex+" "+phone+" "+size+" "+dan+" "+men+" "+imgUrl);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
