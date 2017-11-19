package com.rail.transit.entity;

/**
 * Created by PYF on 2017/11/5.
 */
//实体类记录对象
public class record {

    private int id;
    private String ticketId;
    private String txnDate;
    private String txnTime;
    private String txnStation;
    private String ticketType;
    private String transCode;
    private String sub;
    private String txnStationId;

    public record(int id, String ticketId, String txnDate,
                  String txnTime, String txnStation,
                  String ticketType, String transCode,
                  String sub, String txnStationId) {
        this.id = id;
        this.ticketId = ticketId;
        this.txnDate = txnDate;
        this.txnTime = txnTime;
        this.txnStation = txnStation;
        this.ticketType = ticketType;
        this.transCode = transCode;
        this.sub = sub;
        this.txnStationId = txnStationId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public String getTxnDate() {
        return txnDate;
    }

    public void setTxnDate(String txnDate) {
        this.txnDate = txnDate;
    }

    public String getTxnTime() {
        return txnTime;
    }

    public void setTxnTime(String txnTime) {
        this.txnTime = txnTime;
    }

    public String getTxnStation() {
        return txnStation;
    }

    public void setTxnStation(String txnStation) {
        this.txnStation = txnStation;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getTransCode() {
        return transCode;
    }

    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub;
    }

    public String getTxnStationId() {
        return txnStationId;
    }

    public void setTxnStationId(String txnStationId) {
        this.txnStationId = txnStationId;
    }
}
