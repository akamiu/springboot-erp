package com.roy.controller;

import com.roy.entities.StatisticsGoods;
import com.roy.mapper.StatisticsGoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RestController
@RequestMapping("/statistics")
public class StatisticsController {
    @Autowired
    private StatisticsGoodsMapper mapper;

    @PostMapping
    public List<StatisticsGoods> getAllStatistics(@RequestBody List<String> dateList) {
        List<StatisticsGoods> statistics = mapper.getStatistics(dateList.get(0), dateList.get(1));
        statistics.forEach(i -> {
            if (i.getInSum() == null)
                i.setInSum(0);
            if (i.getOutSum() == null)
                i.setOutSum(0);
        });
        Collections.sort(statistics, new Comparator<StatisticsGoods>() {
            @Override
            public int compare(StatisticsGoods o1, StatisticsGoods o2) {
                return o1.getId() < o2.getId() ? -1 : 1;
            }
        });
        return statistics;
    }
}
