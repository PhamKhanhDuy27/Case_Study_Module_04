package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.ProductRequestDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductService {
    Page<ProductDto> getProductsByCategoryId(long categoryId, Pageable pageable);

    ProductDto getProductById(long productId);

    void addProduct(ProductRequestDto productRequestDto);

    void updateProduct(ProductRequestDto productRequestDto);

    void deleteProduct(long id);

    Page<ProductDto> getAll(Pageable pageable);

    Page<ProductDto> getProductsByName(String name, Pageable pageable);
    List<ProductDto> getAll();
}
