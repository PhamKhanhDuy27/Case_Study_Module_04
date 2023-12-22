package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.entity.Category;

public interface ICategoryConversionService {
    Category findById(long parentId);
}
