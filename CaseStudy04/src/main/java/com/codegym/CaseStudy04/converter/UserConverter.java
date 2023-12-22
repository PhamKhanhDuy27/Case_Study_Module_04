package com.codegym.CaseStudy04.converter;

import com.codegym.CaseStudy04.dto.ProductDto;
import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.dto.UserManagementDto;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.entity.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserConverter {

    public UserDto userToUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setName(user.getName());
        userDto.setPhoneNumber(user.getPhoneNumber());
        userDto.setEmail(user.getEmail());
        userDto.setPassword(user.getPassword());
        userDto.setRole(user.getRole());
        return userDto;
    }

    public UserManagementDto userToUserManagementDto(User user) {
        UserManagementDto userManagementDto = new UserManagementDto();
        userManagementDto.setId(user.getId());
        userManagementDto.setName(user.getName());
        userManagementDto.setPhoneNumber(user.getPhoneNumber());
        userManagementDto.setEmail(user.getEmail());
        userManagementDto.setRole(user.getRole());
        return userManagementDto;
    }
    public List<UserManagementDto> listUserToListUserManagementDto(List<User> users) {
        List<UserManagementDto> userManagementDtoList = new ArrayList<>();
        for(User user : users) {
            userManagementDtoList.add(userToUserManagementDto(user));
        }
        return userManagementDtoList;
    }

}
