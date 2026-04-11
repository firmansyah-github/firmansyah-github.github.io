
package com.example.app.model.entity.servicetype;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "ServiceType")
public class Servicetype implements Serializable {


    @Id
    @Column(name="serviceTypeId", nullable=false, unique=true)
    private String servicetypeid;
    @Id
    @Column(name="serviceTypeEn", nullable=false)
    private java.lang.String servicetypeen;
    @Id
    @Column(name="serviceTypeAr", nullable=false)
    private java.lang.String servicetypear;


    public String getServicetypeid() {
        return servicetypeid;
    }
    public void setServicetypeid(String servicetypeid) {
        this.servicetypeid = servicetypeid;
    }
    public java.lang.String getServicetypeen() {
        return servicetypeen;
    }
    public void setServicetypeen(java.lang.String servicetypeen) {
        this.servicetypeen = servicetypeen;
    }
    public java.lang.String getServicetypear() {
        return servicetypear;
    }
    public void setServicetypear(java.lang.String servicetypear) {
        this.servicetypear = servicetypear;
    }

}
