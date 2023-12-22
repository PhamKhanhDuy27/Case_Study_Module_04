package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.repository.ProductRepository;
import com.codegym.CaseStudy04.service.IProductConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductConversionService implements IProductConversionService {

    private ProductRepository productRepository;
    @Autowired
    public void setProductRepository(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    @Override
    public Product getProductById(long productId) {
        return productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Not Found"));
    }
}
