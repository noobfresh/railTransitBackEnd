package com.rail.transit.controller;

import com.rail.transit.dao.IncomeDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
    public Map<String, String> test5(){
        Map<String, String> map = incomeDao.get2("ticket_type_line_ticket");
        return map;
    }

}
