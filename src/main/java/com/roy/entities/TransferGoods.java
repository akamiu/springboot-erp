package com.roy.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Data
@ToString
@AllArgsConstructor
public class TransferGoods {
    private Long id;
    private Long fromId;
    private Long toId;
    private List<TransferGoodsVO> goodsList;
    private Long goodsId;
    private Integer goodsNum;
    private String msg;
}
