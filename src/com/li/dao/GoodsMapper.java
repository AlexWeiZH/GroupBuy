package com.li.dao;

import com.li.pojo.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
 @Repository
public interface GoodsMapper {
    /**
     *
     * 添加商品
     * @param goods
     * @return
     */
    int addGoods(@Param("goods")Goods goods);

    /**
     * 按页查询商品信息
     * @param startIndex
     * @param pageSize
     * @return
     */
    List<Goods> getGoodsByPage(@Param("startIndex") int startIndex,
                               @Param("pageSize") int pageSize,@Param("category")String category);

     /**
      * 获取商品总数目
      * @return
      */
    int getGoodsCount(@Param("category")String category);

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
    int modifyGoods(@Param("goods") Goods goods);


     /**
      * 根据id查找商品
      * @param goodsid
      * @return
      */
     Goods getGoodsById(Integer goodsid);


     //魏

     /**
      * 按Id查询
      * @param goodsid
      * @return
      */
     public Goods getGoodById(@Param("goodsid")Integer goodsid);


}
