package com.li.dao;

import com.li.pojo.GroupBuy;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupbuyMapper {

    public GroupBuy getGroupBuyById(@Param("groupbuyid") String groupbuyid);
    public GroupBuy getGroupBuyByGoodId(@Param("goodsid") Integer goodsid);
    public int InsertToGroupBuy(@Param("groupbuyid")String groupbuyid,@Param("people_acquired") int people_acquired,@Param("goodsid") Integer goodsid);
    public int UpdateGroupBuyStatus(@Param("groupbuyid")String groupbuyid,@Param("groupbuystatus")boolean groupbuystatus);
    public int UpdateGroupBuyPeople(@Param("groupbuyid")String groupbuyid,@Param("people_acquired")int people_acquired);


}
