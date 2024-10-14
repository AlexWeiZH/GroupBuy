package com.li.service.impl;

import com.li.dao.GoodsMapper;
import com.li.pojo.Goods;
import com.li.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public int addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public List<Goods> getGoodsByPage(int pageNo, int pageSize,String category) {
        return goodsMapper.getGoodsByPage((pageNo -1)*pageSize,pageSize,category);
    }

    @Override
    public int getGoodsCount(String category) {
        return goodsMapper.getGoodsCount(category);
    }

    @Override
    public int delGoodsById(Integer goodsid) {
        return goodsMapper.delGoodsById(goodsid);
    }

    @Override
    public int modifyGoods(Goods goods) {
        return goodsMapper.modifyGoods(goods);
    }

    @Override
    public Goods getGoodsById(Integer goodsid) {
        return goodsMapper.getGoodsById(goodsid);
    }
}
