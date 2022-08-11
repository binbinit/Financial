package com.ww.srb.core;


import org.junit.jupiter.api.Test;
import org.springframework.util.Assert;

/**
 * @Author: ww
 * @DateTime: 2022/8/6 21:53
 * @Description: This is description of class
 */
public class AssertTests {

    @Test
    public void test1(){
        Object o = null;
        if (o == null){
            throw new IllegalArgumentException("参数错误");
        }
    }

    @Test
    public void test2(){
        Object o = null;
        Assert.notNull(o,"参数错误");
    }
}
