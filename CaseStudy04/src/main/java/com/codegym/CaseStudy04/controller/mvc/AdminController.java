package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.CategoryDto;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.ProductRequestDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.dto.UserManagementDto;
import com.codegym.CaseStudy04.service.impl.CategoryServiceImpl;
import com.codegym.CaseStudy04.service.impl.ProductServiceImpl;
import com.codegym.CaseStudy04.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
@SessionAttributes("userDto")
public class AdminController {

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private CategoryServiceImpl categoryService;

    @Autowired
    private UserServiceImpl userService;

    @GetMapping()
    public ModelAndView getHome() {
        return new ModelAndView("admin");
    }

//    Product Controller Start

    @GetMapping("/products")
    public ModelAndView getAllProduct(@PageableDefault(value = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("productList");
        Page<ProductDto> productDtoPage = productService.getAll(pageable);
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("currentUrl", "/admin/products");
        modelAndView.addObject("productDtoPage", productDtoPage);
        return modelAndView;
    }

    @GetMapping("/product/create")
    public ModelAndView getFormProduct() {
        ModelAndView modelAndView = new ModelAndView("formProduct");
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("productDto", new ProductDto());
        return modelAndView;
    }

    @GetMapping("/product/{id}")
    public ModelAndView viewProductById(@PathVariable("id") long id) {
        ModelAndView modelAndView = new ModelAndView("viewProduct");
        ProductDto productDto = productService.getProductById(id);
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("productDto", productDto);
        return modelAndView;
    }

    @PostMapping("/product/add")
    public String addProduct(@ModelAttribute("productRequestDto") ProductRequestDto productRequestDto, RedirectAttributes redirectAttributes) {
        productService.addProduct(productRequestDto);
        String message = "Thêm sản phẩm thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/products";
    }

    @PostMapping("/product/update")
    public String updateProduct(@ModelAttribute("productDto") ProductRequestDto productRequestDto, RedirectAttributes redirectAttributes) {
        productService.updateProduct(productRequestDto);
        String message = "Cập nhật sản phẩm thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/products";
    }

    @GetMapping("/product/{id}/delete")
    public String deleteProduct(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
        productService.deleteProduct(id);
        String message = "Xóa sản phẩm thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/products";
    }

//    Product Controller End

//    Category Controller Start
    @GetMapping("/categories")
    public ModelAndView getAllCategory(@PageableDefault(value = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("categoryList");
        Page<CategoryDto> categoryDtoPage = categoryService.getAllCategory(pageable);
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("categoryDtoPage", categoryDtoPage);
        modelAndView.addObject("currentUrl", "/admin/categories");
        return modelAndView;
    }

    @GetMapping("/category/create")
    public ModelAndView getFormCategory(){
        ModelAndView modelAndView = new ModelAndView("formCategory");
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("categoryDto", new CategoryDto());
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        return modelAndView;
    }

    @GetMapping("/category/{id}")
    public ModelAndView viewCategoryById(@PathVariable("id") long id) {
        ModelAndView modelAndView = new ModelAndView("viewCategory");
        CategoryDto categoryDto = categoryService.getCategoryById(id);
        List<CategoryDto> categoryDtoList = categoryService.getAll();
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("categoryDtoList", categoryDtoList);
        modelAndView.addObject("categoryDto", categoryDto);
        return modelAndView;
    }

    @PostMapping("/category/update")
    public String updateCategory(@ModelAttribute("categoryDto") CategoryDto categoryDto, RedirectAttributes redirectAttributes) {
        categoryService.updateCategory(categoryDto);
        String message = "Cập nhật Category thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/categories";
    }

    @PostMapping("/category/add")
    public String addCategory(@ModelAttribute("categoryDto") CategoryDto categoryDto, RedirectAttributes redirectAttributes) {
        categoryService.addCategory(categoryDto);
        String message = "Thêm Category thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/categories";
    }

    @GetMapping("/category/{id}/delete")
    public String deleteCategory(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
        categoryService.deleteCategory(id);
        String message = "Xóa Category thành công";
        redirectAttributes.addFlashAttribute("message", message);
        return "redirect:/admin/categories";
    }

//   Category Controller End
//   User Controller Start
    @GetMapping("/users")
    public ModelAndView getAllUser(@PageableDefault(value = 8) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("userList");
        Page<UserManagementDto> userManagementDtoPage = userService.getAll(pageable);
        modelAndView.addObject("userDto", new UserDto());
        modelAndView.addObject("currentUrl", "/admin/users");
        modelAndView.addObject("userManagementDtoPage", userManagementDtoPage);
        return modelAndView;
}
}
