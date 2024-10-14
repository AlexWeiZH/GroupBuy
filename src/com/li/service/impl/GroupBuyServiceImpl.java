package com.li.service.impl;

import com.li.dao.GroupbuyMapper;
import com.li.pojo.GroupBuy;
import com.li.service.GroupBuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
    @Autowired
    GroupbuyMapper groupbuyMapper;

    @Override
    public String idGenerator(){
        String str="";
        String str1="";
        //产生groupbuyid
        int max=1000000000,min=1;
        int ran2 = (int) (Math.random()*(max-min)+min);
        if(ran2<10&&ran2>=1){str1="000000000";}
        else if(ran2>=10&&ran2<100){str1="00000000";}
        else if(ran2>=100&&ran2<1000){str1="0000000";}
        else if(ran2>=1000&&ran2<10000){str1="000000";}
        else if(ran2>=10000&&ran2<100000){str1="00000";}
        else if(ran2>=100000&&ran2<1000000){str1="0000";}
        else if(ran2>=1000000&&ran2<10000000){str1="000";}
        else if(ran2>=10000000&&ran2<100000000){str1="00";}
        else {str1="0";}
        String s= String.valueOf(ran2);
        str=str1+s;
        return str;
    }
    @Override
    public GroupBuy getGroupBuyById(String groupbuyid){
        GroupBuy gb=groupbuyMapper.getGroupBuyById(groupbuyid);
        return gb;
    }

    @Override
    public GroupBuy getGroupBuyByGoodId(Integer goodsid){
        GroupBuy gb=groupbuyMapper.getGroupBuyByGoodId(goodsid);
        return gb;
    }

    @Override
    public int InsertToGroupBuy(String groupbuyid,int people_acquired,Integer goodsid){
        return groupbuyMapper.InsertToGroupBuy(groupbuyid,people_acquired,goodsid);
    }

    @Override
    public int UpdateGroupBuyStatus(String groupbuyid,boolean groupbuystatus){
        return groupbuyMapper.UpdateGroupBuyStatus(groupbuyid,groupbuystatus);
    }

    @Override
    public int UpdateGroupBuyPeople(String groupbuyid,int people_acquired) {
        return groupbuyMapper.UpdateGroupBuyPeople(groupbuyid,people_acquired);
    }
}
