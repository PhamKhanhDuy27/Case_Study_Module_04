package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.converter.CategoryConverter;
import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.entity.Category;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.repository.CategoryRepository;
import com.codegym.CaseStudy04.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class CategoryServiceImpl implements ICategoryService {

    private CategoryRepository categoryRepository;
    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    private CategoryConverter categoryConverter;
    @Autowired
    public void setCategoryConverter(CategoryConverter categoryConverter) {
        this.categoryConverter = categoryConverter;
    }

    @Override
    public List<CategoryDto> getAll() {
        List<Category> categoryList = categoryRepository.findAll();
        return categoryConverter.listCategoryToListCategoryDto(categoryList);
    }

    @Override
    public CategoryDto getCategoryById(long id) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(()-> new IllegalArgumentException("Not Found"));
        return categoryConverter.categoryToCategoryDto(category);
    }

    @Override
    public void updateCategory(CategoryDto categoryDto) {
        Category category = categoryConverter.categoryDtoToCategory(categoryDto);
        categoryRepository.save(category);
    }


    @Override
    public void addCategory(CategoryDto categoryDto) {
        Category category = categoryConverter.categoryDtoToCategory(categoryDto);
        categoryRepository.save(category);
    }

    @Override
    public void deleteCategory(long id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public Page<CategoryDto> getAllCategory(Pageable pageable) {
        Page<Category> categories = categoryRepository.findAll(pageable);
        List<CategoryDto> list = categoryConverter.listCategoryToListCategoryDto(categories.getContent());
        return new PageImpl<>(list, pageable, categories.getTotalElements());
    }
}
