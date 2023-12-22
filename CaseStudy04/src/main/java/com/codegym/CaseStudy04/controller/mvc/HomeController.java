package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.dto.LoginDto;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.RegisterDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.service.impl.CategoryServiceImpl;
import com.codegym.CaseStudy04.service.impl.ProductServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/home")
@SessionAttributes("userDto")
public class HomeController {

    private CategoryServiceImpl categoryService;
    @Autowired
    public void setCategoryService(CategoryServiceImpl categoryService) {
        this.categoryService = categoryService;
    }
    private ProductServiceImpl productService;
    @Autowired
    public void setProductService(ProductServiceImpl productService) {
        this.productService = productService;
    }

    @GetMapping()
    public ModelAndView getAll(@PageableDefault(value = 8) Pageable pageable, HttpServletRequest request) {
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        Page<ProductDto> productDtoList = productService.getAll(pageable);
        ModelAndView modelAndView = new ModelAndView("home");
        modelAndView.addObject("currentUrl", "/home");
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("productDtoList", productDtoList);
        return modelAndView;
    }
    @GetMapping("/register")
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView("register");
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("registerDto",new RegisterDto());
        return modelAndView;
    }
    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("loginDto", new LoginDto());
        return modelAndView;
    }
}
