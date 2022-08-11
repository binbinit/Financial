package com.ww.srb.core.service;

import com.ww.srb.core.pojo.entity.BorrowerAttach;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.vo.BorrowerAttachVO;

import java.util.List;

/**
 * <p>
 * 借款人上传资源表 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface BorrowerAttachService extends IService<BorrowerAttach> {

    // 根据borrowerId查询所有的BorrowerAttachVO列表
    List<BorrowerAttachVO> selectBorrowerAttachVOList(Long borrowerId);

}
