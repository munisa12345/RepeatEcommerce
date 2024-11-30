package uz.pdp.repeatecommerce.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer id = idGen++;
    private String name;
    private Double price;
    private String photoUrl;
    private Integer categoryId;

    private static Integer idGen = 1;

    public Product(String name, Double price, String photoUrl, Integer categoryId) {
        this.name = name;
        this.price = price;
        this.photoUrl = photoUrl;
        this.categoryId = categoryId;
    }
}
