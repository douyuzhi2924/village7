package servlet;

import services.LoginServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletLogin",urlPatterns = "/login.do")
public class ServletLogin extends HttpServlet {
    public LoginServices loginServices;
    public ServletLogin(){
        this.loginServices = new LoginServices();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");


        if (this.loginServices.login(username,password)){
            HttpSession session=request.getSession();
            session.setAttribute("username",username);
            session.setMaxInactiveInterval(60*60);
            response.sendRedirect("homepage.jsp");
        }else {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Type", "text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('账号密码错误,请重新登陆')</script>");
            response.getWriter().println("<script>window.location.href='login.jsp'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
