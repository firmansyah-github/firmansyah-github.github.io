
package com.example.app.model.entity.paymentuser;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentUser")
public class Paymentuser implements Serializable {


    @Id
    @Column(name="userId", nullable=false, unique=true)
    private java.lang.String userid;
    @Id
    @Column(name="authenticated", nullable=false)
    private BitSet authenticated;
    @Id
    @Column(name="userName", nullable=false)
    private java.lang.String username;
    @Id
    @Column(name="fullNameEn", nullable=false)
    private java.lang.String fullnameen;
    @Id
    @Column(name="fullNameAr", nullable=false)
    private java.lang.String fullnamear;
    @Id
    @Column(name="mobileNo")
    private java.lang.String mobileno;
    @Id
    @Column(name="email")
    private java.lang.String email;
    @Id
    @Column(name="nationalityCode")
    private String nationalitycode;
    @Id
    @Column(name="emiratesId")
    private java.lang.String emiratesid;
    @Id
    @Column(name="emirateCode")
    private String emiratecode;
    @Id
    @Column(name="poBox")
    private java.lang.String pobox;


    public java.lang.String getUserid() {
        return userid;
    }
    public void setUserid(java.lang.String userid) {
        this.userid = userid;
    }
    public BitSet getAuthenticated() {
        return authenticated;
    }
    public void setAuthenticated(BitSet authenticated) {
        this.authenticated = authenticated;
    }
    public java.lang.String getUsername() {
        return username;
    }
    public void setUsername(java.lang.String username) {
        this.username = username;
    }
    public java.lang.String getFullnameen() {
        return fullnameen;
    }
    public void setFullnameen(java.lang.String fullnameen) {
        this.fullnameen = fullnameen;
    }
    public java.lang.String getFullnamear() {
        return fullnamear;
    }
    public void setFullnamear(java.lang.String fullnamear) {
        this.fullnamear = fullnamear;
    }
    public java.lang.String getMobileno() {
        return mobileno;
    }
    public void setMobileno(java.lang.String mobileno) {
        this.mobileno = mobileno;
    }
    public java.lang.String getEmail() {
        return email;
    }
    public void setEmail(java.lang.String email) {
        this.email = email;
    }
    public String getNationalitycode() {
        return nationalitycode;
    }
    public void setNationalitycode(String nationalitycode) {
        this.nationalitycode = nationalitycode;
    }
    public java.lang.String getEmiratesid() {
        return emiratesid;
    }
    public void setEmiratesid(java.lang.String emiratesid) {
        this.emiratesid = emiratesid;
    }
    public String getEmiratecode() {
        return emiratecode;
    }
    public void setEmiratecode(String emiratecode) {
        this.emiratecode = emiratecode;
    }
    public java.lang.String getPobox() {
        return pobox;
    }
    public void setPobox(java.lang.String pobox) {
        this.pobox = pobox;
    }

}
