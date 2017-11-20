package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/19.
 */
public class PeopleTotaolSavedMoneStations {
    private String people;
    private String station1;
    private String totaolSavedMoney;

    public PeopleTotaolSavedMoneStations(String people, String station1, String totaolSavedMoney) {
        this.people = people;
        this.station1 = station1;
        this.totaolSavedMoney = totaolSavedMoney;
    }

    public PeopleTotaolSavedMoneStations() {
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getStation1() {
        return station1;
    }

    public void setStation1(String station1) {
        this.station1 = station1;
    }

    public String getTotaolSavedMoney() {
        return totaolSavedMoney;
    }

    public void setTotaolSavedMoney(String totaolSavedMoney) {
        this.totaolSavedMoney = totaolSavedMoney;
    }
}
