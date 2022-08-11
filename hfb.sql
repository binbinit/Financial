/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : hfb

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 11/08/2022 12:50:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户code',
  `amount` decimal(10, 2) NOT NULL COMMENT '帐户可用余额',
  `freeze_amount` decimal(10, 2) NOT NULL COMMENT '投资中冻结金额',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (20, '5f036e4202634070b560e0db16e68887', 10745.00, 0.00, '2022-08-10 12:01:32', '2022-08-10 12:03:49', 0);
INSERT INTO `user_account` VALUES (21, '378520cec4c2483292a29fc72cb4889d', 247012.00, 0.00, '2022-08-10 12:12:13', '2022-08-10 12:12:13', 0);
INSERT INTO `user_account` VALUES (22, '4cd16d6d6e584c3e97b579286435923e', 1110.00, 0.00, '2022-08-10 12:49:40', '2022-08-10 21:26:22', 0);
INSERT INTO `user_account` VALUES (23, '8fe7653b92bf4b37ad0b621006bead30', 192.50, 0.00, '2022-08-10 20:30:42', '2022-08-10 20:30:42', 0);
INSERT INTO `user_account` VALUES (24, 'd9cef349e7db4720a7b74e45fb3c2718', 220606.00, 0.00, '2022-08-11 11:07:25', '2022-08-11 11:07:25', 0);
INSERT INTO `user_account` VALUES (25, '338b8a7d450b449ebdb131d447a77079', 0.00, 0.00, '2022-08-11 11:08:43', '2022-08-11 11:08:43', 0);
INSERT INTO `user_account` VALUES (26, '29f9c18d30f54c98854fb30ed93c6be5', 83.00, 0.00, '2022-08-11 11:11:26', '2022-08-11 11:11:26', 0);
INSERT INTO `user_account` VALUES (27, 'c06f3329fdd94afe883462daf10845ff', 99141.50, 0.00, '2022-08-11 11:12:54', '2022-08-11 11:12:54', 0);

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `agent_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `agent_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'P2P商户的用户id',
  `personal_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `bank_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timestamp` bigint(1) NULL DEFAULT NULL,
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的汇付宝id',
  `pay_passwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (17, 999888, '7', '张三', '13777777777', '12331212314324', '342534253252', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660017813271, 'f9ec7fdc8e9849828b03a15ac84b8a8d', '123456', 0, '2022-08-09 12:03:40', '2022-08-09 12:03:40', 0);
INSERT INTO `user_bind` VALUES (18, 999888, '8', '李四', '13666666666', '323232323232323', '12321123234532', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660100787327, '5f036e4202634070b560e0db16e68887', '123456', 0, '2022-08-10 11:06:33', '2022-08-10 11:06:33', 0);
INSERT INTO `user_bind` VALUES (19, 999888, '9', '王五', '13655555555', '453653467777', '6666666666666', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660104727999, '378520cec4c2483292a29fc72cb4889d', '123456', 0, '2022-08-10 12:12:13', '2022-08-10 12:12:13', 0);
INSERT INTO `user_bind` VALUES (20, 999888, '18', '赵六', '17666666666', '234532532453', '34254252345432', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660106976292, '4cd16d6d6e584c3e97b579286435923e', '123456', 0, '2022-08-10 12:49:40', '2022-08-10 12:49:40', 0);
INSERT INTO `user_bind` VALUES (21, 999888, '15', '田七', '15933333333', '123321321321', '12341234321', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660134635484, '8fe7653b92bf4b37ad0b621006bead30', '123456', 0, '2022-08-10 20:30:42', '2022-08-10 20:30:42', 0);
INSERT INTO `user_bind` VALUES (22, 999888, '7', '张三', '13999999999', '123456789098', '123456789999999', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660187241539, 'd9cef349e7db4720a7b74e45fb3c2718', '1234', 0, '2022-08-11 11:07:25', '2022-08-11 11:07:25', 0);
INSERT INTO `user_bind` VALUES (23, 999888, '8', '李四', '13988888888', '223232323232', '2323432424234324', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660187319107, '338b8a7d450b449ebdb131d447a77079', '1234', 0, '2022-08-11 11:08:43', '2022-08-11 11:08:43', 0);
INSERT INTO `user_bind` VALUES (24, 999888, '9', '王五', '13977777777', '231323424234323', '23542432432432', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660187482462, '29f9c18d30f54c98854fb30ed93c6be5', '1234', 0, '2022-08-11 11:11:26', '2022-08-11 11:11:26', 0);
INSERT INTO `user_bind` VALUES (25, 999888, '10', '赵六', '13966666666', '34322342342342', '234532454325', NULL, 'http://localhost:3000/user', 'http://localhost/api/core/userBind/notify', 1660187570407, 'c06f3329fdd94afe883462daf10845ff', '1234', 0, '2022-08-11 11:12:54', '2022-08-11 11:12:54', 0);

-- ----------------------------
-- Table structure for user_invest
-- ----------------------------
DROP TABLE IF EXISTS `user_invest`;
CREATE TABLE `user_invest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `vote_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '投资人绑定协议号',
  `benefit_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '借款人绑定协议号',
  `agent_project_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目编号',
  `agent_project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目名称',
  `agent_bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商户订单号',
  `vote_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资金额',
  `vote_prize_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资奖励金额',
  `vote_fee_amt` decimal(10, 2) NULL COMMENT 'P2P商户手续费',
  `project_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '项目总金额',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：默认 1：已放款 -1：已撤标）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户投资表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_invest
-- ----------------------------
INSERT INTO `user_invest` VALUES (10, '4cd16d6d6e584c3e97b579286435923e', '8fe7653b92bf4b37ad0b621006bead30', 'LEND20220810203333428', '美容', 'INVEST20220810203414563', 200.00, 0.00, 0.00, 100000.00, '', 1, '2022-08-10 20:34:19', '2022-08-10 20:34:36', 0);
INSERT INTO `user_invest` VALUES (11, 'd9cef349e7db4720a7b74e45fb3c2718', 'c06f3329fdd94afe883462daf10845ff', 'LEND20220811111753696', '买房', 'INVEST20220811112228889', 10000.00, 0.00, 0.00, 100000.00, '', 1, '2022-08-11 11:22:30', '2022-08-11 11:24:36', 0);
INSERT INTO `user_invest` VALUES (12, 'd9cef349e7db4720a7b74e45fb3c2718', 'c06f3329fdd94afe883462daf10845ff', 'LEND20220811111753696', '买房', 'INVEST20220811112315486', 100.00, 0.00, 0.00, 100000.00, '', 1, '2022-08-11 11:23:19', '2022-08-11 11:24:36', 0);

-- ----------------------------
-- Table structure for user_item_return
-- ----------------------------
DROP TABLE IF EXISTS `user_item_return`;
CREATE TABLE `user_item_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_return_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '还款id',
  `agent_project_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '还款项目编号',
  `vote_bill_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '投资单号',
  `to_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '收款人（投资人）',
  `transit_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款金额',
  `base_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款本金',
  `benifit_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '还款利息',
  `fee_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT '商户手续费',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户还款明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_item_return
-- ----------------------------
INSERT INTO `user_item_return` VALUES (1, 1, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 10100.00, 10000.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:26:16', '2022-08-11 11:26:16', 0);
INSERT INTO `user_item_return` VALUES (2, 1, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 101.00, 100.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:26:16', '2022-08-11 11:26:16', 0);
INSERT INTO `user_item_return` VALUES (3, 2, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 100.00, 0.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:26:54', '2022-08-11 11:26:54', 0);
INSERT INTO `user_item_return` VALUES (4, 2, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 1.00, 0.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:26:54', '2022-08-11 11:26:54', 0);
INSERT INTO `user_item_return` VALUES (5, 3, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 100.00, 0.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:29:25', '2022-08-11 11:29:25', 0);
INSERT INTO `user_item_return` VALUES (6, 3, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 1.00, 0.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:29:25', '2022-08-11 11:29:25', 0);
INSERT INTO `user_item_return` VALUES (7, 4, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 100.00, 0.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:29:39', '2022-08-11 11:29:39', 0);
INSERT INTO `user_item_return` VALUES (8, 4, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 1.00, 0.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:29:39', '2022-08-11 11:29:39', 0);
INSERT INTO `user_item_return` VALUES (9, 5, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 100.00, 0.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:30:06', '2022-08-11 11:30:06', 0);
INSERT INTO `user_item_return` VALUES (10, 5, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 1.00, 0.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:30:06', '2022-08-11 11:30:06', 0);
INSERT INTO `user_item_return` VALUES (11, 6, 'LEND20220811111753696', 'INVEST20220811112228889', 'd9cef349e7db4720a7b74e45fb3c2718', 100.00, 0.00, 100.00, 0.00, NULL, 0, '2022-08-11 11:30:30', '2022-08-11 11:30:30', 0);
INSERT INTO `user_item_return` VALUES (12, 6, 'LEND20220811111753696', 'INVEST20220811112315486', 'd9cef349e7db4720a7b74e45fb3c2718', 1.00, 0.00, 1.00, 0.00, NULL, 0, '2022-08-11 11:30:30', '2022-08-11 11:30:30', 0);

-- ----------------------------
-- Table structure for user_return
-- ----------------------------
DROP TABLE IF EXISTS `user_return`;
CREATE TABLE `user_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `agent_goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户商品名称',
  `agent_batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '批次号',
  `from_bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '还款人绑定协议号',
  `total_amt` decimal(10, 2) NULL COMMENT '还款总额',
  `vote_fee_amt` decimal(10, 2) NULL DEFAULT NULL COMMENT 'P2P商户手续费',
  `data` json NULL COMMENT '还款明细数据',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户还款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_return
-- ----------------------------
INSERT INTO `user_return` VALUES (1, '买房', 'RETURN20220811112436918', 'c06f3329fdd94afe883462daf10845ff', 10201.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 10000, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 10100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 100, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 101, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:26:16', '2022-08-11 11:26:16', 0);
INSERT INTO `user_return` VALUES (2, '买房', 'RETURN20220811112436110', 'c06f3329fdd94afe883462daf10845ff', 101.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 1, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:26:54', '2022-08-11 11:26:54', 0);
INSERT INTO `user_return` VALUES (3, '买房', 'RETURN20220811112436279', 'c06f3329fdd94afe883462daf10845ff', 101.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 1, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:29:25', '2022-08-11 11:29:25', 0);
INSERT INTO `user_return` VALUES (4, '买房', 'RETURN20220811112436135', 'c06f3329fdd94afe883462daf10845ff', 101.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 1, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:29:39', '2022-08-11 11:29:39', 0);
INSERT INTO `user_return` VALUES (5, '买房', 'RETURN20220811112436545', 'c06f3329fdd94afe883462daf10845ff', 101.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 1, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:30:06', '2022-08-11 11:30:06', 0);
INSERT INTO `user_return` VALUES (6, '买房', 'RETURN20220811112436136', 'c06f3329fdd94afe883462daf10845ff', 101.00, 0.00, '[{\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 100, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 100, \"voteBillNo\": \"INVEST20220811112228889\", \"agentProjectCode\": \"LEND20220811111753696\"}, {\"feeAmt\": 0, \"baseAmt\": 0, \"benifitAmt\": 1, \"toBindCode\": \"d9cef349e7db4720a7b74e45fb3c2718\", \"transitAmt\": 1, \"voteBillNo\": \"INVEST20220811112315486\", \"agentProjectCode\": \"LEND20220811111753696\"}]', '', 0, '2022-08-11 11:30:30', '2022-08-11 11:30:30', 0);

SET FOREIGN_KEY_CHECKS = 1;
