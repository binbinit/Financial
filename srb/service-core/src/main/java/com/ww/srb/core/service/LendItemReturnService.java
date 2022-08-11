package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.LendItemReturn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的出借回款记录表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface LendItemReturnService extends IService<LendItemReturn> {

    List<LendItemReturn> selectByLendId(Long lendId, Long userId);

    // 根据还款id获取回款列表
    List<Map<String, Object>> addReturnDetail(Long lendReturnId);

    // 根据还款计划id获取对应的回款计划列表
    List<LendItemReturn> selectLendItemReturnList(Long lendReturnId);
}
