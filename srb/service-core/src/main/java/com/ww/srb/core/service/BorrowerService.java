package com.ww.srb.core.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ww.srb.core.pojo.entity.Borrower;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.BorrowerApprovalVO;
import com.ww.srb.core.pojo.vo.BorrowerDetailVO;
import com.ww.srb.core.pojo.vo.BorrowerVO;

/**
 * <p>
 * 借款人 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface BorrowerService extends IService<Borrower> {

    // 通过id保存借款人信息
    void saveBorrowerVOByUserId(BorrowerVO borrowerVO, Long userId);

    // 获取借款人认证状态
    Integer getStatusByUserId(Long userId);

    // 获取借款人分页列表
    IPage<Borrower> listPage(Page<Borrower> pageParam, String keyword);

    // 获取借款人信息
    BorrowerDetailVO getBorrowerDetailVOById(Long id);

    // 借款额度审批
    void approval(BorrowerApprovalVO borrowerApprovalVO);
}
