package vo;

public class money {
    public Integer id;
    public String type;
    public Integer zhuhuid;
    public Integer yingmoney;
    public Integer yimoney;

    public money() {
    }

    public money(Integer mid, String type, Integer zhuhuid, Integer yingmoney, Integer yimoney) {
        this.id = mid;
        this.type = type;
        this.zhuhuid = zhuhuid;
        this.yingmoney = yingmoney;
        this.yimoney = yimoney;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer mid) {
        this.id = mid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getZhuhuid() {
        return zhuhuid;
    }

    public void setZhuhuid(Integer zhuhuid) {
        this.zhuhuid = zhuhuid;
    }

    public Integer getYingmoney() {
        return yingmoney;
    }

    public void setYingmoney(Integer yingmoney) {
        this.yingmoney = yingmoney;
    }

    public Integer getYimoney() {
        return yimoney;
    }

    public void setYimoney(Integer yimoney) {
        this.yimoney = yimoney;
    }
}
