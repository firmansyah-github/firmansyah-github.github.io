
package com.example.app.model.entity.paymentapplicationtransactionattempt;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentApplicationTransactionAttempt")
public class Paymentapplicationtransactionattempt implements Serializable {


    @Id
    @Column(name="paymentApplicationTransactionId", nullable=false, unique=true)
    private String paymentapplicationtransactionid;
    @Id
    @Column(name="paymentBatchId")
    private String paymentbatchid;
    @Id
    @Column(name="paymentApplicationQuoteId")
    private String paymentapplicationquoteid;
    @Id
    @Column(name="applicationId")
    private String applicationid;
    @Id
    @Column(name="spCode", nullable=false)
    private java.lang.String spcode;
    @Id
    @Column(name="servCode", nullable=false)
    private java.lang.String servcode;
    @Id
    @Column(name="spTrn", nullable=false, unique=true)
    private java.lang.String sptrn;
    @Id
    @Column(name="amount", nullable=false)
    private BigDecimal amount;
    @Id
    @Column(name="currency", nullable=false)
    private java.lang.String currency;
    @Id
    @Column(name="timestamp", nullable=false)
    private java.lang.String timestamp;
    @Id
    @Column(name="channel", nullable=false)
    private String channel;
    @Id
    @Column(name="description", nullable=false)
    private java.lang.String description;
    @Id
    @Column(name="type", nullable=false)
    private java.lang.String type;
    @Id
    @Column(name="version", nullable=false)
    private java.lang.String version;
    @Id
    @Column(name="settlementType", nullable=false)
    private java.lang.String settlementtype;
    @Id
    @Column(name="degTrn")
    private java.lang.String degtrn;
    @Id
    @Column(name="txnTimestamp")
    private java.lang.String txntimestamp;
    @Id
    @Column(name="paymentMethod")
    private java.lang.String paymentmethod;
    @Id
    @Column(name="paymentMethodNumber")
    private java.lang.String paymentmethodnumber;
    @Id
    @Column(name="status")
    private java.lang.String status;
    @Id
    @Column(name="statusCode")
    private java.lang.String statuscode;


    public String getPaymentapplicationtransactionid() {
        return paymentapplicationtransactionid;
    }
    public void setPaymentapplicationtransactionid(String paymentapplicationtransactionid) {
        this.paymentapplicationtransactionid = paymentapplicationtransactionid;
    }
    public String getPaymentbatchid() {
        return paymentbatchid;
    }
    public void setPaymentbatchid(String paymentbatchid) {
        this.paymentbatchid = paymentbatchid;
    }
    public String getPaymentapplicationquoteid() {
        return paymentapplicationquoteid;
    }
    public void setPaymentapplicationquoteid(String paymentapplicationquoteid) {
        this.paymentapplicationquoteid = paymentapplicationquoteid;
    }
    public String getApplicationid() {
        return applicationid;
    }
    public void setApplicationid(String applicationid) {
        this.applicationid = applicationid;
    }
    public java.lang.String getSpcode() {
        return spcode;
    }
    public void setSpcode(java.lang.String spcode) {
        this.spcode = spcode;
    }
    public java.lang.String getServcode() {
        return servcode;
    }
    public void setServcode(java.lang.String servcode) {
        this.servcode = servcode;
    }
    public java.lang.String getSptrn() {
        return sptrn;
    }
    public void setSptrn(java.lang.String sptrn) {
        this.sptrn = sptrn;
    }
    public BigDecimal getAmount() {
        return amount;
    }
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    public java.lang.String getCurrency() {
        return currency;
    }
    public void setCurrency(java.lang.String currency) {
        this.currency = currency;
    }
    public java.lang.String getTimestamp() {
        return timestamp;
    }
    public void setTimestamp(java.lang.String timestamp) {
        this.timestamp = timestamp;
    }
    public String getChannel() {
        return channel;
    }
    public void setChannel(String channel) {
        this.channel = channel;
    }
    public java.lang.String getDescription() {
        return description;
    }
    public void setDescription(java.lang.String description) {
        this.description = description;
    }
    public java.lang.String getType() {
        return type;
    }
    public void setType(java.lang.String type) {
        this.type = type;
    }
    public java.lang.String getVersion() {
        return version;
    }
    public void setVersion(java.lang.String version) {
        this.version = version;
    }
    public java.lang.String getSettlementtype() {
        return settlementtype;
    }
    public void setSettlementtype(java.lang.String settlementtype) {
        this.settlementtype = settlementtype;
    }
    public java.lang.String getDegtrn() {
        return degtrn;
    }
    public void setDegtrn(java.lang.String degtrn) {
        this.degtrn = degtrn;
    }
    public java.lang.String getTxntimestamp() {
        return txntimestamp;
    }
    public void setTxntimestamp(java.lang.String txntimestamp) {
        this.txntimestamp = txntimestamp;
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
    public java.lang.String getStatus() {
        return status;
    }
    public void setStatus(java.lang.String status) {
        this.status = status;
    }
    public java.lang.String getStatuscode() {
        return statuscode;
    }
    public void setStatuscode(java.lang.String statuscode) {
        this.statuscode = statuscode;
    }

}
