package com.codegym.CaseStudy04.dto;

import lombok.Data;

import java.util.List;

@Data
public class ProductDto {
    private Long id;
    private String name;
    private Long price;
    private Long quantity;
    private Long categoryId;
    private List<ImageDto> imageDtoList;
}
