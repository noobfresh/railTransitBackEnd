package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/6.
 */
public class Income {

    private String totalIncome;

    public Income(String totalIncome) {
        this.totalIncome = totalIncome;
    }

    public String getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(String totalIncome) {
        this.totalIncome = totalIncome;
    }
}
