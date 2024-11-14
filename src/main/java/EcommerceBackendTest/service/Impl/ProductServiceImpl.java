package EcommerceBackendTest.service.Impl;

import EcommerceBackendTest.dto.ProductDto;

import java.util.List;

public interface ProductServiceImpl {
     List<ProductDto> getAllProducts();
     ProductDto getProductById(Long id);
     ProductDto saveProduct(ProductDto productDto);
     ProductDto updateProduct(Long id, ProductDto productDto);
     void deleteProduct(Long id);

}
