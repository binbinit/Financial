package com.ww.srb.sms.client.fallback;

import com.ww.srb.sms.client.CoreUserInfoClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @Author: ww
 * @DateTime: 2022/8/8 19:47
 * @Description: This is description of class
 */

@Service
@Slf4j
public class CoreUserInfoClientFallback implements CoreUserInfoClient {
    @Override
    public boolean checkMobile(String mobile) {
        log.error("远程调用失败，服务熔断");
        return false; // 手机号不重复
    }
}
