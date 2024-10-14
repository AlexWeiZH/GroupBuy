package com.li.pojo;

public class GroupBuy {
    private String groupbuyid;
    private int people_acquired;
    private boolean groupbuystatus;
    private Integer goodsid;

    public String getGroupbuyid() {
        return groupbuyid;
    }

    public void setGroupbuyid(String groupbuyid) {
        this.groupbuyid = groupbuyid;
    }

    public int getPeople_acquired() {
        return people_acquired;
    }

    public void setPeople_acquired(int people_acquired) {
        this.people_acquired = people_acquired;
    }

    public boolean getGroupbuystatus() {
        return groupbuystatus;
    }

    public void setGroupbuystatus(boolean groupbuystatus) {
        this.groupbuystatus = groupbuystatus;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }
}
