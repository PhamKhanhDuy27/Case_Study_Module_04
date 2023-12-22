package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.dto.LoginDto;
import com.codegym.CaseStudy04.dto.RegisterDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.dto.UserManagementDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IUserService {

    void updateUser(UserDto userDto);

    void register(RegisterDto registerDto);

    UserDto login(LoginDto loginDto);

    Page<UserManagementDto> getAll(Pageable pageable);

    UserDto getByPhoneNumber(String phoneNumber);
}
