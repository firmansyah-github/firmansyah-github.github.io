
package com.example.app.controller.paymenttransactionquotefeedetail;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymenttransactionquotefeedetails")
public class PaymenttransactionquotefeedetailController {

    @Autowired
    private PaymenttransactionquotefeedetailService paymenttransactionquotefeedetailService;

    @PostMapping
    public PaymenttransactionquotefeedetailDto create(@RequestBody PaymenttransactionquotefeedetailDto dto) {
        return paymenttransactionquotefeedetailService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymenttransactionquotefeedetailDto> getById(@PathVariable("id") String id) {
        return paymenttransactionquotefeedetailService.findById(id);
    }

    @GetMapping
    public List<PaymenttransactionquotefeedetailDto> getAll() {
        return paymenttransactionquotefeedetailService.findAll();
    }

    @PutMapping("/{id}")
    public PaymenttransactionquotefeedetailDto update(@PathVariable("id") String id, @RequestBody PaymenttransactionquotefeedetailDto dto) {
        return paymenttransactionquotefeedetailService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymenttransactionquotefeedetailService.delete(id);
    }
}
