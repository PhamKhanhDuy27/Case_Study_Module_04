package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Cart;
import com.codegym.CaseStudy04.service.impl.CartServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
@SessionAttributes("userDto")
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @GetMapping()
    public ModelAndView getCart(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        if(userDto == null) {
            modelAndView.setViewName("redirect:/home/login");
        }
        else {
            Cart cart= cartService.getCart(userDto);
            modelAndView.setViewName("cart");
            modelAndView.addObject("cart", cart);
        }
        return modelAndView;
    }

    @GetMapping("/addToCart/product/{id}")
    public ModelAndView addToCart(@PathVariable("id") long id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        if(userDto == null) {
            modelAndView.setViewName("redirect:/home/login");
        }
        else {
            cartService.addToCart(id, userDto);
            modelAndView.setViewName("redirect:/cart");
        }
        return modelAndView;
    }
}
