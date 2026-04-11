
package com.example.app.controller.paymentapplicationquote;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentapplicationquotes")
public class PaymentapplicationquoteController {

    @Autowired
    private PaymentapplicationquoteService paymentapplicationquoteService;

    @PostMapping
    public PaymentapplicationquoteDto create(@RequestBody PaymentapplicationquoteDto dto) {
        return paymentapplicationquoteService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentapplicationquoteDto> getById(@PathVariable("id") Paymentapplicationquote.PaymentapplicationquoteId id) {
        return paymentapplicationquoteService.findById(id);
    }

    @GetMapping
    public List<PaymentapplicationquoteDto> getAll() {
        return paymentapplicationquoteService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentapplicationquoteDto update(@PathVariable("id") Paymentapplicationquote.PaymentapplicationquoteId id, @RequestBody PaymentapplicationquoteDto dto) {
        return paymentapplicationquoteService.update(dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Paymentapplicationquote.PaymentapplicationquoteId id) {
        paymentapplicationquoteService.delete(id);
    }
}
