package com.rail.transit.dao;

import com.rail.transit.entity.Income;

import java.util.List;

/**
 * Created by PYF on 2017/11/6.
 */
public interface IIncomeDao {

    //add
    boolean add(Income income);

    //add 批量
    boolean add(List<Income> incomes);

    //delete
    void delete(String key);

    //delete 批量
    void delete(List<String> keys);

    //update
    boolean update(Income income);

    //get
    Income get(String keyId);
}
