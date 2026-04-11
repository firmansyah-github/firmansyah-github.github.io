
package com.example.app.controller.paymentuser;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentusers")
public class PaymentuserController {

    @Autowired
    private PaymentuserService paymentuserService;

    @PostMapping
    public PaymentuserDto create(@RequestBody PaymentuserDto dto) {
        return paymentuserService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentuserDto> getById(@PathVariable("id") java.lang.String id) {
        return paymentuserService.findById(id);
    }

    @GetMapping
    public List<PaymentuserDto> getAll() {
        return paymentuserService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentuserDto update(@PathVariable("id") java.lang.String id, @RequestBody PaymentuserDto dto) {
        return paymentuserService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") java.lang.String id) {
        paymentuserService.delete(id);
    }
}
