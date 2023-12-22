package com.codegym.CaseStudy04.repository;

import com.codegym.CaseStudy04.entity.CartLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartLineRepository extends JpaRepository<CartLine, Long> {
}
