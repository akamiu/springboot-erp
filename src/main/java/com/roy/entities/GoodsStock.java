package com.roy.entities;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GoodsStock {
    private Long goodsId;
    private Long warehouseId;
    private Integer num;

    private String goodsName;
    private String warehouse;
    private String unit;
    private String category;


}
