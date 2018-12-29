/*
Navicat MySQL Data Transfer

Source Server         : fyt
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : fyt_cms

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-12-29 19:08:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_advclass
-- ----------------------------
DROP TABLE IF EXISTS `cms_advclass`;
CREATE TABLE `cms_advclass` (
  `Guid` varchar(50) NOT NULL,
  `ParentGuid` varchar(50) DEFAULT '0' COMMENT '父ID',
  `Title` varchar(50) NOT NULL COMMENT '栏位名称',
  `Flag` varchar(50) NOT NULL COMMENT '栏位类型',
  `Width` int(20) DEFAULT NULL COMMENT '宽度',
  `Height` int(20) DEFAULT NULL COMMENT '高度',
  `Summary` varchar(500) DEFAULT NULL COMMENT '说明',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `SiteID` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `UpdateDate` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Guid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_advclass
-- ----------------------------
INSERT INTO `cms_advclass` VALUES ('cc30b3d1-2ed6-41af-b6cb-12ad2df27456', null, '电脑端', '图片列表广告', '0', '0', null, '', '1', '2018-11-07 16:04:21');
INSERT INTO `cms_advclass` VALUES ('05227551-2879-4d3d-9bd5-d3f4d3aa2178', 'cc30b3d1-2ed6-41af-b6cb-12ad2df27456', 'Banner', '图片列表广告', '1920', '600', null, '', '1', '2018-11-07 16:43:37');
INSERT INTO `cms_advclass` VALUES ('71eb327c-9d58-4638-bc31-b37a1ac22dcc', null, '手机端', '图片列表广告', '0', '0', null, '', '1', '2018-11-08 08:59:51');
INSERT INTO `cms_advclass` VALUES ('e8b4325d-bdd8-448f-83be-034d66642b14', '71eb327c-9d58-4638-bc31-b37a1ac22dcc', '手机焦点图', '图片列表广告', '0', '0', null, '', '1', '2018-11-08 09:00:03');
INSERT INTO `cms_advclass` VALUES ('e8be9aeb-264b-47af-9908-311f52aebe2f', 'cc30b3d1-2ed6-41af-b6cb-12ad2df27456', '友情链接', '友情链接', '0', '0', null, '', '1', '2018-12-16 18:28:59');

-- ----------------------------
-- Table structure for cms_advlist
-- ----------------------------
DROP TABLE IF EXISTS `cms_advlist`;
CREATE TABLE `cms_advlist` (
  `Guid` varchar(50) NOT NULL,
  `ClassGuid` varchar(50) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `Title` varchar(200) NOT NULL COMMENT '广告位名称',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '广告位类型',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `ImgUrl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `LinkUrl` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `LinkSummary` varchar(200) DEFAULT NULL COMMENT '链接描述',
  `Target` varchar(50) NOT NULL COMMENT '打开窗口类型',
  `AdvCode` varchar(2000) DEFAULT NULL COMMENT '广告位说明',
  `IsTimeLimit` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用时间显示',
  `BeginTime` datetime DEFAULT NULL COMMENT '开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `Hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `UpdateDate` datetime NOT NULL COMMENT '更新时间',
  `Summary` varchar(2000) DEFAULT NULL COMMENT '广告位说明',
  PRIMARY KEY (`Guid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_advlist
-- ----------------------------
INSERT INTO `cms_advlist` VALUES ('2ad11d2d-c010-4b69-9801-1a4248d9f2fa', '05227551-2879-4d3d-9bd5-d3f4d3aa2178', '测试广告名称', '0', '', null, null, null, '_blank', null, '\0', '2018-11-08 00:00:00', '2018-11-08 00:00:00', '74', '234', '2018-12-29 19:04:37', null);

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  `ColumnId` int(11) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '0=新闻1=多图片',
  `Title` varchar(200) NOT NULL COMMENT '文章标题',
  `TitleColor` varchar(20) DEFAULT NULL COMMENT '文章标题颜色',
  `SubTitle` varchar(200) DEFAULT NULL COMMENT '文章副标题',
  `Author` varchar(20) DEFAULT NULL COMMENT '作者',
  `Source` varchar(20) DEFAULT NULL COMMENT '来源',
  `IsLink` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否外链',
  `LinkUrl` varchar(255) DEFAULT NULL COMMENT '外部链接地址',
  `Tag` varchar(200) DEFAULT NULL COMMENT '文章标签',
  `Sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `ImgUrl` varchar(255) DEFAULT NULL COMMENT '文章宣传图',
  `ThumImg` varchar(255) DEFAULT NULL COMMENT '文章缩略图',
  `VideoUrl` varchar(255) DEFAULT NULL COMMENT '视频链接地址',
  `IsTop` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否置顶',
  `IsHot` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否热点',
  `IsScroll` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否滚动',
  `IsSlide` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否幻灯',
  `IsComment` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允许评论',
  `IsWap` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否手机站显示',
  `IsRecyc` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否在回收站',
  `Audit` bit(1) NOT NULL DEFAULT b'1' COMMENT '审核状态',
  `KeyWord` varchar(255) DEFAULT NULL COMMENT 'Seo关键字',
  `Summary` varchar(2000) DEFAULT NULL COMMENT '文章摘要',
  `Content` text COMMENT '文章内容',
  `Hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `DayHits` int(11) NOT NULL DEFAULT '0' COMMENT '当日点击量',
  `WeedHits` int(11) NOT NULL DEFAULT '0' COMMENT '星期点击量',
  `MonthHits` int(11) NOT NULL DEFAULT '0' COMMENT '月点击量',
  `LastHitDate` datetime DEFAULT NULL COMMENT '最后点击时间',
  `EditDate` datetime DEFAULT NULL COMMENT '编辑时间',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  `DelDate` datetime DEFAULT NULL COMMENT '删除到回收站时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1432', '1023', '0', '11111111111', null, null, null, null, '\0', null, null, '1', null, null, null, '\0', '\0', '\0', '\0', '\0', '\0', '\0', '', null, null, null, '0', '0', '0', '0', null, '2018-12-29 00:00:00', '2018-12-29 19:08:07', null);

-- ----------------------------
-- Table structure for cms_column
-- ----------------------------
DROP TABLE IF EXISTS `cms_column`;
CREATE TABLE `cms_column` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动递增',
  `Number` varchar(50) NOT NULL COMMENT '栏目编号',
  `Title` varchar(50) NOT NULL COMMENT '栏目标题',
  `EnTitle` varchar(50) DEFAULT NULL COMMENT '英文栏位名称',
  `SubTitle` varchar(50) DEFAULT NULL COMMENT '栏位副标题',
  `ParentId` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目',
  `ClassList` varchar(50) DEFAULT NULL COMMENT '栏位集合',
  `ClassLayer` int(11) NOT NULL DEFAULT '0' COMMENT '栏位等级',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `TypeID` int(11) NOT NULL DEFAULT '0' COMMENT '栏目类型',
  `Attr` varchar(20) DEFAULT NULL COMMENT '栏位属性',
  `TempId` int(11) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `TempName` varchar(50) NOT NULL COMMENT '模板名称',
  `TempUrl` varchar(255) NOT NULL COMMENT '模板地址',
  `ImgUrl` varchar(255) DEFAULT NULL COMMENT '栏位图片',
  `LinkUrl` varchar(255) DEFAULT NULL COMMENT '外部链接地址',
  `WapLinkUrl` varchar(255) DEFAULT NULL COMMENT '移动端链接地址',
  `IsTopShow` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否顶部显示',
  `IsWapShow` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否手机端展示',
  `KeyWord` varchar(100) DEFAULT NULL COMMENT '关键词',
  `Summary` varchar(500) DEFAULT NULL COMMENT '描述',
  `Content` text COMMENT '内容',
  `SiteGuid` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `UpdateDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_column
-- ----------------------------
INSERT INTO `cms_column` VALUES ('1022', '5588272437', '软件开发', 'webdeveloper', null, '1015', '1015,1022,', '3', '9', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:51:28');
INSERT INTO `cms_column` VALUES ('1023', '7608345065', '公司动态', 'company-dynamic', null, '1016', '1016,1023,', '3', '10', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:00:19');
INSERT INTO `cms_column` VALUES ('1024', '3519603282', '技术支持', 'support', null, '1016', '1016,1024,', '3', '11', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:02:05');
INSERT INTO `cms_column` VALUES ('1025', '4455785074', '行业新闻', 'industry', null, '1016', '1016,1025,', '3', '12', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:02:27');
INSERT INTO `cms_column` VALUES ('1021', '9825568883', '手机微网站', 'weixin-site', null, '1015', '1015,1021,', '3', '8', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:51:12');
INSERT INTO `cms_column` VALUES ('1020', '4489163039', '电子商城', 'b2c-development', null, '1015', '1015,1020,', '3', '7', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:50:56');
INSERT INTO `cms_column` VALUES ('1019', '9684832483', '移动APP', 'wapapp', null, '1015', '1015,1019,', '3', '6', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:50:43');
INSERT INTO `cms_column` VALUES ('1018', '9308175596', '高端定制网站', 'responsive-site', null, '1015', '1015,1018,', '3', '5', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:49:57');
INSERT INTO `cms_column` VALUES ('1017', '3181001917', '联系我们', null, null, '1014', '1017,', '2', '4', '1', null, '16', '单页模板', '/fytadmin/cms/columnmodify?type=1&id=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:29:38');
INSERT INTO `cms_column` VALUES ('1016', '9960010741', '新闻中心', null, null, '1014', '1016,', '2', '3', '1', null, '16', '单页模板', '/fytadmin/cms/columnmodify?type=1&id=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:04:05');
INSERT INTO `cms_column` VALUES ('1014', '2949442215', '网站管理', null, null, '0', null, '1', '1', '1', null, '16', '单页模板', '/fytadmin/cms/columnmodify?type=1&id=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 17:28:02');
INSERT INTO `cms_column` VALUES ('1015', '7124008434', '我们的作品', null, null, '1014', '1015,', '2', '2', '1', null, '16', '单页模板', '/fytadmin/cms/columnmodify?type=1&id=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:04:12');
INSERT INTO `cms_column` VALUES ('1026', '3875128420', '网络营销', 'marketing', null, '1016', '1016,1026,', '3', '13', '1', null, '17', '文章模板', '/fytadmin/cms/article/?column=', null, null, null, '', '\0', null, null, null, '0', '2018-12-15 18:03:38');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一ID',
  `ColumnId` varchar(50) NOT NULL COMMENT '归属栏目ID',
  `UserId` varchar(255) DEFAULT '0' COMMENT '评论人ID',
  `UserName` varchar(255) DEFAULT NULL COMMENT '评论人昵称',
  `Summary` text COMMENT '评论内容',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `Option` int(11) NOT NULL DEFAULT '0' COMMENT '评论类型，如=1文章   2=下载  3=商品',
  `Star` int(255) NOT NULL DEFAULT '0' COMMENT '如果评论有星，显示星数',
  `RepUserId` varchar(255) DEFAULT NULL COMMENT '回复人ID',
  `RepUserName` varchar(255) DEFAULT NULL COMMENT '回复人昵称',
  `RepDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间',
  `Audit` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否审核通过',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_download
-- ----------------------------
DROP TABLE IF EXISTS `cms_download`;
CREATE TABLE `cms_download` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ColumnId` int(11) NOT NULL COMMENT '下载所属类型',
  `Title` varchar(255) NOT NULL COMMENT '下载标题',
  `SubTitle` varchar(255) DEFAULT NULL COMMENT '下载副标题',
  `FileUrl` varchar(500) DEFAULT NULL COMMENT '文件地址',
  `FileType` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `FileSize` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `DownSum` int(11) NOT NULL DEFAULT '0' COMMENT '下载数量',
  `Hits` int(11) NOT NULL DEFAULT '0' COMMENT '访问数',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `IsSystem` varchar(255) DEFAULT NULL COMMENT '适用系统',
  `IsCharge` varchar(255) DEFAULT NULL COMMENT '软件类型',
  `ImgUrl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `ThumImg` varchar(255) DEFAULT NULL COMMENT '缩略图地址',
  `IsTop` bit(1) NOT NULL COMMENT '是否置顶',
  `IsComment` bit(1) NOT NULL COMMENT '是否评论',
  `Audit` bit(1) NOT NULL COMMENT '状态',
  `IsLink` bit(1) NOT NULL COMMENT '是否有外链',
  `LinkUrl` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `Tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `Summary` varchar(1000) DEFAULT NULL COMMENT '简介',
  `Content` text COMMENT '详细描述',
  `EditDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_download
-- ----------------------------

-- ----------------------------
-- Table structure for cms_image
-- ----------------------------
DROP TABLE IF EXISTS `cms_image`;
CREATE TABLE `cms_image` (
  `Guid` varchar(50) NOT NULL,
  `TheGuid` varchar(50) DEFAULT NULL COMMENT '所属栏目Guid',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '图片类型，一个栏目可有多个图片类型',
  `Title` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `ImgBig` varchar(255) NOT NULL COMMENT '图片原图',
  `ImgSmall` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `ImgType` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `ImgSize` bigint(20) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `IsCover` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为封面',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_image
-- ----------------------------
INSERT INTO `cms_image` VALUES ('c30bfec4-bb75-43cf-960c-868c52d957ef', null, '0', null, '/upload/localpc/banner/583bf138e46ad_1024.jpg', null, 'jpg', '58', '\0', '0', '2018-12-14 22:36:39');

-- ----------------------------
-- Table structure for cms_imgtype
-- ----------------------------
DROP TABLE IF EXISTS `cms_imgtype`;
CREATE TABLE `cms_imgtype` (
  `Guid` varchar(50) NOT NULL,
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '一级菜单',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型分类 0=本地 1=云端',
  `Level` tinyint(10) NOT NULL DEFAULT '1' COMMENT '级别',
  `Name` varchar(50) NOT NULL,
  `EnName` varchar(50) DEFAULT NULL,
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_imgtype
-- ----------------------------
INSERT INTO `cms_imgtype` VALUES ('130301d3-b274-408a-b1a5-63da559ff5ab', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '新闻', 'news', '2018-12-14 11:00:44');
INSERT INTO `cms_imgtype` VALUES ('295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', null, '1', '0', 'Web网站', 'website', '2018-12-14 11:00:45');
INSERT INTO `cms_imgtype` VALUES ('3fc8afde-d8eb-4fd3-bc8a-6f38a02b2b24', 'a9a27418-b88d-4ee9-b248-ad11a337779d', '0', '1', '测试文件', 'testfile', '2018-12-14 22:48:44');
INSERT INTO `cms_imgtype` VALUES ('63b20d96-a4b0-4c6d-8d73-38debbf7bc4c', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '其他', 'else', '2018-12-14 11:00:46');
INSERT INTO `cms_imgtype` VALUES ('65947712-a9bc-4b6c-b72d-a0e2928efec2', '7bd6e9df-8c95-4c39-ba1c-a39bb114f100', '1', '1', '焦点图', 'banner', '2018-12-14 11:00:47');
INSERT INTO `cms_imgtype` VALUES ('6c54044d-9417-46db-9348-d6dca3d5bdbe', 'a9a27418-b88d-4ee9-b248-ad11a337779d', '0', '1', '轮播图', 'slider', '2018-12-14 11:11:08');
INSERT INTO `cms_imgtype` VALUES ('7bd6e9df-8c95-4c39-ba1c-a39bb114f100', null, '1', '0', '手机App', 'mobile', '2018-12-14 11:00:48');
INSERT INTO `cms_imgtype` VALUES ('991740df-b550-4157-8579-00ceecb8c65b', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '焦点图', 'banner', '2018-12-14 11:00:49');
INSERT INTO `cms_imgtype` VALUES ('a1b359fb-d3fc-4dc7-95b7-1e1e80ca3b86', 'a9a27418-b88d-4ee9-b248-ad11a337779d', '0', '1', '焦点图', 'banner', '2018-12-14 11:10:52');
INSERT INTO `cms_imgtype` VALUES ('a88674cc-a8f4-4e95-ba3e-b8548b7d75a3', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '服务', 'service', '2018-12-14 11:00:50');
INSERT INTO `cms_imgtype` VALUES ('a9a27418-b88d-4ee9-b248-ad11a337779d', null, '0', '0', 'PC站', 'localpc', '2018-12-14 11:10:39');
INSERT INTO `cms_imgtype` VALUES ('cdec6afb-d9ef-49d3-9789-b676e5832f44', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '文件', 'files', '2018-12-14 11:00:51');
INSERT INTO `cms_imgtype` VALUES ('dc0f61ca-ce4c-45f4-93e0-f14585c06fc0', '295ab6ef-e55f-49ce-80df-a28f4ecdb6a3', '1', '1', '案例', 'cases', '2018-12-14 11:00:53');

-- ----------------------------
-- Table structure for cms_message
-- ----------------------------
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动标识',
  `ColumnId` varchar(50) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `Title` varchar(200) DEFAULT NULL COMMENT '标题',
  `Mobile` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `Email` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `QQ` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `Status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否查看',
  `Summary` varchar(2000) DEFAULT NULL COMMENT '描述',
  `Content` text COMMENT '内容',
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `UserName` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `IP` varchar(50) DEFAULT NULL,
  `ParentId` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `RepId` int(11) NOT NULL DEFAULT '0' COMMENT '回复ID',
  `RepContent` varchar(2000) DEFAULT NULL COMMENT '回复内容',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  `RepDate` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_message
-- ----------------------------
INSERT INTO `cms_message` VALUES ('7', '0', '0', '测试标题A', null, null, null, '', null, null, '0', null, null, '0', '0', null, '2018-11-08 13:42:47', null);
INSERT INTO `cms_message` VALUES ('8', '0', '0', '测试标题B', null, null, null, '', null, null, '0', null, null, '0', '0', null, '2018-11-08 13:42:47', null);
INSERT INTO `cms_message` VALUES ('9', '0', '0', '测试标题C', null, null, null, '', null, null, '0', null, null, '0', '0', null, '2018-11-08 13:42:47', null);
INSERT INTO `cms_message` VALUES ('10', '0', '0', '测试标题D', null, null, null, '', null, null, '0', null, null, '0', '0', null, '2018-11-08 13:42:47', null);
INSERT INTO `cms_message` VALUES ('23', 'message', '0', 'aaaaaaaa', 'aaa', null, null, '', 'aaaaaaaaaa', null, '0', 'aaaaaaaa', '::1', '0', '0', null, '2018-12-18 12:03:29', null);
INSERT INTO `cms_message` VALUES ('22', 'message', '0', 'aaaaaaaa', 'aaa', null, null, '', 'aaaaaaaaaa', null, '0', 'aaaaaaaa', '::1', '0', '0', null, '2018-12-18 12:03:27', null);
INSERT INTO `cms_message` VALUES ('20', 'message', '0', 'aaaaaaaa', 'aaa', null, null, '', 'aaaaaaaaaa', null, '0', 'aaaaaaaa', '::1', '0', '0', null, '2018-12-18 12:03:14', null);
INSERT INTO `cms_message` VALUES ('21', 'message', '0', 'aaaaaaaa', 'aaa', null, null, '', 'aaaaaaaaaa', null, '0', 'aaaaaaaa', '::1', '0', '0', null, '2018-12-18 12:03:25', null);

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `Guid` varchar(50) NOT NULL,
  `SysId` int(11) NOT NULL DEFAULT '0' COMMENT '系统ID',
  `SiteName` varchar(50) NOT NULL COMMENT '网站名称',
  `SiteUrl` varchar(100) DEFAULT NULL COMMENT '网站域名',
  `SiteLogo` varchar(255) DEFAULT NULL COMMENT '网站Logo',
  `Summary` varchar(500) DEFAULT NULL COMMENT '网站描述',
  `SiteTel` varchar(50) DEFAULT NULL COMMENT '公司电话',
  `SiteFax` varchar(50) DEFAULT NULL COMMENT '公司传真',
  `SiteEmail` varchar(100) DEFAULT NULL COMMENT '公司人事邮箱',
  `QQ` varchar(500) DEFAULT NULL COMMENT '公司客服QQ',
  `WeiXin` varchar(255) DEFAULT NULL COMMENT '微信公众号图片',
  `WeiBo` varchar(255) DEFAULT NULL COMMENT '微博链接地址或者二维码',
  `SiteAddress` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `SiteCode` varchar(2000) DEFAULT NULL COMMENT '网站备案号其它等信息',
  `SeoTitle` varchar(255) DEFAULT NULL COMMENT '网站SEO标题',
  `SeoKey` varchar(500) DEFAULT NULL COMMENT '网站SEO关键字',
  `SeoDescribe` varchar(2000) DEFAULT NULL COMMENT '网站SEO描述',
  `SiteCopyright` varchar(2000) DEFAULT NULL COMMENT '网站版权等信息',
  `Status` bit(1) DEFAULT b'1' COMMENT '网站开启关闭状态',
  `CloseInfo` varchar(2000) DEFAULT NULL COMMENT '如果状态关闭，请输入关闭网站原因',
  `IsDel` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`Guid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('78756a6c-50c8-47a5-b898-5d6d24a20327', '0', '测试站点', 'www.fuyu.com', 'abc', null, null, null, null, null, null, null, null, null, '网站标题', '网站关键字', '网站描述', null, '\0', null, '\0');

-- ----------------------------
-- Table structure for cms_tags
-- ----------------------------
DROP TABLE IF EXISTS `cms_tags`;
CREATE TABLE `cms_tags` (
  `Guid` varchar(50) NOT NULL,
  `FirstLetter` varchar(5) DEFAULT NULL COMMENT '首字母',
  `Name` varchar(20) DEFAULT NULL COMMENT '标签名称',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `Links` varchar(255) DEFAULT NULL COMMENT '标签链接地址',
  `TagsHits` int(11) NOT NULL DEFAULT '0' COMMENT '标签点击量',
  PRIMARY KEY (`Guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_tags
-- ----------------------------

-- ----------------------------
-- Table structure for cms_template
-- ----------------------------
DROP TABLE IF EXISTS `cms_template`;
CREATE TABLE `cms_template` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增长',
  `Title` varchar(50) NOT NULL COMMENT '模板名称',
  `Url` varchar(255) NOT NULL COMMENT '模板地址',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `Sort` int(11) DEFAULT '0' COMMENT '排序',
  `AddDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_template
-- ----------------------------
INSERT INTO `cms_template` VALUES ('16', '单页模板', '/fytadmin/cms/columnmodify?type=1&id=', '\0', '0', '2018-11-05 22:23:55');
INSERT INTO `cms_template` VALUES ('17', '文章模板', '/fytadmin/cms/article/?column=', '\0', '0', '2018-11-05 22:24:17');
INSERT INTO `cms_template` VALUES ('18', '下载模板', '/fytadmin/cms/download/?column=', '\0', '0', '2018-11-07 12:43:54');

-- ----------------------------
-- Table structure for cms_vote
-- ----------------------------
DROP TABLE IF EXISTS `cms_vote`;
CREATE TABLE `cms_vote` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `ColumnId` int(11) NOT NULL COMMENT '所属栏目ID',
  `Title` varchar(200) DEFAULT NULL COMMENT '投票标题',
  `SubTitle` varchar(200) DEFAULT NULL COMMENT '投票副标题',
  `ItemSum` int(11) NOT NULL COMMENT '选项总数',
  `VoteSum` int(11) NOT NULL COMMENT '投票总数',
  `Options` bit(1) NOT NULL,
  `VoteType` int(11) NOT NULL COMMENT '投票类型',
  `ImgUrl` varchar(200) DEFAULT NULL COMMENT '宣传图',
  `IsTime` bit(1) NOT NULL COMMENT '时间限制',
  `BeginDate` datetime NOT NULL COMMENT '开始时间',
  `EndDate` datetime NOT NULL,
  `Summary` varchar(2000) DEFAULT NULL COMMENT '投票简介',
  `AddDate` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_vote
-- ----------------------------

-- ----------------------------
-- Table structure for cms_voteitem
-- ----------------------------
DROP TABLE IF EXISTS `cms_voteitem`;
CREATE TABLE `cms_voteitem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `VoteId` int(11) NOT NULL COMMENT '投票项ID',
  `Title` varchar(200) DEFAULT NULL COMMENT '投票项',
  `VoteSum` int(11) NOT NULL COMMENT '投票数',
  `Scale` varchar(200) DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_voteitem
-- ----------------------------

-- ----------------------------
-- Table structure for cms_votelog
-- ----------------------------
DROP TABLE IF EXISTS `cms_votelog`;
CREATE TABLE `cms_votelog` (
  `Guid` varchar(255) NOT NULL COMMENT '唯一ID',
  `VoteId` int(11) DEFAULT NULL COMMENT '投票ID',
  `ItemId` varchar(255) DEFAULT NULL COMMENT '投票项ID',
  `UserId` varchar(255) NOT NULL COMMENT '投票人ID',
  `UserName` varchar(255) DEFAULT NULL COMMENT '投票人昵称',
  `Ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `AddDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '投票时间',
  `Summary` varchar(500) DEFAULT NULL COMMENT '投票详情',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_votelog
-- ----------------------------

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识',
  `RoleGuid` varchar(50) DEFAULT NULL COMMENT '角色标识',
  `DepartmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `DepartmentGuid` varchar(50) NOT NULL COMMENT '部门标识',
  `DepartmentGuidList` varchar(500) DEFAULT NULL,
  `LoginName` varchar(30) NOT NULL COMMENT '登录账号',
  `LoginPwd` varchar(50) NOT NULL COMMENT '登录密码',
  `TrueName` varchar(20) DEFAULT NULL COMMENT '真是姓名',
  `Number` varchar(10) NOT NULL COMMENT '编号',
  `HeadPic` varchar(100) NOT NULL COMMENT '头像',
  `Sex` varchar(10) NOT NULL DEFAULT '' COMMENT '性别',
  `Mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `Email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `Summary` varchar(500) DEFAULT NULL COMMENT '描述',
  `AddDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `LoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `UpLoginDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES ('12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, '商务中心', '52523a76-52b3-4c25-a1bd-9123a011f2a8', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,24febdc4-655f-4492-ac8a-4adab18c22c8,52523a76-52b3-4c25-a1bd-9123a011f2a8,', 'admins', 'pPo9vFeTWOCF0oLKKdX9Jw==', '子恒国际', '1101', '/themes/img/avatar.jpg', '男', '13888888888', '', null, null, '2018-10-09 22:54:47', '2018-12-29 18:41:12', '2018-12-29 18:41:12');
INSERT INTO `sys_admin` VALUES ('30d3da88-bb72-4ace-a303-b3aae0ecb732', null, '事业发展部', '4b6ab27f-c0fa-483d-9b5a-55891ee8d727', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,4b6ab27f-c0fa-483d-9b5a-55891ee8d727,', 'testadmin', 'Ycdvj7dGDz45F6Qlw7OMQ904o/xRuq0k', '李四', '1002', '/themes/img/avatar.jpg', '男', null, '\0', null, null, '2018-07-22 00:42:14', '2018-07-22 00:42:14', '2018-07-22 00:42:14');

-- ----------------------------
-- Table structure for sys_appsetting
-- ----------------------------
DROP TABLE IF EXISTS `sys_appsetting`;
CREATE TABLE `sys_appsetting` (
  `Guid` varchar(50) NOT NULL,
  `AndroidVersion` varchar(50) NOT NULL DEFAULT '0.0' COMMENT '安卓版本号',
  `AndroidFile` varchar(255) DEFAULT NULL COMMENT '更新文件',
  `IosVersion` varchar(50) NOT NULL COMMENT 'Ios版本号',
  `IosFile` varchar(255) DEFAULT NULL COMMENT 'Ios更新文件地址',
  `IosAudit` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Ios审核开关  0=关/1=开',
  `IsDel` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除 0=不删除/1=删除',
  `UpdateDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_appsetting
-- ----------------------------
INSERT INTO `sys_appsetting` VALUES ('1fb35576-8bd2-4744-b708-7aeb1626578b', '2', null, '2', null, '0', '', '2018-11-28 10:52:06');

-- ----------------------------
-- Table structure for sys_btnfun
-- ----------------------------
DROP TABLE IF EXISTS `sys_btnfun`;
CREATE TABLE `sys_btnfun` (
  `Guid` varchar(50) NOT NULL,
  `MenuGuid` varchar(50) NOT NULL,
  `Name` varchar(20) NOT NULL COMMENT '功能名称',
  `FunType` varchar(20) NOT NULL COMMENT '功能标识名称',
  `Summary` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_btnfun
-- ----------------------------
INSERT INTO `sys_btnfun` VALUES ('6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '新增', 'Add', null);
INSERT INTO `sys_btnfun` VALUES ('6d2c2da5-8bb8-4905-aaa9-cd297a46e4ed', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '导出', 'Export', null);
INSERT INTO `sys_btnfun` VALUES ('8112ffb0-a84e-496c-93d7-95c02678754a', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '审核', 'Audit', null);
INSERT INTO `sys_btnfun` VALUES ('931bd729-f160-4fe3-bb7c-7828a2da047a', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '修改', 'Edit', null);
INSERT INTO `sys_btnfun` VALUES ('b1ab3437-6481-4a4e-b536-d7870a822de4', '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '导入', 'Import', null);
INSERT INTO `sys_btnfun` VALUES ('b943200f-7c99-44b5-93d9-e4ea2505928a', '5ce13ead-971b-4ed4-ad5f-acacccd82381', '新增', 'Add', null);

-- ----------------------------
-- Table structure for sys_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE `sys_code` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标号Guid',
  `ParentGuid` varchar(50) NOT NULL COMMENT '字典类型标识',
  `CodeType` varchar(50) DEFAULT NULL COMMENT '字典值——类型',
  `Name` varchar(255) NOT NULL COMMENT '字典值——名称',
  `EnName` varchar(255) DEFAULT NULL COMMENT '字典值——英文名称',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '字典值——排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '字典值——状态',
  `Summary` varchar(1000) DEFAULT NULL COMMENT '字典值——描述',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '字典值——添加时间',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '字典值——修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code
-- ----------------------------
INSERT INTO `sys_code` VALUES ('0042c8e2-60dc-44b9-a637-d98d6e4c6d1a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BLZ', 'BLZ百禄姿', null, '317', '', 'BLZ百禄姿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0086fdc0-1718-4dae-96de-4eb56f94be83', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YZB', 'YZB伊姿百瑞', null, '261', '', 'YZB伊姿百瑞', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('00bc1e1a-1ed3-4b89-9b20-707715652148', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'P', '皮草', null, '155', '', '皮草', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('00e579a7-7766-401e-a9a3-24636e8e5895', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SDP', 'SDP皮衣三', null, '169', '', '皮衣三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0409f43c-f999-4ef2-a5be-9405ba5ba7e9', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'M46', 'M46曼紫46羽绒服三', null, '182', '', '曼紫46羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('06256d8f-5206-4282-b206-b82d4ace5565', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HNS', 'HNS海宁双面尼', null, '288', '', 'HNS海宁双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('064aac2c-1bee-4cad-9f86-1486159d20be', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DDZ', '吊带杂DDZ', null, '225', '', '吊带杂DDZ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('089b20ed-c712-4b10-839c-06b574c7f35d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XHX', 'XHX雪鸿羽绒服', null, '149', '', '雪鸿羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0915806a-5315-4bcb-bcda-402b272d9f27', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JJX', 'JJX晶晶薇琪', null, '198', '', 'JJX晶晶薇琪', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('09c453df-df66-4b8d-9324-d74db78a385b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YFL', 'YFL音非', null, '278', '', 'YFL音非', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0b9abd29-a571-40eb-95ba-afb591f3412c', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JLY', '佳澜依尔JLY', null, '210', '', '佳澜依尔JLY', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0ccd9c0e-4df4-401e-b40a-531ca53ae849', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HSX', 'HSX花色', null, '308', '', 'HSX花色', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0ceee612-c739-49ff-a635-b4f67f3e1ffd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'CSL', 'CSL尘色', null, '44', '', '尘色', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0e425b2d-9549-45d5-abbf-f95cbd52cb72', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'G', '半裙', null, '143', '', '半裙', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0e56f826-a388-4472-beb6-f8539b5e2883', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZGP', 'ZGP专供皮衣', null, '189', '', 'ZGP专供皮衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0e6a54df-6fb9-4e5a-b0a9-61de5eab1f7a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JWN', 'JWN杰文妮', null, '123', '', '杰文妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('0eb83125-cfb4-4062-9e23-1b1a1a90aee7', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SKL', 'SKL萨酷睿L', null, '117', '', 'SKL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1050bee3-8a02-441b-977a-537b4e060e6a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DMX', '麦之林DMX', null, '239', '', '麦之林DMX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1083421d-2cc4-47c7-aad3-534e877a71cb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DRD', 'DRD貂绒打底毛衫', null, '258', '', 'DRD貂绒打底毛衫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('10bdbd39-c147-4131-9903-b540b6e96121', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XMX', 'XMX绚萌', null, '124', '', '绚萌', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('11c2d713-43b6-45b1-8338-50342ac23b62', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YNX', '依诺YNX', null, '224', '', '依诺YNX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('12738a20-2ae0-4a30-bee5-9922efaf964a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SNY', 'SNY圣娜依儿', null, '197', '', 'SNY圣娜依儿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('12f73730-5e4d-4ae8-bb10-e62f08749dd7', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZYX', 'ZYX甄妍', null, '302', '', 'ZYX甄妍', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('14dc428c-6d46-4c3d-ac59-b16c68b8e358', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BFN', 'BFN贝芙妮', null, '75', '', '贝芙妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('15b25377-72ad-4087-83ad-ca28a8cedfdf', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HEL', 'HEL禾尔美', null, '69', '', '禾尔美', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('15bc0cdb-a28b-4784-b7f7-8dbd76d6416a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DSY', 'DSY迪丝雅', null, '265', '', 'DSY迪丝雅', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1913afc4-0c1e-4e0e-9f4f-19788e8aac35', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MEN', 'MEN沐恩真丝', null, '217', '', 'MEN沐恩真丝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1970b666-7b15-481d-8702-1368e2380c3f', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'H', '四季装', null, '12', '', '四季装-H', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1b87910f-d007-4d33-afbe-98ffda089589', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AYX', 'AYX艾燕春装', null, '259', '', 'AYX艾燕春装', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1cffd0c2-f35c-42d8-bd77-265f5e282fe8', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PYX', 'PYX皮衣', null, '236', '', 'PYX皮衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1d164b70-f91b-41bb-b348-62cfd6ae75fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HXX', 'HXX鸿秀双面妮', null, '147', '', '鸿秀双面妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1da78dc4-908e-4cd8-aa0c-0cd5172365fc', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NKS', 'NKS男款双面尼', null, '267', '', 'NKS男款双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1dd9460a-ca52-4016-80f9-c56c0434654f', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'IKL', 'IK', null, '67', '', 'IK', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('1efed59b-232f-4c80-867a-8ddc925848e3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AWL', 'AWL艾薇儿awl', null, '72', '', '艾薇儿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2011a2a0-e5aa-4dd0-b0e7-8fb1a429cdcd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HYY', 'HYY韩以羽绒服', null, '315', '', 'HYY韩以羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2169b09a-8b58-4376-b1c4-3f56839d2304', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MSL', 'MSL曼丝L秀登', null, '119', '', 'MSL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('22c6f678-cd30-4248-92a2-e9baa6b6f117', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'O', '羊绒大衣', null, '141', '', '羊绒大衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('22f7bd06-33f6-45d6-8c21-6290e098ceb2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XFZ', '西服杂XFZ', null, '228', '', '西服杂XFZ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2418bfca-9640-4382-a665-f6fd5ffcc017', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YBL', 'YBL伊百丽', null, '142', '', '伊百丽', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2474293b-a3b0-41a3-baa4-1b2a75257b97', '7b664e3e-f58a-4e66-8c0f-be1458541d14', '137', '137高圆圆同款三', null, '190', '', '137高圆圆同款三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('24f9efe2-b80e-4ab1-833c-f02a61948b95', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YMR', 'YMR依目了然', null, '132', '', '依目了然', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('25b47163-315e-4c63-abed-8412f537a516', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JXL', 'JXL杰西伍', null, '70', '', '杰西伍', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2628b747-9986-4a5c-9a30-abf89b6a8742', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZNW', 'ZNW珍妮文', null, '216', '', 'ZNW珍妮文', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('273309c3-34d0-4cf4-8abe-7b83ddd22fe6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FZL', 'FZL梵姿', null, '55', '', '梵姿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('27fe6c17-2e1d-4f3e-8416-074e9033a53d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XDZ', 'XDZ雪丹枝', null, '275', '', 'XDZ雪丹枝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('28245b5c-9205-4084-99aa-c34a5e695c9c', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'A', '春装', null, '5', '', '春装-A', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('28d7c022-5749-40e2-8b3d-fed90cf2e02e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'M53', 'M53曼紫53 三', null, '203', '', 'M53曼紫53 三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('28ffb566-5247-41cf-bcd3-725d305b19be', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'OSL', 'OSL欧时力', null, '73', '', '欧时力', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2963ff16-26fe-4754-98f6-332d33b91dc5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XYY', 'XYY夏映颗粒绒', null, '316', '', 'XYY夏映颗粒绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('29c41b94-4b92-4676-a1d2-2cf89abb8c90', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'T', '夹克', null, '298', '', '机车夹克', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2a3aa0f8-c5b3-4570-a8a2-e04e0f05d6ef', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MQX', 'MQX玛琪雅朵', null, '87', '', '玛琪雅朵', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2a64211c-e0c0-40a5-a291-7e44dec9f681', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YZM', 'YZM羽绒服三', null, '178', '', 'YZM羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2afd1417-9b6f-4842-afca-ae72805609a1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BJS', 'BJS北京双面尼', null, '243', '', 'BJS北京双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2b2cf889-6245-4a21-9454-35c9e882ace5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WYL', 'WYL唯依', null, '93', '', '唯依', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2bdac142-528e-433f-9a7e-3aa02ccea7fe', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'RFY', 'RFY人佛缘', null, '164', '', '人佛缘', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2e6da0d5-3f35-4093-a442-d9d1b50c3a07', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AWR', 'AWR艾薇儿awr', null, '125', '', '艾薇儿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2ea653ab-1a18-4c84-a872-cf873ab11f5d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BSK', 'BSK百思寇', null, '251', '', 'BSK百思寇', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2eaf5d0f-3010-46ef-96c3-0d79ea17f9b2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MMW', 'MMW棉麻围巾', null, '146', '', '棉麻围巾', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('2fa78c1b-40d0-4eb7-a1a8-b44de4e64589', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YZK', 'YZK依庄可人', null, '246', '', 'YZK依庄可人', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3035f671-abca-437b-96ff-990225cb6f28', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '2', '2', null, '135', '', '2', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('32ceaa41-dea6-4cff-bb95-11f2789870db', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HNX', 'HNX亨奴', null, '226', '', 'HNX亨奴', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('333ba8b5-d2ba-4901-97fd-6edd6e761736', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '0', '0', null, '172', '', '0', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('33ec687b-e773-4a8c-a644-43821e63e7ff', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YYY', 'YYY依艺缘', null, '276', '', 'YYY依艺缘', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3681512b-3fc7-458e-a9db-b15990b922fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YSD', 'YSD依莎蒂妮', null, '230', '', 'YSD依莎蒂妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('38e51871-1eac-4201-89d4-06533623fb2e', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'H', '50以上休闲', null, '151', '', '50以上休闲', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('39d525ac-0df2-4c36-919c-301d2af15127', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HBN', 'HBN韩版连衣裙', null, '289', '', 'HBN韩版连衣裙', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3a0c2c57-5b29-42ea-900e-ba751772128e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NYN', 'NYN诺喑呢', null, '188', '', 'NYN诺喑呢', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3c92c5b5-a74c-4483-b053-b7061d2ed8a5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YDA', 'YDA雅蒂安娜', null, '173', '', 'YDA雅蒂安娜', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3c95046e-b1b3-4a39-8006-9987056e84be', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YFX', 'YFX佑芙妮', null, '231', '', 'YFX佑芙妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3d6bb971-13e5-4c50-a0b2-4d7f1c5643b4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PXL', '飘宣PXL', null, '159', '', '飘宣PXL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('3ddeae38-b336-4450-b5d9-5e9e90115e98', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'QTM', 'QTM晴天明月', null, '43', '', '晴天明月', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('400920ee-9e41-4a9a-8561-9abeff8f26a5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JXW', 'JXW 杰西伍', null, '200', '', 'JXW 杰西伍', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('40f67656-6b9c-49ab-b8c3-377ebcde16c7', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'I', 'XXXXL', null, '40', '', 'XXXXL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('41bc4e6d-25a8-462a-b8b4-b6079ae2a57d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NRS', 'NRS女人时报', null, '85', '', '女人时报', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('429f8ceb-69a4-42ef-a3e4-c907389e97d3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YRT', 'YRT羽绒服三', null, '171', '', 'YRT羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('433885fa-b07d-40f1-b175-f3475ab744fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DZK', 'DZK 2017定制款', null, '235', '', 'DZK 2017定制款', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('43854363-22b0-4176-a0bc-66dd612f660d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SSN', 'SSN似水年华', null, '53', '', '似水年华', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('443df199-e5f2-4509-894f-cf1ec1d57a9d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LSQ', 'LSQ陆氏青云', null, '56', '', '陆氏青云', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('450562e4-3293-4d71-8f82-ecb5889a74a4', '1942d4fd-3203-42b1-a955-4a84a532b2a2', '19', '2019', null, '319', '', '2019', '2018-10-19 13:07:22', '2018-10-19 13:07:22');
INSERT INTO `sys_code` VALUES ('45744b0c-a792-4ea8-8490-1cf5ae7556fa', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FMY', 'FMY风媚衣坊 晨贝 靡曼', null, '290', '', 'FMY风媚衣坊 晨贝 靡曼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('45f44976-7856-4e34-b12c-8e7d568b1aaa', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WHZ', '武汉杂2017WHZ', null, '238', '', '武汉杂2017WHZ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('463ad549-3d7b-4a87-8b13-5878f84eb035', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MZY', 'MZY曼紫羽绒服三', null, '166', '', '曼紫羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('46ac0b25-660b-48cc-a3ec-ff8dd47864cd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WBB', 'WBB 武汉彬彬 ', null, '205', '', 'WBB 武汉彬彬 ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('46c3f4a1-aea3-4df6-a8c4-1e65ae626335', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'G', 'XXL', null, '38', '', 'XXL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('477b792f-fee7-46af-9547-55f7684ce5cd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SMR', '双面尼三楼SMR', null, '174', '', '双面尼三楼SMR', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('489ed30a-12c7-4c71-8871-1031681f9a5c', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'M52', 'M52曼紫52羽绒服三', null, '184', '', '曼紫52羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('495ccc11-f0a3-452c-b401-ecc91794350d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SYS', 'SYS似水映', null, '214', '', 'SYS似水映', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4987917b-062e-4e21-8f4d-36df5cf7c76e', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'C', '上衣', null, '15', '', '上衣-C', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4a32b9c5-fae7-462c-aec4-93d5fdf6812d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MQY', 'MQY玛琪雅朵', null, '129', '', '玛琪雅朵', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4b48af91-e964-4d82-b18b-50589db0dbda', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YDM', 'YDM雅蒂安娜毛呢', null, '209', '', 'YDM雅蒂安娜毛呢', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4b9f096f-c053-41fb-9477-ce52375b7ef5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MLM', 'MLM梅丽摩尔', null, '291', '', 'MLM梅丽摩尔', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4be990a5-d6a3-4e75-a43b-65731c44e3bf', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '1', '1', null, '134', '', '1', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4c249ebc-20ef-40ee-b00c-9c63aec3f74c', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'F', 'XL', null, '37', '', 'XL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4c882546-9e1f-425c-a807-78e15ce4e526', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'S', '围巾', null, '145', '', '围巾', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4dbb2a64-36a4-4f43-89f9-ed7da48aa193', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HJY', 'HJY惠景媛', null, '204', '', 'HJY惠景媛', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4e20068b-63be-4d2c-9e38-6cdbe02391b2', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'B', 'XS', null, '33', '', 'XS', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4e6f026b-3eb0-47ad-9184-854c5199e5d8', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'U', '马甲', null, '299', '', '马甲', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4f075839-9804-4998-8659-a919391e561f', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YSY', 'YSY羽绒服三', null, '170', '', 'YSY羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('4f4d3428-fd3c-48c2-85fa-57db17a7fe3f', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'D', '冬装', null, '8', '', '冬装-D', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('500fb1ae-1861-4a5a-9f77-ee6b69bd5375', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'V', '内衣', null, '312', '', '内衣-V', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('50523d77-235a-4c30-b033-be84259b2ff2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YML', 'YML依美瑞', null, '63', '', 'YML依美瑞', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5057e97d-cdc2-413b-8e50-a3fddfb5b822', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BFL', 'BFL贝芙妮', null, '212', '', 'BFL贝芙妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('51957ec1-e8b2-4f9e-8f27-39a4cf261266', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HTF', 'HTF红头发风衣', null, '222', '', 'HTF红头发风衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('55ba863c-664c-40df-8199-7d06992274ac', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BZM', 'BZM宝姿毛衣', null, '140', '', '宝姿毛衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('570b6e38-0333-4bd5-b857-89f6ba8da34a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MNL', 'MNL沐恩冬装', null, '122', '', 'MNL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5aee6bfc-dae4-4616-b129-cb63528570d2', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', 'A', 'A', null, '28', '', 'A', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5b39701e-285c-4bd9-b080-3eeaf70190d5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SKR', 'SKR萨酷睿', null, '57', '', '萨酷睿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5b3ea153-d6e6-42bd-a82e-8497af8f7f0e', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'K', '年轻处理', null, '154', '', '年轻处理', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5b406c33-4552-4d03-809f-20a147523893', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'F', '秋冬装', null, '10', '', '秋冬装-F', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5d24cddd-de94-4602-921e-c8e4b14e8172', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LZL', 'LZL朗姿丽', null, '286', '', 'LZL朗姿丽', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('5e5b962f-362f-4a94-9846-81e6db713be7', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TZD', '童装冬棉服TZD', null, '207', '', '童装冬棉服TZD', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('61fa64da-07f7-4067-9ded-cd8d106e7ba6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SRN', 'SRN赛睿娜', null, '59', '', '赛睿娜', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('62413bf5-d888-4594-8c50-225d3554f085', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YZD', 'YZD艺之蝶', null, '54', '', '艺之蝶', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6300ace3-6443-4d78-bbc3-cdea2c3f57a8', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZTG', 'ZTG紫藤谷', null, '273', '', 'ZTG紫藤谷', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('65590d1d-1c7c-44ae-a328-481a6b5dc2cc', '1942d4fd-3203-42b1-a955-4a84a532b2a2', '20', '2020', null, '320', '', '2020', '2018-10-19 13:07:31', '2018-10-19 13:07:31');
INSERT INTO `sys_code` VALUES ('65d6afad-2c99-4bf7-a4f8-64824562ba97', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SYX', 'SYX水映', null, '181', '', '水映', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('69471576-93bb-473d-a301-204193219f52', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WYX', 'WYX唯依', null, '202', '', 'WYX唯依', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6948a911-3034-45ca-8a17-7797e1a63641', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SMM', 'SMM双面呢三', null, '168', '', '双面呢三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6befc43f-e491-4a84-bc31-756c008707f3', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'H', 'XXXL', null, '39', '', 'XXXL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6c28ecc7-f193-498c-b314-0315b321de95', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FRL', 'FRL妃萱', null, '64', '', '妃萱', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6c67c5d6-fc73-4dec-8754-b5cf242de955', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'A', 'T恤', null, '13', '', 'T恤-A', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6c9da850-84fb-4f3a-a0a4-a0822b7cef7b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'OBY', 'OBY欧版羽绒服', null, '133', '', '欧版羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6cf31787-0a53-419d-be61-b32847b6df79', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZGY', 'ZGY专供羽绒服', null, '187', '', 'ZGY专供羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6d4c33ba-05d9-4238-a9b8-c82fc290d393', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AML', 'AML艾米拉羽绒服三', null, '167', '', '艾米拉羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6e838a10-94c3-4089-8766-3b4bfe85c24d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BYM', 'BYM倍艺蒙', null, '272', '', 'BYM倍艺蒙', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('6ed694c7-6efa-47ff-8425-de995b1953fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TPN', 'TPN太平鸟', null, '271', '', 'TPN太平鸟', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('709c8230-b39f-442f-872f-1f38bae53e4e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DRX', 'DRX貂绒', null, '128', '', '貂绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('711c4b57-8336-4f31-b421-80c83e996dbc', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'D', 'M', null, '35', '', 'M', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('717c1829-0ec6-46b2-bfa9-40e0aef20871', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'M61', 'M61曼紫M61羽绒服三', null, '185', '', '曼紫M61羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('71bee291-1391-4cb3-b533-f8f1e78e485e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SJL', '世纪蓝天SJL', null, '211', '', '世纪蓝天SJL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('71f3252a-638d-43a7-ad79-f9eee672f019', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'J', '均码', null, '41', '', '均码', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('75c3b9b1-beb5-42e1-aa10-26a1962a76fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AXX', 'AXX暗香', null, '282', '', 'AXX暗香', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('76b32e1f-ddd7-43b0-a589-0298bfcfcbe5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MZL', 'MZL曼紫mzl', null, '71', '', '曼紫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('775401f9-f43f-4bdf-a253-bb2717ddf4b2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FXX', 'FXX妃萱', null, '46', '', '妃萱', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7794ac40-1385-43d2-be28-8db183207a67', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'G', '春秋装', null, '11', '', '春秋装-G', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('77b25de4-731c-4f16-a5f0-a463f1cc2ad7', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LZW', 'LZW靓姿屋', null, '232', '', 'LZW靓姿屋', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7835dbc9-9a6f-4ea4-8326-1889779cf28e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DDL', 'DDL迪迪欧', null, '68', '', '迪迪欧', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('784dc39b-90bd-431c-895f-e9de04564181', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '4', '4', null, '137', '', '4', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('79f45c74-7492-4816-869c-66b59bb5f0ba', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YMM', 'YMM怡梦情缘棉服', null, '257', '', 'YMM怡梦情缘棉服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7b03a3f5-cd03-400d-876d-70b367f6a24f', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YKD', 'YKD羽绒服三', null, '186', '', 'YKD羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7b79b747-56b1-4d81-842d-99715e94b12a', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'E', '风衣', null, '17', '', '风衣-E', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7bcf0dbe-6f54-4231-967e-1a0513f85f23', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DDK', 'DDK打底裤 ', null, '191', '', 'DDK打底裤 ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7d209f2e-e7b8-4a91-819e-a955c593ec85', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1006', '包', null, '78', '', null, '2018-06-30 19:29:11', '2018-06-30 19:29:11');
INSERT INTO `sys_code` VALUES ('7e3f1f8a-7b58-4de2-9326-ddd08f2196f1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YFQ', '依芳秋水双面尼YFQ', null, '206', '', '依芳秋水双面尼YFQ', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('7f2375e8-c387-4c8d-9934-b6833edaf4a0', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SJS', 'SJS世纪蓝天双面尼', null, '245', '', 'SJS世纪蓝天双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('804ee952-3f85-4e4a-aa8e-1ba37b5ac486', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TKY', 'TKY挑款羽绒服', null, '255', '', 'TKY挑款羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('80994916-bf65-49ff-8529-9e8796bd46dd', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'A', 'XXL', null, '32', '', 'XXL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('80ce475a-781e-4e58-a506-a77dc9648fca', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YHM', 'YHM羽绒服三', null, '179', '', 'YHM羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('81d70b21-ee20-48eb-b254-6b456517833b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NRL', 'NRL女人屋', null, '103', '', '女人屋', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8383ab1c-18ee-4039-8e2c-33ce68ee1615', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PXM', 'PXM飘轩', null, '74', '', '飘轩', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('867a05c8-ebf8-460a-9de9-9d2e1e4aae73', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'I', '50以下休闲', null, '152', '', '50以下休闲', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('86a900ad-98c8-40d6-8a00-c7fd2cf2f568', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DRN', 'DRN貂绒打底', null, '144', '', '貂绒打底', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('88b76b27-e764-4421-965e-822b8640e155', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TRY', '条绒羽绒服', null, '307', '', '条绒羽绒服TRY', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8913777b-bfc5-41db-8c38-91c8b4956fe5', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', 'B', 'B', null, '29', '', 'B', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8994730c-0ae1-45f6-a1a8-38b609a46252', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BJY', 'BJY北京羽绒服', null, '256', '', 'BJY北京羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8bb35887-5ff6-4b85-b700-ff49e830e3d1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SJZ', 'SJZ世纪蓝天真丝', null, '215', '', 'SJZ世纪蓝天真丝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8dda6501-f1a4-4ede-99df-98731ac37648', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WMZ', 'WMZ外贸真丝', null, '285', '', 'WMZ外贸真丝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8f67ee08-799f-4369-ad56-ee25066da0cd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XCX', 'XCX炫彩', null, '283', '', 'XCX炫彩', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8fccca92-1f94-4bc3-b74a-40ef7f8f109c', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MXX', 'MXX茉希', null, '277', '', 'MXX茉希', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('8ff8c4e9-ad53-438d-84fb-11d0ed3207fd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YDW', '依丁物语YDW', null, '218', '', '依丁物语YDW', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('93321313-2711-40e6-b7c2-d469bb54eec6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'KDM', 'KDM凯蒂梅露羊剪绒', null, '294', '', 'KDM凯蒂梅露羊剪绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('93a26353-fd83-4c17-832f-7724a35a5490', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'STS', 'STS尚缇诗', null, '244', '', 'STS尚缇诗', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('93e7d972-b6c8-403e-86ad-2fec6ae63de4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TKX', 'TKX唐卡', null, '281', '', 'TKX唐卡', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('94a7cbb7-b07e-4a77-b5c8-0674993548a3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PKF', 'PKF派克服', null, '240', '', 'PKF派克服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('95a7e559-2714-4b06-b776-18dd3860841e', '7b664e3e-f58a-4e66-8c0f-be1458541d14', '5ZY', '5ZY5字羽绒服三', null, '192', '', '5ZY5字羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('966afc63-956e-4900-86a0-61c811ec1e30', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YBX', 'YBX约布', null, '295', '', 'YBX约布', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('96e356fa-5b68-49d0-9fcd-aba2f0222303', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PJN', 'PJN帕佳妮', null, '304', '', 'PJN帕佳妮', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('96e43f17-ef09-4e55-a61e-34292b2753f3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MXM', 'MXM莫西莫', null, '66', '', '莫西莫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('98d45a4c-3035-4583-8040-5c1821c7ca97', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BHX', 'BHX鋇禾春装', null, '266', '', 'BHX鋇禾春装', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('98dda8cf-0193-4431-9a8e-dea7524dfca4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZSL', 'ZSL真丝连衣裙', null, '227', '', 'ZSL真丝连衣裙', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('99bb643f-99d1-4d58-9b0e-887a774877b8', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XRX', 'XRX熙然', null, '241', '', 'XRX熙然', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9a838347-2e8d-4acb-ac6d-2615ce15fc0c', '1942d4fd-3203-42b1-a955-4a84a532b2a2', '18', '2018', null, '318', '', '2018', '2018-10-19 13:07:14', '2018-10-19 13:07:14');
INSERT INTO `sys_code` VALUES ('9b8d73b7-e51c-469c-a035-b9c634f44c24', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NSQ', 'NSQ诺诗琪', null, '220', '', 'NSQ诺诗琪', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9b91b963-d46a-463b-814b-c47805146050', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', 'D', ' D', null, '31', '', 'D', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9ba942ed-37ac-457e-9cad-5ae962762242', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MXY', 'MXY魔犀羽绒服', null, '165', '', '魔犀羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9cdfcb80-3647-4b59-b4ec-9e88bc1dbf36', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SDX', 'SDX天格双面呢', null, '120', '', 'SDX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9d414f7d-1213-4409-af54-1efe4a14a87a', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'L', '棉服', null, '150', '', '棉服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9dd88a48-9522-46f6-b676-af1ff37afa36', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '6', '6', null, '24', '', '6', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9e283ca6-df02-485a-840f-4b37918ebaba', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NIK', 'NIK耐克', null, '2', '', '耐克-NIK', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9e420c91-320e-44bc-ab99-c9cc95b8c69f', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TRG', 'TRG唐人阁', null, '76', '', '唐人阁', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9e4d15d3-c0d2-456d-8da3-a873d89181d0', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WYS', 'WYS连衣裙', null, '314', '', 'WYS连衣裙', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9f2edffa-aea8-4014-bd9e-546a3094c54b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FMX', 'FMX纷漫', null, '42', '', '纷漫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('9f784c92-22e1-434e-8792-43d1829d9009', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '5', '5', null, '23', '', '5', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a0664601-d919-4dec-a1ea-28e90edcd0c2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YFN', 'YFN妍妃霓', null, '126', '', '妍妃霓', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a092d9a4-da9f-44e5-8850-6b3b9bdd5a7d', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YGX', 'YGX雅阁', null, '121', '', 'YGX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a1034ce4-d115-4496-b161-64eb5c69d45e', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '9', '9', null, '27', '', '9', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a1332c02-4c8f-4bbe-88de-52e5f9a09166', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YBB', 'YBB一布百布', null, '250', '', 'YBB一布百布', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a143fe9d-480c-4486-b20d-a572ba40e510', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ADI', 'ADI阿迪', null, '1', '', '阿迪-ADI', '2018-10-19 13:06:29', '2018-10-19 13:06:29');
INSERT INTO `sys_code` VALUES ('a15d5b75-7f13-4f23-b2a5-20cfe7941f44', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZSW', 'ZSW真丝围巾', null, '305', '', 'ZSW真丝围巾', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a1aa0583-bae7-4e85-b71f-6b3f871fa118', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'B', '夏装', null, '6', '', '夏装-B', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a29395f1-cbb6-4d3f-bd86-b83c4db15c69', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LGS', 'LGS爱女孩', null, '116', '', '爱女孩', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a30fb363-6976-4232-b9c6-b154170e3dc0', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZGM', 'ZGM专供棉服', null, '201', '', 'ZGM专供棉服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a36dfd28-f130-4d84-83a7-e9d15d5682a3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YRW', 'YRW羊绒围巾', null, '138', '', '羊绒围巾', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a50b6cb4-560f-41af-906a-ef5f43b19186', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SSL', 'SSL桑索', null, '51', '', '桑索', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a5d04a95-7fd7-4e6a-8962-4f8889c3d431', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YXX', 'YXX羽希', null, '58', '', '羽希', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a8d9bd2e-8a0f-4235-8d93-4b5909c945b4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MDX', 'MDX漫多', null, '223', '', 'MDX漫多', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('a97b8fa7-c260-4df6-a1bb-d5314d398baa', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JNX', 'JNX邂逅江南', null, '310', '', 'JNX邂逅江南', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ab170ed2-56c5-467e-8630-02db6910ab44', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JJW', 'JJW晶晶旗威', null, '161', '', '晶晶旗威', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ad5cff15-ab87-4ad6-9ea1-89503d2f1832', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '8', '8', null, '26', '', '8', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ad80fbf8-7db6-40e7-8c88-32a1abb1eee4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FZX', '梵姿FZX', null, '79', '', '梵姿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ade7d3e9-0026-43e7-83fe-96c1be30122c', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'CRZ', 'CR\'Z', null, '52', '', 'CR\'Z', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('af8c9140-12ec-44e2-9691-c08adbb4b8de', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'W', '卫衣', null, '297', '', '卫衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b1b5f177-0fff-4574-b90f-2ae0fdf3d8bd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YJR', 'YJR羊剪绒', null, '237', '', 'YJR羊剪绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b2229e38-a32d-4373-831d-0c3c438365ec', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MZX', 'MZX曼紫秋mzx', null, '130', '', '曼紫秋', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b289b54a-9362-4db5-941f-886b9519e5ed', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'F', '裤子', null, '18', '', '裤子-F', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b2f81d20-4274-41ee-bbee-0adf5994b401', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DDM', '打底毛衫DDM', null, '162', '', '打底毛衫DDM', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b34e3d29-f2e2-4fe4-81cd-a5b4347d44d8', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'C', '秋装', null, '7', '', '秋装-C', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b444ae4e-244d-401a-b3d3-37f1c71c4ee6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YMX', 'YMX翼美', null, '97', '', '翼美', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b614c223-d776-4045-a729-dc18294b190e', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1004', '公斤', null, '76', '', null, '2018-06-30 19:28:56', '2018-06-30 19:28:56');
INSERT INTO `sys_code` VALUES ('b61e977f-6162-4443-97c3-0d0473aa281b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JZK', 'JZK羽绒服三', null, '180', '', 'JZK羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('b87554b5-541d-48ec-9978-49f422fd7ac0', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LYR', 'LYR蓝雅绒', null, '160', '', '蓝雅绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ba90d75a-5d8a-4dac-9458-f46d12511d57', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1003', '条', null, '75', '', null, '2018-06-30 19:28:50', '2018-06-30 19:28:50');
INSERT INTO `sys_code` VALUES ('baab9800-b7db-4ea3-8b89-1f4ae38ea822', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'GFN', 'GFN哥芙妮羽绒服', null, '177', '', '哥芙妮羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('bc2d7429-eb0b-4f24-aa70-f40d7589aa81', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'C', 'S', null, '34', '', 'S', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('bc6ba969-a659-4e1c-8dee-d29608324b33', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'WHY', 'WHY王后羽绒服', null, '176', '', '王后羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('be8c4b17-e786-4441-ab9e-7f1dbeb4a776', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HHS', 'HHS黄鹤双面尼', null, '248', '', 'HHS黄鹤双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c0d871ba-0670-466c-8586-e02ce2c65c02', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DDO', 'DDO迪迪欧秋', null, '92', '', '迪迪欧秋', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c0e51b55-671b-480a-b864-69c23a81fc0b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'DBQ', 'DBQ迪碧茜毛衣', null, '303', '', 'DBQ迪碧茜', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c1d2b3f8-032a-4410-bf05-249053a825e3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XKL', 'XKL茜可可', null, '50', '', '茜可可', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c203be2e-2873-4d0a-9faf-68e894e1e2f3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HZZ', 'HZZ杭州杂', null, '247', '', 'HZZ杭州杂', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c2abdd8e-2eae-47eb-a694-4714da6137fe', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BBL', 'BBL播', null, '65', '', '播', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c2e89f09-04f6-4645-95fc-c480bd551714', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HHJ', 'HHJ红火家人', null, '234', '', 'HHJ红火家人', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c2ff2b85-e617-4e71-95c0-3b9638b606d6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JOR', 'JOR乔丹', null, '4', '', '乔丹-JOR', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c36abb33-00ac-42c6-8cdc-45fca59bb9f1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'QCX', '千禅QCX', null, '208', '', '千禅女装', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('c7f0ea3d-42c1-4e7f-8102-402ac55c0b01', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1007', '套', null, '79', '', null, '2018-06-30 19:29:26', '2018-06-30 19:29:26');
INSERT INTO `sys_code` VALUES ('c8ee7d8b-1f25-423d-b9ec-d557805d6b67', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'R', '衬衣', null, '157', '', '衬衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ca73d117-461c-4a3f-aacb-36a8570abd48', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SRL', 'SRL赛睿娜L', null, '118', '', 'SRL', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('caf2b551-3599-4b86-be78-f540d3ef5dcc', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'CZM', 'CZM粗针毛衫', null, '263', '', 'CZM粗针毛衫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('cb500968-e8ab-4494-bc64-76b338fff965', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'QLS', 'QLS琦丽莎', null, '213', '', 'QLS琦丽莎', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('cc708b6c-a96d-4c5d-9241-0bbb6af11f26', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PSB', 'PSB帕斯宝', null, '279', '', 'PSB帕斯宝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ccf9a0cc-aba8-4e05-81ce-9585686b6643', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FRX', 'FRX芙瑞宣', null, '62', '', '芙瑞宣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ce01577b-f8f7-4619-994b-968235c42ad2', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZRS', 'ZRS绽然双面尼', null, '287', '', 'ZRS绽然', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('cecc6dc2-76ed-4737-99b9-870c42ca03e6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'PYY', 'PYY球球款三', null, '194', '', 'PYY球球款三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('cf054a61-9bdc-4508-9567-585060f067e5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'IKX', 'IKX', null, '158', '', 'IKX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('cf992e05-e8c5-451a-b95b-8b4735903082', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MQL', 'MQL玛琪雅朵', null, '60', '', '玛琪雅朵', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d16848b9-60d2-48db-a746-79c082aa6578', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'M03', 'M03曼紫03羽绒服三', null, '182', '', '曼紫03羽绒服三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d16d0a0d-c884-412c-b32d-c1912b0c7f41', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MZR', 'MZR曼紫三', null, '195', '', 'MZR曼紫三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d2ef5490-f39b-4652-b9f2-a4ba87369750', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MEX', 'MEX沐恩', null, '48', '', '沐恩', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d34c7cb9-68d6-4875-bc0b-75a2b93000de', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '3', '3', null, '136', '', '3', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d36d28d3-2054-44cb-9817-a1a43ac4d5c6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HEM', 'HEM和尔美', null, '196', '', 'HEM和尔美', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d4c6125c-558d-406e-a4dc-3cf8d72f92b8', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MEL', 'MEL沐恩L', null, '163', '', '沐恩L', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d56ddc33-ebb7-44ad-a7a2-cc0efe4589ff', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SNL', 'SNL圣娜依儿', null, '100', '', '圣娜依儿', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d6c64f0a-dc6d-4cab-b51f-b7db35a3eb02', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZLX', 'ZLX庄丽欣', null, '45', '', '庄丽欣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d7acb442-d4dd-4745-af1e-6fd6ec69fae6', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SWX', '述忘SWX', null, '219', '', '述忘SWX', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d7c945e2-3917-44db-999c-e7a51b9ddd99', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'QSX', 'QSX强缩绒', null, '309', '', 'QSX强缩绒', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d7e140c1-0a74-4829-8e97-c0a378172f2c', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZHG', 'ZHG子恒国际双面尼', null, '293', '', 'ZHG子恒国际双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('d844e30b-5eb6-4800-a449-061dd4c56af5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MSX', 'MSX曼丝秀登', null, '90', '', '曼丝秀登', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('dab7d485-278d-460f-a722-ee6311d51d23', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1001', '件', null, '73', '', null, '2018-06-30 19:28:37', '2018-06-30 19:28:37');
INSERT INTO `sys_code` VALUES ('daea1534-8f45-4dd3-8344-42c7cd41a636', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BBX', 'BBX播', null, '199', '', 'BBX播', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('db09e1fc-40b6-4e06-b754-5f217b6b5262', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ARB', 'ARB阿尔巴卡双面尼', null, '264', '', 'ARB阿尔巴卡双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('dbbf8787-343c-4962-bdf2-e5e36944f51f', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1005', '箱', null, '77', '', null, '2018-06-30 19:29:06', '2018-06-30 19:29:06');
INSERT INTO `sys_code` VALUES ('dbda1090-2471-47d8-a32d-765f9eb08910', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'KWN', 'KWN柯文娜', null, '242', '', 'KWN柯文娜', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('dcb6bd5a-4057-444b-8edd-e2355aa36954', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'N', '毛衫', null, '139', '', '', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('dd0abc85-f78f-421c-843b-a6959a08c105', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', 'C', 'C', null, '30', '', 'C', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('dd272d8b-9a09-4672-a4dd-5f740b17a363', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'APM', 'APM艾普玛', null, '296', '', 'APM艾普玛', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('deb3a772-884d-4fd9-a555-1b8b7b05d124', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XKM', 'XKM2017新款毛衣', null, '252', '', 'XKM2017新款毛衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('df908b0c-c2c4-41ed-bdc5-2fe97889b344', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'FAR', 'FAR F.艾人', null, '270', '', ' F.艾人', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e00ae7bb-c23d-4326-b050-4986e5138c5a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'NRW', 'NRW女人屋', null, '61', '', '女人屋', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e064b9a9-924d-488b-8e5d-00b751d2821b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XPP', 'XPP溆牌', null, '269', '', '溆牌', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e1ee070b-1932-43e3-a7c4-20f05d672ba1', '2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '7', '7', null, '25', '', '7', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e2d9b374-1c31-4260-bafa-717c4bda88cb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'ZTL', 'ZTL紫藤罗', null, '49', '', '紫藤罗', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e48f49c9-626c-4bcb-be1f-70a9e17765a1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'HZS', 'HZS杭州双面尼', null, '254', '', 'HZS杭州双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e5d71e81-9e0c-4d58-93ab-cdad615f5edf', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AGW', 'AGW昂购物', null, '311', '', 'AGW昂购物', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e6b2a41e-37d1-4104-a79f-ef3927bf73bd', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'M', '羽绒服', null, '148', '', '羽绒服', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e6f0fce3-37da-4731-a08d-c0e07e086938', '8cb134d5-979b-40e2-b453-aeee265f4ab2', 'E', '春夏装', null, '9', '', '春夏装-E', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e7c6b1ea-645f-406a-a8ac-9706768472cc', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YXL', 'YXL依香丽影', null, '47', '', '依香丽影', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e98ed7b9-c959-4326-a1a7-0fe7ad6179c0', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'J', '老年处理', null, '153', '', '老年处理', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('e9d62a8b-09bd-435a-b3e2-a9822a2bede0', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'JJL', 'JJL晶晶旗威', null, '99', '', '晶晶旗威', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ea7d64e7-a57a-4df9-924d-0a2d73ff9b08', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BRM', 'BRM芭而慕', null, '292', '', 'BRM芭而慕', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('eb23a73e-cc4d-4caf-83cd-ca74bb226b85', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SSX', 'SSX述色', null, '306', '', 'SSX述色', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ed24f032-166f-4ffb-88d5-a23edcbb23f5', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'AAA', 'AAA处理品', null, '233', '', 'AAA处理品', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ee673e40-ec67-4653-92fc-3fd33c220514', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LIN', 'LIN李宁', null, '3', '', '李宁-LIN', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('eeec08d1-c9a5-491c-ba1b-01335c7e3b95', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'B', '连衣裙', null, '14', '', '连衣裙-B', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ef5df705-7ce0-4d08-ade0-42d6c9af48a9', '7088d9b9-6692-4fc7-a83c-da580f1407c3', '1002', '个', null, '74', '', null, '2018-06-30 19:28:42', '2018-06-30 19:28:42');
INSERT INTO `sys_code` VALUES ('f0a9b98f-534f-4edb-9f88-23c60a823406', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BFX', 'BFX柏芙澜', null, '262', '', 'BFX柏芙澜', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f0b27702-4212-430c-ba28-5adda333a86a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MNX', 'MNX玛尼毛衫', null, '221', '', 'MNX玛尼毛衫', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f1e5ca9a-2970-4849-bbd3-efb766e5a848', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'GLS', '格鲁丝', null, '301', '', 'GLS格鲁丝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f266600a-7af3-4238-aed1-ccbffd887db3', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MZS', 'MZS曼紫双面呢', null, '77', '', '曼紫双面呢', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f3251ee9-8c9d-4547-ae7c-a7bdc7ca95dd', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'TAS', 'TAS铜氨丝', null, '284', '', 'TAS铜氨丝', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f38bbf12-e3c1-497c-95d9-1c68b3ae3e9c', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'Q', '套装', null, '156', '', '套装', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f3a5b120-3ff6-4679-a159-a2af679a6e24', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'BJN', 'BJN贝婕妮春装', null, '260', '', 'BJN贝婕妮春装', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f44155fb-734c-4e6b-bbe2-fa0a3c3e6e94', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'CCC', 'CCC折扣品', null, '268', '', '折扣品', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f4c60280-5885-48b5-9093-623170a8a2a1', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'SSS', 'SSS莎莎双面尼', null, '249', '', 'SSS莎莎双面尼', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f4d4f3ba-326f-473b-ac5e-c3fad3ac56f4', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'MGG', 'MGG木果果木', null, '274', '', 'MGG木果果木', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f65fd2dd-63c5-4d00-bba7-a1593a4ca40b', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'STX', 'STX诗婷', null, '313', '', 'STX诗婷', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f6d55b1a-10c4-4ee9-a160-ed982411e663', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'CSX', '尘色CSX', null, '127', '', ' 尘色X', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f7b26c3e-4128-40ab-b080-144cfd28b6fb', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XKB', 'XKB西可可', null, '80', '', '西可可', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('f8ce041e-8da3-4cba-9ca3-762922062a63', '48458681-48b0-490a-a840-0ffcbe49f5d4', 'D', '外套', null, '16', '', '外套-D', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('fbf9703e-23d9-4b3d-b8d1-b747c1d44a89', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'RST', 'RST双面尼三', null, '175', '', 'RST双面尼三', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('fdd9a2c3-5256-4eb7-abc6-d11789517550', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'RLX', 'RLX芮丽', null, '280', '', 'RLX芮丽', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('fe355bd2-9ac5-4127-8b75-7830d30353af', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'YXS', 'YXS伊袖', null, '300', '', 'YXS伊袖', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('fedc9430-77ea-4055-b923-ce90964f09c9', 'e86cf108-dc4d-4532-8cce-fdb041363902', 'E', 'L', null, '36', '', 'L', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ff1f8041-dfb8-43af-8540-76e1de25af53', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'XBX', 'XBX小背心', null, '229', '', 'XBX小背心', '2018-10-19 13:06:36', '2018-10-19 13:06:36');
INSERT INTO `sys_code` VALUES ('ff899c09-9242-4d0a-aad6-64594079227a', '7b664e3e-f58a-4e66-8c0f-be1458541d14', 'LCX', 'LCX莱茨大衣', null, '253', '', 'LCX莱茨大衣', '2018-10-19 13:06:36', '2018-10-19 13:06:36');

-- ----------------------------
-- Table structure for sys_codetype
-- ----------------------------
DROP TABLE IF EXISTS `sys_codetype`;
CREATE TABLE `sys_codetype` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标号Guid',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '字典类型父级',
  `Layer` int(11) NOT NULL DEFAULT '0' COMMENT '深度',
  `Name` varchar(50) NOT NULL COMMENT '字典类型名称',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '字典类型排序',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '归属公司或站点',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_codetype
-- ----------------------------
INSERT INTO `sys_codetype` VALUES ('1942d4fd-3203-42b1-a955-4a84a532b2a2', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '年份', '19', '2018-07-24 18:54:48', '2018-07-24 18:54:48', null);
INSERT INTO `sys_codetype` VALUES ('2e0393f9-e6d6-4c15-98cf-96072f0d3d70', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '批次', '15', '2018-06-18 06:38:03', '2018-06-18 06:38:03', null);
INSERT INTO `sys_codetype` VALUES ('48458681-48b0-490a-a840-0ffcbe49f5d4', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '款式', '14', '2018-06-18 06:37:55', '2018-06-18 06:37:55', null);
INSERT INTO `sys_codetype` VALUES ('7088d9b9-6692-4fc7-a83c-da580f1407c3', '9d7643f0-d739-4342-b2da-45781b62ddd0', '1', '采购商品单位', '18', '2018-06-30 19:28:13', '2018-06-30 19:28:13', null);
INSERT INTO `sys_codetype` VALUES ('7b664e3e-f58a-4e66-8c0f-be1458541d14', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '品牌', '5', '2018-06-18 06:21:54', '2018-06-18 06:21:54', null);
INSERT INTO `sys_codetype` VALUES ('8cb134d5-979b-40e2-b453-aeee265f4ab2', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '季节', '13', '2018-06-18 06:35:32', '2018-06-18 06:35:32', null);
INSERT INTO `sys_codetype` VALUES ('8d3158d6-e179-4046-99e9-53eb8c04ddb1', null, '0', '服装SKU', '4', '2018-06-18 06:21:45', '2018-06-18 06:21:46', null);
INSERT INTO `sys_codetype` VALUES ('9d7643f0-d739-4342-b2da-45781b62ddd0', null, '0', '采购字典', '17', '2018-06-30 19:28:02', '2018-06-30 19:28:02', null);
INSERT INTO `sys_codetype` VALUES ('e86cf108-dc4d-4532-8cce-fdb041363902', '8d3158d6-e179-4046-99e9-53eb8c04ddb1', '1', '尺码', '16', '2018-06-18 06:38:09', '2018-06-18 06:38:09', null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识——Guid',
  `LoginName` varchar(50) NOT NULL COMMENT '日志操作ID',
  `DepartName` varchar(50) DEFAULT NULL COMMENT '日志操作人所属部门Guid',
  `OptionTable` varchar(50) DEFAULT NULL COMMENT '操作表名',
  `Summary` varchar(255) NOT NULL COMMENT '日志操作内容',
  `IP` varchar(20) NOT NULL COMMENT '日志操作IP地址',
  `MacUrl` varchar(50) DEFAULT NULL COMMENT '日志操作Mac地址',
  `LogType` int(11) NOT NULL DEFAULT '0' COMMENT '日志操作类型',
  `Urls` varchar(255) NOT NULL COMMENT '日志操作Url',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '日志添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `Guid` varchar(50) NOT NULL COMMENT '唯一标识Guid',
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '所属站点或公司菜单',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '菜单父级Guid',
  `ParentName` varchar(50) NOT NULL COMMENT '父级菜单名称',
  `Name` varchar(50) NOT NULL COMMENT '菜单名称',
  `NameCode` varchar(50) NOT NULL COMMENT '菜单名称标识',
  `ParentGuidList` varchar(500) DEFAULT NULL COMMENT '所属父级的集合',
  `Layer` int(10) NOT NULL COMMENT '菜单深度',
  `Urls` varchar(255) DEFAULT NULL COMMENT '菜单Url',
  `Icon` varchar(50) DEFAULT NULL COMMENT '菜单图标Class',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '菜单状态 true=正常 false=不显示',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `AddTIme` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00aaf062-ee50-4844-9b51-80743a65cd4d', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', 'CMS内容管理', '功能组件', '2040', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,', '2', null, 'layui-icon-component', '62', '', '2018-10-22 23:02:09', '2018-10-22 23:02:09');
INSERT INTO `sys_menu` VALUES ('0a61ddff-ead5-49c0-8bed-2189872b8646', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', 'CMS内容管理', '栏目管理', '2020', ',a4b3b26f-076a-4267-b03d-613081b13a12,0a61ddff-ead5-49c0-8bed-2189872b8646,', '2', null, 'layui-icon-template', '56', '', '2018-09-29 22:03:38', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('0d65e849-f903-4cf3-b413-9e4e7bbda82e', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', 'CMS内容管理', '内容管理', '2030', ',a4b3b26f-076a-4267-b03d-613081b13a12,0d65e849-f903-4cf3-b413-9e4e7bbda82e,', '2', null, 'layui-icon-survey', '58', '', '2018-09-29 22:03:56', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('1d0bb157-868e-41e6-b048-f2c139111ab3', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '文本回复', '3023', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,1d0bb157-868e-41e6-b048-f2c139111ab3,', '3', null, null, '74', '', '2018-09-29 21:58:54', '2018-09-29 21:58:54');
INSERT INTO `sys_menu` VALUES ('1d58c9b0-22fa-4fe4-aba4-06a4ecd5b0a1', null, 'fe96606e-2b92-4587-8196-e5b4e85ed633', '我的工作台', '数据库文件', '2013', ',a4b3b26f-076a-4267-b03d-613081b13a12,fe96606e-2b92-4587-8196-e5b4e85ed633,1d58c9b0-22fa-4fe4-aba4-06a4ecd5b0a1,', '3', '/fytadmin/cms/datafile/', null, '55', '', '2018-10-30 15:14:27', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('1fc3d8e8-e3f2-49cf-a652-2341082643df', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '用户管理', '1012', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,1fc3d8e8-e3f2-49cf-a652-2341082643df,', '3', '/fytadmin/sys/admin/', null, '6', '', '2018-09-28 23:26:43', '2018-09-28 23:26:43');
INSERT INTO `sys_menu` VALUES ('2a3a4afe-2a51-4858-9c85-df26bb7a7611', null, 'f752cbdb-48b9-4958-bd05-0b8c3602e809', '微信公众号', '基本设置', '3010', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,2a3a4afe-2a51-4858-9c85-df26bb7a7611,', '2', null, 'layui-icon-set', '68', '', '2018-09-29 22:05:43', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('35834721-2287-416d-aed2-d0a43277e70e', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', '功能组件', '留言管理', '2043', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,35834721-2287-416d-aed2-d0a43277e70e,', '3', '/fytadmin/cms/message/', null, '65', '', '2018-10-30 15:16:42', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', null, 'f752cbdb-48b9-4958-bd05-0b8c3602e809', '微信公众号', '消息管理', '3020', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,', '2', null, 'layui-icon-speaker', '71', '', '2018-09-29 22:05:53', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('3d4f34cb-b69f-47e1-8abb-2f2b7ae20520', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '关注回复', '3021', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,3d4f34cb-b69f-47e1-8abb-2f2b7ae20520,', '3', null, null, '72', '', '2018-09-29 21:58:22', '2018-09-29 21:58:22');
INSERT INTO `sys_menu` VALUES ('3f8327fd-b8be-44d9-801c-39520e72da87', null, '0a61ddff-ead5-49c0-8bed-2189872b8646', '栏目管理', '栏目列表', '2021', ',a4b3b26f-076a-4267-b03d-613081b13a12,0a61ddff-ead5-49c0-8bed-2189872b8646,3f8327fd-b8be-44d9-801c-39520e72da87,', '3', '/fytadmin/cms/column/', null, '57', '', '2018-10-30 15:14:43', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('404d4b8b-8e3c-42ee-aee5-f29df31308fa', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '菜单管理', '1013', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,404d4b8b-8e3c-42ee-aee5-f29df31308fa,', '3', '/fytadmin/sys/menu/', null, '7', '', '2018-09-28 23:26:50', '2018-09-28 23:26:50');
INSERT INTO `sys_menu` VALUES ('4e104381-22f5-4a91-a784-00a7276afa61', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', '功能组件', '文件管理', '2045', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,4e104381-22f5-4a91-a784-00a7276afa61,', '3', '/fytadmin/cms/files/', null, '67', '\0', '2018-11-08 14:28:33', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('51216bb3-d0c7-474a-b565-71cf96db19f4', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '版本更新', '1016', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,51216bb3-d0c7-474a-b565-71cf96db19f4,', '3', '/fytadmin/app/setting/', null, '10', '', '2018-09-28 23:27:39', '2018-09-28 23:27:39');
INSERT INTO `sys_menu` VALUES ('51c9c0aa-de65-47d0-87bc-cef0624cb8f9', null, 'fe96606e-2b92-4587-8196-e5b4e85ed633', '我的工作台', '数据库备份', '2012', ',a4b3b26f-076a-4267-b03d-613081b13a12,fe96606e-2b92-4587-8196-e5b4e85ed633,51c9c0aa-de65-47d0-87bc-cef0624cb8f9,', '3', '/fytadmin/cms/database/', null, '54', '', '2018-10-30 15:14:10', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('582721b8-743a-45ce-9497-238982b3be9b', null, '0a61ddff-ead5-49c0-8bed-2189872b8646', '栏目管理', '模板管理', '2022', ',a4b3b26f-076a-4267-b03d-613081b13a12,0a61ddff-ead5-49c0-8bed-2189872b8646,582721b8-743a-45ce-9497-238982b3be9b,', '3', '/fytadmin/cms/template', null, '78', '', '2018-11-05 17:21:49', '2018-11-05 17:21:49');
INSERT INTO `sys_menu` VALUES ('5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '角色管理', '1011', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,5ce13ead-971b-4ed4-ad5f-acacccd82381,', '3', '/fytadmin/sys/role/', null, '5', '', '2018-09-28 23:26:07', '2018-09-28 23:26:07');
INSERT INTO `sys_menu` VALUES ('5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', 'CMS内容管理', '系统管理', '1001', ',a4b3b26f-076a-4267-b03d-613081b13a12,5ed17c74-0fff-4f88-8581-3b4f26d005a8,', '2', null, 'layui-icon-set', '2', '', '2018-10-22 23:06:12', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '部门管理', '1010', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,6d4cfcf7-ff1c-4537-aa3f-75cc9df27583,', '3', '/fytadmin/sys/organize/', null, '4', '', '2018-09-28 23:22:49', '2018-09-28 23:22:49');
INSERT INTO `sys_menu` VALUES ('787ae7bf-fb35-4ed4-9c6a-15aba81609c3', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '语音回复', '3025', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,787ae7bf-fb35-4ed4-9c6a-15aba81609c3,', '3', null, null, '76', '', '2018-09-29 21:59:25', '2018-09-29 21:59:25');
INSERT INTO `sys_menu` VALUES ('7e2356b0-f77f-41fe-b27b-15665b0ccba0', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', '功能组件', '下载管理', '2044', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,7e2356b0-f77f-41fe-b27b-15665b0ccba0,', '3', '/fytadmin/cms/download/', null, '66', '\0', '2018-11-08 14:28:38', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('8cdf2bc4-b5f8-4d6a-9282-5e5f6042d69f', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '默认回复', '3022', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,8cdf2bc4-b5f8-4d6a-9282-5e5f6042d69f,', '3', null, null, '73', '', '2018-09-29 21:58:38', '2018-09-29 21:58:38');
INSERT INTO `sys_menu` VALUES ('945de8ba-a13d-4ffc-aa62-c072ea2a3b05', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', '内容管理', '文章管理', '2031', ',a4b3b26f-076a-4267-b03d-613081b13a12,0d65e849-f903-4cf3-b413-9e4e7bbda82e,945de8ba-a13d-4ffc-aa62-c072ea2a3b05,', '3', '/fytadmin/cms/article/', null, '59', '', '2018-10-30 15:14:56', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('98285095-b35d-458d-9908-355d2e4fddbd', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', '功能组件', '广告管理', '2041', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,98285095-b35d-458d-9908-355d2e4fddbd,', '3', '/fytadmin/cms/adv/', null, '63', '', '2018-10-30 15:16:30', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('99aa1f66-6b0f-4c9d-ab70-22e92f4f6202', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', '内容管理', '内容管理', '2034', ',a4b3b26f-076a-4267-b03d-613081b13a12,0d65e849-f903-4cf3-b413-9e4e7bbda82e,99aa1f66-6b0f-4c9d-ab70-22e92f4f6202,', '3', '/fytadmin/cms/content', null, '79', '', '2018-11-06 16:51:19', '2018-11-06 16:51:19');
INSERT INTO `sys_menu` VALUES ('a05afbda-1234-4ca0-a160-6dd11ea3bf7d', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '消息记录', '3026', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,a05afbda-1234-4ca0-a160-6dd11ea3bf7d,', '3', null, null, '77', '', '2018-09-29 21:59:42', '2018-09-29 21:59:42');
INSERT INTO `sys_menu` VALUES ('a171bbb0-c65c-4e09-82f5-9ed51169b24d', null, '2a3a4afe-2a51-4858-9c85-df26bb7a7611', '基本设置', '公众平台管理', '3011', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,2a3a4afe-2a51-4858-9c85-df26bb7a7611,a171bbb0-c65c-4e09-82f5-9ed51169b24d,', '3', null, null, '69', '', '2018-09-29 21:56:59', '2018-09-29 21:56:59');
INSERT INTO `sys_menu` VALUES ('a280f6e2-3100-445f-871d-77ea443356a9', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '字段管理', '1015', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,a280f6e2-3100-445f-871d-77ea443356a9,', '3', '/fytadmin/sys/codes/', null, '9', '', '2018-09-28 23:27:32', '2018-09-28 23:27:32');
INSERT INTO `sys_menu` VALUES ('a4b3b26f-076a-4267-b03d-613081b13a12', null, null, '根目录', 'CMS内容管理', '0002', ',a4b3b26f-076a-4267-b03d-613081b13a12,', '1', null, 'layui-icon-website', '50', '', '2018-09-29 16:18:57', '2018-09-29 16:18:57');
INSERT INTO `sys_menu` VALUES ('a82ecfbf-b428-4022-b9a3-81ad277fc05c', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', '功能组件', '投票管理', '2042', ',a4b3b26f-076a-4267-b03d-613081b13a12,00aaf062-ee50-4844-9b51-80743a65cd4d,a82ecfbf-b428-4022-b9a3-81ad277fc05c,', '3', '/fytadmin/cms/vote/', null, '64', '\0', '2018-11-08 14:28:44', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('a90d2eaf-918f-4c43-8ce2-3f4f9b05c74a', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', '内容管理', '点击排行', '2033', ',a4b3b26f-076a-4267-b03d-613081b13a12,0d65e849-f903-4cf3-b413-9e4e7bbda82e,a90d2eaf-918f-4c43-8ce2-3f4f9b05c74a,', '3', '/fytadmin/cms/articletop/', null, '61', '', '2018-10-30 15:15:31', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('b354ea64-88b6-4032-a26a-fee198e24d9d', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', '系统管理', '系统日志', '1014', ',5ed17c74-0fff-4f88-8581-3b4f26d005a8,b354ea64-88b6-4032-a26a-fee198e24d9d,', '3', '/fytadmin/sys/log/', null, '8', '', '2018-09-28 23:27:06', '2018-09-28 23:27:06');
INSERT INTO `sys_menu` VALUES ('b8ede145-b5c2-4339-a3cc-f9808aa0c776', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', '消息管理', '图文回复', '3024', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,3d0acfb2-fa3c-4fe6-bd5c-e587c4523978,b8ede145-b5c2-4339-a3cc-f9808aa0c776,', '3', null, null, '75', '', '2018-09-29 21:59:10', '2018-09-29 21:59:10');
INSERT INTO `sys_menu` VALUES ('be526a42-9a48-4221-bc9b-3e1d5ddddf2f', null, 'fe96606e-2b92-4587-8196-e5b4e85ed633', '我的工作台', '站点管理', '2011', ',a4b3b26f-076a-4267-b03d-613081b13a12,fe96606e-2b92-4587-8196-e5b4e85ed633,be526a42-9a48-4221-bc9b-3e1d5ddddf2f,', '3', '/fytadmin/cms/site/', null, '53', '', '2018-10-30 15:14:16', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('c1f840e9-e822-4d0f-aca2-28365c52a7c4', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', '内容管理', '回收站管理', '2032', ',a4b3b26f-076a-4267-b03d-613081b13a12,0d65e849-f903-4cf3-b413-9e4e7bbda82e,c1f840e9-e822-4d0f-aca2-28365c52a7c4,', '3', '/fytadmin/cms/recycle/', null, '60', '', '2018-10-30 15:15:16', '0001-01-01 00:00:00');
INSERT INTO `sys_menu` VALUES ('dad12bae-d3f3-4c0e-a728-2e6af5f40e66', null, '2a3a4afe-2a51-4858-9c85-df26bb7a7611', '基本设置', '自定义菜单', '3012', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,2a3a4afe-2a51-4858-9c85-df26bb7a7611,dad12bae-d3f3-4c0e-a728-2e6af5f40e66,', '3', null, null, '70', '', '2018-09-29 21:57:15', '2018-09-29 21:57:15');
INSERT INTO `sys_menu` VALUES ('f752cbdb-48b9-4958-bd05-0b8c3602e809', null, null, '根目录', '微信公众号', '0003', ',f752cbdb-48b9-4958-bd05-0b8c3602e809,', '1', null, 'layui-icon-login-wechat', '51', '', '2018-09-29 16:19:10', '2018-09-29 16:19:10');
INSERT INTO `sys_menu` VALUES ('fe96606e-2b92-4587-8196-e5b4e85ed633', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', 'CMS内容管理', '我的工作台', '2010', ',a4b3b26f-076a-4267-b03d-613081b13a12,fe96606e-2b92-4587-8196-e5b4e85ed633,', '2', null, 'layui-icon-website', '52', '', '2018-09-29 21:43:43', '2018-09-29 21:43:43');

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动标识',
  `ClassID` int(11) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `Types` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `Title` varchar(200) DEFAULT NULL COMMENT '标题',
  `Mobile` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `Email` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `QQ` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `Status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否查看',
  `Summary` varchar(2000) DEFAULT NULL COMMENT '描述',
  `Content` text COMMENT '内容',
  `UserId` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `UserName` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `ParentId` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `RepId` int(11) NOT NULL DEFAULT '0' COMMENT '回复ID',
  `AddDate` datetime DEFAULT NULL COMMENT '添加时间',
  `RepDate` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organize
-- ----------------------------
DROP TABLE IF EXISTS `sys_organize`;
CREATE TABLE `sys_organize` (
  `Guid` varchar(50) NOT NULL,
  `SiteGuid` varchar(50) DEFAULT NULL COMMENT '归属站点',
  `ParentGuid` varchar(50) DEFAULT NULL COMMENT '父节点',
  `Name` varchar(20) NOT NULL COMMENT '组织名称',
  `ParentName` varchar(20) DEFAULT NULL,
  `ParentGuidList` varchar(500) DEFAULT NULL COMMENT '父节点集合',
  `Layer` int(11) NOT NULL DEFAULT '1' COMMENT '层级',
  `Sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `Status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organize
-- ----------------------------
INSERT INTO `sys_organize` VALUES ('24febdc4-655f-4492-ac8a-4adab18c22c8', null, '388b72d3-e10a-4183-8ef7-6be44eb99b1a', '融媒体中心', '包头分公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,24febdc4-655f-4492-ac8a-4adab18c22c8,', '2', '7', '', '2018-05-16 22:09:35');
INSERT INTO `sys_organize` VALUES ('388b72d3-e10a-4183-8ef7-6be44eb99b1a', null, '883deb1c-ddd7-484e-92c1-b3ad3b32e655', '包头分公司', '飞易腾集团', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,', '1', '3', '', '2018-05-16 22:06:20');
INSERT INTO `sys_organize` VALUES ('4b6ab27f-c0fa-483d-9b5a-55891ee8d727', null, '388b72d3-e10a-4183-8ef7-6be44eb99b1a', '事业发展部', '包头分公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,4b6ab27f-c0fa-483d-9b5a-55891ee8d727,', '2', '6', '', '2018-05-16 22:09:30');
INSERT INTO `sys_organize` VALUES ('52523a76-52b3-4c25-a1bd-9123a011f2a8', null, '24febdc4-655f-4492-ac8a-4adab18c22c8', '商务中心', '融媒体中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,388b72d3-e10a-4183-8ef7-6be44eb99b1a,24febdc4-655f-4492-ac8a-4adab18c22c8,52523a76-52b3-4c25-a1bd-9123a011f2a8,', '3', '4', '', '2018-07-20 23:03:59');
INSERT INTO `sys_organize` VALUES ('5533b6c5-ba2e-4659-be29-c860bb41e04d', null, '883deb1c-ddd7-484e-92c1-b3ad3b32e655', '北京总公司', '飞易腾集团', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,', '1', '2', '', '2018-05-16 22:06:02');
INSERT INTO `sys_organize` VALUES ('883deb1c-ddd7-484e-92c1-b3ad3b32e655', null, null, '集团名称', '根目录', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,', '0', '1', '', '2018-11-30 15:05:44');
INSERT INTO `sys_organize` VALUES ('dcf99638-5db6-4dd7-a485-31df1160d45a', null, '5533b6c5-ba2e-4659-be29-c860bb41e04d', '互联网中心', '北京总公司', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,dcf99638-5db6-4dd7-a485-31df1160d45a,', '2', '5', '', '2018-05-16 22:09:36');

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions` (
  `RoleGuid` varchar(50) NOT NULL COMMENT '角色Guid',
  `AdminGuid` varchar(50) DEFAULT NULL COMMENT '管理员ID',
  `MenuGuid` varchar(50) DEFAULT NULL COMMENT '菜单Guid',
  `BtnFunGuid` varchar(50) DEFAULT NULL,
  `Types` tinyint(1) NOT NULL DEFAULT '1' COMMENT '授权类型1=角色-菜单 2=用户-角色 3=角色-菜单-按钮功能'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '931bd729-f160-4fe3-bb7c-7828a2da047a', '3');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, '1');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '1');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '1');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', '6b8d6513-5da7-4f68-a2c4-f0c7cfaf7f61', '3');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'c4261103-dfc7-46e5-ab20-4ca5fc7729f6', '3');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', '30d3da88-bb72-4ace-a303-b3aae0ecb732', null, null, '2');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '30d3da88-bb72-4ace-a303-b3aae0ecb732', null, null, '2');
INSERT INTO `sys_permissions` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', 'b943200f-7c99-44b5-93d9-e4ea2505928a', '3');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', '12cc96cf-7ccf-430b-a54a-e1c6f04690cb', null, null, '2');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'de263753-0706-4985-bf96-317059e483ff', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '1fc3d8e8-e3f2-49cf-a652-2341082643df', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '404d4b8b-8e3c-42ee-aee5-f29df31308fa', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'b354ea64-88b6-4032-a26a-fee198e24d9d', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a280f6e2-3100-445f-871d-77ea443356a9', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '51216bb3-d0c7-474a-b565-71cf96db19f4', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '40823e8a-bc10-4e38-a45f-a6dd7dd0ef78', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'f9129ddd-3d96-4980-ac48-f6aa9a8b6ba9', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'd46fb5d3-27fc-411f-8bc8-df175cc248e4', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'cc59a616-2ca6-4ca8-9907-80ace8d38b47', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '8f6d2ac6-0c9b-4c9c-a1cd-80ca6365781e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'd1f782d2-55c3-4ca6-8002-894a1da52515', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'eafbc38f-fccd-4a5a-9df2-44ff41fde6d9', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5be5bed2-8b11-470f-a233-69a208737f47', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '88989fbb-57e0-4813-a125-f54ca941299c', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '01d476db-17c1-42b9-9725-c995a942006f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '18e89f9b-dc89-4289-a8fd-ee1330e43f79', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'd9a75927-0700-42b9-9ded-55774ee5c20b', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '9d1dcb18-6db8-4d79-bc7e-f2c830f4262d', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '7bfb29b1-b0af-440f-afe9-82883e2e114e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'b217116f-27c3-4d1e-9eda-538ca34bee45', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '401273ed-1639-4646-8b2d-8171beba1c60', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '79315453-3610-435e-80ed-abd7d8c4f770', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '86fc504c-3ce8-40ec-804a-c0c8fb6b520f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '7f0f61dd-ff53-460e-878c-bb3af87740eb', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'db4e4295-fce4-42a6-96f2-387bddcc5449', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'de39aa52-87a6-4539-884d-1ae3a9d6f99c', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5cbca08b-77a6-4294-aa15-4d82d0baa5f8', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '8360ffe4-b8f4-4697-9930-9fbc058d7f92', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '6dc1436e-6ed9-43be-96c5-2e165d43459b', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'cb7e34dc-54cd-41a1-bbd2-666ab2bdf742', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '155b3ab6-1043-4a78-9b59-bb3d1433a17a', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'cb2e4ab6-48de-4a1b-80e9-f3f77eaf1a6f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '663d5881-70ec-49a5-ae94-34f53d23608e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'd651f1e3-653c-4033-9c80-7de6dc9be422', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '6cc8a71a-ef58-48cc-aafb-aafa5a311d7e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '078cff27-e491-48a0-8f64-8abc06e20bd3', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '3476c160-da68-4bed-9e0b-e38c7af7d099', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '3543facc-f81a-4e66-9f62-1a7ffa7bd8e0', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '5ef5e2eb-5902-446b-82e4-11a6d36140fe', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'e63fd97a-2a8c-40d4-a1e1-6f574c85864c', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'c8728c2f-0637-4b8c-808f-289e31aaf495', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'c26b94c0-cae6-4332-8814-f5c8fbfaa58c', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'f879f695-5d6c-4b62-9bfe-79ba8714079f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'fe96606e-2b92-4587-8196-e5b4e85ed633', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'be526a42-9a48-4221-bc9b-3e1d5ddddf2f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '51c9c0aa-de65-47d0-87bc-cef0624cb8f9', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '1d58c9b0-22fa-4fe4-aba4-06a4ecd5b0a1', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '0a61ddff-ead5-49c0-8bed-2189872b8646', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '3f8327fd-b8be-44d9-801c-39520e72da87', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '945de8ba-a13d-4ffc-aa62-c072ea2a3b05', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'c1f840e9-e822-4d0f-aca2-28365c52a7c4', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a90d2eaf-918f-4c43-8ce2-3f4f9b05c74a', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '98285095-b35d-458d-9908-355d2e4fddbd', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a82ecfbf-b428-4022-b9a3-81ad277fc05c', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '35834721-2287-416d-aed2-d0a43277e70e', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '7e2356b0-f77f-41fe-b27b-15665b0ccba0', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '4e104381-22f5-4a91-a784-00a7276afa61', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'f752cbdb-48b9-4958-bd05-0b8c3602e809', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '2a3a4afe-2a51-4858-9c85-df26bb7a7611', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a171bbb0-c65c-4e09-82f5-9ed51169b24d', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'dad12bae-d3f3-4c0e-a728-2e6af5f40e66', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '3d4f34cb-b69f-47e1-8abb-2f2b7ae20520', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '8cdf2bc4-b5f8-4d6a-9282-5e5f6042d69f', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '1d0bb157-868e-41e6-b048-f2c139111ab3', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'b8ede145-b5c2-4339-a3cc-f9808aa0c776', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, '787ae7bf-fb35-4ed4-9c6a-15aba81609c3', null, '1');
INSERT INTO `sys_permissions` VALUES ('2949c266-575a-4e5d-a663-e39d5f33df7e', null, 'a05afbda-1234-4ca0-a160-6dd11ea3bf7d', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a4b3b26f-076a-4267-b03d-613081b13a12', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ed17c74-0fff-4f88-8581-3b4f26d005a8', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '6d4cfcf7-ff1c-4537-aa3f-75cc9df27583', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '5ce13ead-971b-4ed4-ad5f-acacccd82381', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '1fc3d8e8-e3f2-49cf-a652-2341082643df', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '404d4b8b-8e3c-42ee-aee5-f29df31308fa', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'b354ea64-88b6-4032-a26a-fee198e24d9d', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a280f6e2-3100-445f-871d-77ea443356a9', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '51216bb3-d0c7-474a-b565-71cf96db19f4', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'fe96606e-2b92-4587-8196-e5b4e85ed633', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'be526a42-9a48-4221-bc9b-3e1d5ddddf2f', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '51c9c0aa-de65-47d0-87bc-cef0624cb8f9', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '1d58c9b0-22fa-4fe4-aba4-06a4ecd5b0a1', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '0a61ddff-ead5-49c0-8bed-2189872b8646', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '3f8327fd-b8be-44d9-801c-39520e72da87', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '582721b8-743a-45ce-9497-238982b3be9b', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '0d65e849-f903-4cf3-b413-9e4e7bbda82e', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '945de8ba-a13d-4ffc-aa62-c072ea2a3b05', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'c1f840e9-e822-4d0f-aca2-28365c52a7c4', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a90d2eaf-918f-4c43-8ce2-3f4f9b05c74a', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '99aa1f66-6b0f-4c9d-ab70-22e92f4f6202', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '00aaf062-ee50-4844-9b51-80743a65cd4d', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '98285095-b35d-458d-9908-355d2e4fddbd', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a82ecfbf-b428-4022-b9a3-81ad277fc05c', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '35834721-2287-416d-aed2-d0a43277e70e', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '7e2356b0-f77f-41fe-b27b-15665b0ccba0', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '4e104381-22f5-4a91-a784-00a7276afa61', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'f752cbdb-48b9-4958-bd05-0b8c3602e809', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '2a3a4afe-2a51-4858-9c85-df26bb7a7611', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a171bbb0-c65c-4e09-82f5-9ed51169b24d', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'dad12bae-d3f3-4c0e-a728-2e6af5f40e66', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '3d0acfb2-fa3c-4fe6-bd5c-e587c4523978', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '3d4f34cb-b69f-47e1-8abb-2f2b7ae20520', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '8cdf2bc4-b5f8-4d6a-9282-5e5f6042d69f', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '1d0bb157-868e-41e6-b048-f2c139111ab3', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'b8ede145-b5c2-4339-a3cc-f9808aa0c776', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, '787ae7bf-fb35-4ed4-9c6a-15aba81609c3', null, '1');
INSERT INTO `sys_permissions` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', null, 'a05afbda-1234-4ca0-a160-6dd11ea3bf7d', null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `Guid` varchar(50) NOT NULL,
  `DepartmentGuid` varchar(50) NOT NULL COMMENT '部门Guid',
  `DepartmentName` varchar(50) NOT NULL COMMENT '部门名称',
  `DepartmentGroup` varchar(500) NOT NULL COMMENT '归属于角色组',
  `Name` varchar(50) NOT NULL COMMENT '部门名称',
  `Codes` varchar(50) NOT NULL COMMENT '部门编号',
  `IsSystem` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否为超级管理员',
  `Summary` varchar(500) DEFAULT NULL COMMENT '部门描述',
  `AddTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `EditTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('9bf21fc0-6e39-4e16-a55f-6717977a697a', '52523a76-52b3-4c25-a1bd-9123a011f2a8', '商务中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,52523a76-52b3-4c25-a1bd-9123a011f2a8,', '客服管理员', '1002', '', '只能查看会员相关功能', '2018-05-17 23:37:56', '2018-07-16 11:24:03');
INSERT INTO `sys_role` VALUES ('d1bbd2f4-ea8f-4c53-9f67-3b6acd9c29fb', 'dcf99638-5db6-4dd7-a485-31df1160d45a', '互联网中心', ',883deb1c-ddd7-484e-92c1-b3ad3b32e655,5533b6c5-ba2e-4659-be29-c860bb41e04d,dcf99638-5db6-4dd7-a485-31df1160d45a,', '财务管理员', '1003', '', '只能查看财务相关功能', '2018-05-17 23:39:01', '2018-05-17 23:39:01');
