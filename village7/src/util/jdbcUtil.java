package util;

import org.bridj.cpp.std.list;
import org.junit.Test;
import vo.user;

import java.io.File;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class jdbcUtil {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/village6?useUnicode=true&characterEncoding=utf8";
        String user = "root";
        String password = "root";
        Connection con = null;
        con = DriverManager.getConnection(url, user, password);
        return con;
    }



    @Test
    public void test() throws SQLException {
        List<user> al=jdbcUtil.executeQuery(user.class,"select ?,? from user","username","password");

        for (user u:al) {
            System.out.print(u.id+"-");
            System.out.print(u.username+"-");
            System.out.println(u.password);
        }

    }


    //万能查询
    public static <T> List<T> executeQuery(Class<T> clazz, String sql, String... args) {
        List<T>list= new ArrayList<T>();
        if (args.length>0){
            for (int i = 0; i < args.length; i++) {
                sql=sql.replaceFirst("\\?",args[i]);
            }
        }
        try (Connection conn = jdbcUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs=ps.executeQuery();
            Field[] fields=clazz.getFields();
            while(rs.next()){
                T t=clazz.newInstance();
                for (Field field:fields) {
                    if (jdbcUtil.isExistColumn(rs,field.getName())){
                        field.set(t,rs.getObject(field.getName()));
                    }
                }
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return list;
    }

    //万能增加
    public static Integer executeAdd(String sql) {
        Integer count=0;
        try (Connection conn = jdbcUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            count=ps.executeUpdate();

            } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }



    public static boolean isExistColumn(ResultSet rs, String columnName) {
        try {
            if (rs.findColumn(columnName) > 0 ) {
                return true;
            }
        }
        catch (SQLException e) {
            return false;
        }
        return false;
    }


}
