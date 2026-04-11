
package com.example.app.service.paymentgateway;

import java.util.List;
import java.util.Optional;

public interface PaymentgatewayService {
    PaymentgatewayDto create(PaymentgatewayDto dto);
    Optional<PaymentgatewayDto> findById(String id);
    List<PaymentgatewayDto> findAll();
    PaymentgatewayDto update(String id, PaymentgatewayDto dto);
    void delete(String id);
}
