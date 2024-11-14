package EcommerceBackendTest.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.stereotype.Repository;

import EcommerceBackendTest.dto.ProductDto;
import EcommerceBackendTest.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long> {

    ProductDto save(ProductDto product);
}
