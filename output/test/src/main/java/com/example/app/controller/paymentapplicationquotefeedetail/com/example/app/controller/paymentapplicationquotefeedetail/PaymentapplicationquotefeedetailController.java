
package com.example.app.controller.paymentapplicationquotefeedetail;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentapplicationquotefeedetails")
public class PaymentapplicationquotefeedetailController {

    @Autowired
    private PaymentapplicationquotefeedetailService paymentapplicationquotefeedetailService;

    @PostMapping
    public PaymentapplicationquotefeedetailDto create(@RequestBody PaymentapplicationquotefeedetailDto dto) {
        return paymentapplicationquotefeedetailService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentapplicationquotefeedetailDto> getById(@PathVariable("id") String id) {
        return paymentapplicationquotefeedetailService.findById(id);
    }

    @GetMapping
    public List<PaymentapplicationquotefeedetailDto> getAll() {
        return paymentapplicationquotefeedetailService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentapplicationquotefeedetailDto update(@PathVariable("id") String id, @RequestBody PaymentapplicationquotefeedetailDto dto) {
        return paymentapplicationquotefeedetailService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentapplicationquotefeedetailService.delete(id);
    }
}
