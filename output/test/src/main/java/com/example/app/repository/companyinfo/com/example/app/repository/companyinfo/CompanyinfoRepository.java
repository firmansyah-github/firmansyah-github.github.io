
package com.example.app.repository.companyinfo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyinfoRepository extends JpaRepository<Companyinfo, String> {
}
