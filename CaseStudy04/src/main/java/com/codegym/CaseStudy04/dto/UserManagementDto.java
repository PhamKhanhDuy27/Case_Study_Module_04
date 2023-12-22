package com.codegym.CaseStudy04.dto;

import lombok.Data;

@Data
public class UserManagementDto {
    private Long id;
    private String name;
    private String phoneNumber;
    private String email;
    private String role;
}
