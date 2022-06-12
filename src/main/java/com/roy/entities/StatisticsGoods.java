package com.roy.entities;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class StatisticsGoods {
    private Long id;
    private String name;
    private Integer inSum;
    private Integer outSum;
}
