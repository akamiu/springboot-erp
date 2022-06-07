package com.roy.controller;


import com.roy.entities.StockOutGoods;
import com.roy.entities.StockOutOrder;
import com.roy.mapper.StockOutGoodsMapper;
import com.roy.mapper.StockOutOrderMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/stockout")
public class StockOutOrderController {
    @Autowired
    private StockOutOrderMapper stockOutOrderMapper;
    @Autowired
    private StockOutGoodsMapper stockOutGoodsMapper;

    @PostMapping
    @Transactional
    public Result addOrder(@RequestBody StockOutOrder stockOutOrder) {
        System.out.println(stockOutOrder);
        stockOutOrderMapper.insertOrder(stockOutOrder);
        Long id = stockOutOrder.getId();
        System.out.println(id);
        if (id != null) {
            for (StockOutGoods stockOutGoods : stockOutOrder.getGoodsList()) {
                stockOutGoods.setOrderId(id);
                stockOutGoodsMapper.insertGoods(stockOutGoods);
            }
        }
        return Result.success();
    }
}
