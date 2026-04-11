
package com.example.app.service.paymentapplicationtransactionattempt;

import java.util.List;
import java.util.Optional;

public interface PaymentapplicationtransactionattemptService {
    PaymentapplicationtransactionattemptDto create(PaymentapplicationtransactionattemptDto dto);
    Optional<PaymentapplicationtransactionattemptDto> findById(String id);
    List<PaymentapplicationtransactionattemptDto> findAll();
    PaymentapplicationtransactionattemptDto update(String id, PaymentapplicationtransactionattemptDto dto);
    void delete(String id);
}
