
package com.example.app.service.paymentuser;

import java.util.List;
import java.util.Optional;

public interface PaymentuserService {
    PaymentuserDto create(PaymentuserDto dto);
    Optional<PaymentuserDto> findById(java.lang.String id);
    List<PaymentuserDto> findAll();
    PaymentuserDto update(java.lang.String id, PaymentuserDto dto);
    void delete(java.lang.String id);
}
