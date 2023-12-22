package com.codegym.CaseStudy04.service.impl;

import com.codegym.CaseStudy04.dto.UserDto;
import com.codegym.CaseStudy04.entity.Cart;
import com.codegym.CaseStudy04.entity.CartLine;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.entity.User;
import com.codegym.CaseStudy04.repository.CartLineRepository;
import com.codegym.CaseStudy04.repository.CartRepository;
import com.codegym.CaseStudy04.repository.ProductRepository;
import com.codegym.CaseStudy04.repository.UserRepository;
import com.codegym.CaseStudy04.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartLineRepository cartLineRepository;

    @Override
    public Cart addToCart(long id, UserDto userDto) {
        long quantity = 1;
        User user = userRepository.findByPhoneNumber(userDto.getPhoneNumber());
        Cart cart = cartRepository.findByUserId(user.getId());
        if(cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cartRepository.save(cart);
        }

        Product product = productRepository.findById(id)
                .orElseThrow(()-> new IllegalArgumentException("Not Found"));
        CartLine existCartLine = existCartLine(cart, product);
        if(existCartLine != null) {
            existCartLine.setQuantity(existCartLine.getQuantity() + quantity);
            existCartLine.setSubtotal(product.getPrice() * existCartLine.getQuantity());
            cartLineRepository.save(existCartLine);
        }
        else {
            CartLine cartLine = new CartLine();
            cartLine.setCart(cart);
            cartLine.setProduct(product);
            cartLine.setQuantity(quantity);
            cartLine.setSubtotal(product.getPrice() * quantity);
            cartLineRepository.save(cartLine);
        }
        long total = 0;
        List<CartLine> cartLines = cart.getCartLine();
        for(CartLine cartLine1 : cartLines) {
            total = total + cartLine1.getSubtotal();
        }

        cart.setTotal(total);
        cartRepository.save(cart);
        return cart;
    }

    @Override
    public Cart getCart(UserDto userDto) {
        User user = userRepository.findByPhoneNumber(userDto.getPhoneNumber());
        return cartRepository.findByUserId(user.getId());
    }

    private CartLine existCartLine(Cart cart, Product product) {
        List<CartLine> cartLines = cart.getCartLine();
        for (CartLine cartLine : cartLines) {
            if(cartLine.getProduct().equals(product)) {
                return cartLine;
            }
        }
        return null;
    }
}
