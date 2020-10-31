package dao;

import org.junit.Test;
import util.jdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class tubiaoDao {
    /*住户房屋类型报表人数查询*/
    //***************************************************************************************//
    public static Integer selectfangziSizeCount(String fangziSize) throws SQLException {
        Connection conn = jdbcUtil.getConnection();
        String sql="select COUNT(*) from zhuhutable where fangziSize = \""+fangziSize+"\"";
        System.out.println(sql);
        PreparedStatement ps3 = conn.prepareStatement(sql);
        ResultSet result=ps3.executeQuery();
        Integer count=1;
        while (result.next()){
            count=result.getInt(1);
        }
        System.out.println(count);
        return count;
    }
    public static Integer getNum20() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectfangziSizeCount("20平米");
        return count;
    }
    public static Integer getNum45() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectfangziSizeCount("45平米");
        return count;
    }
    public static Integer getNum50() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectfangziSizeCount("50平米");
        return count;
    }
    public static Integer getNum60() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectfangziSizeCount("60平米");
        return count;
    }
    public static Integer getNum80() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectfangziSizeCount("80平米");
        return count;
    }

    /*未及时缴费人数查询*/
    //***************************************************************************************//
    public static Integer selectMoneyTypeCount(String type) throws SQLException {
        Connection conn = jdbcUtil.getConnection();
        String sql="select COUNT(*) from money where type=\""+type+"\" and  yingMoney > yiMoney";
        System.out.println(sql);
        PreparedStatement ps3 = conn.prepareStatement(sql);
        ResultSet result=ps3.executeQuery();
        Integer count=1;
        while (result.next()){
            count=result.getInt(1);
        }
        System.out.println(count);
        return count;
    }

    public static Integer getWater() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectMoneyTypeCount("water");
        return count;
    }
    public static Integer getDian() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectMoneyTypeCount("dian");
        return count;
    }
    public static Integer getNuan() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectMoneyTypeCount("nuan");
        return count;
    }
    public static Integer getWu() throws SQLException {
        Integer count=1;
        count=tubiaoDao.selectMoneyTypeCount("wu");
        return count;
    }

    public static Integer selectYingMoneyCount() throws SQLException {
        Connection conn = jdbcUtil.getConnection();
        String sql="SELECT SUM(yingMoney) FROM money";
        System.out.println(sql);
        PreparedStatement ps3 = conn.prepareStatement(sql);
        ResultSet result=ps3.executeQuery();
        Integer count=1;
        while (result.next()){
            count=result.getInt(1);
        }
        System.out.println(count);
        return count;
    }
    public static Integer selectYiMoneyCount() throws SQLException {
        Connection conn = jdbcUtil.getConnection();
        String sql="SELECT SUM(yiMoney) FROM money";
        System.out.println(sql);
        PreparedStatement ps3 = conn.prepareStatement(sql);
        ResultSet result=ps3.executeQuery();
        Integer count=1;
        while (result.next()){
            count=result.getInt(1);
        }
        System.out.println(count);
        return count;
    }

    public static Integer selectMoneyBi() throws SQLException {
        double ying=tubiaoDao.selectYingMoneyCount();
        double yi=tubiaoDao.selectYiMoneyCount();
        double bl=0;
        bl=yi/ying*100;
        Integer bll= (int) bl;
        return bll;
    }


}
