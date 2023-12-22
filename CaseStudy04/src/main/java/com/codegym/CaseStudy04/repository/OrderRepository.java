package com.codegym.CaseStudy04.repository;

import com.codegym.CaseStudy04.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
