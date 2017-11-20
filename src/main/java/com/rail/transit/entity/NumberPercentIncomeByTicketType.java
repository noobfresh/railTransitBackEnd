package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/18.
 */
public class NumberPercentIncomeByTicketType {
    private String line;
    private String ticket_t;
    private String number;
    private String percent;
    private String income;

    public NumberPercentIncomeByTicketType(String line, String ticket_t, String number, String percent, String income) {
        this.line = line;
        this.ticket_t = ticket_t;
        this.number = number;
        this.percent = percent;
        this.income = income;
    }

    public NumberPercentIncomeByTicketType() {
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getTicket_t() {
        return ticket_t;
    }

    public void setTicket_t(String ticket_t) {
        this.ticket_t = ticket_t;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String percent) {
        this.percent = percent;
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }
}
