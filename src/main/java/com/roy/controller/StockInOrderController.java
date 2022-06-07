package com.roy.controller;

import com.roy.entities.StockInGoods;
import com.roy.entities.StockInOrder;
import com.roy.mapper.StockInGoodsMapper;
import com.roy.mapper.StockInOrderMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/stockin")
public class StockInOrderController {
    @Autowired
    private StockInOrderMapper stockInOrderMapper;
    @Autowired
    private StockInGoodsMapper stockInGoodsMapper;


    @PostMapping
    @Transactional
    public Result addOrder(@RequestBody StockInOrder stockInOrder) {
        System.out.println(stockInOrder);
        stockInOrderMapper.insertOrder(stockInOrder);
        Long id = stockInOrder.getId();
        System.out.println(id);
        if (id != null) {
            for (StockInGoods stockInGoods : stockInOrder.getGoodsList()) {
                stockInGoods.setOrderId(id);
                stockInGoodsMapper.insertGoods(stockInGoods);
            }
        }
        return Result.success();
    }
}
