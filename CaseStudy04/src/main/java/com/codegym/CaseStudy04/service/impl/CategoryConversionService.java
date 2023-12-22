package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.entity.Category;
import com.codegym.CaseStudy04.repository.CategoryRepository;
import com.codegym.CaseStudy04.service.ICategoryConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryConversionService implements ICategoryConversionService {

    private CategoryRepository categoryRepository;
    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Category findById(long parentId) {
        return categoryRepository.findById(parentId).orElseThrow(()-> new IllegalArgumentException("Not Found"));
    }
}
