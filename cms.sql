/*
 Navicat MySQL Data Transfer

 Source Server         : manyCommunities
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 31/10/2020 11:58:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  `modify_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `article_id` int(11) NOT NULL COMMENT '所属文章',
  `user_id` int(11) NOT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '测试评论', '2020-10-26 08:47:00', '2020-10-26 08:47:00', 9, 19);
INSERT INTO `comments` VALUES (2, '测试评论1', '2020-10-26 08:57:25', '2020-10-26 08:57:25', 9, 19);
INSERT INTO `comments` VALUES (3, '测试评论2', '2020-10-26 09:04:54', '2020-10-26 09:04:54', 9, 19);
INSERT INTO `comments` VALUES (4, 'nihao', '2020-10-29 04:39:06', '2020-10-29 04:39:06', 6, 19);
INSERT INTO `comments` VALUES (5, '我来评论了', '2020-10-29 05:36:00', '2020-10-29 05:36:00', 7, 19);
INSERT INTO `comments` VALUES (6, '呵呵', '2020-10-29 05:39:21', '2020-10-29 05:39:21', 7, 19);
INSERT INTO `comments` VALUES (7, '哈哈', '2020-10-29 05:45:55', '2020-10-29 05:45:55', 9, 19);
INSERT INTO `comments` VALUES (8, '呵呵', '2020-10-29 05:47:33', '2020-10-29 05:47:33', 6, 19);
INSERT INTO `comments` VALUES (9, '666', '2020-10-29 05:48:59', '2020-10-29 05:48:59', 6, 19);
INSERT INTO `comments` VALUES (10, '111', '2020-10-29 05:51:29', '2020-10-29 05:51:29', 6, 19);
INSERT INTO `comments` VALUES (11, '999', '2020-10-29 05:52:42', '2020-10-29 05:52:42', 6, 19);
INSERT INTO `comments` VALUES (12, '123', '2020-10-29 06:22:40', '2020-10-29 06:22:40', 6, 19);
INSERT INTO `comments` VALUES (13, '123', '2020-10-29 06:22:44', '2020-10-29 06:22:44', 6, 19);
INSERT INTO `comments` VALUES (14, '123', '2020-10-29 06:22:49', '2020-10-29 06:22:49', 6, 19);
INSERT INTO `comments` VALUES (15, '你好', '2020-10-29 06:23:48', '2020-10-29 06:23:48', 6, 19);
INSERT INTO `comments` VALUES (16, '呵呵', '2020-10-29 06:24:13', '2020-10-29 06:24:13', 6, 19);
INSERT INTO `comments` VALUES (17, '6666', '2020-10-29 06:25:02', '2020-10-29 06:25:02', 6, 19);
INSERT INTO `comments` VALUES (18, '哈哈', '2020-10-29 06:32:43', '2020-10-29 06:32:43', 6, 19);
INSERT INTO `comments` VALUES (19, '未敢再', '2020-10-29 06:34:43', '2020-10-29 06:34:43', 6, 19);
INSERT INTO `comments` VALUES (20, '我去', '2020-10-29 06:37:55', '2020-10-29 06:37:55', 9, 19);
INSERT INTO `comments` VALUES (21, '扭曲哦', '2020-10-29 08:47:29', '2020-10-29 08:47:29', 6, 19);
INSERT INTO `comments` VALUES (22, 'heh', '2020-10-30 09:45:30', '2020-10-30 09:45:30', 9, 19);
INSERT INTO `comments` VALUES (23, 'nihoa', '2020-10-30 11:12:21', '2020-10-30 11:12:21', 6, 19);
INSERT INTO `comments` VALUES (24, '1', '2020-10-30 11:41:36', '2020-10-30 11:41:36', 9, 19);

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章内容',
  `create_time` datetime(0) NOT NULL COMMENT '发布时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  `user_id` int(11) NOT NULL COMMENT '文章所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES (6, '测试5', '测试内容5', '2020-10-26 11:21:06', '2020-10-26 00:00:00', 20);
INSERT INTO `topics` VALUES (7, '修改标题2', '修改内容2', '2020-10-26 12:10:04', '2020-10-26 04:26:00', 19);
INSERT INTO `topics` VALUES (8, '测试7', '测试内容7', '2020-10-26 12:10:13', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (9, '测试8888888888', '测试内容8hahahahhahhhah', '2020-10-26 12:10:18', '2020-10-29 12:42:34', 19);
INSERT INTO `topics` VALUES (11, '测试10', '测试内容10', '2020-10-26 12:10:27', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (12, '测试11', '测试内容11', '2020-10-26 12:10:31', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (13, '测试12', '测试内容12', '2020-10-26 12:10:35', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (14, '测试13', '测试内容13', '2020-10-26 12:10:40', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (15, '测试14', '测试内容14', '2020-10-26 12:10:44', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (16, '测试15', '测试内容15', '2020-10-26 12:10:48', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (17, '测试16', '测试内容16', '2020-10-26 12:10:51', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (18, '测试17', '测试内容17', '2020-10-26 12:10:55', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (19, '测试18', '测试内容18', '2020-10-26 12:11:01', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (20, '测试19', '测试内容19', '2020-10-26 12:11:04', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (21, '测试20', '测试内容20', '2020-10-26 12:11:10', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (22, '测试21', '测试内容21', '2020-10-26 12:11:13', '2020-10-26 00:00:00', 19);
INSERT INTO `topics` VALUES (23, '测试标题23', '测试内容23', '2020-10-26 08:39:31', '2020-10-26 08:39:31', 19);
INSERT INTO `topics` VALUES (24, '今天适合写代码', '你好', '2020-10-28 03:23:26', '2020-10-28 03:23:26', 19);
INSERT INTO `topics` VALUES (25, 'undefined', 'undefined', '2020-10-28 03:24:37', '2020-10-28 03:24:37', 19);
INSERT INTO `topics` VALUES (26, 'undefined', 'undefined', '2020-10-28 03:27:38', '2020-10-28 03:27:38', 19);
INSERT INTO `topics` VALUES (27, 'undefined', 'undefined', '2020-10-28 03:27:54', '2020-10-28 03:27:54', 19);
INSERT INTO `topics` VALUES (28, 'undefined', 'undefined', '2020-10-28 03:28:02', '2020-10-28 03:28:02', 19);
INSERT INTO `topics` VALUES (29, '今天适合写代码', '66666', '2020-10-28 03:34:59', '2020-10-28 03:34:59', 19);
INSERT INTO `topics` VALUES (30, '今天适合写代码', '123', '2020-10-30 09:34:01', '2020-10-30 09:34:01', 19);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (19, 'LiuOoCc', 'de8d6c50fef22cab3abae03d0826b6a1', 'LiuOoCc@qq.com', '刘一手', 'default-avatar.png', b'0', '2020-10-26 10:37:40', '2020-10-26 10:37:40');
INSERT INTO `users` VALUES (20, 'LiuOoCc1', 'de8d6c50fef22cab3abae03d0826b6a1', 'LiuOoCc1@qq.com', '刘一手1', 'default-avatar.png', b'0', '2020-10-26 04:25:00', '2020-10-26 04:25:00');
INSERT INTO `users` VALUES (22, 'undefined', '8add17102ed680d0c84b756c9ea173dc', 'LiuOoCc@qq.com1', 'LiuOo2', 'default-avatar.png', b'0', '2020-10-27 04:42:47', '2020-10-27 04:42:47');
INSERT INTO `users` VALUES (23, 'undefined', '8add17102ed680d0c84b756c9ea173dc', 'LiuOoCc@qq.com11', 'LiuOoCc23', 'default-avatar.png', b'0', '2020-10-27 04:44:19', '2020-10-27 04:44:19');
INSERT INTO `users` VALUES (24, 'undefined', '8add17102ed680d0c84b756c9ea173dc', 'LiuOoCc@qq.com123', 'Li23123', 'default-avatar.png', b'0', '2020-10-27 04:45:48', '2020-10-27 04:45:48');
INSERT INTO `users` VALUES (25, 'undefined', '8add17102ed680d0c84b756c9ea173dc', 'LiuOoCc@q123', 'LiuO123', 'default-avatar.png', b'0', '2020-10-27 04:46:18', '2020-10-27 04:46:18');
INSERT INTO `users` VALUES (26, 'undefined', '8add17102ed680d0c84b756c9ea173dc', 'LiuOoCc@qq.com111', 'LiuOoCc@qq.com222', 'default-avatar.png', b'0', '2020-10-27 04:48:42', '2020-10-27 04:48:42');
INSERT INTO `users` VALUES (27, 'undefined', '8add17102ed680d0c84b756c9ea173dc', '1LiuOoCc@qq.com', 'LiuOoCc@qq.com1', 'default-avatar.png', b'0', '2020-10-28 11:47:41', '2020-10-28 11:47:41');
INSERT INTO `users` VALUES (34, '1231', '8add17102ed680d0c84b756c9ea173dc', '123@21313', '1231', 'default-avatar.png', b'0', '2020-10-30 12:18:33', '2020-10-30 12:18:33');
INSERT INTO `users` VALUES (35, 'ewas', '8add17102ed680d0c84b756c9ea173dc', '12312!242@sfdas', 'ewas', 'default-avatar.png', b'0', '2020-10-30 12:20:45', '2020-10-30 12:20:45');
INSERT INTO `users` VALUES (36, '刘两手', 'b9e79361b4040a3f3a71668163d2f058', '273904198@qq.com', '刘两手', 'default-avatar.png', b'0', '2020-10-30 12:23:49', '2020-10-30 12:23:49');
INSERT INTO `users` VALUES (37, '123123123', '14e1b600b1fd579f47433b88e8d85291', '273904198@qq.com111', '123123123', 'default-avatar.png', b'0', '2020-10-30 12:27:19', '2020-10-30 12:27:19');
INSERT INTO `users` VALUES (38, '1231123', 'c6a216499bf6669011b9fcec1f675f49', '1123@123', '1231123', 'default-avatar.png', b'0', '2020-10-30 12:35:39', '2020-10-30 12:35:39');
INSERT INTO `users` VALUES (39, '4124124', '63ee451939ed580ef3c4b6f0109d1fd0', '123@e1231', '4124124', 'default-avatar.png', b'0', '2020-10-30 12:36:40', '2020-10-30 12:36:40');

SET FOREIGN_KEY_CHECKS = 1;
