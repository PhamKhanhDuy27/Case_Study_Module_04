package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.entity.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICategoryService {
    List<CategoryDto> getAll();

    CategoryDto getCategoryById(long id);

    void updateCategory(CategoryDto categoryDto);

    void addCategory(CategoryDto categoryDto);

    void deleteCategory(long id);

    Page<CategoryDto> getAllCategory(Pageable pageable);
}
