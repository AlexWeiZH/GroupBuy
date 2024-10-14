package com.li.dao;

import com.li.pojo.Bonus;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface BonusMapper {
     int InsertBonus(@Param("goodsname") String goodsname,
                     @Param("totalprice") double totalprice,
                     @Param("time") Timestamp time,
                     @Param("bonus") int bonus,
                     @Param("user_id") Integer user_id);

     List<Bonus> getAllBonusByPage(@Param("startIndex") int startIndex,
                                   @Param("pageSize") int pageSize, @Param("user_id") Integer user_id);
     int getBonusSum(@Param("user_id") Integer user_id);
     int getBonusCount(@Param("user_id") Integer user_id);
}
