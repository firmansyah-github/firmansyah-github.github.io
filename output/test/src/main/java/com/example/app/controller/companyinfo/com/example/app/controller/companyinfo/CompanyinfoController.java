
package com.example.app.controller.companyinfo;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@RestController
@RequestMapping("/api/companyinfos")
public class CompanyinfoController {

    @Autowired
    private CompanyinfoService companyinfoService;

    @PostMapping
    public CompanyinfoDto create(@RequestBody CompanyinfoDto dto) {
        return companyinfoService.create(dto);
    }

    @GetMapping("/{id}")
    public Optional<CompanyinfoDto> getById(@PathVariable("id") String id) {
        return companyinfoService.findById(id);
    }

    @GetMapping
    public List<CompanyinfoDto> getAll() {
        return companyinfoService.findAll();
    }

    @PutMapping("/{id}")
    public CompanyinfoDto update(@PathVariable("id") String id, @RequestBody CompanyinfoDto dto) {
        return companyinfoService.update(id, dto);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") String id) {
        companyinfoService.delete(id);
    }
}
