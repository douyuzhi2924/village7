package dao;

import org.junit.Test;
import util.jdbcUtil;
import vo.user;
import vo.weixiuTable;
import vo.zhuhuTable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class weixiuTableDao {

    /**
     * 返回全部维修信息
     */
    public static  ResultSet selectAll() throws SQLException {
        String sql="select weixiuTable.id,zhuhuName,zhuhuPhone,danyuanNum,menpaiNum,guzhang,baoxiuTime,zhuhuid  from weixiuTable,zhuhutable where weixiuTable.zhuhuid=zhuhutable.id";
        Connection conn = jdbcUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet result=ps.executeQuery();

        return  result;
    }
    /**
     * 返回全部维修信息2
     */
    public static  List<weixiuTable> selectAll2() throws SQLException {
        String sql="select * from weixiuTable";
        List<weixiuTable> list= new ArrayList<>();
        list= jdbcUtil.executeQuery(weixiuTable.class,sql);
        return  list;
    }


    /**
     * 通过id修改住户信息
     */
    public static Integer updateWeixiu(weixiuTable z){
        Integer count=0;
        String sql="UPDATE weixiutable SET  " +
                "zhuhuid="+z.getZhuhuid()+", " +
                "guzhang=\""+z.getGuzhang()+"\", " +
                "baoxiuTime=\""+z.getBaoxiuTime()+"\" where id="+ z.getId();
        System.out.println(sql);
        count=jdbcUtil.executeAdd(sql);
        return count;
    }


}
