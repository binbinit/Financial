package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.UserAccount;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;
import java.util.Map;

/**
 * <p>
 * 用户账户 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface UserAccountService extends IService<UserAccount> {

    // 表单提交充值信息
    String commitCharge(BigDecimal chargeAmt, Long userId);

    // 用户充值异步回调
    String notify(Map<String, Object> paramMap);

    // 根据id查询账户余额
    BigDecimal getAccount(Long userId);

    // 提交提现信息
    String commitWithdraw(BigDecimal fetchAmt, Long userId);

    // 用户提现回调
    void notifyWithdraw(Map<String, Object> paramMap);
}
