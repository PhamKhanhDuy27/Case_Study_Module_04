package com.codegym.CaseStudy04.controller.mvc;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.service.impl.UserServiceImpl;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
@SessionAttributes("userDto")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/{phoneNumber}")
    public ModelAndView getById(@PathVariable("phoneNumber") String phoneNumber) {
        ModelAndView modelAndView = new ModelAndView("detailUser");
        UserDto userDto = userService.getByPhoneNumber(phoneNumber);
        modelAndView.addObject("userDto", userDto);
        return modelAndView;
    }
    @PostMapping("/update")
    public String updateUser(@ModelAttribute("UserDto") UserDto userDto, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) {
        userService.updateUser(userDto);
        // Hủy session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Xóa cookie
        Cookie cookie = new Cookie("phoneNumber", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        String message = "Cập nhật tài khoản thành công";
        redirectAttributes.addFlashAttribute("message", message);

        return "redirect:/home";
    }
}
