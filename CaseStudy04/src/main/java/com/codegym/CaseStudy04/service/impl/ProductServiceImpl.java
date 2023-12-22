package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.converter.ProductConverter;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.ProductRequestDto;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.repository.ProductRepository;
import com.codegym.CaseStudy04.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ProductServiceImpl implements IProductService {

    private ProductRepository productRepository;
    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    private ProductConverter productConverter;
    @Autowired
    public void setProductConverter(ProductConverter productConverter) {
        this.productConverter = productConverter;
    }

    @Override
    public Page<ProductDto> getAll(Pageable pageable) {
        Page<Product> productList = productRepository.findAll(pageable);
        List<ProductDto> list = productConverter.listProductToListProductDto(productList.getContent());
        return new PageImpl<>(list, pageable, productList.getTotalElements());
    }



    @Override
    public Page<ProductDto> getProductsByName(String name, Pageable pageable) {
        Page<Product> productList = productRepository.findByName(name, pageable);
        List<ProductDto> list = productConverter.listProductToListProductDto((productList.getContent()));
        return new PageImpl<>(list, pageable, productList.getTotalElements());
    }

    @Override
    public List<ProductDto> getAll() {
        List<Product> productList = productRepository.findAll();
        return productConverter.listProductToListProductDto(productList);
    }

    @Override
    public Page<ProductDto> getProductsByCategoryId(long categoryId, Pageable pageable) {
        Page<Product> productList = productRepository.findProductsByCategoryId(categoryId, pageable);
        List<ProductDto> list = productConverter.listProductToListProductDto(productList.getContent());
        return new PageImpl<>(list, pageable, productList.getTotalElements());
    }

    @Override
    public ProductDto getProductById(long productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Not Found"));
        return productConverter.productToProductDto(product);
    }

    @Override
    public void addProduct(ProductRequestDto productRequestDto) {
        productRepository.save(productConverter.productRequestDtoToProduct(productRequestDto));
    }

    @Override
    public void updateProduct(ProductRequestDto productRequestDto) {
        productRepository.save(productConverter.productRequestDtoToProduct(productRequestDto));
    }

    @Override
    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

}
