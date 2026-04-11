
package com.example.app.model.entity.beneficiaryinfo;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "BeneficiaryInfo")
public class Beneficiaryinfo implements Serializable {


    @Id
    @Column(name="beneficiaryInfoId", nullable=false)
    private String beneficiaryinfoid;
    @Id
    @Column(name="accountId")
    private java.lang.String accountid;
    @Id
    @Column(name="fullNameEn", nullable=false)
    private java.lang.String fullnameen;
    @Id
    @Column(name="fullNameAr")
    private java.lang.String fullnamear;
    @Id
    @Column(name="mobileNo", nullable=false)
    private java.lang.String mobileno;
    @Id
    @Column(name="email")
    private java.lang.String email;
    @Id
    @Column(name="emiratesId")
    private java.lang.String emiratesid;
    @Id
    @Column(name="type", nullable=false)
    private java.lang.String type;


    public String getBeneficiaryinfoid() {
        return beneficiaryinfoid;
    }
    public void setBeneficiaryinfoid(String beneficiaryinfoid) {
        this.beneficiaryinfoid = beneficiaryinfoid;
    }
    public java.lang.String getAccountid() {
        return accountid;
    }
    public void setAccountid(java.lang.String accountid) {
        this.accountid = accountid;
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
    public java.lang.String getEmiratesid() {
        return emiratesid;
    }
    public void setEmiratesid(java.lang.String emiratesid) {
        this.emiratesid = emiratesid;
    }
    public java.lang.String getType() {
        return type;
    }
    public void setType(java.lang.String type) {
        this.type = type;
    }

}
