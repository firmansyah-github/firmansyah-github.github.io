
package com.example.app.controller.paymenttransactionquotefeedetailattempt;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymenttransactionquotefeedetailattempts")
public class PaymenttransactionquotefeedetailattemptController {

    @Autowired
    private PaymenttransactionquotefeedetailattemptService paymenttransactionquotefeedetailattemptService;

    @PostMapping
    public PaymenttransactionquotefeedetailattemptDto create(@RequestBody PaymenttransactionquotefeedetailattemptDto dto) {
        return paymenttransactionquotefeedetailattemptService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymenttransactionquotefeedetailattemptDto> getById(@PathVariable("id") String id) {
        return paymenttransactionquotefeedetailattemptService.findById(id);
    }

    @GetMapping
    public List<PaymenttransactionquotefeedetailattemptDto> getAll() {
        return paymenttransactionquotefeedetailattemptService.findAll();
    }

    @PutMapping("/{id}")
    public PaymenttransactionquotefeedetailattemptDto update(@PathVariable("id") String id, @RequestBody PaymenttransactionquotefeedetailattemptDto dto) {
        return paymenttransactionquotefeedetailattemptService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymenttransactionquotefeedetailattemptService.delete(id);
    }
}
