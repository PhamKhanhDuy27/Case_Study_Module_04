package com.codegym.CaseStudy04.repository;

import com.codegym.CaseStudy04.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findProductsByCategoryId(long categoryId, Pageable pageable);

    @Query(value = "SELECT * FROM PRODUCT WHERE LOWER(NAME) LIKE LOWER ('%' :name '%')", nativeQuery = true)
    Page<Product> findByName(@Param("name") String name, Pageable pageable);
}
