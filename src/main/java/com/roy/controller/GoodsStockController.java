package com.roy.controller;

import com.roy.entities.Goods;
import com.roy.entities.GoodsStock;
import com.roy.mapper.GoodsStockMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/stock")
public class GoodsStockController {
    @Autowired
    private GoodsStockMapper goodsStockMapper;

    @GetMapping("/not")
    public List<Goods> getGoodsNotInWarehouse(@RequestParam("warehouseId") Integer warehouseId) {
        return goodsStockMapper.selectGoodsNotInWarehouse(warehouseId);
    }

    @PostMapping("/add")
    public Integer addGoodsStock(@RequestBody GoodsStock goodsStock) {
        return goodsStockMapper.insertGoodsStock(goodsStock);

    }

    @PostMapping("/update")
    public Integer updateGoodsStock(@RequestBody GoodsStock goodsStock) {

        return goodsStockMapper.updateGoodsStock(goodsStock);
    }


    @DeleteMapping("/{warehouseId}/{goodsId}")
    public Integer delete(@PathVariable Integer warehouseId, @PathVariable Integer goodsId) {
        return goodsStockMapper.deleteGoodsStockById(warehouseId, goodsId);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<String> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        goodsStockMapper.deleteBatchGoodsStock(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize, @RequestParam Integer warehouseId) {
        pageNum = (pageNum - 1) * pageSize;
        List<GoodsStock> list = goodsStockMapper.selectPage(pageNum, pageSize, warehouseId);
        Integer total = goodsStockMapper.selectPage(pageNum, 0, warehouseId).size();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }

}
