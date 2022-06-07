package com.roy.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.util.List;

@Data
@ToString
public class StockOutOrder {
    private Long id;
    private Long ownerId;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date deliveryDate;
    private Long customerId;
    private Double amount;
    private List<StockOutGoods> goodsList;

    private String owner;
    private String customer;

}
