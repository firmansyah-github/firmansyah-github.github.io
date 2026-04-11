
package com.example.app.service.servicetype;

import java.util.List;
import java.util.Optional;

public interface ServicetypeService {
    ServicetypeDto create(ServicetypeDto dto);
    Optional<ServicetypeDto> findById(String id);
    List<ServicetypeDto> findAll();
    ServicetypeDto update(String id, ServicetypeDto dto);
    void delete(String id);
}
