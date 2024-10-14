package com.li.service.impl;

import com.li.dao.BonusMapper;
import com.li.pojo.Bonus;
import com.li.service.BonusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.Timestamp;
import java.util.List;

@Service
public class BonusServiceImpl implements BonusService {
    @Autowired
    BonusMapper bonusMapper;



    @Override
    public int InsertBonus(String goodsname, double totalprice, Timestamp time, int bonus, Integer user_id) {
        return bonusMapper.InsertBonus(goodsname,totalprice,time,bonus,user_id);
    }

    @Override
    public List<Bonus> getAllBonusByPage(int pageNo, int pageSize,int user_id){
        return bonusMapper.getAllBonusByPage((pageNo -1)*pageSize,pageSize, user_id);
    }
    @Override
    public int getBonusSum(Integer user_id){
        return bonusMapper.getBonusSum(user_id);
    }
    @Override
    public int getBonusCount(Integer user_id){
        return bonusMapper.getBonusCount(user_id);
    }
}
