package servlet;

import rlsb.WebFaceCompare;
import sun.misc.BASE64Decoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;

@WebServlet(name = "ServletTest",urlPatterns = "/myform.do")
public class ServletTest extends HttpServlet {
    public static String word = "0";


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("执行了Servlet");
        String str = new String(request.getParameter("imgurl").getBytes("iso-8859-1"), "utf-8");
        str=str.substring(str.indexOf(',')+1,str.length());
        System.out.println(str);
        ServletTest.generateImage(str,"D://fzh.jpg");

        System.out.println(str);
        WebFaceCompare w = new WebFaceCompare();
        Double d = 0.1;
        try {
            d = w.myMain();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String word = "对比结果(相似度):" + d;
        request.setAttribute("xsd", word);
        if(d<0.7||d>1){
            if(d>1)
                d=0.01;
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Type", "text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('人脸识别相似度为:"+d+"%,未达到标准请重新登陆')</script>");
            response.getWriter().println("<script>window.location.href='index.jsp'</script>");
        }else {
            HttpSession session=request.getSession();
            session.setAttribute("username","窦浴智");
            session.setMaxInactiveInterval(60*60);

            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Type", "text/html;charset=UTF-8");
            d=d*100;
            DecimalFormat df = new DecimalFormat("#.00");
            response.getWriter().println("<script>alert('人脸识别相似度为:"+df.format(d)+"%,登陆成功')</script>");
            response.getWriter().println("<script>window.location.href='homepage.jsp'</script>");

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);//调用doGet()方法
    }

    public ServletTest() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    /**
     * @param imgStr base64编码字符串
     * @param path   图片路径-具体到文件
     * @return
     * @Description: 将base64编码字符串转换为图片
     * @Author:
     * @CreateTime:
     */
    public static boolean generateImage(String imgStr, String path) {
        if (imgStr == null)
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(path);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
