package com.li.service;
import com.li.pojo.Bonus;

import java.sql.Timestamp;
import java.util.List;

public interface BonusService {
    public int InsertBonus(String goodsname, double totalprice, Timestamp time, int bonus,Integer user_id);
    public List<Bonus> getAllBonusByPage(int pageNo, int pageSize, int user_id);
    public int getBonusSum(Integer user_id);
    public int getBonusCount(Integer user_id);
}
