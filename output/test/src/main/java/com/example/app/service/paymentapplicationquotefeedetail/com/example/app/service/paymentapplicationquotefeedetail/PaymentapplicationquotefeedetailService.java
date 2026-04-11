
package com.example.app.service.paymentapplicationquotefeedetail;

import java.util.List;
import java.util.Optional;

public interface PaymentapplicationquotefeedetailService {
    PaymentapplicationquotefeedetailDto create(PaymentapplicationquotefeedetailDto dto);
    Optional<PaymentapplicationquotefeedetailDto> findById(String id);
    List<PaymentapplicationquotefeedetailDto> findAll();
    PaymentapplicationquotefeedetailDto update(String id, PaymentapplicationquotefeedetailDto dto);
    void delete(String id);
}
