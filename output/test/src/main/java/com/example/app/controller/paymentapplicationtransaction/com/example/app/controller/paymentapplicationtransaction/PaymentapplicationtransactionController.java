
package com.example.app.controller.paymentapplicationtransaction;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentapplicationtransactions")
public class PaymentapplicationtransactionController {

    @Autowired
    private PaymentapplicationtransactionService paymentapplicationtransactionService;

    @PostMapping
    public PaymentapplicationtransactionDto create(@RequestBody PaymentapplicationtransactionDto dto) {
        return paymentapplicationtransactionService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentapplicationtransactionDto> getById(@PathVariable("id") String id) {
        return paymentapplicationtransactionService.findById(id);
    }

    @GetMapping
    public List<PaymentapplicationtransactionDto> getAll() {
        return paymentapplicationtransactionService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentapplicationtransactionDto update(@PathVariable("id") String id, @RequestBody PaymentapplicationtransactionDto dto) {
        return paymentapplicationtransactionService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentapplicationtransactionService.delete(id);
    }
}
