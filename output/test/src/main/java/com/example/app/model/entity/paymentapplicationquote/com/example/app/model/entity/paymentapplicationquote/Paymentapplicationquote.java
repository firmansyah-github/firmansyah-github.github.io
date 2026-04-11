
package com.example.app.model.entity.paymentapplicationquote;

import java.time.LocalDateTime;

import javax.persistence.*;
import java.io.Serializable;
java.time.LocalDateTime

@Entity
@Table(name = "PaymentApplicationQuote")
public class Paymentapplicationquote implements Serializable {

    @EmbeddedId
    private PaymentapplicationquoteId id;


    @ManyToOne
    @JoinColumn(name="beneficiaryInfoId", referencedColumnName="beneficiaryInfoId", name="FK_Quote_Beneficiary")
    private Beneficiaryinfo beneficiaryinfo;
    @ManyToOne
    @JoinColumn(name="userId", referencedColumnName="userId", name="FK_Quote_User")
    private Paymentuser paymentuser;
    @ManyToOne
    @JoinColumn(name="serviceId", referencedColumnName="serviceId", name="FK_Quote_Service")
    private Service service;


    // Embedded Id class for composite primary key
    @Embeddable
    public static class PaymentapplicationquoteId implements Serializable {
        private String paymentapplicationquoteid;
        public String getPaymentapplicationquoteid() { return paymentapplicationquoteid; }
        public void setPaymentapplicationquoteid(String paymentapplicationquoteid) { this.paymentapplicationquoteid = paymentapplicationquoteid; }
        private String applicationid;
        public String getApplicationid() { return applicationid; }
        public void setApplicationid(String applicationid) { this.applicationid = applicationid; }
    }
}
