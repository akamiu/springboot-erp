package com.roy.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.util.List;

@ToString
@Data
public class StockInOrder {
    private Long id;
    private Long ownerId;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date stockDate;
    private Long supplierId;
    private Double amount;

    private List<StockInGoods> goodsList;
    private String owner;
    private String supplier;
}
