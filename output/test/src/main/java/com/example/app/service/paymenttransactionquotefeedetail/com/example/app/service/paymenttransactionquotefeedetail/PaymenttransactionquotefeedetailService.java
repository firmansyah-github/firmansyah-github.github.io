
package com.example.app.service.paymenttransactionquotefeedetail;

import java.util.List;
import java.util.Optional;

public interface PaymenttransactionquotefeedetailService {
    PaymenttransactionquotefeedetailDto create(PaymenttransactionquotefeedetailDto dto);
    Optional<PaymenttransactionquotefeedetailDto> findById(String id);
    List<PaymenttransactionquotefeedetailDto> findAll();
    PaymenttransactionquotefeedetailDto update(String id, PaymenttransactionquotefeedetailDto dto);
    void delete(String id);
}
