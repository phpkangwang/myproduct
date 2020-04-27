/*
 Navicat Premium Data Transfer

 Source Server         : 【周兴--国际网站】
 Source Server Type    : MySQL
 Source Server Version : 50647
 Source Host           : 150.109.45.122:3306
 Source Schema         : nationWeb

 Target Server Type    : MySQL
 Target Server Version : 50647
 File Encoding         : 65001

 Date: 27/04/2020 20:03:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_nation
-- ----------------------------
DROP TABLE IF EXISTS `admin_nation`;
CREATE TABLE `admin_nation`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '国际',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户国家列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_nation
-- ----------------------------
INSERT INTO `admin_nation` VALUES (1, '默认1');
INSERT INTO `admin_nation` VALUES (2, '美国');
INSERT INTO `admin_nation` VALUES (3, '英国');
INSERT INTO `admin_nation` VALUES (4, '印度');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账户',
  `nick_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录凭证',
  `role` tinyint(2) NOT NULL DEFAULT 1 COMMENT '超级管理员 2普通管理员',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, '12345@qq.com', 'Huge Admin', '123456', 'eyJpZCI6MSwidGltZSI6MTU4Nzk1NjY2NH0=', 1, '', 1, '2020-04-03 00:00:00');
INSERT INTO `admin_user` VALUES (11, '123456@qq.com', '张三', '123456', 'eyJpZCI6MTEsInRpbWUiOjE1ODc5MDU1NDh9', 2, '', 1, '2020-04-14 17:24:29');

-- ----------------------------
-- Table structure for contact_us
-- ----------------------------
DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1男 2女 3未知',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工作',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮件',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contact_us
-- ----------------------------
INSERT INTO `contact_us` VALUES (1, 3, 1, '1', '1', '1', '', '1', '1');
INSERT INTO `contact_us` VALUES (2, 2, 1, '1212', '131323', '24555@qq.com', '', 'EUROPE', 'weafaf');
INSERT INTO `contact_us` VALUES (3, 2, 1, '2324342', '424', '245050089@qq.com', 'ASIA', '2424', '232i4u935u');
INSERT INTO `contact_us` VALUES (4, 2, 1, 'afeqf', 'afafa', '245050089@qq.com', 'EUROPE', '中国', 'test123');
INSERT INTO `contact_us` VALUES (5, 2, 1, '1212', '23243', '245050089@qq.com', 'AUSTRALIA', 'wewe', '232323');
INSERT INTO `contact_us` VALUES (6, 2, 1, 'afaf', 'afaf', '2450505089@qq.com', 'EUROPE', 'afa', 'sdfs');
INSERT INTO `contact_us` VALUES (7, 1, 1, '1', '1', '1', '1', '1', '1');
INSERT INTO `contact_us` VALUES (8, 1, 1, '212', '1212', '2450505089@qq.com', 'EUROPE', '112', 'test');
INSERT INTO `contact_us` VALUES (9, 1, 1, 'karen yao', 'de', 'karen.yao@vincismile.com', 'AUSTRALIA', '中国', 'wwwww');
INSERT INTO `contact_us` VALUES (10, 1, 1, 'karen', 'de', 'karen.yao@hugedental.com', 'ASIA', '中国', 'wwww');

-- ----------------------------
-- Table structure for dental_exhibition
-- ----------------------------
DROP TABLE IF EXISTS `dental_exhibition`;
CREATE TABLE `dental_exhibition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'date',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'time',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地点',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '地址',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '牙科展览' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dental_exhibition
-- ----------------------------
INSERT INTO `dental_exhibition` VALUES (13, 'Dental Exhibition', 'April 10, 2020 (Sydn', '1:00 PM - 2:00 PM', 'Sydney', 'https://www.facebook.com/vincismileclub/live_video', 'test001', 1, '2020-04-27 17:01:37');
INSERT INTO `dental_exhibition` VALUES (14, 'Dental Exhibition', 'April 28, 2020 (Beij', '4:00PM - 5:00PM', 'Beijing', 'https://www.facebook.com/events/3687761864627926/', '测试001', 1, '2020-04-27 17:00:52');
INSERT INTO `dental_exhibition` VALUES (16, '111222', '11112222', '111222', '1111222', '11122', '1112', 2, '2020-04-21 14:54:47');

-- ----------------------------
-- Table structure for email_us
-- ----------------------------
DROP TABLE IF EXISTS `email_us`;
CREATE TABLE `email_us`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '我们的email' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of email_us
-- ----------------------------
INSERT INTO `email_us` VALUES (1, '474021880@qq.com');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '地址',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (9, 'xinwen2', 'xinwen2', '2', 1, '2020-04-07 12:00:27');
INSERT INTO `file` VALUES (10, 'xinwen3', 'xinwen3', '2', 1, '2020-04-07 12:00:33');
INSERT INTO `file` VALUES (11, 'xinwen4', 'xinwen4', '2', 1, '2020-04-07 12:00:37');
INSERT INTO `file` VALUES (12, 'xinwen5', 'xinwen5', '2', 1, '2020-04-07 12:00:42');
INSERT INTO `file` VALUES (14, 'xinwen1', 'xinwen1', '2', 2, '2020-04-07 12:01:05');
INSERT INTO `file` VALUES (15, 'xinwen2', 'xinwen2', '2', 2, '2020-04-07 12:01:09');
INSERT INTO `file` VALUES (16, 'xinwen3', 'xinwen3', '2', 2, '2020-04-07 12:01:13');
INSERT INTO `file` VALUES (17, 'xinwen4', 'xinwen4', '2', 2, '2020-04-07 12:01:18');
INSERT INTO `file` VALUES (18, 'xinwen5', 'xinwen5', '2', 2, '2020-04-07 12:01:22');
INSERT INTO `file` VALUES (19, 'xinwen64', 'xinwen63', '2', 2, '2020-04-17 11:51:03');
INSERT INTO `file` VALUES (21, '111', '1111', '111', 2, '2020-04-21 14:52:03');
INSERT INTO `file` VALUES (22, '222333', '2222333', '22233', 2, '2020-04-21 14:52:27');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上机菜单id，没有为0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `path_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单点击跳转地址',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'path',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单别名',
  `out_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外链',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图片地址',
  `sort` int(5) NOT NULL DEFAULT 1 COMMENT '菜单排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (43, 0, 'Products', 'Product', '', '', '', '', 1);
INSERT INTO `menu` VALUES (44, 0, 'Education', 'Education', '', '', '', '20200421103702_24132.jpg', 0);
INSERT INTO `menu` VALUES (45, 0, 'Log In', 'Login', '', '', '', '', 26);
INSERT INTO `menu` VALUES (46, 0, 'Service', 'Service', '', '', '', '20200421105054_70324.jpg', 18);
INSERT INTO `menu` VALUES (47, 0, 'Our stories', 'Stories', '', '', '', '20200421105045_48752.jpg', 23);
INSERT INTO `menu` VALUES (48, 44, 'Free Webinars', 'EducationWebinars', '', '', '', '20200421112545_38428.jpg', 1);
INSERT INTO `menu` VALUES (49, 44, 'Videos', 'EducationVideoList', '', '', '', '', 2);
INSERT INTO `menu` VALUES (50, 43, 'LAB MATERIALS', 'ProductList', '', '', '', '20200421111336_34825.jpg', 6);
INSERT INTO `menu` VALUES (51, 43, 'VINCISMILE', 'ProductList', '', '', '', '20200421111428_75293.jpg', 17);
INSERT INTO `menu` VALUES (52, 43, 'CLINICAL MATERIALS', 'ProductList', '', '', '', '20200421111418_88480.jpg', 13);
INSERT INTO `menu` VALUES (53, 46, 'Design Services Center', 'ServiceDesign', '', '', '', '', 20);
INSERT INTO `menu` VALUES (54, 46, 'Dental Exhibition', 'ServiceExhibition', '', '', '', '20200421112619_44587.jpg', 19);
INSERT INTO `menu` VALUES (55, 46, 'FAQ', 'ServiceFAQ', '', '', '', '20200421112633_88843.jpg', 21);
INSERT INTO `menu` VALUES (56, 46, 'DownLoad', 'ServiceDownload', '', '', '', '20200421112742_15477.jpg', 22);
INSERT INTO `menu` VALUES (57, 47, 'Company Info', 'SinglePage', '', '', '', '20200421112817_69123.jpg', 24);
INSERT INTO `menu` VALUES (58, 47, 'Job Opportunities', 'SinglePage', '', '', '', '20200421112835_61525.jpg', 25);
INSERT INTO `menu` VALUES (61, 49, 'Product Description', 'EducationVideoList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 0);
INSERT INTO `menu` VALUES (62, 49, 'Product Opertion', 'EducationVideoList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 1);
INSERT INTO `menu` VALUES (63, 50, 'Synthetic Polymer Teeth', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 0);
INSERT INTO `menu` VALUES (64, 50, 'PMMA Blocks', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 1);
INSERT INTO `menu` VALUES (65, 50, 'Wax Blocks', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 3);
INSERT INTO `menu` VALUES (66, 50, 'Zirconia Blocks', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 2);
INSERT INTO `menu` VALUES (67, 50, 'CAD/CAM Machines', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 4);
INSERT INTO `menu` VALUES (68, 50, 'C-Silicone Materials', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 5);
INSERT INTO `menu` VALUES (69, 52, 'Glass Lonomer Cement', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 0);
INSERT INTO `menu` VALUES (70, 52, 'Restorative Materials', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 1);
INSERT INTO `menu` VALUES (71, 52, 'A-Silicone Materials', 'ProductList', '', '', '', 'https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar', 2);

-- ----------------------------
-- Table structure for netmeeting
-- ----------------------------
DROP TABLE IF EXISTS `netmeeting`;
CREATE TABLE `netmeeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会议标题',
  `topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '演讲人',
  `speaker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'content内容',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会议地点',
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'data',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'time',
  `link_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'link_text',
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'link_text',
  `link_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'link_text',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网络研讨会' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of netmeeting
-- ----------------------------
INSERT INTO `netmeeting` VALUES (11, ' PARTIAL MODEL SILICONE', '', '', '', 'PARTIAL MODEL SILICONE', '<div class=\"pd-about', '', '', '', '', 2, '2020-04-17 11:27:56');
INSERT INTO `netmeeting` VALUES (12, 'DEMCO V2 chairside CAD/CAM miller', '', '', '', 'DEMCO V2 chairside CAD/CAM miller', '<p>DEMCO V2 is desig', '', '', '', '', 2, '2020-04-17 11:31:06');
INSERT INTO `netmeeting` VALUES (13, 'Free Live Webinar on VinciSmile Facebook and Insta', 'Invisible Orthodontics Introduction and Tips', 'Dr. Harry Marget', 'Dr. Harry Marget on Vincismile FREE live webinar will bring you the introduction of Vincismile invisible correction products and correction tips to help you better improve the invisible correction skills, let patients get a confident smile, and in-depth understanding of our brand and products.', '', 'April 10, 2020 (Sydn', '1:00 PM - 2:00 PM', 'Watch Playback', 'https://www.facebook.com/vincismileclub/live_videos/', '', 1, '2020-04-27 11:59:43');
INSERT INTO `netmeeting` VALUES (14, '1111222', '1111222', '111222', '111222', '111222', '111222', '11112', '', '', '', 2, '2020-04-21 14:53:57');
INSERT INTO `netmeeting` VALUES (15, 'Huge Facebook Webinar', 'Introduction of Huge Restorative System', '', '1. Huge Clinical Product Line introduction<br>2. Basic concept of Huge Biological Restorative Material<br>3. Demo of cavity restoration clinical practice.', '', 'April 28, 2020 (Beij', '4:00PM - 5:00PM', 'Reserve now and you will enjoy special discount.', 'https://www.facebook.com/events/3687761864627926/', 'After reserve, you will also get an email reminder before this course is going to live.', 1, '2020-04-27 12:04:17');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'content内容',
  `top` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1是首页推荐 2不是',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (12, 'HUGE meet you at Sao Paulo CIOSP Dental 2020', 'HUGE meet you at Sao Paulo CIOSP Dental 2020', '<p><span>On December 22, the Huge Dental Group\'s theme of &ldquo;Improving the Customer Experience and Growing with Customers&rdquo; was presented at the Lanqiao Jinjiang Hotel\'s New Year\'s Eve, and more than 600 employees gathered in Rizhao.</span></p>\n<p><span>The evening party was hold after a short video of the Shanghai Huge event in 2019. The executives of Huge Dental Group delivered a summary of the company\'s current and future development.</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>', 2, 1, '2020-04-26 20:58:24');
INSERT INTO `news` VALUES (14, 'xinwen1', 'xinwen1', 'xinwen1', 2, 2, '2020-04-07 12:01:05');
INSERT INTO `news` VALUES (15, 'xinwen2', 'xinwen2', 'xinwen2', 2, 2, '2020-04-07 12:01:09');
INSERT INTO `news` VALUES (16, 'xinwen3', 'xinwen3', 'xinwen3', 2, 2, '2020-04-07 12:01:13');
INSERT INTO `news` VALUES (17, 'xinwen4', 'xinwen4', 'xinwen4', 2, 2, '2020-04-07 12:01:18');
INSERT INTO `news` VALUES (18, 'xinwen5', 'xinwen5', 'xinwen5', 2, 2, '2020-04-07 12:01:22');
INSERT INTO `news` VALUES (19, 'xinwen64', 'xinwen63', '<p>xinwen6</p>', 2, 2, '2020-04-17 11:51:03');
INSERT INTO `news` VALUES (20, 'HUGE Dental International Group Celebrate 2020 par', 'HUGE Dental International Group Celebrate 2020 party!', '<p><span>On December 22, the Huge Dental Group\'s theme of &ldquo;Improving the Customer Experience and Growing with Customers&rdquo; was presented at the Lanqiao Jinjiang Hotel\'s New Year\'s Eve, and more than 600 employees gathered in Rizhao.</span></p>\n<p><span>The evening party was hold after a short video of the Shanghai Huge event in 2019. The executives of Huge Dental Group delivered a summary of the company\'s current and future development.</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>', 2, 1, '2020-04-27 11:54:12');
INSERT INTO `news` VALUES (21, 'HUGE DENTAL extend the Spring Festival', 'HUGE DENTAL extend the Spring Festival', '<p><span>On December 22, the Huge Dental Group\'s theme of &ldquo;Improving the Customer Experience and Growing with Customers&rdquo; was presented at the Lanqiao Jinjiang Hotel\'s New Year\'s Eve, and more than 600 employees gathered in Rizhao.</span></p>\n<p><span>The evening party was hold after a short video of the Shanghai Huge event in 2019. The executives of Huge Dental Group delivered a summary of the company\'s current and future development.</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>', 2, 1, '2020-04-27 11:54:32');
INSERT INTO `news` VALUES (22, 'Waiting for you ! Thai Dental Expo 109th', 'Waiting for you ! Thai Dental Expo 109th', '<p><span>On December 22, the Huge Dental Group\'s theme of &ldquo;Improving the Customer Experience and Growing with Customers&rdquo; was presented at the Lanqiao Jinjiang Hotel\'s New Year\'s Eve, and more than 600 employees gathered in Rizhao.</span></p>\n<p><span>The evening party was hold after a short video of the Shanghai Huge event in 2019. The executives of Huge Dental Group delivered a summary of the company\'s current and future development.</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>\n<p><span>Mr. Song Xin, Chairman of Huge Dental Group made an important speech. Huge Dental Group has achieved good results in the past year, and it is inseparable from the hard work of each Huge person. I hope that all the family members of Huge Dental will continue to cooperate closely, respect and help each other, and strive for excellence as the core competitiveness of Huge Dental, making Huge Dental a sustainable development platform, driving the transformation of research and development technology, global research and development, global sales, and global manufacturing , The development goals of the global team are moving forward!</span></p>', 2, 1, '2020-04-27 11:54:56');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品描述',
  `menu_id` int(10) NOT NULL DEFAULT 0 COMMENT '属于哪个菜单id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '多图片地址逗号隔开',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'data内容',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'content内容',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `shelve` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1上架 2下架',
  `recommend` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1推荐 2不推荐',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1可用 2不可用',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (10, 'VINCISMILE Invisible Orthodontic Appliance', 'VINCISMILE Invisible Orthodontic Appliance', 51, '20200427111716_55799.jpg,20200427111719_34393.jpg', '<h3>VINCISMILE,smile as much as you wish!&nbsp;</h3>\n<p>Vincismile Invisible Orthodontic Appliance is an elegant solution for orthodontics and&nbsp;an awesome alternative to a traditional bracket and wire system.&nbsp;</p>', '<h3>What are Vincismile Invisible Orthodontic Appliance?&nbsp;&nbsp;</h3>\n<p>Vincismile Invisible Orthodontic Appliance are vacuum formed from transparent biomedical materials, they are invisible and people even not aware patient put them on.&nbsp;Vincismileis an awesome alternative to a traditional bracket and wire system.&nbsp;</p>\n<h3>What are the advantages of Vincismile Invisible Orthodontic Appliance?&nbsp;</h3>\n<h3>More comfortable</h3>\n<p>The algorithm of Vincismilesoftware helps precisely calculate the most appropriate amount of each tooth movement, as compared to traditional brackets and wires which may irritate and cause pain.</p>\n<h3>Convenient</h3>\n<p>Vincismileclear aligners need no bands, wires and brackets, consuming less chair time, and the patient can visit the clinic less frequently (once every 8 weeks) compared with traditional treatment.</p>\n<h3>Predictable</h3>\n<p>The 3D interface of Vincismilesoftware can display the whole treatment process and final results, making it easier for the doctors to communicate with the patients.</p>\n<h3>Removable</h3>\n<p>Vincismile Invisible Orthodontic Appliance is removable, so you can take it out before clean your teeth, which can apparently decrease the incidence of demineralization and caries.</p>\n<h3>Read more information about Vincismile aligners you can here:&nbsp; <a href=\"http://uk.vincismile.com/index/index\" target=\"_self\">http://uk.vincismile.com/index/index</a>&nbsp;or simply send us an Email: marketing@hugedental.com</h3>\n<p style=\"text-align: center;\"><img title=\"VINCISMILE INVISIBLE ALIGNERS\" src=\"https://0.rc.xiniu.com/g2/M00/15/4A/CgAGe1xvodeAa-FJAAOKVGGGeE4734.png\" alt=\"VINCISMILE INVISIBLE ALIGNERS\" /></p>', 1, 1, 1, 1, '2020-04-27 11:18:30');
INSERT INTO `product` VALUES (11, ' PARTIAL MODEL SILICONE', 'PARTIAL MODEL SILICONE', 37, 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100', '<div class=\"pd-about\" data-v-4a052f19=\"\">Partial Model Silicone</div>\n<div class=\"pd-desc\" data-v-4a052f19=\"\">\n<div>\n<h3>Product Features:</h3>\n<p>①Duplicating denture moulds</p>\n<p>②Control matrix for designing metal implant structures,making temporary crowns&amp;bridges,and producing gingival tissue.</p>\n<p>③Protecting teeth from plaster and high temperature flask</p>\n<p><strong>Specification:&nbsp;</strong>Base 10kg+Catalyst 40g*5+Measuring Spoon*1</p>\n<p><strong>Material:</strong>&nbsp;Vinyl polysiloxane(VPS)</p>\n</div>\n</div>', '', 2, 1, 1, 1, '2020-04-17 11:27:56');
INSERT INTO `product` VALUES (12, 'DEMCO V2 chairside CAD/CAM miller', 'DEMCO V2 chairside CAD/CAM miller', 36, 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100', '<p>DEMCO V2 is designed for dental chairside using</p>', '', 2, 1, 1, 1, '2020-04-17 11:31:06');
INSERT INTO `product` VALUES (13, 'test', 'test', 36, 'wwwww.png', '11111', '22222', 2, 1, 1, 1, '2020-04-21 13:34:35');

-- ----------------------------
-- Table structure for question_answer
-- ----------------------------
DROP TABLE IF EXISTS `question_answer`;
CREATE TABLE `question_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '问题',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '答案',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT 'nation表id',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常见问题' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_answer
-- ----------------------------
INSERT INTO `question_answer` VALUES (14, 'xinwen1', 'xinwen1', 2, '2020-04-07 12:01:05');
INSERT INTO `question_answer` VALUES (15, 'xinwen2', 'xinwen2', 2, '2020-04-07 12:01:09');
INSERT INTO `question_answer` VALUES (16, 'xinwen3', 'xinwen3', 2, '2020-04-07 12:01:13');
INSERT INTO `question_answer` VALUES (17, 'xinwen4', 'xinwen4', 2, '2020-04-07 12:01:18');
INSERT INTO `question_answer` VALUES (18, 'xinwen55', 'xinwen55', 2, '2020-04-17 11:53:05');
INSERT INTO `question_answer` VALUES (19, 'xinwen66', 'xinwen66', 2, '2020-04-17 11:53:11');
INSERT INTO `question_answer` VALUES (23, 'Do A Sporting Stag Do In Birmingham？', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum justo sit amet risus ut, consequat quis, congue in.', 1, '2020-04-27 11:57:06');

-- ----------------------------
-- Table structure for shape_base
-- ----------------------------
DROP TABLE IF EXISTS `shape_base`;
CREATE TABLE `shape_base`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓',
  `second_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工作',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮件',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '国家',
  `lab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '实验室名称',
  `lab_people_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '实验室人数',
  `cdt_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'CDT数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shape_base
-- ----------------------------
INSERT INTO `shape_base` VALUES (1, 3, '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `shape_base` VALUES (2, 3, '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `shape_base` VALUES (3, 2, '1111', '222', '', '245050089@qq.com', '中国', '12345678', '1000', '54678976543567');

-- ----------------------------
-- Table structure for single_page
-- ----------------------------
DROP TABLE IF EXISTS `single_page`;
CREATE TABLE `single_page`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) NOT NULL DEFAULT 0 COMMENT '属于哪个菜单id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'content内容',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单页面' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of single_page
-- ----------------------------
INSERT INTO `single_page` VALUES (14, 58, '<h3><span style=\"font-size: 16px; color: #777777; font-weight: 500; line-height: 40px;\">Oversea Sales Manager(Africa Market）</span></h3>\n<p>Responsible for growing sales revenue within assigned geographic territory by prospecting and developing new customers,as well as calling on and visiting an existing customer base to maintain exist business and develop additional business.The ability to understand customer needs and help them meet their business and technical challenges are keys to success.This position supports all aspects of customer contact and relationships based on the fundamentals of integrity selling and high efficiency response.</p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">1.A minimum of 2 years&rsquo;Sales or Customer Service experience with a proven track record of sales success.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">2.Ability to maintain and build effective business relationships with customers,management staff and co-workers.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">3.Solid sales aptitude and the demonstrated ability to increase profits and market share.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">4.Strong verbal and written communication skills and positive customer service focus.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">5.Deep understand of Africa culture.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">6.Significant travel within assigned sales territory,up to 75%,willing to work flexible schedule.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">7.Language:English,Chinese.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">8.Priority：Africa Nationality or Foreigner whom was settled down in Africa.</span></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h3><span style=\"font-size: 16px; color: #777777; font-weight: 500; line-height: 40px;\">Regional Sales Manager(Asia Market)</span></h3>\n<p>This Regional Sales Manager is responsible for growing sales revenue within assigned geographic territory by prospecting and developing new customers,as well as calling on and visiting an existing customer base to maintain exist business and develop additional business.The ability to understand customer needs and help them meet their business and technical challenges are keys to success.This position supports all aspects of customer contact and relationships based on the fundamentals of integrity selling and high efficiency response.</p>\n<p>Job Requirements,</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">1.A minimum of 2 years&rsquo;Sales or Customer Service experience with a proven track record of sales success.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">2.Ability to maintain and build effective business relationships with customers,management staff and co-workers.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">3.Solid sales aptitude and the demonstrated ability to increase profits and market share.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">4.Strong verbal and written communication skills and positive customer service focus.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">5.Deep understand of Asian culture.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">6.Significant travel within assigned sales territory,up to 75%,willing to work flexible schedule.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">7.Language:English,Chinese.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p><span style=\"line-height: 1.5;\">8.Priority:South East Asia Nationality or Foreigner whom was settled down in South East Asia.</span></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h3><span style=\"font-size: 16px; color: #777777; font-weight: 500; line-height: 40px;\">Oversea Sales Manager(Middle East Market）</span></h3>\n<p>Responsible for growing sales revenue within assigned geographic territory by prospecting and developing new customers,as well as calling on and visiting an existing customer base to maintain exist business and develop additional business.The ability to understand customer needs and help them meet their business and technical challenges are keys to success.This position supports all aspects of customer contact and relationships based on the fundamentals of integrity selling and high efficiency response.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">1.A minimum of 2 years&rsquo;Sales or Customer Service experience with a proven track record of sales success.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">2.Ability to maintain and build effective business relationships with customers,management staff and co-workers.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">3.Solid sales aptitude and the demonstrated ability to increase profits and market share.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">4.Strong verbal and written communication skills and positive customer service focus.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">5.Deep understand of Middle East culture.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">6.Significant travel within assigned sales territory,up to 75%,willing to work flexible schedule.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">7.Language:English,Chinese.</span></p>\n<p><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p>&nbsp;</p>\n<p><span style=\"line-height: 1.5;\">8.Priority：Middle East Nationality or Foreigner whom was settled down in Middle East.</span></p>\n<p>&nbsp;</p>', 1, '2020-04-27 16:57:53');
INSERT INTO `single_page` VALUES (15, 57, '<p>Established in 1985 in Shanghai China,HUGE was the first multi-layered Synthetic Polymer Teeth manufacturer in China,and since then,HUGE has been dedicating to be the leading supplier of dental material in the world.&nbsp;</p>\n<p><br />To provide professional dental products and services,Shandong Huge Dental Material Corporation(SHD for short)that integrates R&amp;D,manufacturing,sales of dental products and services,was founded in 2014 in Rizhao Shandong,China,the United Nation&rsquo;s Best Cities for Residences.&nbsp;</p>\n<p><br />Until 2017,there are three R&amp;D centers functioning independently in&nbsp;Beijing,Qingdao and Rizhao,China.Over 400 employees in HUGE are making contributions each day,to our clients in China and abroad.</p>\n<p><br />The company is ISO 13485 certified and the products are listed or registered with CFDA(China),CE(EU),FDA(USA),MDL and MDEL(Canada),JIS(Japan)and many other countries.Due to the delicate sales network HUGE had built,dental professionals in all the major cities of China are able to acquire HUGE products,and over 50 million population are benefited.In the international market,people from 80+countries/regions are using HUGE products.</p>\n<p><br />There is nothing in the world would stop HUGE committing to improving dental technique and reducing the cost of dental care.<br /><br />1985<br />Established in Shanghai China;<br /><br />2004~2010<br />&rarr;&nbsp;HUGE was restructured refreshed,dedicating into high-quality dental material R&amp;D,and the CAD/CAM tooth molding center was established,8 ranges of teeth with different mould design that can be applied to all races worldwide were launched;</p>\n<p><br />&rarr;&nbsp;HUGE RIZHAO manufacturing center was set up and became one of the largest synthetic polymer teeth manufacturers in China;</p>\n<p><br />&rarr;&nbsp;HUGE products were exported to 30+countries;<br /><br />2011-2016<br />&rarr;&nbsp;National Certification of New Hi-tech Enterprise was awarded to HUGE.The company was listed with NEEQ in 2015,and in the same year,HUGE acquired Enjoy Laboratory,which is one of the most advanced Glass Ionomer Cement material research and development lab in China；</p>\n<p><br />&rarr;&nbsp;Many newer dental products such as PMMA BLOCK,Zirconia Block,Light Curing Tray,PERFIT Elastomeric Impression Material and Glass Ionomer Cement were launched,HUGE products were exported to 80 countries;</p>\n<p><br />&rarr;&nbsp;KAIJING synthetic polymer teeth and PERFIT Elastomeric Impression Material are one of the most popular brands that widely used in the Chinese market;</p>\n<p><br />2017~2018<br />&rarr;&nbsp;HUGE R&amp;D building started to work;</p>\n<p><br />&rarr;HUGE India company started to work;</p>\n<p><br />&rarr;&nbsp;Vincismile Invisible Orthodontic Appliance was launched;</p>\n<p><br />&rarr;&nbsp;30%+increase of yearly revenue continued;</p>\n<p><br />2019~<br />&rarr;Many more new products for adhesive,direct restorations and indirect restorations are to be launched,follow HUGE&rsquo;s website&nbsp;www.hugedental.com and the show is on...</p>\n<table>\n<tbody>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Established in 1985 in Shanghai China,HUGE was the first multi-layered Synthetic Polymer Teeth manufacturer in China,and since then,HUGEhas been dedicating to be the leading supplier of dental material in the world.</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">To provide professional dental products and services,Shandong Huge Dental Material Corporation(SHD for short)that integrates R&amp;D,manufacturing,sales of dental products and services,was founded in 2014 in Rizhao Shandong,China,the United Nation&rsquo;s Best Cities for Residences.</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Until 2017,there are three R&amp;D centers functioning independently in Beijing,Qingdao and Rizhao,China.Over 400 employees in HUGE aremaking contributions each day,to our clients in China and abroad.</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">The company is ISO13485 certified and the products are listed or registered with CFDA(China),CE(EU),FDA(USA),MDL and MDEL(Canada),JIS(Japan)and many other countries.Due to the delicate sales network HUGE had built,dental professionals in all the major cities of China are able to acquire HUGE products,and over 50 million population are benefited.In the international market,people from 80+countries/regions are using HUGE products.</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">There is nothing in the world would stop HUGE committing to improving dental technique and reducing the cost of dental care.</span></p>\n<p style=\"text-align: left;\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<div style=\"text-align: left;\"><span style=\"line-height: 1.5;\">3S Conception</span></div>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/56/6E/CgAGS1fRGUWAOllpAAP7qcNlLTQ573.jpg\" alt=\"Company Info\" /></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Factory</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<div style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;10,000㎡manufacturing and research plant located in Hi-tech Development Zone,with capability to acquire additional 30,000㎡of land for further expansion</span></div>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;10 workshops for synthetic polymer teeth with advanced equipment,annual production capability 60million,and 1million kg production capability of dental silicon impression material,1000kg of GIC annual capacity</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Two buildings in the manufacturing cite available for dormitory,able to support 24 hours production in 3 shifts of 8 hours</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Over 300 employees working in production</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Complete procedures though SAP&amp;CRM system to manage production,logistic,financial accounts,customers and administration</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;3 R&amp;D centers</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Teeth Mold Design Center located in Shanghai</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Application&amp;Pre-production Center of R&amp;D located in Rizhao</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Material Development Center located in Peking</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;32 patents</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"1\" rowspan=\"1\">\n<p style=\"text-align: left;\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/4E/FC/CgAGS1e9PwuAbKsTAAINKUCYhWA458.png\" alt=\"Company Info\" /></p>\n</td>\n<td colspan=\"1\" rowspan=\"1\">\n<p style=\"text-align: left;\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/4E/FC/CgAGS1e9PxSAUR-5AADiQbUnE6Q659.png\" alt=\"Company Info\" /></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Quality Control</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Raw materials import from Europe,Japan with high quality standard</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;3 phases tests before formal production application for each new batch of raw material</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Detail and traceable records of raw material to semi-finished product to final product</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;High quality CAD/CAM steel molds update every 5 years to make sure lifelike design and size consistence,every single tooth is examined by EYE</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Full denture is set up to verify shade consistence</span></p>\n</td>\n</tr>\n<tr>\n<td style=\"text-align: left;\" colspan=\"1\" rowspan=\"1\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/7A/C8/CgAGTFg-QrOADiJPAADxD8i-qVA162.jpg\" alt=\"Company Info\" /></td>\n<td style=\"text-align: left;\" colspan=\"1\" rowspan=\"1\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/7A/C8/CgAGTFg-QruAQDcBAADcQRA2wfM666.jpg\" alt=\"Company Info\" /></td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">R&amp;D</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/56/6F/CgAGS1fRGtaAMJffAAPbdWcTgg0949.jpg\" alt=\"Company Info\" /></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Marketing&amp;Sales</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Marketing&amp;Sales-Domestic</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;With over 50 sales reps.Based in different cities in China</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;30%+annual growth</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;400+distributors,100+direct sales to big labs/hospitals,covers totally 28,000customers and 30million end-users</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Exhibit in 18 shows and 220+academic seminars,with over 4,700 attendants and trained,2200+awards invested</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Non-profit charity carry out in central and western China with CDS</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">&nbsp;&nbsp;</span></p>\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Marketing&amp;Sales&ndash;International</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Sales team with 10+people based in different countries,still increasing&hellip;</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;120+dealers worldwide in 80+countries from Europe,America,Africa,Middle-east,Asia and Pacific Area</span></p>\n<p style=\"text-align: left;\"><span style=\"line-height: 2;\">&bull;&nbsp;&nbsp;&nbsp;&nbsp;Exhibit in IDS Koln,Adeec Dubai,IDEM Singapore since 2007 and coordinate exhibit in over 10 shows worldwide</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\">&nbsp;</p>\n<p style=\"text-align: left;\"><span style=\"line-height: 1.5;\">Product History</span></p>\n</td>\n</tr>\n<tr>\n<td colspan=\"2\" rowspan=\"1\">\n<p style=\"text-align: left;\"><img title=\"Company Info\" src=\"https://0.rc.xiniu.com/g1/M00/56/76/CgAGS1fRHWOANqpKAAHiHFZpoKA829.jpg\" alt=\"Company Info\" /></p>\n</td>\n</tr>\n</tbody>\n</table>', 1, '2020-04-27 16:39:53');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账户',
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录凭证',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '账户创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '245050089@qq.com', '728264', '', '', 0);
INSERT INTO `user` VALUES (2, '2636948219@qq.com', '305426', 'eyJpZCI6MiwidGltZSI6MTU4NjM1MjEwNX0=', '', 0);
INSERT INTO `user` VALUES (3, '474021880@qq.com', '123456', 'eyJpZCI6MywidGltZSI6MTU4NjI2ODU2OX0=', '', 0);
INSERT INTO `user` VALUES (4, '474021880111@qq.com', '885163', '', '', 0);
INSERT INTO `user` VALUES (5, '11123456@qq.com', '868400', '', '', 0);
INSERT INTO `user` VALUES (6, 'karen.yao@vincismile.com', '797373', '', '', 0);
INSERT INTO `user` VALUES (7, 'eurodent1@yahoo.com', '874420', 'eyJpZCI6NywidGltZSI6MTU4NTc3ODYwMH0=', '', 0);
INSERT INTO `user` VALUES (8, 'aqdentureservice@aq.lvcoxmail.com', '716302', '', '', 0);
INSERT INTO `user` VALUES (9, 'romagajen@yahoo.com', '354320', '', '', 0);
INSERT INTO `user` VALUES (10, 'ben_jianwei@163.com', '925622', '', '', 0);
INSERT INTO `user` VALUES (11, 'Jesyleguia@yahoo.it', '596566', '', '', 0);
INSERT INTO `user` VALUES (12, 'elyasav12@gmail.com', '602677', '', '', 0);
INSERT INTO `user` VALUES (13, 'rubendiaz366@gmail.com', '552230', '', '', 0);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `menu_id` int(10) NOT NULL DEFAULT 0 COMMENT '属于哪个菜单id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1普通视频 2Banner视频 3弹窗视频',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (9, 'xinwen2', 0, 'xinwen2', 2, 'xinwen2', NULL, 1, '2020-04-07 12:00:27');
INSERT INTO `video` VALUES (10, 'xinwen3', 0, 'xinwen3', 2, 'xinwen3', NULL, 1, '2020-04-07 12:00:33');
INSERT INTO `video` VALUES (11, 'xinwen4', 0, 'xinwen4', 2, 'xinwen4', NULL, 1, '2020-04-07 12:00:37');
INSERT INTO `video` VALUES (12, 'xinwen5', 0, 'xinwen5', 2, 'xinwen5', NULL, 1, '2020-04-07 12:00:42');
INSERT INTO `video` VALUES (14, 'xinwen1', 0, 'xinwen1', 2, 'xinwen1', NULL, 2, '2020-04-07 12:01:05');
INSERT INTO `video` VALUES (15, 'xinwen2', 0, 'xinwen2', 2, 'xinwen2', NULL, 2, '2020-04-07 12:01:09');
INSERT INTO `video` VALUES (16, 'xinwen3', 0, 'xinwen3', 2, 'xinwen3', NULL, 2, '2020-04-07 12:01:13');
INSERT INTO `video` VALUES (17, 'xinwen4', 0, 'xinwen4', 2, 'xinwen4', NULL, 2, '2020-04-07 12:01:18');
INSERT INTO `video` VALUES (18, 'xinwen5', 0, 'xinwen5', 2, 'xinwen5', NULL, 2, '2020-04-07 12:01:22');
INSERT INTO `video` VALUES (19, 'xinwen64', 0, 'xinwen63', 2, '<p>xinwen6</p>', NULL, 2, '2020-04-17 11:51:03');
INSERT INTO `video` VALUES (21, '22223333', 222333, '222333', 2, '222333', '222333', 2, '2020-04-21 14:49:58');
INSERT INTO `video` VALUES (22, '222', 222, '222', 2, '222', '222', 2, '2020-04-21 14:49:06');

-- ----------------------------
-- Table structure for web_foot
-- ----------------------------
DROP TABLE IF EXISTS `web_foot`;
CREATE TABLE `web_foot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页脚分类',
  `list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页脚' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of web_foot
-- ----------------------------
INSERT INTO `web_foot` VALUES (22, 'Our Family of Brands', '[{\"type\":\"2\",\"name\":\"Vinci Smile\",\"content\":\"http://www.vincismile.com/index/index\"},{\"type\":\"2\",\"name\":\"Nobillium\",\"content\":\"https://www.nobilium.com/\"}]', 1, '2020-04-27 16:28:56');
INSERT INTO `web_foot` VALUES (23, 'Help from Us', '[{\"type\":\"2\",\"name\":\"FAQ\",\"content\":\"http://walkcloud.store/in/service/FAQ\"},{\"type\":\"2\",\"name\":\"Download\",\"content\":\"http://walkcloud.store/in/service/download\"}]', 1, '2020-04-20 20:52:18');
INSERT INTO `web_foot` VALUES (24, 'Contact Us', '[{\"type\":\"1\",\"name\":\"Add\",\"content\":\"NO.68 Shanhai Road Donggang District, RizhaoCity, Shandong Province, 276800, P.R.China\"},{\"type\":\"1\",\"name\":\"Tel\",\"content\":\"+86-633-2277268\"},{\"type\":\"1\",\"name\":\"Fax\",\"content\":\"+86-633-2277298\"},{\"type\":\"1\",\"name\":\"Email\",\"content\":\"marketing@hugedental.com\"}]', 1, '2020-04-27 16:25:29');
INSERT INTO `web_foot` VALUES (25, '11', '[{\"type\":\"3\",\"content\":\"\",\"image_url\":\"20200427120605_40124.png\"},{\"type\":\"3\",\"content\":\"https://www.linkedin.com/company/hugedental1985/?viewAsMember=true\",\"image_url\":\"20200427120631_60361.png\"},{\"type\":\"3\",\"content\":\"https://www.youtube.com/channel/UCpReOK95qR-SHhGR-vTPh8Q/about?view_as=public\",\"image_url\":\"20200427120645_62560.png\"},{\"type\":\"3\",\"content\":\"https://www.instagram.com/huge_dental\",\"image_url\":\"20200427120730_61776.png\"},{\"type\":\"3\",\"content\":\"https://www.facebook.com/hugedentalmaterial\",\"image_url\":\"20200427120750_58067.png\"},{\"type\":\"3\",\"content\":\"\",\"image_url\":\"20200427162513_68498.png\"}]', 1, '2020-04-27 16:25:17');

-- ----------------------------
-- Table structure for web_foot_copy1
-- ----------------------------
DROP TABLE IF EXISTS `web_foot_copy1`;
CREATE TABLE `web_foot_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '页脚分类',
  `list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `nation` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1 通用 2美国',
  `create_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页脚' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of web_foot_copy1
-- ----------------------------
INSERT INTO `web_foot_copy1` VALUES (22, 'Our Family of Brands', '[{\"type\":\"2\",\"name\":\"Vinci Mile\",\"content\":\"http://www.vincismile.com/index/index\"},{\"type\":\"2\",\"name\":\"Oralla\",\"content\":\"http://www.vincismile.com/index/index\"},{\"type\":\"2\",\"name\":\"nobles\",\"content\":\"http://www.vincismile.com/index/index\"}]', 1, '2020-04-20 21:43:15');
INSERT INTO `web_foot_copy1` VALUES (23, 'Help from Us', '[{\"type\":\"2\",\"name\":\"FAQ\",\"content\":\"http://walkcloud.store/in/service/FAQ\"},{\"type\":\"2\",\"name\":\"Download\",\"content\":\"http://walkcloud.store/in/service/download\"}]', 1, '2020-04-20 20:52:18');
INSERT INTO `web_foot_copy1` VALUES (24, 'Contact Us', '[{\"type\":\"1\",\"name\":\"Add\",\"content\":\"NO.68 Shanhai Road Donggang District, RizhaoCity, Shandong Province, 276800, P.R.China\"},{\"type\":\"1\",\"name\":\"Tel\",\"content\":\"+86-633-2277268\"},{\"type\":\"1\",\"name\":\"Fax\",\"content\":\"+86-633-2277298\"},{\"type\":\"1\",\"name\":\"Email\",\"content\":\"marketing@hugedental.com\"}]', 1, '2020-04-20 21:40:08');
INSERT INTO `web_foot_copy1` VALUES (25, '', '[{\"type\":\"3\",\"content\":\"\",\"image_url\":\"20200420214052_66949.png\"},{\"type\":\"3\",\"content\":\"\",\"image_url\":\"20200420214105_12715.png\"},{\"type\":\"3\",\"content\":\"https://www.facebook.com/hugedentalmaterial\",\"image_url\":\"20200421164518_53736.png\"},{\"type\":\"3\",\"content\":\"http://192.168.3.11:9527/content/footer-edit/25\",\"image_url\":\"20200421210048_27607.png\"}]', 1, '2020-04-21 21:23:41');

SET FOREIGN_KEY_CHECKS = 1;
