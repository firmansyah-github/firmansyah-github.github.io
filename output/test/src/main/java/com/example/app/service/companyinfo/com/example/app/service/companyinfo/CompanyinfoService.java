
package com.example.app.service.companyinfo;

import java.util.List;
import java.util.Optional;

public interface CompanyinfoService {
    CompanyinfoDto create(CompanyinfoDto dto);
    Optional<CompanyinfoDto> findById(String id);
    List<CompanyinfoDto> findAll();
    CompanyinfoDto update(String id, CompanyinfoDto dto);
    void delete(String id);
}
