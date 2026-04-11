
package com.example.app.model.entity.paymenttransactionquotefeedetail;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentTransactionQuoteFeeDetail")
public class Paymenttransactionquotefeedetail implements Serializable {


    @Id
    @Column(name="PaymentTransactionQuoteFeeDetailId", nullable=false, unique=true)
    private String paymenttransactionquotefeedetailid;
    @Id
    @Column(name="paymentApplicationQuoteFeeDetailId")
    private String paymentapplicationquotefeedetailid;
    @Id
    @Column(name="paymentApplicationTransactionId")
    private String paymentapplicationtransactionid;

    @ManyToOne
    @JoinColumn(name="paymentApplicationQuoteFeeDetailId", referencedColumnName="paymentApplicationQuoteFeeDetailId", name="FK_PaymentTransactionQuoteFeeDetail_PaymentApplicationQuoteFeeDetail")
    private Paymentapplicationquotefeedetail paymentapplicationquotefeedetail;
    @ManyToOne
    @JoinColumn(name="paymentApplicationTransactionId", referencedColumnName="paymentApplicationTransactionId", name="FK_PaymentTransactionQuoteFeeDetail_PaymentApplicationTransaction")
    private Paymentapplicationtransaction paymentapplicationtransaction;

    public String getPaymenttransactionquotefeedetailid() {
        return paymenttransactionquotefeedetailid;
    }
    public void setPaymenttransactionquotefeedetailid(String paymenttransactionquotefeedetailid) {
        this.paymenttransactionquotefeedetailid = paymenttransactionquotefeedetailid;
    }
    public String getPaymentapplicationquotefeedetailid() {
        return paymentapplicationquotefeedetailid;
    }
    public void setPaymentapplicationquotefeedetailid(String paymentapplicationquotefeedetailid) {
        this.paymentapplicationquotefeedetailid = paymentapplicationquotefeedetailid;
    }
    public String getPaymentapplicationtransactionid() {
        return paymentapplicationtransactionid;
    }
    public void setPaymentapplicationtransactionid(String paymentapplicationtransactionid) {
        this.paymentapplicationtransactionid = paymentapplicationtransactionid;
    }

}
