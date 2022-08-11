package com.ww.srb.core.service;

import com.ww.srb.core.pojo.bo.TransFlowBO;
import com.ww.srb.core.pojo.entity.TransFlow;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 交易流水表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface TransFlowService extends IService<TransFlow> {

    // 存储交易流水
    void saveTransFlow(TransFlowBO transFlowBO);

    // 判断流水如果存在，则从业务方法中直接退出
    boolean isSaveTransFlow(String agentBillNo);

    // 根据id获取资金记录列表
    List<TransFlow> selectByUserId(Long userId);
}
