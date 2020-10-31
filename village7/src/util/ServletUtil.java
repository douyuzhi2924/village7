package util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ServletUtil")
public class ServletUtil extends HttpServlet {
    public String uploadImg(HttpServletRequest req) throws ServletException, IOException {
        String imgUrl="";
        //解析和检查请求，是否是post方式，是否是二进制流格式
        Boolean isMultipart= ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            return null; //如果不是就不用上传了
        }
        try {
            //创建FileItemFactory对象
            FileItemFactory factory=new DiskFileItemFactory();
            //创建文件上传的处理器
            ServletFileUpload upload=new ServletFileUpload(factory);
            //解析请求
            List<FileItem> items=upload.parseRequest(req);
            //迭代出每一个FileItem
            for (FileItem item : items) {
                String fileName = item.getFieldName();
                if (item.isFormField()) {
                    //普通的表单控件
                    String value = item.getString("utf-8");
                    //System.out.println(fileName + "->" + value);
                } else {
                    //上传文件的控件
                    String RandomName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(item.getName());
                    //System.out.println(fileName + "->" + FilenameUtils.getName(item.getName())); //一个的标签的name，一个是文件的name

                    String path=req.getServletContext().getRealPath("/upload");
                    //System.out.println(path);
                    item.write(new File(path, item.getName())); //把上传的文件保存到某个文件中

                    //fileOut-->>fileWeb
                    String fileOut="C:/Users/Administrator/Desktop/village6/out/artifacts/village6_war_exploded/upload/"+item.getName();
                    File f=new File(fileOut);
                    String fileWeb="C:/Users/Administrator/Desktop/village6/web/upload/"+item.getName();
                    imgUrl="/upload/"+item.getName();
                    //File f=new File(fileOut);

                    FileInputStream fr=new FileInputStream(f);
                    FileOutputStream fw=new FileOutputStream(fileWeb);
                    byte[] c=new byte[1024];
                    int i=fr.read(c);
                    while (i!=-1){
                        fw.write(c);
                        i=fr.read(c);
                    }
                    fw.flush();
                    fr.close();
                    fw.close();
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return imgUrl;
    }


}
