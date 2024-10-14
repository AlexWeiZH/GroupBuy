package com.li.pojo;

import java.sql.Timestamp;

public class Bonus {
    private String goodsname;
    private Double totalprice;
    private Timestamp ordertime;
    private int bonus;
    private Integer user_id;
    private Integer bonusid;

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public Timestamp getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Timestamp ordertime) {
        this.ordertime = ordertime;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    public Integer getBonusid() {
        return bonusid;
    }

    public void setBonusid(Integer bonusid) {
        this.bonusid = bonusid;
    }


}
