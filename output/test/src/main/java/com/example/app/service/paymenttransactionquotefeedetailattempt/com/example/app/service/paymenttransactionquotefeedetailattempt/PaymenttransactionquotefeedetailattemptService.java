
package com.example.app.service.paymenttransactionquotefeedetailattempt;

import java.util.List;
import java.util.Optional;

public interface PaymenttransactionquotefeedetailattemptService {
    PaymenttransactionquotefeedetailattemptDto create(PaymenttransactionquotefeedetailattemptDto dto);
    Optional<PaymenttransactionquotefeedetailattemptDto> findById(String id);
    List<PaymenttransactionquotefeedetailattemptDto> findAll();
    PaymenttransactionquotefeedetailattemptDto update(String id, PaymenttransactionquotefeedetailattemptDto dto);
    void delete(String id);
}
