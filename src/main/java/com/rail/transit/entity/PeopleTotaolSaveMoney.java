package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/19.
 */
public class PeopleTotaolSaveMoney {
    private String line;
    private String people;
    private String totaolSaveMoney;

    public PeopleTotaolSaveMoney(String line, String people, String totaolSaveMoney) {
        this.line = line;
        this.people = people;
        this.totaolSaveMoney = totaolSaveMoney;
    }

    public PeopleTotaolSaveMoney() {
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getTotaolSaveMoney() {
        return totaolSaveMoney;
    }

    public void setTotaolSaveMoney(String totaolSaveMoney) {
        this.totaolSaveMoney = totaolSaveMoney;
    }
}
