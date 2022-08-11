package com.ww.common.result;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: ww
 * @DateTime: 2022/8/6 20:57
 * @Description: This is description of class
 */

@Data
public class R {

    private Integer code;
    private String message;
    private Map<String, Object> data = new HashMap();

    // 构造函数私有化
    private R(){}

    // 成功
    public static R ok(){
        R r = new R();
        r.setCode(ResponseEnum.SUCCESS.getCode());
        r.setMessage(ResponseEnum.SUCCESS.getMessage());
        return r;
    }

    // 失败
    public static R error(){
        R r = new R();
        r.setCode(ResponseEnum.ERROR.getCode());
        r.setMessage(ResponseEnum.ERROR.getMessage());
        return r;
    }

    // 特定结果
    public static R setResult(ResponseEnum responseEnum){
        R r = new R();
        r.setCode(responseEnum.getCode());
        r.setMessage(responseEnum.getMessage());
        return r;
    }

    public R message(String message){
        this.setMessage(message);
        return this;
    }

    public R code(Integer code){
        this.setCode(code);
        return this;
    }

    public R data(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    public R data(Map<String, Object> map){
        this.setData(map);
        return this;
    }

}
