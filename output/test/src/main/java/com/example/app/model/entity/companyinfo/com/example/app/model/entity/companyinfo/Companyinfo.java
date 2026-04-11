
package com.example.app.model.entity.companyinfo;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "CompanyInfo")
public class Companyinfo implements Serializable {


    @Id
    @Column(name="beneficiaryInfoId", nullable=false, unique=true)
    private String beneficiaryinfoid;
    @Id
    @Column(name="companyNameEn", nullable=false)
    private java.lang.String companynameen;
    @Id
    @Column(name="companyNameAr")
    private java.lang.String companynamear;
    @Id
    @Column(name="tradeLicenseNumber")
    private java.lang.String tradelicensenumber;
    @Id
    @Column(name="licenseIssuingAuthority")
    private java.lang.String licenseissuingauthority;

    @ManyToOne
    @JoinColumn(name="beneficiaryInfoId", referencedColumnName="beneficiaryInfoId", name="FK_CompanyInfo_Beneficiary")
    private Beneficiaryinfo beneficiaryinfo;

    public String getBeneficiaryinfoid() {
        return beneficiaryinfoid;
    }
    public void setBeneficiaryinfoid(String beneficiaryinfoid) {
        this.beneficiaryinfoid = beneficiaryinfoid;
    }
    public java.lang.String getCompanynameen() {
        return companynameen;
    }
    public void setCompanynameen(java.lang.String companynameen) {
        this.companynameen = companynameen;
    }
    public java.lang.String getCompanynamear() {
        return companynamear;
    }
    public void setCompanynamear(java.lang.String companynamear) {
        this.companynamear = companynamear;
    }
    public java.lang.String getTradelicensenumber() {
        return tradelicensenumber;
    }
    public void setTradelicensenumber(java.lang.String tradelicensenumber) {
        this.tradelicensenumber = tradelicensenumber;
    }
    public java.lang.String getLicenseissuingauthority() {
        return licenseissuingauthority;
    }
    public void setLicenseissuingauthority(java.lang.String licenseissuingauthority) {
        this.licenseissuingauthority = licenseissuingauthority;
    }

}
