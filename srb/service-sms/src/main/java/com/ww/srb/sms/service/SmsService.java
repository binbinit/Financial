package com.ww.srb.sms.service;

import java.util.Map;

/**
 * @Author: ww
 * @DateTime: 2022/8/7 23:08
 * @Description: This is description of class
 */
public interface SmsService {

    void send(String mobile, String templateCode, Map<String,Object> param);
}
