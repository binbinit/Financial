package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.LendItem;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.InvestVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的出借记录表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface LendItemService extends IService<LendItem> {

    // 构建充值自动提交表单
    String commitInvest(InvestVO investVO);

    // 投资回调
    void notify(Map<String, Object> paramMap);

    // 获取投资列表信息
    List<LendItem> selectByLendId(Long lendId, Integer status);

    // 获取投资记录列表
    List<LendItem> selectByLendId(Long lendId);
}
