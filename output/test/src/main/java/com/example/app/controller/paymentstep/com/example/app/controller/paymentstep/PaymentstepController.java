
package com.example.app.controller.paymentstep;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentsteps")
public class PaymentstepController {

    @Autowired
    private PaymentstepService paymentstepService;

    @PostMapping
    public PaymentstepDto create(@RequestBody PaymentstepDto dto) {
        return paymentstepService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentstepDto> getById(@PathVariable("id") String id) {
        return paymentstepService.findById(id);
    }

    @GetMapping
    public List<PaymentstepDto> getAll() {
        return paymentstepService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentstepDto update(@PathVariable("id") String id, @RequestBody PaymentstepDto dto) {
        return paymentstepService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentstepService.delete(id);
    }
}
