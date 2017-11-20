package com.rail.transit.controller;

import com.rail.transit.dao.IncomeDaoImpl;
import com.rail.transit.entity.*;
import com.sun.org.apache.xml.internal.serialize.LineSeparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PYF on 2017/11/6.
 */
@Controller
@RequestMapping("test/")
public class TestController {

    private IncomeDaoImpl incomeDao;

    @Autowired
    public TestController(IncomeDaoImpl incomeDao) {
        this.incomeDao = incomeDao;
    }

    @RequestMapping(value = "test")
    @ResponseBody
    public Map<String, String> test(){
        Map<String, String> map = new HashMap<String, String>();
        //System.out.println(incomeDao.get("totalincome").getTotalIncome());
        map.put("totalincome",
                String.valueOf(incomeDao.get("totalincome").getTotalIncome()));
        map.put("avg_ticketprice_include_free",
                String.valueOf(incomeDao.get("avg_ticketprice_include_free").getTotalIncome()));
        map.put("avg_ticketprice_no_include_free",
                String.valueOf(incomeDao.get("avg_ticketprice_no_include_free").getTotalIncome()));
        map.put("total_people_discount",
                String.valueOf(incomeDao.get("total_people_discount").getTotalIncome()));
        map.put("total_money_discount",
                String.valueOf(incomeDao.get("total_money_discount").getTotalIncome()));
        map.put("single_ticket_loss_num",
                String.valueOf(incomeDao.get("single_ticket_loss_num").getTotalIncome()));
        return map;
    }

    @RequestMapping(value = "test2")
    @ResponseBody
    public Map<String, String> test2(){
        Map<String, String> map = incomeDao.get1("moneyByTime");
        return map;
    }

    @RequestMapping(value = "test3")
    @ResponseBody
    public Map<String, String> test3(){
        Map<String, String> map = incomeDao.get1("people_discount");
        return map;
    }

    @RequestMapping(value = "test4")
    @ResponseBody
    public Map<String, String> test4(){
        Map<String, String> map = incomeDao.get1("money_discount");
        return map;
    }

    @RequestMapping(value = "test5")
    @ResponseBody
    public Map<String, List<NumberPercentIncomeByTicketType>> test5(){
        List<NumberPercentIncomeByTicketType> list = incomeDao.get2("ticket_type_line_ticket");
        Map<String, List<NumberPercentIncomeByTicketType>> map = new HashMap<String, List<NumberPercentIncomeByTicketType>>();
        map.put("ticket_type_line_ticket", list);
        return map;
    }

    @RequestMapping(value = "test6")
    @ResponseBody
    public Map<String, List<PeopleTotaolSaveMoney>> test6(){
        List<PeopleTotaolSaveMoney> list = incomeDao.get3("lines");
        Map<String, List<PeopleTotaolSaveMoney>> map = new HashMap<String, List<PeopleTotaolSaveMoney>>();
        map.put("lines", list);
        return map;
    }

    @RequestMapping(value = "test7")
    @ResponseBody
    public Map<String, List<PeopleTotaolSavedMoneyLineTicketType>> test7(){
        List<PeopleTotaolSavedMoneyLineTicketType> list = incomeDao.get4("line_ticket_type");
        Map<String, List<PeopleTotaolSavedMoneyLineTicketType>> map = new HashMap<String, List<PeopleTotaolSavedMoneyLineTicketType>>();
        map.put("line_ticket_type", list);
        return map;
    }

    @RequestMapping(value = "test8")
    @ResponseBody
    public Map<String, List<PeopleTotaolSavedMoneStations>> test8(){
        List<PeopleTotaolSavedMoneStations> list = incomeDao.get5("stations");
        Map<String, List<PeopleTotaolSavedMoneStations>> map = new HashMap<String, List<PeopleTotaolSavedMoneStations>>();
        map.put("stations", list);
        return map;
    }

    @RequestMapping(value = "test9")
    @ResponseBody
    public Map<String, List<PeopleTotaolSavedMoneyStationTicketType>> test9(){
        List<PeopleTotaolSavedMoneyStationTicketType> list = incomeDao.get6("station_ticket_type");
        Map<String, List<PeopleTotaolSavedMoneyStationTicketType>> map = new HashMap<String, List<PeopleTotaolSavedMoneyStationTicketType>>();
        map.put("station_ticket_type", list);
        return map;
    }
}
