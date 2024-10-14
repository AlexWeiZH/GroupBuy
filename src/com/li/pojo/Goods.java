package com.li.pojo;



public class Goods {

     private Integer goodsid;
     private String goodsname;
     private String goodscategory; //产品类别
     private Double  price;
     private Integer goods_gbpeople_number;//团购需要的人数
     private String goods_extra_info; //备注信息
     private Double goodsdiscount;//折扣
     private boolean cangroupbuy;//是否可以团购


    public boolean isCangroupbuy() {
        return cangroupbuy;
    }

    public void setCangroupbuy(boolean cangroupbuy) {
        this.cangroupbuy = cangroupbuy;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodscategory() {
        return goodscategory;
    }

    public void setGoodscategory(String goodscategory) {
        this.goodscategory = goodscategory;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getGoods_gbpeople_number() {
        return goods_gbpeople_number;
    }

    public void setGoods_gbpeople_number(Integer goods_gbpeople_number) {
        this.goods_gbpeople_number = goods_gbpeople_number;
    }

    public String getGoods_extra_info() {
        return goods_extra_info;
    }

    public void setGoods_extra_info(String goods_extra_info) {
        this.goods_extra_info = goods_extra_info;
    }

    public Double getGoodsdiscount() {
        return goodsdiscount;
    }

    public void setGoodsdiscount(Double goodsdiscount) {
        this.goodsdiscount = goodsdiscount;
    }

    /**
     * 重写equals函数
     * @param obj
     * @return
     */
    @Override
    public boolean equals(Object obj) {
        if(obj==null){
            return false;
        }
        if(this==obj){
            return true;
        }
        if(obj instanceof Goods){
            Goods goods=(Goods)obj;
            if(goods.getGoodsid().equals(this.getGoodsid())&&
                    goods.getGoodsname().equals(this.getGoodsname())&&
                    goods.getGoodscategory().equals(this.getGoodscategory())&&
                    goods.getGoods_gbpeople_number().equals(this.getGoods_gbpeople_number())&&
                    goods.getGoodsdiscount().equals(this.getGoodsdiscount())&&
                    goods.getGoods_extra_info().equals(this.getGoods_extra_info())&&
                    goods.getPrice().equals(this.getPrice())&&
                    goods.isCangroupbuy()==this.isCangroupbuy()){
                return true;
            }else {
                return false;
            }
        }
        return false;
    }
}
