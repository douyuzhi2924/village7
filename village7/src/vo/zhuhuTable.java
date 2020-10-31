package vo;

public class zhuhuTable {
    public Integer id;
    public String zhuhuName;
    public String zhuhuSex;
    public String zhuhuPhone;
    public String fangziSize;
    public String danyuanNum;
    public String menpaiNum;
    public String tupian;

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian;
    }

    public zhuhuTable() {
    }

    public zhuhuTable(Integer id, String zhuhuName, String zhuhuSex, String zhuhuPhone, String fangziSize, String danyuanNum, String menpaiNum, String tupian) {
        this.id = id;
        this.zhuhuName = zhuhuName;
        this.zhuhuSex = zhuhuSex;
        this.zhuhuPhone = zhuhuPhone;
        this.fangziSize = fangziSize;
        this.danyuanNum = danyuanNum;
        this.menpaiNum = menpaiNum;
        this.tupian = tupian;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZhuhuName() {
        return zhuhuName;
    }

    public void setZhuhuName(String zhuhuName) {
        this.zhuhuName = zhuhuName;
    }

    public String getZhuhuSex() {
        return zhuhuSex;
    }

    public void setZhuhuSex(String zhuhuSex) {
        this.zhuhuSex = zhuhuSex;
    }

    public String getZhuhuPhone() {
        return zhuhuPhone;
    }

    public void setZhuhuPhone(String zhuhuPhone) {
        this.zhuhuPhone = zhuhuPhone;
    }

    public String getFangziSize() {
        return fangziSize;
    }

    public void setFangziSize(String fangziSize) {
        this.fangziSize = fangziSize;
    }

    public String getDanyuanNum() {
        return danyuanNum;
    }

    public void setDanyuanNum(String danyuanNum) {
        this.danyuanNum = danyuanNum;
    }

    public String getMenpaiNum() {
        return menpaiNum;
    }

    public void setMenpaiNum(String menpaiNum) {
        this.menpaiNum = menpaiNum;
    }

    @Override
    public String toString() {
        return "zhuhuTable{" +
                "id=" + id +
                ", zhuhuName='" + zhuhuName + '\'' +
                ", zhuhuSex='" + zhuhuSex + '\'' +
                ", zhuhuPhone='" + zhuhuPhone + '\'' +
                ", fangziSize='" + fangziSize + '\'' +
                ", danyuanNum='" + danyuanNum + '\'' +
                ", menpaiNum='" + menpaiNum + '\'' +
                ", tupian='" + tupian + '\'' +
                '}';
    }
}
