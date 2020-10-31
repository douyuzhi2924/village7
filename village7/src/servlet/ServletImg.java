package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.util.UUID;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.*;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import util.ServletUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ServletImg",urlPatterns = "/uploadimg.do")
public class ServletImg extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String headimg=req.getParameter("headimg");
        ServletUtil s=new ServletUtil();

        String imgUrl=s.uploadImg(req);
        System.out.println(imgUrl);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


}
