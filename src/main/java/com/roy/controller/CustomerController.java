package com.roy.controller;

import com.roy.entities.Customer;
import com.roy.entities.Supplier;
import com.roy.mapper.CustomerMapper;
import com.roy.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerMapper customerMapper;
    @GetMapping
    public List<Customer> getCustomer() {
        return customerMapper.selectAllCustomer();
    }

    @PostMapping
    public Integer addCustomer(@RequestBody Customer customer) {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        customer.setCreatedDate(sqlDate);

        if (customer.getId() == null) {
            return customerMapper.insertCustomer(customer);
        }
        return customerMapper.updateCustomer(customer);
    }

    @DeleteMapping("/{id}")
    public Integer delete(@PathVariable Integer id) {
        return customerMapper.deleteCustomerById(id);
    }

    @PostMapping("/del")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        String idsStr = ids.stream().map(n -> String.valueOf(n)).collect(Collectors.joining(","));
        System.out.println(idsStr);
        customerMapper.deleteBatchCustomer(idsStr);
        return Result.success();
    }

    @GetMapping("/page")//url param
    public Result findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {
        pageNum = (pageNum - 1) * pageSize;
        List<Customer> list = customerMapper.selectPage(pageNum, pageSize);
        Integer total = customerMapper.getCustomerNum();
        Map<String, Object> data = new HashMap<>();
        data.put("list", list);
        data.put("total", total);
        return Result.success(data);
    }
}
