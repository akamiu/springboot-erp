package com.roy.entities;

import lombok.Data;

import java.sql.Date;

@Data
public class Customer {
    private Long id;
    private String name;
    private String type;
    private Long ownerId;
    private String contactName;
    private String contactPhone;
    private Double debt;
    private Date createdDate;
    private String owner;
}
