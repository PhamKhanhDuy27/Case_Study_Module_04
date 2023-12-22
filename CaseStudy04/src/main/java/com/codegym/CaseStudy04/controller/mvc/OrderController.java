package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Order;
import com.codegym.CaseStudy04.service.impl.OrderServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/order")
@SessionAttributes("userDto")
public class OrderController {

    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping("/addToOrder/cart/{id}")
    public ModelAndView addToOrder(@PathVariable("id") long id, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        if(userDto == null) {
            modelAndView.setViewName("redirect:/home/login");
        }
        else {
            Order order = orderService.addToOrder(id, userDto);
            modelAndView.setViewName("checkout");
            modelAndView.addObject("order", order);
        }
        return modelAndView;
    }
}
