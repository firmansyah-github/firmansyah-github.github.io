
package com.example.app.controller.servicetype;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/servicetypes")
public class ServicetypeController {

    @Autowired
    private ServicetypeService servicetypeService;

    @PostMapping
    public ServicetypeDto create(@RequestBody ServicetypeDto dto) {
        return servicetypeService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<ServicetypeDto> getById(@PathVariable("id") String id) {
        return servicetypeService.findById(id);
    }

    @GetMapping
    public List<ServicetypeDto> getAll() {
        return servicetypeService.findAll();
    }

    @PutMapping("/{id}")
    public ServicetypeDto update(@PathVariable("id") String id, @RequestBody ServicetypeDto dto) {
        return servicetypeService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        servicetypeService.delete(id);
    }
}
