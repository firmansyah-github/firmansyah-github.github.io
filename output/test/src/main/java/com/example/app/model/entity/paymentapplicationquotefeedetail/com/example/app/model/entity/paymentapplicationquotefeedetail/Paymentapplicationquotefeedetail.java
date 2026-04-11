
package com.example.app.model.entity.paymentapplicationquotefeedetail;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentApplicationQuoteFeeDetail")
public class Paymentapplicationquotefeedetail implements Serializable {


    @Id
    @Column(name="paymentApplicationQuoteFeeDetailId", nullable=false, unique=true)
    private String paymentapplicationquotefeedetailid;
    @Id
    @Column(name="paymentApplicationQuoteId")
    private String paymentapplicationquoteid;
    @Id
    @Column(name="applicationId")
    private String applicationid;
    @Id
    @Column(name="feeType")
    private java.lang.String feetype;
    @Id
    @Column(name="beneficiaryInfoId")
    private String beneficiaryinfoid;
    @Id
    @Column(name="amount")
    private BigDecimal amount;
    @Id
    @Column(name="description")
    private java.lang.String description;
    @Id
    @Column(name="feeType_ar")
    private java.lang.String feetypeAr;
    @Id
    @Column(name="feeTypeCode")
    private java.lang.String feetypecode;
    @Id
    @Column(name="descriptionAr")
    private java.lang.String descriptionar;
    @Id
    @Column(name="quantity")
    private java.lang.Integer quantity;
    @Id
    @Column(name="totalAmount")
    private BigDecimal totalamount;
    @Id
    @Column(name="currency")
    private java.lang.String currency;
    @Id
    @Column(name="currencyAr")
    private java.lang.String currencyar;

    @ManyToOne
    @JoinColumn(name="beneficiaryInfoId", referencedColumnName="beneficiaryInfoId", name="FK_QuoteFeeDetail_Beneficiary")
    private Beneficiaryinfo beneficiaryinfo;
    @ManyToOne
    @JoinColumn(name="paymentApplicationQuoteId", referencedColumnName="paymentApplicationQuoteId", name="FK_QuoteFeeDetail_Quote")
    private Paymentapplicationquote paymentapplicationquote;
    @ManyToOne
    @JoinColumn(name="applicationId", referencedColumnName="applicationId", name="FK_QuoteFeeDetail_Quote")
    private Paymentapplicationquote paymentapplicationquote;

    public String getPaymentapplicationquotefeedetailid() {
        return paymentapplicationquotefeedetailid;
    }
    public void setPaymentapplicationquotefeedetailid(String paymentapplicationquotefeedetailid) {
        this.paymentapplicationquotefeedetailid = paymentapplicationquotefeedetailid;
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
    public java.lang.String getFeetype() {
        return feetype;
    }
    public void setFeetype(java.lang.String feetype) {
        this.feetype = feetype;
    }
    public String getBeneficiaryinfoid() {
        return beneficiaryinfoid;
    }
    public void setBeneficiaryinfoid(String beneficiaryinfoid) {
        this.beneficiaryinfoid = beneficiaryinfoid;
    }
    public BigDecimal getAmount() {
        return amount;
    }
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    public java.lang.String getDescription() {
        return description;
    }
    public void setDescription(java.lang.String description) {
        this.description = description;
    }
    public java.lang.String getFeetypeAr() {
        return feetypeAr;
    }
    public void setFeetypeAr(java.lang.String feetypeAr) {
        this.feetypeAr = feetypeAr;
    }
    public java.lang.String getFeetypecode() {
        return feetypecode;
    }
    public void setFeetypecode(java.lang.String feetypecode) {
        this.feetypecode = feetypecode;
    }
    public java.lang.String getDescriptionar() {
        return descriptionar;
    }
    public void setDescriptionar(java.lang.String descriptionar) {
        this.descriptionar = descriptionar;
    }
    public java.lang.Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(java.lang.Integer quantity) {
        this.quantity = quantity;
    }
    public BigDecimal getTotalamount() {
        return totalamount;
    }
    public void setTotalamount(BigDecimal totalamount) {
        this.totalamount = totalamount;
    }
    public java.lang.String getCurrency() {
        return currency;
    }
    public void setCurrency(java.lang.String currency) {
        this.currency = currency;
    }
    public java.lang.String getCurrencyar() {
        return currencyar;
    }
    public void setCurrencyar(java.lang.String currencyar) {
        this.currencyar = currencyar;
    }

}
