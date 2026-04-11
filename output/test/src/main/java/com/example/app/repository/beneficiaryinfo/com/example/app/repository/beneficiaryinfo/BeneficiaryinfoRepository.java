
package com.example.app.repository.beneficiaryinfo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BeneficiaryinfoRepository extends JpaRepository<Beneficiaryinfo, String> {
}
