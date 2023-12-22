package com.codegym.CaseStudy04.service;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Order;

public interface IOrderService {
     Order addToOrder(long id, UserDto userDto);
}
