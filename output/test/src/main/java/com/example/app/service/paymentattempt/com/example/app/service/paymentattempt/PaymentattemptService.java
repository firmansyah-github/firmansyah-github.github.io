
package com.example.app.service.paymentattempt;

import java.util.List;
import java.util.Optional;

public interface PaymentattemptService {
    PaymentattemptDto create(PaymentattemptDto dto);
    Optional<PaymentattemptDto> findById(String id);
    List<PaymentattemptDto> findAll();
    PaymentattemptDto update(String id, PaymentattemptDto dto);
    void delete(String id);
}
