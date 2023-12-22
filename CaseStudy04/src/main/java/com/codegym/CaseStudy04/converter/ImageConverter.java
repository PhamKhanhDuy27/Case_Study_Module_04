package com.codegym.CaseStudy04.converter;

import com.codegym.CaseStudy04.dto.ImageDto;
import com.codegym.CaseStudy04.entity.Image;
import com.codegym.CaseStudy04.entity.Product;
import com.codegym.CaseStudy04.service.impl.ProductConversionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ImageConverter {

    private ProductConversionService productConversionService;
    @Autowired
    public void setProductService(ProductConversionService productConversionService) {
        this.productConversionService = productConversionService;
    }

    public ImageDto imageToImageDto(Image image) {
        ImageDto imageDto = new ImageDto();
        imageDto.setId(image.getId());
        imageDto.setUrl(image.getUrl());
        if (image.getProduct() != null) {
            imageDto.setProductId(image.getProduct().getId());
        }
        return imageDto;
    }
    public List<ImageDto> listImageToListImageDto(List<Image> imageList) {
        List<ImageDto> imageDtoList = new ArrayList<>();
        for(Image image : imageList) {
            imageDtoList.add(imageToImageDto(image));
        }
        return imageDtoList;
    }

    public Image imageDtoToImage(ImageDto imageDto) {
        Image image = new Image();
        image.setUrl(imageDto.getUrl());
        if (imageDto.getProductId() != null) {
            Product product = productConversionService.getProductById(imageDto.getProductId());
            image.setProduct(product);
        }
        return image;
    }

    public List<Image> listImageDtoToListImage(List<ImageDto> imageDtoList) {
        List<Image> imageList = new ArrayList<>();
        for(ImageDto imageDto : imageDtoList) {
            imageList.add(imageDtoToImage(imageDto));
        }
        return imageList;
    }
}
