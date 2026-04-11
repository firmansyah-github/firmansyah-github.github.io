
package com.example.app.controller.paymentattempt;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/paymentattempts")
public class PaymentattemptController {

    @Autowired
    private PaymentattemptService paymentattemptService;

    @PostMapping
    public PaymentattemptDto create(@RequestBody PaymentattemptDto dto) {
        return paymentattemptService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<PaymentattemptDto> getById(@PathVariable("id") String id) {
        return paymentattemptService.findById(id);
    }

    @GetMapping
    public List<PaymentattemptDto> getAll() {
        return paymentattemptService.findAll();
    }

    @PutMapping("/{id}")
    public PaymentattemptDto update(@PathVariable("id") String id, @RequestBody PaymentattemptDto dto) {
        return paymentattemptService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        paymentattemptService.delete(id);
    }
}
