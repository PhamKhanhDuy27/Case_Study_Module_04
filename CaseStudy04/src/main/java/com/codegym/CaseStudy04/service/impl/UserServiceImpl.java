package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.converter.UserConverter;
import com.codegym.CaseStudy04.dto.LoginDto;
import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.RegisterDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.dto.UserManagementDto;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.entity.User;
import com.codegym.CaseStudy04.repository.UserRepository;
import com.codegym.CaseStudy04.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserConverter userConverter;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void updateUser(UserDto userDto) {
        String phoneNumber = userDto.getPhoneNumber();
        User user = userRepository.findByPhoneNumber(phoneNumber);
        user.setName(userDto.getName());
        user.setPhoneNumber(userDto.getPhoneNumber());
        user.setEmail(userDto.getEmail());
        if(!"".equals(userDto.getPassword())) {
            String password = passwordEncoder.encode(userDto.getPassword());
            user.setPassword(password);
        }
        user.setRole(userDto.getRole());
        userRepository.save(user);
    }

    @Override
    public void register(RegisterDto registerDto) {
        String password = passwordEncoder.encode(registerDto.getPassword());
        User user = User.builder().name(registerDto.getName())
                .phoneNumber(registerDto.getPhoneNumber())
                .email(registerDto.getEmail())
                .password(password)
                .role(registerDto.getRole())
                .build();
        userRepository.save(user);
        System.out.println("Đăng ký thành công");
    }

    @Override
    public UserDto login(LoginDto loginDto) {
        User user = userRepository.findByPhoneNumber(loginDto.getPhoneNumber());
        if (user != null && passwordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
            return userConverter.userToUserDto(user);
        }
        return null;
    }

    @Override
    public Page<UserManagementDto> getAll(Pageable pageable) {
        Page<User> users = userRepository.findAll(pageable);
        List<UserManagementDto> list = userConverter.listUserToListUserManagementDto(users.getContent());
        return new PageImpl<>(list, pageable, users.getTotalElements());
    }

    @Override
    public UserDto getByPhoneNumber(String phoneNumber) {
        User user = userRepository.findByPhoneNumber(phoneNumber);
        return userConverter.userToUserDto(user);
    }
}
