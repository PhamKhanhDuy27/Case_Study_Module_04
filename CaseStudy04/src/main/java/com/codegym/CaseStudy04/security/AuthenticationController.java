package com.codegym.CaseStudy04.security;

import com.codegym.CaseStudy04.dto.LoginDto;
import com.codegym.CaseStudy04.dto.RegisterDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.User;
import com.codegym.CaseStudy04.service.impl.UserServiceImpl;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/auth")
public class AuthenticationController {

    @Autowired
    private UserServiceImpl userService;


    @PostMapping("/register")
    public String register(@ModelAttribute("registerDto") RegisterDto registerDto) {
        userService.register(registerDto);
        return "redirect:/home/login";
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute("loginDto") LoginDto loginDto, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        UserDto userDto = userService.login(loginDto);
        if(userDto != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userDto", userDto);

            Cookie cookie = new Cookie("phoneNumber", userDto.getPhoneNumber());
            cookie.setMaxAge(2 * 60 * 60);
            response.addCookie(cookie);

            if("ADMIN".equals(userDto.getRole())) {
                modelAndView.setViewName("redirect:/admin");
                System.out.println("Thành công");
            }
            else {
                modelAndView.setViewName("redirect:/home");
                System.out.println("Thành công");
            }
        }
        else {
            modelAndView.setViewName("redirect:/home/login");
            System.out.println("Thất bại");
        }
        return modelAndView;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        // Hủy session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Xóa cookie
        Cookie cookie = new Cookie("phoneNumber", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        // Chuyển hướng người dùng về trang chủ
        return new ModelAndView("redirect:/home");
    }
}
