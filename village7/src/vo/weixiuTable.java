package vo;

import java.sql.Time;
import java.sql.Timestamp;

public class weixiuTable {
    public Integer id;
    public Integer zhuhuid;
    public String guzhang;
    public String baoxiuTime;

    public weixiuTable() {
    }

    public weixiuTable(Integer id, Integer zhuhuid, String guzhang, String baoxiuTime) {
        this.id = id;
        this.zhuhuid = zhuhuid;
        this.guzhang = guzhang;
        this.baoxiuTime = baoxiuTime;
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

    public String getGuzhang() {
        return guzhang;
    }

    public void setGuzhang(String guzhang) {
        this.guzhang = guzhang;
    }

    public String getBaoxiuTime() {
        return baoxiuTime;
    }

    public void setBaoxiuTime(String baoxiuTime) {
        this.baoxiuTime = baoxiuTime;
    }
}
