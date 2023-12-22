package com.codegym.CaseStudy04.controller.api;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.service.ICategoryService;
import com.codegym.CaseStudy04.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api")
public class CategoryController {
//
//    @Autowired
//    private CategoryServiceImpl categoryService;
//
//    @GetMapping("/category")
//    public ResponseEntity<List<CategoryDto>> getAll(){
//        List<CategoryDto> list = categoryService.getAll();
//        return new ResponseEntity<>(list, HttpStatus.OK);
//    }
//
//    @PutMapping("/category/update")
//    public ResponseEntity<String> updateCategory(@RequestBody CategoryDto categoryDto){
//        categoryService.updateCategory(categoryDto);
//        return new ResponseEntity<>("Update Category Successfully", HttpStatus.OK);
//    }
//
//    @PostMapping("/category/add")
//    public ResponseEntity<String> addCategory(@RequestBody CategoryDto categoryDto){
//        categoryService.addCategory(categoryDto);
//        return new ResponseEntity<>("Add Category Successfully", HttpStatus.CREATED);
//    }

}
