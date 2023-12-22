package com.codegym.CaseStudy04.converter;

import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.ProductRequestDto;
import com.codegym.CaseStudy04.entity.Category;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.service.impl.CategoryConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ProductConverter {

    private ImageConverter imageConverter;
    @Autowired
    public void setImageConverter(ImageConverter imageConverter) {
        this.imageConverter = imageConverter;
    }

    private CategoryConversionService categoryConversionService;
    @Autowired
    public void setCategoryService(CategoryConversionService categoryConversionService) {
        this.categoryConversionService = categoryConversionService;
    }

    public ProductDto productToProductDto(Product product) {
        ProductDto productDto = new ProductDto();
        productDto.setId(product.getId());
        productDto.setName(product.getName());
        productDto.setPrice(product.getPrice());
        productDto.setQuantity(product.getQuantity());
        productDto.setCategoryId(product.getCategory().getId());
        productDto.setImageDtoList(imageConverter.listImageToListImageDto(product.getImageList()));
        return productDto;
    }

    public Product productRequestDtoToProduct(ProductRequestDto productRpDto) {
        Product product = new Product();
        product.setName(productRpDto.getName());
        product.setPrice(productRpDto.getPrice());
        product.setQuantity(productRpDto.getQuantity());
        if (productRpDto.getCategoryId() != null) {
            Category category = categoryConversionService.findById(productRpDto.getCategoryId());
            product.setCategory(category);
        }
        return product;
    }
    public List<ProductDto> listProductToListProductDto(List<Product> productList) {
        List<ProductDto> productDtoList = new ArrayList<>();
        for(Product product : productList) {
            productDtoList.add(productToProductDto(product));
        }
        return productDtoList;
    }
    public Product productDtoToProduct(ProductDto productDto) {
        Product product = new Product();
        product.setName(productDto.getName());
        product.setPrice(productDto.getPrice());
        product.setQuantity(productDto.getQuantity());
        if (productDto.getCategoryId() != null) {
            Category category = categoryConversionService.findById(productDto.getCategoryId());
            product.setCategory(category);
        }
        product.setImageList(imageConverter.listImageDtoToListImage(productDto.getImageDtoList()));
        return product;
    }
}
