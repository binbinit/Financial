package com.ww.srb.oss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author: ww
 * @DateTime: 2022/8/8 11:08
 * @Description: oss存储
 */

@SpringBootApplication
@ComponentScan({"com.ww.srb", "com.ww.common"})
public class ServiceOssApplication {
    public static void main(String[] args) {
        SpringApplication.run(ServiceOssApplication.class, args);
    }
}
