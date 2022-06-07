package com.roy.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Goods {
    private Long id;
    private String name;
    private String unit;
    private Double sellingPrice;
    private Double buyingPrice;
    private Integer maxStock;
    private Integer minStock;
    private Long categoryId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date createdDate;
    private String category;

}
