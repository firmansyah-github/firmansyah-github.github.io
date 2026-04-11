
package com.example.app.service.paymentapplicationquote;

import java.util.List;
import java.util.Optional;

public interface PaymentapplicationquoteService {
    PaymentapplicationquoteDto create(PaymentapplicationquoteDto dto);
    Optional<PaymentapplicationquoteDto> findById(Paymentapplicationquote.PaymentapplicationquoteId id);
    List<PaymentapplicationquoteDto> findAll();
    PaymentapplicationquoteDto update(PaymentapplicationquoteDto dto);
    void delete(Paymentapplicationquote.PaymentapplicationquoteId id);
}
