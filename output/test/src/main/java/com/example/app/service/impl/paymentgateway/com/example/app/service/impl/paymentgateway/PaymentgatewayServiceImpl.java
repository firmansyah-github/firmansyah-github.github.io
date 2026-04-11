
package com.example.app.service.impl.paymentgateway;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import javax.transaction.Transactional;

@Service
@Transactional
public class PaymentgatewayServiceImpl implements PaymentgatewayService {

    @Autowired
    private PaymentgatewayRepository repository;

    @Override
    public PaymentgatewayDto create(PaymentgatewayDto dto) {
        // TODO: map DTO to entity, handle FK/PK, save
        return dto;
    }

    @Override
    public Optional<PaymentgatewayDto> findById(String id) {
        return Optional.empty();
    }

    @Override
    public List<PaymentgatewayDto> findAll() {
        return Collections.emptyList();
    }

    @Override
    public PaymentgatewayDto update(String id, PaymentgatewayDto dto) {
        return dto;
    }

    @Override
    public void delete(String id) {
        // TODO: delete implementation
    }
}
