package com.roy;

import com.roy.entities.Goods;
import com.roy.mapper.GoodsCategoryMapper;
import com.roy.mapper.GoodsMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ErpDemoApplicationTests {

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private GoodsCategoryMapper categoryMapper;

    @Test
    void contextLoads() {
        List<Goods> list = goodsMapper.selectAllGoods();
        list.forEach(goods -> {
            System.out.println(goods);
        });
//        Goods goods = goodsMapper.getName("SP000001");
//        System.out.println(goods.getName());
//        System.out.println(categoryMapper.isExist("食品"));
//        System.out.println(categoryMapper.isExist("hh"));
    }

}
