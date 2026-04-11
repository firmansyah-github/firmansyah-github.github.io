
package com.example.app.repository.paymentapplicationtransaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentapplicationtransactionRepository extends JpaRepository<Paymentapplicationtransaction, String> {
}
