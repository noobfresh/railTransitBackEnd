package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/20.
 */
public class PeopleTotaolSavedMoneyStationTicketType {
    private String station1;
    private String ticketType;
    private String people;
    private String totaolSavedMoney;

    public PeopleTotaolSavedMoneyStationTicketType(String station1, String ticketType, String people, String totaolSavedMoney) {
        this.station1 = station1;
        this.ticketType = ticketType;
        this.people = people;
        this.totaolSavedMoney = totaolSavedMoney;
    }

    public PeopleTotaolSavedMoneyStationTicketType() {
    }

    public String getStation1() {
        return station1;
    }

    public void setStation1(String station1) {
        this.station1 = station1;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getTotaolSavedMoney() {
        return totaolSavedMoney;
    }

    public void setTotaolSavedMoney(String totaolSavedMoney) {
        this.totaolSavedMoney = totaolSavedMoney;
    }
}
