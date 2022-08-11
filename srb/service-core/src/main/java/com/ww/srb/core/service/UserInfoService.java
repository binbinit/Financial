package com.ww.srb.core.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ww.srb.core.pojo.entity.UserInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ww.srb.core.pojo.query.UserInfoQuery;
import com.ww.srb.core.pojo.vo.LoginVO;
import com.ww.srb.core.pojo.vo.RegisterVO;
import com.ww.srb.core.pojo.vo.UserIndexVO;
import com.ww.srb.core.pojo.vo.UserInfoVO;

/**
 * <p>
 * 用户基本信息 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface UserInfoService extends IService<UserInfo> {

    // 用户注册
    void register(RegisterVO registerVO);

    // 用户登录
    UserInfoVO login(LoginVO loginVO, String ip);

    // 后台用户管理列表显示
    IPage<UserInfo> listPage(Page<UserInfo> pageParam, UserInfoQuery userInfoQuery);

    // 锁定用户状态
    void lock(Long id, Integer status);

    // 判断手机号是否注册
    boolean checkMobile(String mobile);

    // 根据用户id获取用户个人信息
    UserIndexVO getIndexUserInfo(Long userId);

    // 根据bindCode获取手机号
    String getMobileByBindCode(String bindCode);
}
