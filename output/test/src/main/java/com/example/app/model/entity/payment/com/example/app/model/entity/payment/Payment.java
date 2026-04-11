
package com.example.app.model.entity.payment;

import java.time.LocalDateTime;

import javax.persistence.*;
import java.io.Serializable;
java.time.LocalDateTime

@Entity
@Table(name = "Payment")
public class Payment implements Serializable {


    @Id
    @Column(name="paymentBatchId", nullable=false, unique=true)
    private String paymentbatchid;
    @Id
    @Column(name="paymentGatewayId")
    private String paymentgatewayid;
    @Id
    @Column(name="userId")
    private java.lang.String userid;
    @Id
    @Column(name="paymentDateTime")
    private java.time.LocalDateTime paymentdatetime;
    @Id
    @Column(name="status")
    private java.lang.String status;
    @Id
    @Column(name="lastExternalRefId")
    private java.lang.String lastexternalrefid;
    @Id
    @Column(name="totalAmount", nullable=false)
    private BigDecimal totalamount;
    @Id
    @Column(name="totalTransactions", nullable=false)
    private java.lang.Integer totaltransactions;
    @Id
    @Column(name="paymentMethod")
    private java.lang.String paymentmethod;
    @Id
    @Column(name="paymentMethodNumber")
    private java.lang.String paymentmethodnumber;
    @Id
    @Column(name="currency")
    private java.lang.String currency;
    @Id
    @Column(name="messageCode")
    private java.lang.String messagecode;
    @Id
    @Column(name="messageEn")
    private java.lang.String messageen;
    @Id
    @Column(name="messageAr")
    private java.lang.String messagear;
    @Id
    @Column(name="paymentDocId")
    private java.lang.String paymentdocid;

    @ManyToOne
    @JoinColumn(name="paymentGatewayId", referencedColumnName="paymentGatewayId", name="FK_Payment_Gateway")
    private Paymentgateway paymentgateway;
    @ManyToOne
    @JoinColumn(name="userId", referencedColumnName="userId", name="FK_Payment_User")
    private Paymentuser paymentuser;

    public String getPaymentbatchid() {
        return paymentbatchid;
    }
    public void setPaymentbatchid(String paymentbatchid) {
        this.paymentbatchid = paymentbatchid;
    }
    public String getPaymentgatewayid() {
        return paymentgatewayid;
    }
    public void setPaymentgatewayid(String paymentgatewayid) {
        this.paymentgatewayid = paymentgatewayid;
    }
    public java.lang.String getUserid() {
        return userid;
    }
    public void setUserid(java.lang.String userid) {
        this.userid = userid;
    }
    public java.time.LocalDateTime getPaymentdatetime() {
        return paymentdatetime;
    }
    public void setPaymentdatetime(java.time.LocalDateTime paymentdatetime) {
        this.paymentdatetime = paymentdatetime;
    }
    public java.lang.String getStatus() {
        return status;
    }
    public void setStatus(java.lang.String status) {
        this.status = status;
    }
    public java.lang.String getLastexternalrefid() {
        return lastexternalrefid;
    }
    public void setLastexternalrefid(java.lang.String lastexternalrefid) {
        this.lastexternalrefid = lastexternalrefid;
    }
    public BigDecimal getTotalamount() {
        return totalamount;
    }
    public void setTotalamount(BigDecimal totalamount) {
        this.totalamount = totalamount;
    }
    public java.lang.Integer getTotaltransactions() {
        return totaltransactions;
    }
    public void setTotaltransactions(java.lang.Integer totaltransactions) {
        this.totaltransactions = totaltransactions;
    }
    public java.lang.String getPaymentmethod() {
        return paymentmethod;
    }
    public void setPaymentmethod(java.lang.String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }
    public java.lang.String getPaymentmethodnumber() {
        return paymentmethodnumber;
    }
    public void setPaymentmethodnumber(java.lang.String paymentmethodnumber) {
        this.paymentmethodnumber = paymentmethodnumber;
    }
    public java.lang.String getCurrency() {
        return currency;
    }
    public void setCurrency(java.lang.String currency) {
        this.currency = currency;
    }
    public java.lang.String getMessagecode() {
        return messagecode;
    }
    public void setMessagecode(java.lang.String messagecode) {
        this.messagecode = messagecode;
    }
    public java.lang.String getMessageen() {
        return messageen;
    }
    public void setMessageen(java.lang.String messageen) {
        this.messageen = messageen;
    }
    public java.lang.String getMessagear() {
        return messagear;
    }
    public void setMessagear(java.lang.String messagear) {
        this.messagear = messagear;
    }
    public java.lang.String getPaymentdocid() {
        return paymentdocid;
    }
    public void setPaymentdocid(java.lang.String paymentdocid) {
        this.paymentdocid = paymentdocid;
    }

}
