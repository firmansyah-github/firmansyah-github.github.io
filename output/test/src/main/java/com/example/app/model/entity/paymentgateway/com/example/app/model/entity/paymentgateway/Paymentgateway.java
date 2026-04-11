
package com.example.app.model.entity.paymentgateway;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "PaymentGateway")
public class Paymentgateway implements Serializable {


    @Id
    @Column(name="paymentGatewayId", nullable=false, unique=true)
    private String paymentgatewayid;
    @Id
    @Column(name="gatewayName", unique=true)
    private java.lang.String gatewayname;
    @Id
    @Column(name="gatewayDescription")
    private java.lang.String gatewaydescription;


    public String getPaymentgatewayid() {
        return paymentgatewayid;
    }
    public void setPaymentgatewayid(String paymentgatewayid) {
        this.paymentgatewayid = paymentgatewayid;
    }
    public java.lang.String getGatewayname() {
        return gatewayname;
    }
    public void setGatewayname(java.lang.String gatewayname) {
        this.gatewayname = gatewayname;
    }
    public java.lang.String getGatewaydescription() {
        return gatewaydescription;
    }
    public void setGatewaydescription(java.lang.String gatewaydescription) {
        this.gatewaydescription = gatewaydescription;
    }

}
