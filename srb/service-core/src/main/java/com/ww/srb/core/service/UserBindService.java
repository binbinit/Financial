package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.UserBind;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.UserBindVO;

import java.util.Map;

/**
 * <p>
 * 用户绑定表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface UserBindService extends IService<UserBind> {

    // 账户绑定提交数据
    String commitBindUser(UserBindVO userBindVO, Long userId);

    void notify(Map<String, Object> paramMap);

    // 根据userId获取用户绑定账号
    String getBindCodeByUserId(Long userId);
}
