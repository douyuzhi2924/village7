package vo;

public class kuaidi {
    public Integer id;
    public Integer zhuhuid;
    public String kuaidiNum;
    public Integer qujianNum;
    public String tupian;

    public kuaidi() {
    }

    public kuaidi(Integer id, Integer zhuhuid, String kuaidiNum, Integer qujianNum, String tupian) {
        this.id = id;
        this.zhuhuid = zhuhuid;
        this.kuaidiNum = kuaidiNum;
        this.qujianNum = qujianNum;
        this.tupian = tupian;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getZhuhuid() {
        return zhuhuid;
    }

    public void setZhuhuid(Integer zhuhuid) {
        this.zhuhuid = zhuhuid;
    }

    public String getKuaidiNum() {
        return kuaidiNum;
    }

    public void setKuaidiNum(String kuaidiNum) {
        this.kuaidiNum = kuaidiNum;
    }

    public Integer getQujianNum() {
        return qujianNum;
    }

    public void setQujianNum(Integer qujianNum) {
        this.qujianNum = qujianNum;
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian;
    }
}
