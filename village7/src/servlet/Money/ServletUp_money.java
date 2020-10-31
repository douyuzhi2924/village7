package servlet.Money;

import dao.moneyDao;
import dao.weixiuTableDao;
import vo.money;
import vo.weixiuTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletUp_money",urlPatterns = "/money.up")
public class ServletUp_money extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String S=request.getParameter("id");
        Integer id=Integer.parseInt(S);

        Integer types=Integer.parseInt(request.getParameter("type"));
        String type="";
        if (types==1)
            type="water";
        else if (types==2)
            type="dian";
        else if (types==3)
            type="nuan";
        else if (types==4)
            type="wu";

        Integer zhuhuid=Integer.parseInt(request.getParameter("zhuhuid"));
        Integer yingMoney=Integer.parseInt(request.getParameter("yingMoney"));
        Integer yiMoney=Integer.parseInt(request.getParameter("yiMoney"));

        System.out.println(id+" "+type+" "+zhuhuid+" "+yingMoney+" "+yiMoney);

        money w=new money(id,type,zhuhuid,yingMoney,yiMoney);

        Integer count= moneyDao.updateZhuhu(w);

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
