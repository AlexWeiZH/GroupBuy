package com.li.service;
import com.li.pojo.GroupBuy;
public interface GroupBuyService {
    public String idGenerator();
    public GroupBuy getGroupBuyById(String groupbuyid);
    public GroupBuy getGroupBuyByGoodId(Integer goodsid);
    public int InsertToGroupBuy(String groupbuyid, int people_acquired, Integer goodsid);
    public int UpdateGroupBuyStatus(String groupbuyid, boolean groupbuystatus);
    public int UpdateGroupBuyPeople(String groupbuyid, int people_acquired);
}
