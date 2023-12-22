package com.codegym.CaseStudy04.repository;

import com.codegym.CaseStudy04.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Long > {
    Cart findByUserId(Long id);
}
