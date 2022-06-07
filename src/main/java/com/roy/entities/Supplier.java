package com.roy.entities;

import lombok.Data;

import java.sql.Date;

@Data
public class Supplier {
    private Long id;
    private String name;
    private String type;
    private Integer ownerId;
    private String contactName;
    private String contactPhone;
    private String address;
    private Double debt;
    private Date createdDate;
    private String owner;
}
