package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.BorrowInfo;
import com.ww.srb.core.pojo.entity.Lend;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.BorrowInfoApprovalVO;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 标的准备表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface LendService extends IService<Lend> {

    // 创建标的
    void createLend(BorrowInfoApprovalVO borrowInfoApprovalVO, BorrowInfo borrowInfo);

    // 标的列表
    List<Lend> selectList();

    // 根据id获取标的信息
    Map<String, Object> getLendDetail(Long id);

    // 投资收益
    BigDecimal getInterestCount(BigDecimal invest, BigDecimal yearRate, Integer totalmonth, Integer returnMethod);

    // 满标放款
    void makeLoan(Long id);
}
