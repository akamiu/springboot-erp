package com.roy.entities;

import lombok.Data;

import java.sql.Date;

@Data
public class GoodsCategory {
    private Long id;
    private String name;
    private Date createTime;
}
