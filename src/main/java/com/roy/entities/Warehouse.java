package com.roy.entities;

import lombok.Data;

import java.sql.Date;

@Data
public class Warehouse {
    private Long id;
    private String name;
    private String address;
    private Long ownerId;
    private Date createdDate;
    private String msg;
    private String owner;
}
