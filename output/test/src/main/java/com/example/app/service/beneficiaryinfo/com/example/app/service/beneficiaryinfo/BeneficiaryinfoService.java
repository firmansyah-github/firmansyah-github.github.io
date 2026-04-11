
package com.example.app.service.beneficiaryinfo;

import java.util.List;
import java.util.Optional;

public interface BeneficiaryinfoService {
    BeneficiaryinfoDto create(BeneficiaryinfoDto dto);
    Optional<BeneficiaryinfoDto> findById(String id);
    List<BeneficiaryinfoDto> findAll();
    BeneficiaryinfoDto update(String id, BeneficiaryinfoDto dto);
    void delete(String id);
}
