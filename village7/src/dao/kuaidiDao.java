package dao;

import org.junit.Test;
import util.jdbcUtil;
import vo.kuaidi;
import vo.user;
import vo.zhuhuTable;

import java.util.ArrayList;
import java.util.List;

public class kuaidiDao {
    /**
     * 返回快递信息
     */
    public static List<kuaidi> selectAllLogin(){
        List<kuaidi> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(kuaidi.class,"select * from kuaiditable");
        return list;
    }
    @Test
    public void t(){
        System.out.println(1);
    }
    /**
     * 修改住户信息
     */
    public static Integer updateKuaidi(kuaidi k){
        Integer count=0;
        String sql="UPDATE kuaiditable SET  " +
                "zhuhuid="+k.getZhuhuid()+", " +
                "kuaidiNum=\""+k.getKuaidiNum()+"\", " +
                "qujianNum="+k.getQujianNum()+", " + "tupian=default  WHERE id="+k.getId();
        System.out.println(sql);
        count=jdbcUtil.executeAdd(sql);
        return count;
    }
}
