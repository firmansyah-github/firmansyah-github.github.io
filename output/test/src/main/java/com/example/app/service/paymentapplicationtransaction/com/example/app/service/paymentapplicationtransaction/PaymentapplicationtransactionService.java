
package com.example.app.service.paymentapplicationtransaction;

import java.util.List;
import java.util.Optional;

public interface PaymentapplicationtransactionService {
    PaymentapplicationtransactionDto create(PaymentapplicationtransactionDto dto);
    Optional<PaymentapplicationtransactionDto> findById(String id);
    List<PaymentapplicationtransactionDto> findAll();
    PaymentapplicationtransactionDto update(String id, PaymentapplicationtransactionDto dto);
    void delete(String id);
}
