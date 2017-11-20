package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/19.
 */
public class PeopleTotaolSavedMoneyLineTicketType {
    private String line;
    private String ticketType;
    private String people;
    private String totaolSavedMoney;

    public PeopleTotaolSavedMoneyLineTicketType(String line, String ticketType, String people, String totaolSavedMoney) {
        this.line = line;
        this.ticketType = ticketType;
        this.people = people;
        this.totaolSavedMoney = totaolSavedMoney;
    }

    public PeopleTotaolSavedMoneyLineTicketType() {
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
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
