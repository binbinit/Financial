package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.LendReturn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 还款记录表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface LendReturnService extends IService<LendReturn> {

    List<LendReturn> selectByLendId(Long lendId);

    // 提交还款信息
    String commitReturn(Long lendReturnId, Long userId);

    // 还款回调
    void notify(Map<String, Object> paramMap);
}
