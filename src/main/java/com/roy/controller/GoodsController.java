package com.roy.controller;

import com.roy.entities.Goods;
import com.roy.mapper.GoodsMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    private GoodsMapper goodsMapper;

    @GetMapping
    public List<Goods> getGoods() {
        return goodsMapper.selectAllGoods();
    }

    @PostMapping
    public Integer addGoods(@RequestBody Goods goods) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        goods.setCreatedDate(sqlDate);

        if (goods.getId() == null) {
            return goodsMapper.insertGoods(goods);
        }
        return goodsMapper.updateGoods(goods);
    }

    @DeleteMapping("/{id}")
    public Integer delete(@PathVariable Integer id) {
        return goodsMapper.deleteGoodsById(id);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        goodsMapper.deleteBatchGoods(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize, @RequestParam Integer categoryId, @RequestParam String name) {
        pageNum = (pageNum - 1) * pageSize;
        List<Goods> list = goodsMapper.selectPage(pageNum, pageSize, categoryId, name);
        Integer total = goodsMapper.selectPage(pageNum, 0, categoryId, name).size();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }
    //    @GetMapping("/page")//url param
//    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
//        pageNum = (pageNum - 1) * pageSize;
//        List<Goods> list = goodsMapper.selectPage(pageNum, pageSize);
//        Integer total = goodsMapper.getGoodsNum();
//        Map<String, Object> data = new HashMap<>();
//        data.put("list", list);
//        data.put("total", total);
//        return Result.success(data);
//    }
}
