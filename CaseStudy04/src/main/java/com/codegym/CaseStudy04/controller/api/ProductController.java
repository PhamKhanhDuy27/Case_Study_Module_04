package com.codegym.CaseStudy04.controller.api;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api")
public class ProductController {

//    @GetMapping("/productList")
//    public ResponseEntity<List<ProductResponseDto>> getAll(){
//        List<ProductResponseDto> list = productService.getAll();
//        return new ResponseEntity<>(list, HttpStatus.OK);
//    }
//
//    @GetMapping("/category/{category-id}/productList")
//    public ResponseEntity<List<ProductResponseDto>> getProductByCategoryId(@PathVariable ("category-id") long categoryId) {
//        List<ProductResponseDto> list = productService.getProductByCategoryId(categoryId);
//        return new ResponseEntity<>(list, HttpStatus.OK);
//    }
//
//    @GetMapping("/product/{product-id}")
//    public ResponseEntity<ProductResponseDto> getProductById(@PathVariable ("product-id") long productId) {
//        ProductResponseDto productResponseDto = productService.getProductById(productId);
//        return new ResponseEntity<>(productResponseDto, HttpStatus.OK);
//    }
//    @PostMapping("/product/add")
//    public ResponseEntity<String> addProduct(@RequestBody ProductRequestDto productRequestDto){
//        productService.addProduct(productRequestDto);
//        return new ResponseEntity<>("Add Product Successfully", HttpStatus.CREATED);
//    }
//    @PutMapping("/product/update")
//    public ResponseEntity<String> updateProduct(@RequestBody ProductRequestDto productRequestDto){
//        productService.updateProduct(productRequestDto);
//        return new ResponseEntity<>("Update Product Successfully", HttpStatus.OK);
//    }
//    @DeleteMapping("/product/delete")
//    public ResponseEntity<String> deleteProduct(@RequestBody ProductRequestDto productRequestDto){
//        productService.deleteProduct(productRequestDto);
//        return new ResponseEntity<>("Delete Product Successfully", HttpStatus.OK);
//    }
}
