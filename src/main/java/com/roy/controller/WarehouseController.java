package com.roy.controller;

import com.roy.entities.Goods;
import com.roy.entities.User;
import com.roy.entities.Warehouse;
import com.roy.mapper.WarehouseMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/warehouse")
public class WarehouseController {
    @Autowired
    private WarehouseMapper warehouseMapper;

    @GetMapping
    public List<Warehouse> getAllWarehouse() {
        return warehouseMapper.selectAllWarehouse();
    }

    @PostMapping
    public Integer addWarehouse(@RequestBody Warehouse warehouse) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        warehouse.setCreatedDate(sqlDate);

        if (warehouse.getId() == null) {
            return warehouseMapper.insertWarehouse(warehouse);
        }
        return warehouseMapper.updateWarehouse(warehouse);
    }

    @DeleteMapping("/{id}")
    public Integer delete(@PathVariable Integer id) {
        return warehouseMapper.deleteWarehouseById(id);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        warehouseMapper.deleteBatchWarehouse(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
        pageNum = (pageNum - 1) * pageSize;
        List<Warehouse> list = warehouseMapper.selectPage(pageNum, pageSize);
        Integer total = warehouseMapper.getWarehouseNum();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }
}
