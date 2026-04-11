
package com.example.app.model.entity.paymenttransactionquotefeedetailattempt;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentTransactionQuoteFeeDetailAttempt")
public class Paymenttransactionquotefeedetailattempt implements Serializable {


    @Id
    @Column(name="PaymentTransactionQuoteFeeDetailId", nullable=false, unique=true)
    private String paymenttransactionquotefeedetailid;
    @Id
    @Column(name="paymentApplicationQuoteFeeDetailId")
    private String paymentapplicationquotefeedetailid;
    @Id
    @Column(name="paymentApplicationTransactionId")
    private String paymentapplicationtransactionid;


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
