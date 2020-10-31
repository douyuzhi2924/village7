package servlet.Money;

import dao.moneyDao;
import dao.zhuhuTableDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletAdd_money",urlPatterns = "/money.add")
public class ServletAdd_money extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String types=request.getParameter("type");
        String type="";
        if (types.equals("1")){
            type="water";
        }
        else if (types.equals("2")){
            type="dian";
        }
        else if (types.equals("3")){
            type="nuan";
        }
        else if (types.equals("4")){
            type="wu";
        }

        String zhuhuid=request.getParameter("zhuhuid");
        Integer yingMoney=Integer.parseInt(request.getParameter("yingMoney"));
        Integer yiMoney=Integer.parseInt(request.getParameter("yiMoney"));
        Integer count=0;
        String sql="INSERT INTO money VALUES (null,\""+type+"\","+zhuhuid+","+yingMoney+","+yiMoney+")";
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
