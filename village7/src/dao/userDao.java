package dao;

import org.bridj.cpp.std.list;
import util.jdbcUtil;
import vo.user;
import vo.zhuhuTable;

import java.util.ArrayList;
import java.util.List;

public class userDao {

    /**
     * 登陆验证
     */
    public List<user> selectLogin(String username,String password){
        List<user> list=new ArrayList<>();
        list=jdbcUtil.executeQuery(user.class,"select * from user where username='?' and password='?'",username,password);
        return list;
    }

    /**
     * 返回账号信息
     */
    public static List<user> selectAllLogin(){
        System.out.println("douyuzhi");
        List<user> list=new ArrayList<>();
        list=jdbcUtil.executeQuery(user.class,"select * from user");
        return list;
    }

    /**
     * 增加登陆信息
     */
    public static Integer add(String sql){
        Integer count=0;
        count=jdbcUtil.executeAdd(sql);
        return count;
    }

    /**
     * 通过id修改登陆信息
     */
    public static Integer updateUser(user z){
        Integer count=0;
        String sql="UPDATE user SET  " +
                "username=\""+z.getUsername()+"\", " +
                "password=\""+z.getPassword()+"\"  WHERE id="+z.getId();
        System.out.println(sql);
        count=jdbcUtil.executeAdd(sql);
        return count;
    }



}
