
package com.example.app.service.payment;

import java.util.List;
import java.util.Optional;

public interface PaymentService {
    PaymentDto create(PaymentDto dto);
    Optional<PaymentDto> findById(String id);
    List<PaymentDto> findAll();
    PaymentDto update(String id, PaymentDto dto);
    void delete(String id);
}
