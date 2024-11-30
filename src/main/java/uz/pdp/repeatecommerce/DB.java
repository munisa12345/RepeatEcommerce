package uz.pdp.repeatecommerce;


import uz.pdp.repeatecommerce.entity.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface DB {
    List<User> USERS = new ArrayList<>(List.of(
            new User("Eshmat", "Toshmatov", "+998941234567", "123"),
            new User("Ahmad", "Qudratov", "+998947654321", "321"),
            new User("Hikmat", "Anvarov", "+998941234568", "124"),
            new User("Admin", "Adminjonov", "+998940000000", "000", "ADMIN")
    ));

    List<Category> CATEGORIES = new ArrayList<>(List.of(
            new Category("Yeguliklar"),
            new Category("Ichimliklar"),
            new Category("Kiyimlar"),
            new Category("Ovqatlar"),
            new Category("Texnikalar")
    ));

    List<Product> PRODUCTS = new ArrayList<>(List.of(
            new Product("Non", 5.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Bread.jpg",
                    1),
            new Product("Pishloq", 10.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Cheese.jpg",
                    1),
            new Product(
                    "Buldak Ramen", 25.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Buldak_Ramen.jpg",
                    1
            ),
            new Product("Milka Chocolate", 15.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Chocolate_milka.jpg",
                    1
            ),
            new Product("Cookies", 20.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Cookies.jpg",1
            ),
            new Product("Teokbokki", 32.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Teokbokkii.jpg",1
            ),


            new Product("Choy", 2.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Tea.jpg",
                    2),
            new Product("Sharbat", 3.5,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Juice.jpg",
                    2),
            new Product("Coca Cola", 13.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\CocaCola.jpg", 2
            ),
            new Product("Sprite", 17.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Sprite.jpg", 2
            ),


            new Product("Kurtka", 50.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Jacket.jpg",
                    3),
            new Product("Sharf", 15.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Scarf.jpg",
                    3),
            new Product("Adida shoes", 123.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Adidas_shoes.jpg", 3
            ),
            new Product("Converse", 200.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Converse_Womens.jpg",3
            ),
            new Product("Sweater", 150.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Sweater.jpg",3
            ),
            new Product("Womens shoes", 130.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Womens_Shoes.jpg", 3
            ),

            new Product("Burger", 15.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Burger.jpg",
                    4),
            new Product("Sandwich", 12.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Sandwich.jpg",
                    4),
            new Product("Lavash", 32.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Lavash.jpg", 4),
            new Product("Lays", 32.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Lays.jpg", 4),


            new Product("Blender", 500.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Blender.jpg", 5),
            new Product("Fridge", 1500.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Fridge.jpg", 5),
            new Product("Kitchen Untensils", 500.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Kitchen_Utensils.jpg", 5),
            new Product("Vacuum Cleaner", 300.0,
                    "C:\\Users\\user\\IdeaProjects\\InternetMarket\\files\\Vacuum_Cleaner.jpg", 5)

    ));
    List<Order> ORDERS = new ArrayList<>();
    List<OrderItem> ORDERITEMS = new ArrayList<>();

    static List<Product> getProductsByCategoryId(Integer categoryId) {
        return PRODUCTS.stream()
                .filter(product -> product.getCategoryId().equals(categoryId))
                .collect(Collectors.toList());
    }
    static Product getProductById(int productId) {
        for (Product product : PRODUCTS) {
            if (product.getId() == productId) {
                return product;
            }
        }
        return null;
    }
}
