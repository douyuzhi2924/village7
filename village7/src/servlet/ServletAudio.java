//package servlet;
//
//
//
//import hcaudio.common.DemoException;
//import org.junit.Test;
//import sbaudio.WebIATWS;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.*;
//
//@WebServlet(name = "ServletAudio")
//public class ServletAudio extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        this.doGet(request, response);//调用doGet()方法
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String re="";
////        try {
////            Thread.sleep(3000); //1000 毫秒，也就是bai1秒.
////        } catch(InterruptedException ex) {
////            Thread.currentThread().interrupt();
////        }
//        System.out.println("audio来了");
//        try {
////            WebIATWS w= new WebIATWS();
////            WebIATWS.file="D:\\TSBrowserDownloads\\video.wav";
////            re=w.mymain();
////            System.out.println("servlet:"+re);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
////        try {
////            FilterDemo01 f=new FilterDemo01();
////            String wordgo=f.sayword(re);
////            request.setAttribute("saywords_index",wordgo);
////        } catch (DemoException e) {
////            e.printStackTrace();
////        }
//        //request.setAttribute("wordresult","<script language='javascript'>alert('您说了:"+re+"');</script>");
//
//        request.getRequestDispatcher("index.jsp").forward(request, response);
//
//    }
//
//
//
//
//}
