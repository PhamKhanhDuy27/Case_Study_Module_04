package com.codegym.CaseStudy04.converter;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.entity.Category;
import com.codegym.CaseStudy04.service.impl.CategoryConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CategoryConverter {

    private CategoryConversionService categoryConversionService;
    @Autowired
    public void setCategoryService(CategoryConversionService categoryConversionService) {
        this.categoryConversionService = categoryConversionService;
    }

    public CategoryDto categoryToCategoryDto(Category category) {
        CategoryDto categoryDto = new CategoryDto();
        categoryDto.setId(category.getId());
        categoryDto.setName(category.getName());
        if (category.getParent() != null) {
            categoryDto.setParentId(category.getParent().getId());
        }
        return categoryDto;
    }

    public Category categoryDtoToCategory(CategoryDto categoryDto) {
        Category category = new Category();
        category.setId(categoryDto.getId());
        category.setName(categoryDto.getName());
        if (categoryDto.getParentId() != null) {
            Category parent = categoryConversionService.findById(categoryDto.getParentId());
            category.setParent(parent);
        }
        return category;
    }

    public List<CategoryDto> listCategoryToListCategoryDto(List<Category> categoryList) {
        List<CategoryDto> categoryDtoList = new ArrayList<>();
        for(Category category : categoryList) {
            categoryDtoList.add(categoryToCategoryDto(category));
        }
        return categoryDtoList;
    }
}
