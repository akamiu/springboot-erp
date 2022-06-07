package com.roy.entities;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class StockInGoods {
    private Long id;
    private Long orderId;
    private Long goodsId;
    private Integer goodsNum;
    private Double goodsPrice;
    private Long warehouseId;
    private String msg;

    private String goodsName;
    private String warehouse;

}
