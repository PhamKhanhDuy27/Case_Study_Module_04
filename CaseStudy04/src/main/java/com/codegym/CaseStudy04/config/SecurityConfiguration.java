package com.codegym.CaseStudy04.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(auth -> auth
//                .requestMatchers("/home/**").permitAll()
//                .requestMatchers("/product/**").permitAll()
//                .requestMatchers("/category/**").permitAll()
//                .requestMatchers("/static/**").permitAll()
//                .requestMatchers("/css/**").permitAll()
//                .requestMatchers("/js/**").permitAll()
//                .requestMatchers("/auth/**").permitAll()
                .anyRequest().permitAll());
        return http.build();
    }

}
