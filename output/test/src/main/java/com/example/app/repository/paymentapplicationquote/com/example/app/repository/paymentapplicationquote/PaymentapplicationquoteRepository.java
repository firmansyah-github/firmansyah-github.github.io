
package com.example.app.repository.paymentapplicationquote;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentapplicationquoteRepository extends JpaRepository<Paymentapplicationquote, Paymentapplicationquote.PaymentapplicationquoteId> {
}
