
package com.example.app.service.paymentstep;

import java.util.List;
import java.util.Optional;

public interface PaymentstepService {
    PaymentstepDto create(PaymentstepDto dto);
    Optional<PaymentstepDto> findById(String id);
    List<PaymentstepDto> findAll();
    PaymentstepDto update(String id, PaymentstepDto dto);
    void delete(String id);
}
