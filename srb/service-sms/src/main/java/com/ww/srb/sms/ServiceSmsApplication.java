package com.ww.srb.sms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Author: ww
 * @DateTime: 2022/8/7 22:44
 * @Description: 短信
 */

@SpringBootApplication
@ComponentScan({"com.ww.srb", "com.ww.common"})
@EnableFeignClients
public class ServiceSmsApplication {
    public static void main(String[] args) {
        SpringApplication.run(ServiceSmsApplication.class, args);
    }
}
