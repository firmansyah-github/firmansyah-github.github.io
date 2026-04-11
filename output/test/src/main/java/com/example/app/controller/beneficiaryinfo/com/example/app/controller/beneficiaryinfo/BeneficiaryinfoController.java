
package com.example.app.controller.beneficiaryinfo;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/beneficiaryinfos")
public class BeneficiaryinfoController {

    @Autowired
    private BeneficiaryinfoService beneficiaryinfoService;

    @PostMapping
    public BeneficiaryinfoDto create(@RequestBody BeneficiaryinfoDto dto) {
        return beneficiaryinfoService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<BeneficiaryinfoDto> getById(@PathVariable("id") String id) {
        return beneficiaryinfoService.findById(id);
    }

    @GetMapping
    public List<BeneficiaryinfoDto> getAll() {
        return beneficiaryinfoService.findAll();
    }

    @PutMapping("/{id}")
    public BeneficiaryinfoDto update(@PathVariable("id") String id, @RequestBody BeneficiaryinfoDto dto) {
        return beneficiaryinfoService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        beneficiaryinfoService.delete(id);
    }
}
