package uz.pdp.repeatecommerce.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id = idGen++;
    private Status status;
    private LocalDateTime date;
    private Integer userId;

    private static Integer idGen = 1;

    public Order(Status status, LocalDateTime date, Integer userId) {
        this.status = status;
        this.date = date;
        this.userId = userId;
    }
}
