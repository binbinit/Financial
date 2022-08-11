/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : srb_core

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 11/08/2022 12:50:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow_info
-- ----------------------------
DROP TABLE IF EXISTS `borrow_info`;
CREATE TABLE `borrow_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '借款期限',
  `borrow_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `money_use` tinyint(3) NULL DEFAULT NULL COMMENT '资金用途',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未提交，1：审核中， 2：审核通过， -1：审核不通过）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_info
-- ----------------------------
INSERT INTO `borrow_info` VALUES (6, 10, 100000.00, 6, 0.12, 3, 2, 2, '2022-08-11 11:17:18', '2022-08-11 11:17:18', 0);
INSERT INTO `borrow_info` VALUES (7, 9, 5000.00, 1, 0.12, 4, 4, 2, '2022-08-11 11:33:31', '2022-08-11 11:33:31', 0);

-- ----------------------------
-- Table structure for borrower
-- ----------------------------
DROP TABLE IF EXISTS `borrower`;
CREATE TABLE `borrower`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sex` tinyint(3) NULL DEFAULT NULL COMMENT '性别（1：男 0：女）',
  `age` tinyint(3) NULL DEFAULT NULL COMMENT '年龄',
  `education` tinyint(3) NULL DEFAULT NULL COMMENT '学历',
  `is_marry` tinyint(1) NULL DEFAULT NULL COMMENT '是否结婚（1：是 0：否）',
  `industry` tinyint(3) NULL DEFAULT NULL COMMENT '行业',
  `income` tinyint(3) NULL DEFAULT NULL COMMENT '月收入',
  `return_source` tinyint(3) NULL DEFAULT NULL COMMENT '还款来源',
  `contacts_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `contacts_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contacts_relation` tinyint(3) NULL DEFAULT NULL COMMENT '联系人关系',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未认证，1：认证中， 2：认证通过， -1：认证失败）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrower
-- ----------------------------
INSERT INTO `borrower` VALUES (4, 10, '赵六', '34322342342342', '13966666666', 1, 50, 4, 1, 5, 4, 1, '刘备', '13966666666', 3, 2, '2022-08-11 11:16:33', '2022-08-11 11:16:33', 0);
INSERT INTO `borrower` VALUES (5, 9, '王五', '231323424234323', '13977777777', 0, 30, 4, 1, 3, 2, 1, '曹操', '13999999999', 3, 2, '2022-08-11 11:32:18', '2022-08-11 11:32:18', 0);

-- ----------------------------
-- Table structure for borrower_attach
-- ----------------------------
DROP TABLE IF EXISTS `borrower_attach`;
CREATE TABLE `borrower_attach`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrower_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款人id',
  `image_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片类型（idCard1：身份证正面，idCard2：身份证反面，house：房产证，car：车）',
  `image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `image_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_borrower_id`(`borrower_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人上传资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrower_attach
-- ----------------------------
INSERT INTO `borrower_attach` VALUES (13, 4, 'idCard1', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/idCard1/2022/08/11/c3184d4e-f174-4aaf-a772-0fcd9498e015.jpg', 'lh.jpg', '2022-08-11 11:16:33', '2022-08-11 11:16:33', 0);
INSERT INTO `borrower_attach` VALUES (14, 4, 'idCard2', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/idCard2/2022/08/11/44401bae-11e7-482e-9948-b83097e926db.jpg', 'lh.jpg', '2022-08-11 11:16:33', '2022-08-11 11:16:33', 0);
INSERT INTO `borrower_attach` VALUES (15, 4, 'house', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/house/2022/08/11/870edbff-dd19-4234-be6b-dfc85a55a031.jpg', 'lh.jpg', '2022-08-11 11:16:33', '2022-08-11 11:16:33', 0);
INSERT INTO `borrower_attach` VALUES (16, 4, 'car', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/car/2022/08/11/038b0d57-037a-44af-80f3-c47db4b1750a.jpg', 'lh.jpg', '2022-08-11 11:16:33', '2022-08-11 11:16:33', 0);
INSERT INTO `borrower_attach` VALUES (17, 5, 'idCard1', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/idCard1/2022/08/11/92566e53-d797-4b5c-97d8-b67ac7506169.jpg', 'lh.jpg', '2022-08-11 11:32:18', '2022-08-11 11:32:18', 0);
INSERT INTO `borrower_attach` VALUES (18, 5, 'idCard2', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/idCard2/2022/08/11/6feefbec-ca65-4824-84cf-6c6c3d65e9a1.jpg', 'lh.jpg', '2022-08-11 11:32:18', '2022-08-11 11:32:18', 0);
INSERT INTO `borrower_attach` VALUES (19, 5, 'house', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/house/2022/08/11/75561be3-1288-4114-a9e3-33ecf231ee0a.jpg', 'lh.jpg', '2022-08-11 11:32:18', '2022-08-11 11:32:18', 0);
INSERT INTO `borrower_attach` VALUES (20, 5, 'car', 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/car/2022/08/11/4497942a-88fb-4924-a307-b2615ac1d40f.jpg', 'lh.jpg', '2022-08-11 11:32:18', '2022-08-11 11:32:18', 0);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `value` int(11) NULL DEFAULT NULL COMMENT '值',
  `dict_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_parent_id_value`(`parent_id`, `value`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 0, '全部分类', NULL, 'ROOT', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20000, 1, '行业', NULL, 'industry', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20001, 20000, 'IT', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20002, 20000, '医生', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20003, 20000, '教师', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20004, 20000, '导游', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20005, 20000, '律师', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20006, 20000, '其他', 6, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30000, 1, '学历', NULL, 'education', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30001, 30000, '高中', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30002, 30000, '大专', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30003, 30000, '本科', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30004, 30000, '研究生', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30005, 30000, '其他', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40000, 1, '收入', NULL, 'income', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40001, 40000, '0-3000', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40002, 40000, '3000-5000', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40003, 40000, '5000-10000', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40004, 40000, '10000以上', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50000, 1, '收入来源', NULL, 'returnSource', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50001, 50000, '工资', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50002, 50000, '股票', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50003, 50000, '兼职', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60000, 1, '关系', NULL, 'relation', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60001, 60000, '夫妻', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60002, 60000, '兄妹', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60003, 60000, '父母', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60004, 60000, '其他', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70000, 1, '还款方式', NULL, 'returnMethod', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70001, 70000, '等额本息', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70002, 70000, '等额本金', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70003, 70000, '每月还息一次还本', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70004, 70000, '一次还本还息', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80000, 1, '资金用途', NULL, 'moneyUse', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80001, 80000, '旅游', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80002, 80000, '买房', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80003, 80000, '装修', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80004, 80000, '医疗', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80005, 80000, '美容', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80006, 80000, '其他', 6, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81000, 1, '借款状态', NULL, 'borrowStatus', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81001, 81000, '待审核', 0, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81002, 81000, '审批通过', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81003, 81000, '还款中', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81004, 81000, '结束', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81005, 81000, '审批不通过', -1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82000, 1, '学校性质', NULL, 'SchoolStatus', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82001, 82000, '211/985', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82002, 82000, '一本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82003, 82000, '二本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82004, 82000, '三本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82005, 82000, '高职高专', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82006, 82000, '中职中专', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82007, 82000, '高中及以下', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);

-- ----------------------------
-- Table structure for integral_grade
-- ----------------------------
DROP TABLE IF EXISTS `integral_grade`;
CREATE TABLE `integral_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `integral_start` int(11) NULL DEFAULT NULL COMMENT '积分区间开始',
  `integral_end` int(11) NULL DEFAULT NULL COMMENT '积分区间结束',
  `borrow_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款额度',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of integral_grade
-- ----------------------------
INSERT INTO `integral_grade` VALUES (1, 10, 50, 10000.00, '2020-12-08 17:02:29', '2021-02-19 17:58:10', 0);
INSERT INTO `integral_grade` VALUES (2, 51, 100, 30000.00, '2020-12-08 17:02:42', '2021-02-19 18:00:25', 0);
INSERT INTO `integral_grade` VALUES (3, 101, 2000, 100000.00, '2020-12-08 17:02:57', '2021-02-23 21:03:03', 0);

-- ----------------------------
-- Table structure for lend
-- ----------------------------
DROP TABLE IF EXISTS `lend`;
CREATE TABLE `lend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款用户id',
  `borrow_info_id` bigint(20) NULL DEFAULT NULL COMMENT '借款信息id',
  `lend_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标的编号',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '标的金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '投资期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `service_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台服务费率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式',
  `lowest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低投资金额',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已投金额',
  `invest_num` int(11) NULL DEFAULT NULL COMMENT '投资人数',
  `publish_date` datetime(0) NULL DEFAULT NULL COMMENT '发布日期',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `lend_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际收益',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `check_admin_id` bigint(1) NULL DEFAULT NULL COMMENT '审核用户id',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '放款时间',
  `payment_admin_id` datetime(0) NULL DEFAULT NULL COMMENT '放款人id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_no`(`lend_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的准备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend
-- ----------------------------
INSERT INTO `lend` VALUES (4, 10, 6, 'LEND20220811111753696', '买房', 100000.00, 6, 0.12, 0.05, 3, 100.00, 10100.00, 2, '2022-08-11 11:17:54', '2022-08-11', '2023-02-11', '买房买房', 2500.00, 252.50, 3, '2022-08-11 11:17:54', 1, '2022-08-11 11:24:36', NULL, '2022-08-11 11:17:53', '2022-08-11 11:17:53', 0);
INSERT INTO `lend` VALUES (5, 9, 7, 'LEND20220811113352865', '医疗', 5000.00, 1, 0.12, 0.05, 4, 100.00, 0.00, 0, '2022-08-11 11:33:52', '2022-08-11', '2022-09-11', '医疗医疗医疗', 20.83, 0.00, 1, '2022-08-11 11:33:52', 1, NULL, NULL, '2022-08-11 11:33:52', '2022-08-11 11:33:52', 0);

-- ----------------------------
-- Table structure for lend_item
-- ----------------------------
DROP TABLE IF EXISTS `lend_item`;
CREATE TABLE `lend_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_item_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资编号',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(20) NULL DEFAULT NULL COMMENT '投资用户id',
  `invest_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资人名称',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资金额',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `invest_time` datetime(0) NULL DEFAULT NULL COMMENT '投资时间',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际收益',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0：默认 1：已支付 2：已还款）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_item_no`(`lend_item_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_item
-- ----------------------------
INSERT INTO `lend_item` VALUES (7, 'INVEST20220811112228889', 4, 7, '张三', 10000.00, 0.12, '2022-08-11 11:22:28', '2022-08-11', '2023-02-11', 600.00, 600.00, 1, '2022-08-11 11:22:28', '2022-08-11 11:22:28', 0);
INSERT INTO `lend_item` VALUES (8, 'INVEST20220811112315486', 4, 7, '张三', 100.00, 0.12, '2022-08-11 11:23:15', '2022-08-11', '2023-02-11', 6.00, 6.00, 1, '2022-08-11 11:23:15', '2022-08-11 11:23:15', 0);

-- ----------------------------
-- Table structure for lend_item_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_item_return`;
CREATE TABLE `lend_item_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_return_id` bigint(20) NULL DEFAULT NULL COMMENT '标的还款id',
  `lend_item_id` bigint(20) NULL DEFAULT NULL COMMENT '标的项id',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(1) NULL DEFAULT NULL COMMENT '出借用户id',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '出借金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime(0) NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lend_return_id`(`lend_return_id`) USING BTREE,
  INDEX `idx_lend_item_id`(`lend_item_id`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借回款记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_item_return
-- ----------------------------
INSERT INTO `lend_item_return` VALUES (16, 10, 7, 4, 7, 10000.00, 1, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2022-09-11', '2022-08-11 11:26:55', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (17, 11, 7, 4, 7, 10000.00, 2, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2022-10-11', '2022-08-11 11:29:26', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (18, 12, 7, 4, 7, 10000.00, 3, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2022-11-11', '2022-08-11 11:29:40', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (19, 13, 7, 4, 7, 10000.00, 4, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2022-12-11', '2022-08-11 11:30:07', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (20, 14, 7, 4, 7, 10000.00, 5, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-01-11', '2022-08-11 11:30:31', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (21, 15, 7, 4, 7, 10000.00, 6, 0.12, 3, 10000.00, 100.00, 10100.00, 0.00, '2023-02-11', '2022-08-11 11:26:17', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (22, 10, 8, 4, 7, 100.00, 1, 0.12, 3, 0.00, 1.00, 1.00, 0.00, '2022-09-11', '2022-08-11 11:26:55', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (23, 11, 8, 4, 7, 100.00, 2, 0.12, 3, 0.00, 1.00, 1.00, 0.00, '2022-10-11', '2022-08-11 11:29:26', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (24, 12, 8, 4, 7, 100.00, 3, 0.12, 3, 0.00, 1.00, 1.00, 0.00, '2022-11-11', '2022-08-11 11:29:40', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (25, 13, 8, 4, 7, 100.00, 4, 0.12, 3, 0.00, 1.00, 1.00, 0.00, '2022-12-11', '2022-08-11 11:30:07', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (26, 14, 8, 4, 7, 100.00, 5, 0.12, 3, 0.00, 1.00, 1.00, 0.00, '2023-01-11', '2022-08-11 11:30:31', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_item_return` VALUES (27, 15, 8, 4, 7, 100.00, 6, 0.12, 3, 100.00, 1.00, 101.00, 0.00, '2023-02-11', '2022-08-11 11:26:17', 0, NULL, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);

-- ----------------------------
-- Table structure for lend_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_return`;
CREATE TABLE `lend_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_id` bigint(20) NULL DEFAULT NULL COMMENT '标的id',
  `borrow_info_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款信息id',
  `return_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款批次号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款人用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `base_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '计息本金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime(0) NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `is_last` tinyint(1) NULL DEFAULT NULL COMMENT '是否最后一次还款',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_return_no`(`return_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '还款记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_return
-- ----------------------------
INSERT INTO `lend_return` VALUES (10, 4, 6, 'RETURN20220811112436110', 10, 100000.00, 10100.00, 1, 0.12, 3, 0.00, 101.00, 101.00, 0.00, '2022-09-11', '2022-08-11 11:26:55', 0, NULL, 0, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_return` VALUES (11, 4, 6, 'RETURN20220811112436279', 10, 100000.00, 10100.00, 2, 0.12, 3, 0.00, 101.00, 101.00, 0.00, '2022-10-11', '2022-08-11 11:29:26', 0, NULL, 0, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_return` VALUES (12, 4, 6, 'RETURN20220811112436135', 10, 100000.00, 10100.00, 3, 0.12, 3, 0.00, 101.00, 101.00, 0.00, '2022-11-11', '2022-08-11 11:29:40', 0, NULL, 0, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_return` VALUES (13, 4, 6, 'RETURN20220811112436545', 10, 100000.00, 10100.00, 4, 0.12, 3, 0.00, 101.00, 101.00, 0.00, '2022-12-11', '2022-08-11 11:30:07', 0, NULL, 0, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_return` VALUES (14, 4, 6, 'RETURN20220811112436136', 10, 100000.00, 10100.00, 5, 0.12, 3, 0.00, 101.00, 101.00, 0.00, '2023-01-11', '2022-08-11 11:30:31', 0, NULL, 0, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `lend_return` VALUES (15, 4, 6, 'RETURN20220811112436918', 10, 100000.00, 10100.00, 6, 0.12, 3, 10100.00, 101.00, 10201.00, 0.00, '2023-02-11', '2022-08-11 11:26:17', 0, NULL, 1, 1, '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);

-- ----------------------------
-- Table structure for trans_flow
-- ----------------------------
DROP TABLE IF EXISTS `trans_flow`;
CREATE TABLE `trans_flow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `trans_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `trans_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '交易类型（1：充值 2：提现 3：投标 4：投资回款 ...）',
  `trans_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易类型名称',
  `trans_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `memo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trans_no`(`trans_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易流水表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trans_flow
-- ----------------------------
INSERT INTO `trans_flow` VALUES (57, 7, '张三', '20220811111900088', 1, '充值', 20000.00, '充值', '2022-08-11 11:19:03', '2022-08-11 11:19:03', 0);
INSERT INTO `trans_flow` VALUES (58, 7, '张三', '20220811112039289', 1, '充值', 200000.00, '充值', '2022-08-11 11:20:44', '2022-08-11 11:20:44', 0);
INSERT INTO `trans_flow` VALUES (59, 7, '张三', 'INVEST20220811112228889', 2, '投标锁定', 10000.00, '投资项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:22:31', '2022-08-11 11:22:31', 0);
INSERT INTO `trans_flow` VALUES (60, 7, '张三', 'INVEST20220811112315486', 2, '投标锁定', 100.00, '投资项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:23:20', '2022-08-11 11:23:20', 0);
INSERT INTO `trans_flow` VALUES (61, 10, '赵六', 'LOAN20220811112436134', 5, '放款到账', 9847.50, '借款放款到账，编号：LEND20220811111753696', '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `trans_flow` VALUES (62, 7, '张三', 'TRANS20220811112436251', 3, '放款解锁', 10000.00, '冻结资金转出，出借放款，编号：LEND20220811111753696', '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `trans_flow` VALUES (63, 7, '张三', 'TRANS20220811112436730', 3, '放款解锁', 100.00, '冻结资金转出，出借放款，编号：LEND20220811111753696', '2022-08-11 11:24:36', '2022-08-11 11:24:36', 0);
INSERT INTO `trans_flow` VALUES (64, 10, '赵六', '20220811112531329', 1, '充值', 100000.00, '充值', '2022-08-11 11:25:34', '2022-08-11 11:25:34', 0);
INSERT INTO `trans_flow` VALUES (65, 10, '赵六', 'RETURN20220811112436918', 6, '还款扣减', 10201.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:17', '2022-08-11 11:26:17', 0);
INSERT INTO `trans_flow` VALUES (66, 7, '张三', 'RETURNITEM20220811112617755', 7, '出借回款', 10100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:17', '2022-08-11 11:26:17', 0);
INSERT INTO `trans_flow` VALUES (67, 7, '张三', 'RETURNITEM20220811112617441', 7, '出借回款', 101.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:17', '2022-08-11 11:26:17', 0);
INSERT INTO `trans_flow` VALUES (68, 10, '赵六', 'RETURN20220811112436110', 6, '还款扣减', 101.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:55', '2022-08-11 11:26:55', 0);
INSERT INTO `trans_flow` VALUES (69, 7, '张三', 'RETURNITEM20220811112655590', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:55', '2022-08-11 11:26:55', 0);
INSERT INTO `trans_flow` VALUES (70, 7, '张三', 'RETURNITEM20220811112655856', 7, '出借回款', 1.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:26:55', '2022-08-11 11:26:55', 0);
INSERT INTO `trans_flow` VALUES (71, 10, '赵六', 'RETURN20220811112436279', 6, '还款扣减', 101.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:26', '2022-08-11 11:29:26', 0);
INSERT INTO `trans_flow` VALUES (72, 7, '张三', 'RETURNITEM20220811112926879', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:26', '2022-08-11 11:29:26', 0);
INSERT INTO `trans_flow` VALUES (73, 7, '张三', 'RETURNITEM20220811112926953', 7, '出借回款', 1.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:26', '2022-08-11 11:29:26', 0);
INSERT INTO `trans_flow` VALUES (74, 10, '赵六', 'RETURN20220811112436135', 6, '还款扣减', 101.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:40', '2022-08-11 11:29:40', 0);
INSERT INTO `trans_flow` VALUES (75, 7, '张三', 'RETURNITEM20220811112940551', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:40', '2022-08-11 11:29:40', 0);
INSERT INTO `trans_flow` VALUES (76, 7, '张三', 'RETURNITEM20220811112940116', 7, '出借回款', 1.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:29:40', '2022-08-11 11:29:40', 0);
INSERT INTO `trans_flow` VALUES (77, 10, '赵六', 'RETURN20220811112436545', 6, '还款扣减', 101.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:07', '2022-08-11 11:30:07', 0);
INSERT INTO `trans_flow` VALUES (78, 7, '张三', 'RETURNITEM20220811113007223', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:07', '2022-08-11 11:30:07', 0);
INSERT INTO `trans_flow` VALUES (79, 7, '张三', 'RETURNITEM20220811113007011', 7, '出借回款', 1.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:07', '2022-08-11 11:30:07', 0);
INSERT INTO `trans_flow` VALUES (80, 10, '赵六', 'RETURN20220811112436136', 6, '还款扣减', 101.00, '借款人还款扣减，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:31', '2022-08-11 11:30:31', 0);
INSERT INTO `trans_flow` VALUES (81, 7, '张三', 'RETURNITEM20220811113031271', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:31', '2022-08-11 11:30:31', 0);
INSERT INTO `trans_flow` VALUES (82, 7, '张三', 'RETURNITEM20220811113031611', 7, '出借回款', 1.00, '还款到账，项目编号：LEND20220811111753696，项目名称：买房', '2022-08-11 11:30:31', '2022-08-11 11:30:31', 0);
INSERT INTO `trans_flow` VALUES (83, 9, '王五', '20220811113429765', 1, '充值', 20.00, '充值', '2022-08-11 11:34:33', '2022-08-11 11:34:33', 0);
INSERT INTO `trans_flow` VALUES (84, 9, '王五', '20220811122757529', 1, '充值', 20.00, '充值', '2022-08-11 12:28:02', '2022-08-11 12:28:02', 0);
INSERT INTO `trans_flow` VALUES (85, 9, '王五', '20220811123912725', 1, '充值', 20.00, '充值', '2022-08-11 12:39:16', '2022-08-11 12:39:16', 0);
INSERT INTO `trans_flow` VALUES (86, 9, '王五', '20220811124050094', 1, '充值', 10.00, '充值', '2022-08-11 12:40:54', '2022-08-11 12:40:54', 0);
INSERT INTO `trans_flow` VALUES (87, 9, '王五', '20220811124221822', 1, '充值', 1.00, '充值', '2022-08-11 12:42:25', '2022-08-11 12:42:25', 0);
INSERT INTO `trans_flow` VALUES (88, 9, '王五', '20220811124457090', 1, '充值', 1.00, '充值', '2022-08-11 12:45:01', '2022-08-11 12:45:01', 0);
INSERT INTO `trans_flow` VALUES (89, 9, '王五', '20220811124718586', 1, '充值', 11.00, '充值', '2022-08-11 12:47:22', '2022-08-11 12:47:22', 0);

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `amount` decimal(10, 2) NOT NULL COMMENT '帐户可用余额',
  `freeze_amount` decimal(10, 2) NOT NULL COMMENT '冻结金额',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (7, 7, 220606.00, 0.00, '2022-08-11 11:05:09', '2022-08-11 11:30:31', 0, 0);
INSERT INTO `user_account` VALUES (8, 8, 0.00, 0.00, '2022-08-11 11:05:31', '2022-08-11 11:05:31', 0, 0);
INSERT INTO `user_account` VALUES (9, 9, 83.00, 0.00, '2022-08-11 11:05:51', '2022-08-11 12:47:22', 0, 0);
INSERT INTO `user_account` VALUES (10, 10, 99141.50, 0.00, '2022-08-11 11:06:11', '2022-08-11 11:30:31', 0, 0);
INSERT INTO `user_account` VALUES (11, 11, 0.00, 0.00, '2022-08-11 12:49:06', '2022-08-11 12:49:06', 0, 0);

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `bank_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行类型',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (8, 7, '张三', '123456789098', '123456789999999', '建设银行', '13999999999', 'd9cef349e7db4720a7b74e45fb3c2718', 1, '2022-08-11 11:07:21', '2022-08-11 11:07:21', 0);
INSERT INTO `user_bind` VALUES (9, 8, '李四', '223232323232', '2323432424234324', '工商银行', '13988888888', '338b8a7d450b449ebdb131d447a77079', 1, '2022-08-11 11:08:39', '2022-08-11 11:08:39', 0);
INSERT INTO `user_bind` VALUES (10, 9, '王五', '231323424234323', '23542432432432', '湖北银行', '13977777777', '29f9c18d30f54c98854fb30ed93c6be5', 1, '2022-08-11 11:11:22', '2022-08-11 11:11:22', 0);
INSERT INTO `user_bind` VALUES (11, 10, '赵六', '34322342342342', '234532454325', '招商银行', '13966666666', 'c06f3329fdd94afe883462daf10845ff', 1, '2022-08-11 11:12:50', '2022-08-11 11:12:50', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '1：出借人 2：借款人',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户标识openid',
  `head_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `bind_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '绑定状态（0：未绑定，1：绑定成功 -1：绑定失败）',
  `borrow_auth_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '借款人认证状态（0：未认证 1：认证中 2：认证通过 -1：认证失败）',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (7, 1, '13999999999', '81dc9bdb52d04dc20036dbd8313ed055', '13999999999', '张三', '123456789098', NULL, NULL, 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/qlh.jpg', 1, 0, 'd9cef349e7db4720a7b74e45fb3c2718', 0, 1, '2022-08-11 11:05:09', '2022-08-11 11:05:09', 0);
INSERT INTO `user_info` VALUES (8, 1, '13988888888', '81dc9bdb52d04dc20036dbd8313ed055', '13988888888', '李四', '223232323232', NULL, NULL, 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/qlh.jpg', 1, 0, '338b8a7d450b449ebdb131d447a77079', 0, 1, '2022-08-11 11:05:31', '2022-08-11 11:05:31', 0);
INSERT INTO `user_info` VALUES (9, 2, '13977777777', '81dc9bdb52d04dc20036dbd8313ed055', '13977777777', '王五', '231323424234323', NULL, NULL, 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/qlh.jpg', 1, 2, '29f9c18d30f54c98854fb30ed93c6be5', 220, 1, '2022-08-11 11:05:51', '2022-08-11 11:05:51', 0);
INSERT INTO `user_info` VALUES (10, 2, '13966666666', '81dc9bdb52d04dc20036dbd8313ed055', '13966666666', '赵六', '34322342342342', NULL, NULL, 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/qlh.jpg', 1, 2, 'c06f3329fdd94afe883462daf10845ff', 220, 1, '2022-08-11 11:06:11', '2022-08-11 11:06:11', 0);
INSERT INTO `user_info` VALUES (11, 1, '13777777777', '81dc9bdb52d04dc20036dbd8313ed055', '13777777777', '13777777777', NULL, NULL, NULL, 'https://srb-20220808.oss-cn-hangzhou.aliyuncs.com/qlh.jpg', 0, 0, NULL, 0, 1, '2022-08-11 12:49:06', '2022-08-11 12:49:06', 0);

-- ----------------------------
-- Table structure for user_integral
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取积分说明',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES (21, 10, 30, '借款人基本信息', '2022-08-11 11:16:47', '2022-08-11 11:16:47', 0);
INSERT INTO `user_integral` VALUES (22, 10, 30, '借款人身份证信息', '2022-08-11 11:16:47', '2022-08-11 11:16:47', 0);
INSERT INTO `user_integral` VALUES (23, 10, 100, '借款人房产信息', '2022-08-11 11:16:47', '2022-08-11 11:16:47', 0);
INSERT INTO `user_integral` VALUES (24, 10, 60, '借款人车辆信息', '2022-08-11 11:16:47', '2022-08-11 11:16:47', 0);
INSERT INTO `user_integral` VALUES (25, 9, 30, '借款人基本信息', '2022-08-11 11:32:40', '2022-08-11 11:32:40', 0);
INSERT INTO `user_integral` VALUES (26, 9, 30, '借款人身份证信息', '2022-08-11 11:32:40', '2022-08-11 11:32:40', 0);
INSERT INTO `user_integral` VALUES (27, 9, 100, '借款人房产信息', '2022-08-11 11:32:40', '2022-08-11 11:32:40', 0);
INSERT INTO `user_integral` VALUES (28, 9, 60, '借款人车辆信息', '2022-08-11 11:32:40', '2022-08-11 11:32:40', 0);

-- ----------------------------
-- Table structure for user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------
INSERT INTO `user_login_record` VALUES (29, 7, '192.168.140.1', '2022-08-11 11:06:54', '2022-08-11 11:06:54', 0);
INSERT INTO `user_login_record` VALUES (30, 8, '192.168.140.1', '2022-08-11 11:08:17', '2022-08-11 11:08:17', 0);
INSERT INTO `user_login_record` VALUES (31, 9, '192.168.140.1', '2022-08-11 11:10:48', '2022-08-11 11:10:48', 0);
INSERT INTO `user_login_record` VALUES (32, 10, '192.168.140.1', '2022-08-11 11:12:02', '2022-08-11 11:12:02', 0);
INSERT INTO `user_login_record` VALUES (33, 7, '192.168.140.1', '2022-08-11 11:18:34', '2022-08-11 11:18:34', 0);
INSERT INTO `user_login_record` VALUES (34, 10, '192.168.140.1', '2022-08-11 11:25:14', '2022-08-11 11:25:14', 0);
INSERT INTO `user_login_record` VALUES (35, 9, '192.168.140.1', '2022-08-11 11:31:23', '2022-08-11 11:31:23', 0);

SET FOREIGN_KEY_CHECKS = 1;
