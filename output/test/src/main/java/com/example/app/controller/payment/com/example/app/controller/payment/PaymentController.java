
package com.example.app.controller.payment;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping
    public PaymentDto create(@RequestBody PaymentDto dto) {
        return paymentService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentDto> getById(@PathVariable("id") String id) {
        return paymentService.findById(id);
    }

    @GetMapping
    public List<PaymentDto> getAll() {
        return paymentService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentDto update(@PathVariable("id") String id, @RequestBody PaymentDto dto) {
        return paymentService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentService.delete(id);
    }
}
