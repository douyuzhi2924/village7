package dao;

import util.jdbcUtil;
import vo.kuaidi;
import vo.money;
import vo.zhuhuTable;

import java.util.ArrayList;
import java.util.List;

public class moneyDao {

    /**
     * 返回水费信息
     */
    public static List<money> selectWaterMoney(){
        List<money> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(money.class,"select * from money where type=\"water\"");
        return list;
    }

    /**
     * 返回电费信息
     */
    public static List<money> selectDianMoney(){
        List<money> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(money.class,"select * from money where type=\"dian\"");
        return list;
    }

    /**
     * 返回供暖费信息
     */
    public static List<money> selectNuanMoney(){
        List<money> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(money.class,"select * from money where type=\"nuan\"");
        return list;
    }
    /**
     * 返回物业费信息
     */
    public static List<money> selectWuMoney(){
        List<money> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(money.class,"select * from money where type=\"wu\"");
        return list;
    }


    /**
     * 修改缴费信息
     */
    public static Integer updateZhuhu(money z){
        Integer count=0;
        String sql="UPDATE money SET  " +
                "id="+z.getId()+", " +
                "type=\""+z.getType()+"\", " +
                "zhuhuid="+z.getZhuhuid()+", " +
                "yingMoney="+z.getYingmoney()+", " +
                "yiMoney="+z.getYimoney()+" " + "WHERE id="+z.getId();
        System.out.println(sql);
        count=jdbcUtil.executeAdd(sql);
        return count;
    }


    /**
     * 查询欠费用户
     */
    public static List<money> selectNotMoney(){

        List<money>list=new ArrayList<>();
        list=jdbcUtil.executeQuery(money.class,"select * from money where yiMoney < yingMoney");
        return list;
    }

}
