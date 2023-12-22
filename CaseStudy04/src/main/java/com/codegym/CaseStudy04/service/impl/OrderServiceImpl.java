package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Cart;
import com.codegym.CaseStudy04.entity.CartLine;
import com.codegym.CaseStudy04.entity.Order;
import com.codegym.CaseStudy04.entity.OrderLine;
import com.codegym.CaseStudy04.entity.User;
import com.codegym.CaseStudy04.repository.CartLineRepository;
import com.codegym.CaseStudy04.repository.CartRepository;
import com.codegym.CaseStudy04.repository.OrderLineRepository;
import com.codegym.CaseStudy04.repository.OrderRepository;
import com.codegym.CaseStudy04.repository.UserRepository;
import com.codegym.CaseStudy04.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderLineRepository orderLineRepository;

    @Autowired
    private CartLineRepository cartLineRepository;


    @Override
    public Order addToOrder(long id, UserDto userDto) {
        User user = userRepository.findByPhoneNumber(userDto.getPhoneNumber());
        Cart cart = cartRepository.findById(id)
                .orElseThrow(()-> new IllegalArgumentException("Not Found"));

        Order order = new Order();
        order.setUser(user);
        orderRepository.save(order);

        List<CartLine> cartLines = cart.getCartLine();
        for(CartLine cartLine : cartLines){
            OrderLine orderLine = new OrderLine();
            orderLine.setOrder(order);
            orderLine.setProduct(cartLine.getProduct());
            orderLine.setQuantity(cartLine.getQuantity());
            orderLine.setSubtotal(cartLine.getSubtotal());
            orderLineRepository.save(orderLine);
            cartLineRepository.deleteById(cartLine.getId());
        }
        long total = 0;
        List<OrderLine> orderLines = order.getOrderLineList();
        for(OrderLine orderLine : orderLines) {
            total = total + orderLine.getSubtotal();
        }
        order.setTotal(total);
        order.setTimeOrder(new Timestamp(System.currentTimeMillis()));
        orderRepository.save(order);
        return order;
    }
}
