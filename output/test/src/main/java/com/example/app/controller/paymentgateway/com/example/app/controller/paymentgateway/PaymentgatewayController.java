
package com.example.app.controller.paymentgateway;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentgateways")
public class PaymentgatewayController {

    @Autowired
    private PaymentgatewayService paymentgatewayService;

    @PostMapping
    public PaymentgatewayDto create(@RequestBody PaymentgatewayDto dto) {
        return paymentgatewayService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentgatewayDto> getById(@PathVariable("id") String id) {
        return paymentgatewayService.findById(id);
    }

    @GetMapping
    public List<PaymentgatewayDto> getAll() {
        return paymentgatewayService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentgatewayDto update(@PathVariable("id") String id, @RequestBody PaymentgatewayDto dto) {
        return paymentgatewayService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentgatewayService.delete(id);
    }
}
