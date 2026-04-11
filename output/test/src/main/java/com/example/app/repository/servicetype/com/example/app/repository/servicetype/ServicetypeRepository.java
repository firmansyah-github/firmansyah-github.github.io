
package com.example.app.repository.servicetype;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicetypeRepository extends JpaRepository<Servicetype, String> {
}
