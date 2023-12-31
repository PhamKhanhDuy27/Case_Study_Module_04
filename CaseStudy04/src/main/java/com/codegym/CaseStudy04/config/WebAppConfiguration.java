package com.codegym.CaseStudy04.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@EnableWebMvc
@Configuration
public class WebAppConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler(
                        "/static/**",
                        "/css/**",
                        "/js/**")
                .addResourceLocations(
                        "classpath:/static/",
                        "classpath:/static/css/",
                        "classpath:/static/js/");
    }
}
