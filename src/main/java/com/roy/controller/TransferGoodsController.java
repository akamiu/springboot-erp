package com.roy.controller;

import com.roy.entities.GoodsStock;
import com.roy.entities.TransferGoods;
import com.roy.entities.TransferGoodsVO;
import com.roy.mapper.GoodsStockMapper;
import com.roy.mapper.TransferGoodsMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/transfer")
public class TransferGoodsController {
    @Autowired
    private TransferGoodsMapper transferGoodsMapper;

    @Autowired
    private GoodsStockMapper goodsStockMapper;

    @RequestMapping
    @Transactional
    public Result addTransfer(@RequestBody TransferGoods t) {
        for (TransferGoodsVO vo : t.getGoodsList()) {
            TransferGoods transfer = new TransferGoods(null, t.getFromId(), t.getToId(), null, vo.getGoodsId(), vo.getGoodsNum(), t.getMsg());
             if (goodsStockMapper.isExistStock(transfer.getGoodsId(), transfer.getToId()) == 0) {
                GoodsStock goodsStock = new GoodsStock();
                goodsStock.setGoodsId(transfer.getGoodsId());
                goodsStock.setWarehouseId(transfer.getToId());
                goodsStock.setNum(0);
                goodsStockMapper.insertGoodsStock(goodsStock);
            }
            transferGoodsMapper.insert(transfer);
        }
        return Result.success();
    }

}
