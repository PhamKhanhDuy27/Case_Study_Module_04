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
@RequestMapping("/product")
@SessionAttributes("userDto")
public class ProductController {

    private ProductServiceImpl productService;
    @Autowired
    public void setProductService(ProductServiceImpl productService) {
        this.productService = productService;
    }

    private CategoryServiceImpl categoryService;
    @Autowired
    public void setCategoryService(CategoryServiceImpl categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{id}")
    public ModelAndView getProductById(@PathVariable("id") long id) {
        ModelAndView modelAndView = new ModelAndView("detail");
        ProductDto productDto = productService.getProductById(id);
        List<ProductDto> productDtoList = productService.getAll();
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("productDto", productDto);
        modelAndView.addObject("productDtoList", productDtoList);
        return modelAndView;
    }

    @GetMapping("/search")
    public ModelAndView getProductsByName(@RequestParam(value = "name",defaultValue = "") String name,@PageableDefault(value = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("home");
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        Page<ProductDto> productDtoList = productService.getProductsByName(name, pageable);
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("currentUrl", "/product/search?name=" + name);
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("productDtoList", productDtoList);
        return modelAndView;
    }
}
