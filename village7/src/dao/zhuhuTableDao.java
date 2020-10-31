package dao;
        import org.bridj.cpp.std.list;
        import org.junit.Test;
        import util.jdbcUtil;
        import vo.user;
        import vo.zhuhuTable;
        import java.util.ArrayList;
        import java.util.List;
public class zhuhuTableDao {
    /**
     * 返回全部住户信息
     */
    public static List<zhuhuTable> selectZhuHuTable(){
        List<zhuhuTable> list=new ArrayList<>();
        list= jdbcUtil.executeQuery(zhuhuTable.class,"select * from zhuhuTable");
        return list;
    }

    /**
     * 通过id获取住户信息
     */
    public static List<zhuhuTable> selectById(Integer id){
        List<zhuhuTable>list=new ArrayList<zhuhuTable>();
        list=jdbcUtil.executeQuery(zhuhuTable.class,"select id,zhuhuName,zhuhuPhone,danyuanNum,menpaiNum,tupian from zhuhuTable where id="+id);
        return list;
    }

    /**
     * 通过where条件获取住户信息
     */
    public static List<zhuhuTable> selectByWhere(String str){

        List<zhuhuTable>list=new ArrayList<>();
        list=jdbcUtil.executeQuery(zhuhuTable.class,"select * from zhuhuTable where "+str);
        return list;
    }

    /**
     * 增加住户信息
     */
    public static Integer addZhuhu(String sql){
        Integer count=0;
        count=jdbcUtil.executeAdd(sql);
        return count;
    }

    /**
     * 修改住户信息
     */
    public static Integer updateZhuhu(zhuhuTable z){
        Integer count=0;
        String sql="UPDATE zhuhutable SET  " +
                "zhuhuName=\""+z.getZhuhuName()+"\", " +
                "zhuhuSex=\""+z.getZhuhuSex()+"\", " +
                "zhuhuPhone=\""+z.getZhuhuPhone()+"\", " +
                "fangziSize=\""+z.getFangziSize()+"\", " +
                "danyuanNum=\""+z.getDanyuanNum()+"\", " +
                "menpaiNum=\""+z.getMenpaiNum()+"\", " + "tupian=default  WHERE id="+z.getId();
        System.out.println(sql);
        count=jdbcUtil.executeAdd(sql);
        return count;
    }



    @Test
    public void test(){
        zhuhuTable z=new zhuhuTable(1,"窦浴智牛逼","男男","110","1万平米","100单元","666", "");
        zhuhuTableDao.updateZhuhu(z);
    }
}
