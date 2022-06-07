package com.roy.controller;

import com.roy.entities.Goods;
import com.roy.entities.GoodsCategory;
import com.roy.mapper.GoodsCategoryMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/category")
public class GoodsCategoryController {
    @Autowired
    private GoodsCategoryMapper goodsCategoryMapper;

    @GetMapping
    public List<GoodsCategory> getGoodsCategory() {
        return goodsCategoryMapper.getGoodsCategory();
    }

    @PostMapping
    public Integer addGoodsCateGory(@RequestBody GoodsCategory category) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        category.setCreateTime(sqlDate);
        if (category.getId() == null) {
            if (goodsCategoryMapper.selectByName(category.getName()) == null)
                return goodsCategoryMapper.insertCategory(category);
        }
        return goodsCategoryMapper.updateCategory(category);
    }

    @DeleteMapping("/{id}")
    public Integer delete(@PathVariable Integer id) {
        return goodsCategoryMapper.deleteCategoryById(id);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        goodsCategoryMapper.deleteBatchCategory(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
        pageNum = (pageNum - 1) * pageSize;
        List<GoodsCategory> list = goodsCategoryMapper.selectPage(pageNum, pageSize);
        Integer total = goodsCategoryMapper.getCategoryNum();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }
}
