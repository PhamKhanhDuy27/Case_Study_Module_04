package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Cart;

public interface ICartService {
    Cart addToCart(long id, UserDto userDto);

    Cart getCart(UserDto userDto);
}
