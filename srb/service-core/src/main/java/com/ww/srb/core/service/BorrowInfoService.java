package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.BorrowInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.BorrowInfoApprovalVO;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 借款信息表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface BorrowInfoService extends IService<BorrowInfo> {

    // 获取借款额度
    BigDecimal getBorrowAmount(Long userId);

    // 保存借款信息
    void saveBorrowInfo(BorrowInfo borrowInfo, Long userId);

    // 获取借款申请审批状态
    Integer getStatusByUserId(Long userId);

    // 借款信息列表
    List<BorrowInfo> selectList();

    // 获取借款信息详情
    Map<String, Object> getBorrowInfoDetail(Long id);

    // 审批借款信息
    void approval(BorrowInfoApprovalVO borrowInfoApprovalVO);
}
