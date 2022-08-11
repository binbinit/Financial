package com.ww.srb.sms.controller.api;

import com.ww.common.exception.Assert;
import com.ww.common.result.R;
import com.ww.common.result.ResponseEnum;
import com.ww.common.util.RandomUtils;
import com.ww.common.util.RegexValidateUtils;
import com.ww.srb.sms.client.CoreUserInfoClient;
import com.ww.srb.sms.service.SmsService;
import com.ww.srb.sms.util.SmsProperties;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Author: ww
 * @DateTime: 2022/8/7 23:16
 * @Description: This is description of class
 */

@RestController
@RequestMapping("/api/sms")
@Api(tags = "短信管理")
//@CrossOrigin
@Slf4j
public class ApiSmsController {

    @Resource
    private SmsService smsService;

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private CoreUserInfoClient coreUserInfoClient;

    @ApiOperation("获取验证码")
    @GetMapping("/send/{mobile}")
    public R send(
            @ApiParam(value = "手机号", required = true)
            @PathVariable String mobile){

        // 手机号码不能为空
        Assert.notEmpty(mobile, ResponseEnum.MOBILE_NULL_ERROR);
        // 手机号码不合法
        Assert.isTrue(RegexValidateUtils.checkCellphone(mobile), ResponseEnum.MOBILE_ERROR);

        // 判断手机号是否已经注册
        boolean result = coreUserInfoClient.checkMobile(mobile);
        // log.info("result:", result);
        Assert.isTrue(result == false, ResponseEnum.MOBILE_EXIST_ERROR);

        //生成验证码
        String code = RandomUtils.getFourBitRandom();

        //组装短信模板参数
        Map<String,Object> param = new HashMap<>();
        param.put("code", code);

        //发送短信 todo 测试暂时关闭，避免重复给手机发送短信
        // smsService.send(mobile, SmsProperties.TEMPLATE_CODE, param);

        //将验证码存入redis
        redisTemplate.opsForValue().set("srb:sms:code:" + mobile, code, 5, TimeUnit.MINUTES);
        log.info("验证码为：" + code);

        return R.ok().message("短信发送成功");
    }

}
