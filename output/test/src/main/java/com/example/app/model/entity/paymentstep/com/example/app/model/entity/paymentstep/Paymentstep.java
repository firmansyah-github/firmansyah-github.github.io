
package com.example.app.model.entity.paymentstep;

import java.time.LocalDateTime;

import javax.persistence.*;
import java.io.Serializable;
java.time.LocalDateTime

@Entity
@Table(name = "PaymentStep")
public class Paymentstep implements Serializable {


    @Id
    @Column(name="paymentStepId", nullable=false, unique=true)
    private String paymentstepid;
    @Id
    @Column(name="userId")
    private java.lang.String userid;
    @Id
    @Column(name="requestURLAPI")
    private java.lang.String requesturlapi;
    @Id
    @Column(name="requestPaylod")
    private java.lang.String requestpaylod;
    @Id
    @Column(name="requestDateTime")
    private java.time.LocalDateTime requestdatetime;
    @Id
    @Column(name="requestType", nullable=false)
    private java.lang.String requesttype;
    @Id
    @Column(name="responsePaylod")
    private java.lang.String responsepaylod;
    @Id
    @Column(name="responseDateTime")
    private java.time.LocalDateTime responsedatetime;
    @Id
    @Column(name="responseMessage")
    private java.lang.String responsemessage;
    @Id
    @Column(name="responseCode")
    private java.lang.String responsecode;
    @Id
    @Column(name="responseStatus")
    private java.lang.String responsestatus;
    @Id
    @Column(name="responseExternalRefId")
    private java.lang.String responseexternalrefid;
    @Id
    @Column(name="paymentBatchId")
    private String paymentbatchid;
    @Id
    @Column(name="responseMessageAr")
    private java.lang.String responsemessagear;

    @ManyToOne
    @JoinColumn(name="userId", referencedColumnName="userId", name="FK_Step_User")
    private Paymentuser paymentuser;

    public String getPaymentstepid() {
        return paymentstepid;
    }
    public void setPaymentstepid(String paymentstepid) {
        this.paymentstepid = paymentstepid;
    }
    public java.lang.String getUserid() {
        return userid;
    }
    public void setUserid(java.lang.String userid) {
        this.userid = userid;
    }
    public java.lang.String getRequesturlapi() {
        return requesturlapi;
    }
    public void setRequesturlapi(java.lang.String requesturlapi) {
        this.requesturlapi = requesturlapi;
    }
    public java.lang.String getRequestpaylod() {
        return requestpaylod;
    }
    public void setRequestpaylod(java.lang.String requestpaylod) {
        this.requestpaylod = requestpaylod;
    }
    public java.time.LocalDateTime getRequestdatetime() {
        return requestdatetime;
    }
    public void setRequestdatetime(java.time.LocalDateTime requestdatetime) {
        this.requestdatetime = requestdatetime;
    }
    public java.lang.String getRequesttype() {
        return requesttype;
    }
    public void setRequesttype(java.lang.String requesttype) {
        this.requesttype = requesttype;
    }
    public java.lang.String getResponsepaylod() {
        return responsepaylod;
    }
    public void setResponsepaylod(java.lang.String responsepaylod) {
        this.responsepaylod = responsepaylod;
    }
    public java.time.LocalDateTime getResponsedatetime() {
        return responsedatetime;
    }
    public void setResponsedatetime(java.time.LocalDateTime responsedatetime) {
        this.responsedatetime = responsedatetime;
    }
    public java.lang.String getResponsemessage() {
        return responsemessage;
    }
    public void setResponsemessage(java.lang.String responsemessage) {
        this.responsemessage = responsemessage;
    }
    public java.lang.String getResponsecode() {
        return responsecode;
    }
    public void setResponsecode(java.lang.String responsecode) {
        this.responsecode = responsecode;
    }
    public java.lang.String getResponsestatus() {
        return responsestatus;
    }
    public void setResponsestatus(java.lang.String responsestatus) {
        this.responsestatus = responsestatus;
    }
    public java.lang.String getResponseexternalrefid() {
        return responseexternalrefid;
    }
    public void setResponseexternalrefid(java.lang.String responseexternalrefid) {
        this.responseexternalrefid = responseexternalrefid;
    }
    public String getPaymentbatchid() {
        return paymentbatchid;
    }
    public void setPaymentbatchid(String paymentbatchid) {
        this.paymentbatchid = paymentbatchid;
    }
    public java.lang.String getResponsemessagear() {
        return responsemessagear;
    }
    public void setResponsemessagear(java.lang.String responsemessagear) {
        this.responsemessagear = responsemessagear;
    }

}
