package com.codegym.CaseStudy04.dto;

import lombok.Data;

@Data
public class ProductRequestDto {
    private String name;
    private Long price;
    private Long quantity;
    private Long categoryId;
}
