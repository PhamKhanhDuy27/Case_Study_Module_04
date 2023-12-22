package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.service.impl.CategoryServiceImpl;
import com.codegym.CaseStudy04.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/category")
@SessionAttributes("userDto")
public class CategoryController {

    private CategoryServiceImpl categoryService;
    @Autowired
    public void setCategoryService(CategoryServiceImpl categoryService) {
        this.categoryService = categoryService;
    }
    private ProductServiceImpl productService;
    @Autowired
    public void setCategoryService(ProductServiceImpl productService) {
        this.productService = productService;
    }

    @GetMapping("/{id}/products")
    public ModelAndView getProductByCategoryId(@PathVariable("id") long id, @PageableDefault(value = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("home");
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        Page<ProductDto> productDtoList = productService.getProductsByCategoryId(id, pageable);
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("currentUrl", "/category/" + id + "/products");
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("productDtoList", productDtoList);
        return modelAndView;
    }
}
