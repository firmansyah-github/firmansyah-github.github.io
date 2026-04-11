
package com.example.app.repository.paymentstep;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentstepRepository extends JpaRepository<Paymentstep, String> {
}
