package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

@WebFilter(filterName = "MyFilter",urlPatterns = "/*")
public class MyFilter implements Filter {
    List<String> list=new ArrayList<>();

    public MyFilter() {
        this.list.add("/login.do");
        this.list.add("/login.jsp");
        this.list.add("/images/login.jsp");
        this.list.add("/assets/js/login.jsp");
        this.list.add("/assets/css/login.jsp");
        this.list.add("/images/bgbgbg.png");
        this.list.add("/assets/css/cs-skin-elastic.css");
        this.list.add("/images/logologo.png");
        this.list.add("/assets/css/style.css");
        this.list.add("/login.del");
        this.list.add("/index.jsp");
        this.list.add("/myform.do");

    }

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest hsr=(HttpServletRequest) req;
        HttpServletResponse hsp = (HttpServletResponse) resp;
        HttpSession session=hsr.getSession();
        String path=hsr.getServletPath();
        if (list.contains(path)){
            if (path.equals("/login.del")){//删除session
                hsr.getSession().invalidate();
                hsp.sendRedirect("login.jsp");
            }else
            chain.doFilter(req, resp);
        }
        else{
            String name=(String) session.getAttribute("username");
            if (name!=null)
                chain.doFilter(req, resp);
            else
                hsp.sendRedirect("login.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
