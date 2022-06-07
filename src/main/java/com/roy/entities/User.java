package com.roy.entities;

import lombok.Data;

import java.sql.Date;

@Data
public class User {
    private Long id;
    private String name;
    private String role;
    private String phone;
    private String account;
    private String password;
    private Date createdDate;
}
