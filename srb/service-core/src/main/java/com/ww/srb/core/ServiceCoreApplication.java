package com.ww.srb.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author: ww
 * @DateTime: 2022/8/6 20:04
 * @Description: 核心业务
 */
@SpringBootApplication
@ComponentScan({"com.ww.srb","com.ww.common"})
public class ServiceCoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceCoreApplication.class, args);
    }
}