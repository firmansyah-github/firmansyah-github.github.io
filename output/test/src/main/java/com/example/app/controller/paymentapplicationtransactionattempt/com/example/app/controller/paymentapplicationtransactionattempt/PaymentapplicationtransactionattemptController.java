
package com.example.app.controller.paymentapplicationtransactionattempt;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentapplicationtransactionattempts")
public class PaymentapplicationtransactionattemptController {

    @Autowired
    private PaymentapplicationtransactionattemptService paymentapplicationtransactionattemptService;

    @PostMapping
    public PaymentapplicationtransactionattemptDto create(@RequestBody PaymentapplicationtransactionattemptDto dto) {
        return paymentapplicationtransactionattemptService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentapplicationtransactionattemptDto> getById(@PathVariable("id") String id) {
        return paymentapplicationtransactionattemptService.findById(id);
    }

    @GetMapping
    public List<PaymentapplicationtransactionattemptDto> getAll() {
        return paymentapplicationtransactionattemptService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentapplicationtransactionattemptDto update(@PathVariable("id") String id, @RequestBody PaymentapplicationtransactionattemptDto dto) {
        return paymentapplicationtransactionattemptService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentapplicationtransactionattemptService.delete(id);
    }
}
