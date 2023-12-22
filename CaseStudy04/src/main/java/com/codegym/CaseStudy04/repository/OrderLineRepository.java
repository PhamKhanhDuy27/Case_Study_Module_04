package com.codegym.CaseStudy04.repository;

import com.codegym.CaseStudy04.entity.OrderLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderLineRepository extends JpaRepository<OrderLine, Long> {
}
