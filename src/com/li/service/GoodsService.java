package com.li.service;

import com.li.pojo.Goods;


import java.util.List;

public interface GoodsService {

    /**
     *
     * 添加商品
     * @param goods
     * @return
     */
    int addGoods(Goods goods);

    /**
     * 按页查询
     * @param pageNo
     * @param pageSize
     * @return
     */
    List<Goods> getGoodsByPage(int pageNo,int pageSize,String category);

    /**
     * 获取商品总数目
     * @return
     */
    int getGoodsCount(String category);

    /**
     * 根据商品id删除商品
     * @param goodsid
     * @return
     */
    int delGoodsById(Integer goodsid);

    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    int modifyGoods(Goods goods);



    /**
     * 根据id查找商品
     * @param goodsid
     * @return
     */
    Goods getGoodsById(Integer goodsid);
}
