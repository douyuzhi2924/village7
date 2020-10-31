package vo;

import util.jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class aaa {
    public static void main(String[] args) throws SQLException {
        Connection conn3 = jdbcUtil.getConnection();
        String sql3="select COUNT(*) from zhuhutable";
        PreparedStatement ps3 = conn3.prepareStatement(sql3);
        ResultSet result3=ps3.executeQuery();
        while (result3.next()){
            System.out.println(result3.getObject(1));
        }
    }
}
