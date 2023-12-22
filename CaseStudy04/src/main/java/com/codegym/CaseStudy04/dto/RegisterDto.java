package com.codegym.CaseStudy04.dto;

import lombok.Data;

@Data
public class RegisterDto {
    private String name;
    private String phoneNumber;
    private String email;
    private String password;
    private String role;
}
