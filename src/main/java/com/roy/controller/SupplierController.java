package com.roy.controller;

import com.roy.entities.Goods;
import com.roy.entities.Supplier;
import com.roy.entities.User;
import com.roy.mapper.SupplierMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("supplier")
public class SupplierController {
    @Autowired
    private SupplierMapper supplierMapper;
    @GetMapping
    public List<Supplier> getSupplier() {
        return supplierMapper.selectAllSupplier();
    }

    @PostMapping
    public Integer addSupplier(@RequestBody Supplier supplier) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        supplier.setCreatedDate(sqlDate);

        if (supplier.getId() == null) {
            return supplierMapper.insertSupplier(supplier);
        }
        return supplierMapper.updateSupplier(supplier);
    }

    @DeleteMapping("/{id}")
    public Integer delete(@PathVariable Integer id) {
        return supplierMapper.deleteSupplierById(id);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        supplierMapper.deleteBatchSupplier(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
        pageNum = (pageNum - 1) * pageSize;
        List<Supplier> list = supplierMapper.selectPage(pageNum, pageSize);
        Integer total = supplierMapper.getSupplierNum();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }
}
