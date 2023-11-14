/*
 Navicat Premium Data Transfer

 Source Server         : local-3308
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3308
 Source Schema         : veloujsf_pm

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 13/11/2023 21:14:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_access_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_access_groups`;
CREATE TABLE `app_access_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  `is_ldap_default` tinyint(1) NULL DEFAULT NULL,
  `ldap_filter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_access_groups
-- ----------------------------
INSERT INTO `app_access_groups` VALUES (4, 'Διοικητής ΑΑΔΕ', 0, 0, '', 1, '');
INSERT INTO `app_access_groups` VALUES (5, 'Διεύθυνση Στρατηγικού Σχεδιασμού (Δ.Σ.Σ.)', 0, 0, '', 2, '');
INSERT INTO `app_access_groups` VALUES (6, 'Χρήστης ΑΑΔΕ', 1, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (12, 'Διεύθυνση Νομικής Υποστήριξης (Δ.Ν.Υ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (13, 'Διεύθυνση Εσωτερικών Υποθέσεων (Δ.ΕΣ.ΥΠ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (14, 'Διεύθυνση Εσωτερικού Ελέγχου (Δ.ΕΣ.ΕΛ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (15, 'Διεύθυνση Επίλυσης Διαφορών (Δ.Ε.Δ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (16, 'Διεύθυνση Επικοινωνίας (Δ.ΕΠΙΚ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (17, 'Διεύθυνση Εξυπηρέτησης (Δ.ΕΞΥ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (18, 'Διεύθυνση Δασμολογικών Θεμάτων, Ειδικών Καθεστώτων και Απαλλαγών', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (19, 'Γενική Διεύθυνση Φορολογικών Λειτουργιών (Γ.Δ.Φ.Λ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (20, 'Γενική Διεύθυνση Φορολογίας (Γ.Δ.Φ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (21, 'Γενική Διεύθυνση Τελωνείων και & Ε.Φ.Κ. (Γ.Δ.Τ & Ε.Φ.Κ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (22, 'Γενική Διεύθυνση Οικονομικών Υπηρεσιών (Γ.Δ.Ο.Υ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (23, 'Γενική Διεύθυνση Ηλεκτρονικής Διακυβέρνησης (Γ.Δ.ΗΛΕ.Δ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (24, 'Γενική Διεύθυνση Γενικού Χημείου του Κράτους (Γ.Δ.Γ.Χ.Κ.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (25, 'Γενική Διεύθυνση Ανθρωπίνου Δυναμικού και Οργάνωσης (Γ.Δ.Α.Δ.Ο.)', 0, 0, '', 0, '');
INSERT INTO `app_access_groups` VALUES (26, 'Αυτοτελές Τμήμα Υποστήριξης Υπευθύνου Προστασίας Δεδομένων', 0, 0, '', 0, '');

-- ----------------------------
-- Table structure for app_access_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_access_rules`;
CREATE TABLE `app_access_rules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `access_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_view_only_access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comments_access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_access_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_access_rules_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_access_rules_fields`;
CREATE TABLE `app_access_rules_fields`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_access_rules_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_approved_items
-- ----------------------------
DROP TABLE IF EXISTS `app_approved_items`;
CREATE TABLE `app_approved_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `users_id` int NOT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_approved_items
-- ----------------------------

-- ----------------------------
-- Table structure for app_attachments
-- ----------------------------
DROP TABLE IF EXISTS `app_attachments`;
CREATE TABLE `app_attachments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` date NOT NULL,
  `container` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for app_backups
-- ----------------------------
DROP TABLE IF EXISTS `app_backups`;
CREATE TABLE `app_backups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `is_auto` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filename` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_backups
-- ----------------------------
INSERT INTO `app_backups` VALUES (7, 1, 0, 'Minor', '7_2023-10-27_12-07_Rukovoditel_3.4.4.sql.zip', 1698422876);

-- ----------------------------
-- Table structure for app_comments
-- ----------------------------
DROP TABLE IF EXISTS `app_comments`;
CREATE TABLE `app_comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `created_by` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comments
-- ----------------------------
INSERT INTO `app_comments` VALUES (6, 22, 5, 1, 'ΔΣΦΣΔΦΣΦΣΔ', '', 1699269246);

-- ----------------------------
-- Table structure for app_comments_access
-- ----------------------------
DROP TABLE IF EXISTS `app_comments_access`;
CREATE TABLE `app_comments_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `access_groups_id` int NOT NULL,
  `access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comments_access
-- ----------------------------
INSERT INTO `app_comments_access` VALUES (4, 21, 6, 'view,create');
INSERT INTO `app_comments_access` VALUES (5, 21, 5, 'view,create');
INSERT INTO `app_comments_access` VALUES (6, 21, 4, 'view,create,update,delete');
INSERT INTO `app_comments_access` VALUES (7, 22, 5, 'view,create');
INSERT INTO `app_comments_access` VALUES (8, 22, 4, 'view,create,update,delete');
INSERT INTO `app_comments_access` VALUES (9, 23, 6, 'view,create');
INSERT INTO `app_comments_access` VALUES (10, 23, 4, 'view,create,update,delete');
INSERT INTO `app_comments_access` VALUES (11, 24, 5, 'view,create');
INSERT INTO `app_comments_access` VALUES (12, 24, 4, 'view,create,update,delete');

-- ----------------------------
-- Table structure for app_comments_forms_tabs
-- ----------------------------
DROP TABLE IF EXISTS `app_comments_forms_tabs`;
CREATE TABLE `app_comments_forms_tabs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comments_forms_tabs
-- ----------------------------
INSERT INTO `app_comments_forms_tabs` VALUES (1, 25, 'Σχόλια', 2);

-- ----------------------------
-- Table structure for app_comments_history
-- ----------------------------
DROP TABLE IF EXISTS `app_comments_history`;
CREATE TABLE `app_comments_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `comments_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `fields_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comments_id`(`comments_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_comments_history
-- ----------------------------
INSERT INTO `app_comments_history` VALUES (10, 6, 169, '46');
INSERT INTO `app_comments_history` VALUES (11, 6, 170, '53');
INSERT INTO `app_comments_history` VALUES (12, 6, 174, '1');

-- ----------------------------
-- Table structure for app_configuration
-- ----------------------------
DROP TABLE IF EXISTS `app_configuration`;
CREATE TABLE `app_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `configuration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `configuration_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_configuration
-- ----------------------------
INSERT INTO `app_configuration` VALUES (9, 'CFG_APP_NAME', 'Υπουργείο Εξωτερικών - Εφαρμογής Τυποποίησης διαδικασιών');
INSERT INTO `app_configuration` VALUES (10, 'CFG_APP_SHORT_NAME', 'ΥΠΕΞ');
INSERT INTO `app_configuration` VALUES (11, 'CFG_APP_LOGO', 'app_logo_1699089338.png');
INSERT INTO `app_configuration` VALUES (12, 'CFG_EMAIL_USE_NOTIFICATION', '1');
INSERT INTO `app_configuration` VALUES (13, 'CFG_EMAIL_SUBJECT_LABEL', '');
INSERT INTO `app_configuration` VALUES (14, 'CFG_EMAIL_AMOUNT_PREVIOUS_COMMENTS', '2');
INSERT INTO `app_configuration` VALUES (15, 'CFG_EMAIL_COPY_SENDER', '0');
INSERT INTO `app_configuration` VALUES (16, 'CFG_EMAIL_SEND_FROM_SINGLE', '0');
INSERT INTO `app_configuration` VALUES (17, 'CFG_EMAIL_ADDRESS_FROM', 'noreply@noreply.com');
INSERT INTO `app_configuration` VALUES (18, 'CFG_EMAIL_NAME_FROM', 'noreply');
INSERT INTO `app_configuration` VALUES (19, 'CFG_EMAIL_USE_SMTP', '0');
INSERT INTO `app_configuration` VALUES (20, 'CFG_EMAIL_SMTP_SERVER', '');
INSERT INTO `app_configuration` VALUES (21, 'CFG_EMAIL_SMTP_PORT', '');
INSERT INTO `app_configuration` VALUES (22, 'CFG_EMAIL_SMTP_ENCRYPTION', '');
INSERT INTO `app_configuration` VALUES (23, 'CFG_EMAIL_SMTP_LOGIN', '');
INSERT INTO `app_configuration` VALUES (24, 'CFG_EMAIL_SMTP_PASSWORD', '');
INSERT INTO `app_configuration` VALUES (25, 'CFG_LDAP_USE', '0');
INSERT INTO `app_configuration` VALUES (26, 'CFG_LDAP_SERVER_NAME', '');
INSERT INTO `app_configuration` VALUES (27, 'CFG_LDAP_SERVER_PORT', '');
INSERT INTO `app_configuration` VALUES (28, 'CFG_LDAP_BASE_DN', '');
INSERT INTO `app_configuration` VALUES (29, 'CFG_LDAP_UID', '');
INSERT INTO `app_configuration` VALUES (30, 'CFG_LDAP_USER', '');
INSERT INTO `app_configuration` VALUES (31, 'CFG_LDAP_EMAIL_ATTRIBUTE', '');
INSERT INTO `app_configuration` VALUES (32, 'CFG_LDAP_USER_DN', '');
INSERT INTO `app_configuration` VALUES (33, 'CFG_LDAP_PASSWORD', '');
INSERT INTO `app_configuration` VALUES (34, 'CFG_LOGIN_PAGE_HEADING', '');
INSERT INTO `app_configuration` VALUES (35, 'CFG_LOGIN_PAGE_CONTENT', '');
INSERT INTO `app_configuration` VALUES (36, 'CFG_APP_TIMEZONE', 'Europe/Athens');
INSERT INTO `app_configuration` VALUES (37, 'CFG_APP_DATE_FORMAT', 'd/m/Y');
INSERT INTO `app_configuration` VALUES (38, 'CFG_APP_DATETIME_FORMAT', 'D/m/Y H:i');
INSERT INTO `app_configuration` VALUES (39, 'CFG_APP_ROWS_PER_PAGE', '10');
INSERT INTO `app_configuration` VALUES (40, 'CFG_REGISTRATION_EMAIL_SUBJECT', '');
INSERT INTO `app_configuration` VALUES (41, 'CFG_REGISTRATION_EMAIL_BODY', '');
INSERT INTO `app_configuration` VALUES (42, 'CFG_PASSWORD_MIN_LENGTH', '5');
INSERT INTO `app_configuration` VALUES (43, 'CFG_APP_LANGUAGE', 'english.php');
INSERT INTO `app_configuration` VALUES (44, 'CFG_APP_SKIN', '');
INSERT INTO `app_configuration` VALUES (45, 'CFG_PUBLIC_USER_PROFILE_FIELDS', '');
INSERT INTO `app_configuration` VALUES (46, 'CFG_PLUGIN_EXT_INSTALLED', '1');
INSERT INTO `app_configuration` VALUES (47, 'CFG_PLUGIN_EXT_LICENSE_KEY', '146721427960261545813231141481454112969137551519615851129691414814541153271310060261296914541');
INSERT INTO `app_configuration` VALUES (48, 'CFG_APP_SHORT_NAME_MOBILE', '');
INSERT INTO `app_configuration` VALUES (49, 'CFG_APP_LOGO_URL', '');
INSERT INTO `app_configuration` VALUES (50, 'CFG_APP_FAVICON', '');
INSERT INTO `app_configuration` VALUES (51, 'CFG_APP_COPYRIGHT_NAME', 'VELOCITY');
INSERT INTO `app_configuration` VALUES (52, 'CFG_APP_NUMBER_FORMAT', '2/./*');
INSERT INTO `app_configuration` VALUES (53, 'CFG_APP_FIRST_DAY_OF_WEEK', '1');
INSERT INTO `app_configuration` VALUES (54, 'CFG_DROP_DOWN_MENU_ON_HOVER', '0');
INSERT INTO `app_configuration` VALUES (55, 'CFG_DISABLE_CHECK_FOR_UPDATES', '0');
INSERT INTO `app_configuration` VALUES (56, 'CFG_HIDE_POWERED_BY_TEXT', '1');
INSERT INTO `app_configuration` VALUES (57, 'CFG_USE_GLOBAL_SEARCH', '1');
INSERT INTO `app_configuration` VALUES (58, 'CFG_GLOBAL_SEARCH_DISPLAY_IN_HEADER', '0');
INSERT INTO `app_configuration` VALUES (59, 'CFG_GLOBAL_SEARCH_DISPLAY_IN_MENU', '1');
INSERT INTO `app_configuration` VALUES (60, 'CFG_GLOBAL_SEARCH_ALLOWED_GROUPS', '0,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,6,4');
INSERT INTO `app_configuration` VALUES (61, 'CFG_GLOBAL_SEARCH_ROWS_PER_PAGE', '10');
INSERT INTO `app_configuration` VALUES (62, 'CFG_GLOBAL_SEARCH_INPUT_TOOLTIP', 'Search');
INSERT INTO `app_configuration` VALUES (63, 'CFG_GLOBAL_SEARCH_INPUT_MIN', '3');
INSERT INTO `app_configuration` VALUES (64, 'CFG_GLOBAL_SEARCH_INPUT_MAX', '40');
INSERT INTO `app_configuration` VALUES (65, 'CFG_USE_API', '0');
INSERT INTO `app_configuration` VALUES (66, 'CFG_API_KEY', 'sZlojcxr2Fn8fc7FqRz9Q4TMIPtvVT63fbMAg6Eq');
INSERT INTO `app_configuration` VALUES (67, 'CFG_API_ALLOWED_IP', '');

-- ----------------------------
-- Table structure for app_custom_php
-- ----------------------------
DROP TABLE IF EXISTS `app_custom_php`;
CREATE TABLE `app_custom_php`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_folder` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_custom_php
-- ----------------------------

-- ----------------------------
-- Table structure for app_dashboard_pages
-- ----------------------------
DROP TABLE IF EXISTS `app_dashboard_pages`;
CREATE TABLE `app_dashboard_pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `sections_id` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_sections_id`(`sections_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_dashboard_pages
-- ----------------------------
INSERT INTO `app_dashboard_pages` VALUES (1, 1, 0, 'info_block', 1, '', '', 'τεστ', 'default', '', '', 0);
INSERT INTO `app_dashboard_pages` VALUES (2, 1, 0, 'page', 1, 'τεστ', '', '&tau;&epsilon;&sigma;&tau;', 'default', '', '', 0);

-- ----------------------------
-- Table structure for app_dashboard_pages_sections
-- ----------------------------
DROP TABLE IF EXISTS `app_dashboard_pages_sections`;
CREATE TABLE `app_dashboard_pages_sections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grid` tinyint(1) NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_dashboard_pages_sections
-- ----------------------------

-- ----------------------------
-- Table structure for app_emails_on_schedule
-- ----------------------------
DROP TABLE IF EXISTS `app_emails_on_schedule`;
CREATE TABLE `app_emails_on_schedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_added` bigint UNSIGNED NOT NULL,
  `email_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_to_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_emails_on_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for app_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_entities`;
CREATE TABLE `app_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `group_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_in_menu` tinyint(1) NULL DEFAULT 0,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entities
-- ----------------------------
INSERT INTO `app_entities` VALUES (1, 0, 0, 'Users', '', 0, 4);
INSERT INTO `app_entities` VALUES (21, 0, 0, 'Projects', '', 0, 0);
INSERT INTO `app_entities` VALUES (22, 21, 0, 'Tasks', '', 0, 1);
INSERT INTO `app_entities` VALUES (23, 21, 0, 'Tickets', '', 0, 2);
INSERT INTO `app_entities` VALUES (24, 21, 0, 'Discussions', '', 0, 3);
INSERT INTO `app_entities` VALUES (33, 0, 0, 'Γραφεία ΟΕΥ', '', 0, 4);
INSERT INTO `app_entities` VALUES (34, 0, 0, 'Αρχεία ΣΔΠ', '', 0, 5);
INSERT INTO `app_entities` VALUES (35, 21, 0, 'Ανάρτηση Αρχείων ΣΔΠ', '', 0, 4);
INSERT INTO `app_entities` VALUES (36, 0, 0, 'Βιβλιοθήκη Διαδικασίων', '', 0, 2);
INSERT INTO `app_entities` VALUES (37, 0, 0, 'Μητρώο Επαφών', '', 0, 4);

-- ----------------------------
-- Table structure for app_entities_access
-- ----------------------------
DROP TABLE IF EXISTS `app_entities_access`;
CREATE TABLE `app_entities_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `access_groups_id` int NOT NULL,
  `access_schema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entities_access
-- ----------------------------
INSERT INTO `app_entities_access` VALUES (28, 21, 6, 'view_assigned');
INSERT INTO `app_entities_access` VALUES (29, 21, 5, 'view_assigned,reports');
INSERT INTO `app_entities_access` VALUES (30, 21, 4, 'view,create,update,delete,reports');
INSERT INTO `app_entities_access` VALUES (31, 22, 6, '');
INSERT INTO `app_entities_access` VALUES (32, 22, 5, 'view,create,update,reports');
INSERT INTO `app_entities_access` VALUES (33, 22, 4, 'view,create,update,delete,reports');
INSERT INTO `app_entities_access` VALUES (34, 23, 6, 'view_assigned,create,update,reports');
INSERT INTO `app_entities_access` VALUES (35, 23, 5, '');
INSERT INTO `app_entities_access` VALUES (36, 23, 4, 'view,create,update,delete,reports');
INSERT INTO `app_entities_access` VALUES (37, 24, 6, '');
INSERT INTO `app_entities_access` VALUES (38, 24, 5, 'view_assigned,create,update,delete,reports');
INSERT INTO `app_entities_access` VALUES (39, 24, 4, 'view,create,update,delete,reports');

-- ----------------------------
-- Table structure for app_entities_configuration
-- ----------------------------
DROP TABLE IF EXISTS `app_entities_configuration`;
CREATE TABLE `app_entities_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `configuration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `configuration_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 527 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entities_configuration
-- ----------------------------
INSERT INTO `app_entities_configuration` VALUES (11, 1, 'menu_title', 'Χρήστες');
INSERT INTO `app_entities_configuration` VALUES (12, 1, 'listing_heading', 'Users');
INSERT INTO `app_entities_configuration` VALUES (13, 1, 'window_heading', 'User Info');
INSERT INTO `app_entities_configuration` VALUES (14, 1, 'insert_button', 'Add User');
INSERT INTO `app_entities_configuration` VALUES (15, 1, 'use_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (25, 21, 'menu_title', 'Διαδικασίες');
INSERT INTO `app_entities_configuration` VALUES (26, 21, 'listing_heading', 'Διαδικασίες');
INSERT INTO `app_entities_configuration` VALUES (27, 21, 'window_heading', 'Πληροφορίες Διαδικασίας');
INSERT INTO `app_entities_configuration` VALUES (28, 21, 'insert_button', 'Προσθήκη Διαδικασίας');
INSERT INTO `app_entities_configuration` VALUES (29, 21, 'email_subject_new_item', 'New Project:');
INSERT INTO `app_entities_configuration` VALUES (30, 21, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (31, 21, 'email_subject_new_comment', 'New project comment:');
INSERT INTO `app_entities_configuration` VALUES (32, 22, 'menu_title', 'Εργασίες');
INSERT INTO `app_entities_configuration` VALUES (33, 22, 'listing_heading', 'Εργασίες');
INSERT INTO `app_entities_configuration` VALUES (34, 22, 'window_heading', 'Πληροφορίες Εργασίας');
INSERT INTO `app_entities_configuration` VALUES (35, 22, 'insert_button', 'Προθήκη Εργασίας');
INSERT INTO `app_entities_configuration` VALUES (36, 22, 'email_subject_new_item', 'New Task');
INSERT INTO `app_entities_configuration` VALUES (37, 22, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (38, 22, 'email_subject_new_comment', 'New task comment:');
INSERT INTO `app_entities_configuration` VALUES (39, 23, 'menu_title', 'Θέματα');
INSERT INTO `app_entities_configuration` VALUES (40, 23, 'listing_heading', 'Θέματα');
INSERT INTO `app_entities_configuration` VALUES (41, 23, 'window_heading', 'Πληροφορίες Θέματος');
INSERT INTO `app_entities_configuration` VALUES (42, 23, 'insert_button', 'Νέο Θέμα');
INSERT INTO `app_entities_configuration` VALUES (43, 23, 'email_subject_new_item', 'New Ticket:');
INSERT INTO `app_entities_configuration` VALUES (44, 23, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (45, 23, 'email_subject_new_comment', 'New ticket comment');
INSERT INTO `app_entities_configuration` VALUES (46, 24, 'menu_title', 'Σχολιασμός-Συζήτηση');
INSERT INTO `app_entities_configuration` VALUES (47, 24, 'listing_heading', 'Σχολιασμός-Συζήτηση');
INSERT INTO `app_entities_configuration` VALUES (48, 24, 'window_heading', 'Πληροφορίες Συζήτησής ');
INSERT INTO `app_entities_configuration` VALUES (49, 24, 'insert_button', 'Νέα Συζήτηση');
INSERT INTO `app_entities_configuration` VALUES (50, 24, 'email_subject_new_item', 'New Discussion:');
INSERT INTO `app_entities_configuration` VALUES (51, 24, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (52, 24, 'email_subject_new_comment', 'New discussion comment:');
INSERT INTO `app_entities_configuration` VALUES (53, 21, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (54, 22, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (55, 23, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (56, 24, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (90, 21, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (91, 21, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (92, 21, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (93, 21, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (94, 21, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (95, 21, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (96, 21, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (97, 21, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (98, 21, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (99, 21, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (100, 21, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (101, 21, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (102, 21, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (103, 21, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (104, 21, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (105, 21, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (106, 21, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (107, 21, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (108, 21, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (109, 21, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (110, 21, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (111, 21, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (112, 21, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (113, 1, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (114, 1, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (115, 1, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (116, 1, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (117, 1, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (118, 1, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (119, 1, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (120, 1, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (121, 1, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (122, 1, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (123, 1, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (124, 1, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (125, 1, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (126, 1, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (127, 1, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (128, 1, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (129, 1, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (130, 1, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (131, 1, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (132, 1, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (133, 1, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (134, 1, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (135, 1, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (136, 1, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (137, 1, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (138, 1, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (303, 33, 'menu_title', 'Γραφεία ΟΕΥ');
INSERT INTO `app_entities_configuration` VALUES (304, 33, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (305, 33, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (306, 33, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (307, 33, 'window_heading', 'Γραφεία ΟΕΥ');
INSERT INTO `app_entities_configuration` VALUES (308, 33, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (309, 33, 'listing_heading', 'Γραφεία ΟΕΥ');
INSERT INTO `app_entities_configuration` VALUES (310, 33, 'insert_button', 'Νέο Γραφείο ΟΕΥ');
INSERT INTO `app_entities_configuration` VALUES (311, 33, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (312, 33, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (313, 33, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (314, 33, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (315, 33, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (316, 33, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (317, 33, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (318, 33, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (319, 33, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (320, 33, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (321, 33, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (322, 33, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (323, 33, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (324, 33, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (325, 33, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (326, 33, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (327, 33, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (328, 33, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (329, 33, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (330, 33, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (331, 33, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (332, 33, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (333, 33, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (334, 36, 'menu_title', 'Βιβλιοθήκη Διαδικασιών');
INSERT INTO `app_entities_configuration` VALUES (335, 36, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (336, 36, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (337, 36, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (338, 36, 'window_heading', 'Βιβλιοθήκη Διαδικασιών');
INSERT INTO `app_entities_configuration` VALUES (339, 36, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (340, 36, 'listing_heading', 'Βιβλιοθήκη Διαδικασιών');
INSERT INTO `app_entities_configuration` VALUES (341, 36, 'insert_button', 'Νέα Διαδικασία');
INSERT INTO `app_entities_configuration` VALUES (342, 36, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (343, 36, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (344, 36, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (345, 36, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (346, 36, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (347, 36, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (348, 36, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (349, 36, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (350, 36, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (351, 36, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (352, 36, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (353, 36, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (354, 36, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (355, 36, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (356, 36, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (357, 36, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (358, 36, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (359, 36, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (360, 36, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (361, 36, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (362, 36, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (363, 36, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (364, 36, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (365, 34, 'menu_title', '');
INSERT INTO `app_entities_configuration` VALUES (366, 34, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (367, 34, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (368, 34, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (369, 34, 'window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (370, 34, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (371, 34, 'listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (372, 34, 'insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (373, 34, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (374, 34, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (375, 34, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (376, 34, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (377, 34, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (378, 34, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (379, 34, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (380, 34, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (381, 34, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (382, 34, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (383, 34, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (384, 34, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (385, 34, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (386, 34, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (387, 34, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (388, 34, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (389, 34, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (390, 34, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (391, 34, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (392, 34, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (393, 34, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (394, 34, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (395, 34, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (396, 22, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (397, 22, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (398, 22, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (399, 22, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (400, 22, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (401, 22, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (402, 22, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (403, 22, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (404, 22, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (405, 22, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (406, 22, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (407, 22, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (408, 22, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (409, 22, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (410, 22, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (411, 22, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (412, 22, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (413, 22, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (414, 22, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (415, 22, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (416, 22, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (417, 22, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (418, 22, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (419, 23, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (420, 23, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (421, 23, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (422, 23, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (423, 23, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (424, 23, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (425, 23, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (426, 23, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (427, 23, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (428, 23, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (429, 23, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (430, 23, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (431, 23, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (432, 23, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (433, 23, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (434, 23, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (435, 23, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (436, 23, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (437, 23, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (438, 23, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (439, 23, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (440, 23, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (441, 23, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (442, 24, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (443, 24, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (444, 24, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (445, 24, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (446, 24, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (447, 24, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (448, 24, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (449, 24, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (450, 24, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (451, 24, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (452, 24, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (453, 24, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (454, 24, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (455, 24, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (456, 24, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (457, 24, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (458, 24, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (459, 24, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (460, 24, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (461, 24, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (462, 24, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (463, 24, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (464, 24, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (465, 35, 'menu_title', 'Ανάρτηση Αρχείων');
INSERT INTO `app_entities_configuration` VALUES (466, 35, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (467, 35, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (468, 35, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (469, 35, 'window_heading', 'Ανάρτηση Αρχείων');
INSERT INTO `app_entities_configuration` VALUES (470, 35, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (471, 35, 'listing_heading', 'Ανάρτηση Αρχείων');
INSERT INTO `app_entities_configuration` VALUES (472, 35, 'insert_button', 'Νέο Αρχείο');
INSERT INTO `app_entities_configuration` VALUES (473, 35, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (474, 35, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (475, 35, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (476, 35, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (477, 35, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (478, 35, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (479, 35, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (480, 35, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (481, 35, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (482, 35, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (483, 35, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (484, 35, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (485, 35, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (486, 35, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (487, 35, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (488, 35, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (489, 35, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (490, 35, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (491, 35, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (492, 35, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (493, 35, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (494, 35, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (495, 35, 'redirect_after_click_heading', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (496, 37, 'menu_title', 'Μητρώο Επαφών');
INSERT INTO `app_entities_configuration` VALUES (497, 37, 'menu_icon', '');
INSERT INTO `app_entities_configuration` VALUES (498, 37, 'menu_icon_color', '');
INSERT INTO `app_entities_configuration` VALUES (499, 37, 'menu_bg_color', '');
INSERT INTO `app_entities_configuration` VALUES (500, 37, 'window_heading', 'Μητρώο Επαφών');
INSERT INTO `app_entities_configuration` VALUES (501, 37, 'window_width', '');
INSERT INTO `app_entities_configuration` VALUES (502, 37, 'listing_heading', 'Μητρώο Επαφών');
INSERT INTO `app_entities_configuration` VALUES (503, 37, 'insert_button', 'Προσθήκη επαφής');
INSERT INTO `app_entities_configuration` VALUES (504, 37, 'reports_hide_insert_button', '0');
INSERT INTO `app_entities_configuration` VALUES (505, 37, 'listing_debug_mode', '0');
INSERT INTO `app_entities_configuration` VALUES (506, 37, 'email_subject_new_item', '');
INSERT INTO `app_entities_configuration` VALUES (507, 37, 'email_subject_updated_item', '');
INSERT INTO `app_entities_configuration` VALUES (508, 37, 'disable_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (509, 37, 'disable_internal_notification', '0');
INSERT INTO `app_entities_configuration` VALUES (510, 37, 'disable_highlight_unread', '0');
INSERT INTO `app_entities_configuration` VALUES (511, 37, 'use_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (512, 37, 'comments_listing_type', 'table');
INSERT INTO `app_entities_configuration` VALUES (513, 37, 'comments_listing_heading', '');
INSERT INTO `app_entities_configuration` VALUES (514, 37, 'comments_insert_button', '');
INSERT INTO `app_entities_configuration` VALUES (515, 37, 'comments_window_heading', '');
INSERT INTO `app_entities_configuration` VALUES (516, 37, 'display_comments_id', '1');
INSERT INTO `app_entities_configuration` VALUES (517, 37, 'display_last_comment_in_listing', '1');
INSERT INTO `app_entities_configuration` VALUES (518, 37, 'number_characters_in_comments_list', '');
INSERT INTO `app_entities_configuration` VALUES (519, 37, 'use_editor_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (520, 37, 'disable_attachments_in_comments', '1');
INSERT INTO `app_entities_configuration` VALUES (521, 37, 'disable_avatar_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (522, 37, 'image_preview_in_comments', '0');
INSERT INTO `app_entities_configuration` VALUES (523, 37, 'email_subject_new_comment', '');
INSERT INTO `app_entities_configuration` VALUES (524, 37, 'send_notification_to_assigned', '0');
INSERT INTO `app_entities_configuration` VALUES (525, 37, 'redirect_after_adding', 'subentity');
INSERT INTO `app_entities_configuration` VALUES (526, 37, 'redirect_after_click_heading', 'subentity');

-- ----------------------------
-- Table structure for app_entities_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_entities_groups`;
CREATE TABLE `app_entities_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entities_groups
-- ----------------------------

-- ----------------------------
-- Table structure for app_entities_menu
-- ----------------------------
DROP TABLE IF EXISTS `app_entities_menu`;
CREATE TABLE `app_entities_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bg_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entities_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reports_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pages_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'entity',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entities_menu
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_1
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_1`;
CREATE TABLE `app_entity_1`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `parent_item_id` int NOT NULL DEFAULT 0,
  `linked_id` int NOT NULL DEFAULT 0,
  `date_added` bigint NOT NULL DEFAULT 0,
  `date_updated` bigint NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `multiple_access_groups` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 1,
  `field_5` tinyint(1) NOT NULL,
  `field_6` int NOT NULL,
  `field_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_13` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_14` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_201` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_client_id`(`client_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_1
-- ----------------------------
INSERT INTO `app_entity_1` VALUES (1, 6231401, 0, 0, 0, 1698346901, 0, NULL, 0, '$P$EjCV985U.DwqXTzmANLKjDBOyiEeja0', '', 1, 1, 0, 'B2', 'Admin', 'admin@pm.velocitycloud.co', 'user_1_1699089366.png', 'admin', 'greek.php', 'blue', 1699884575);

-- ----------------------------
-- Table structure for app_entity_1_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_1_values`;
CREATE TABLE `app_entity_1_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_1_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_21
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_21`;
CREATE TABLE `app_entity_21`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT 0,
  `parent_item_id` int NULL DEFAULT 0,
  `linked_id` int NULL DEFAULT 0,
  `date_added` bigint NOT NULL DEFAULT 0,
  `date_updated` bigint NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_161` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_324` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_332` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_333` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_334` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_352` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_field_333`(`field_333`(128) ASC) USING BTREE,
  INDEX `idx_field_334`(`field_334`(128) ASC) USING BTREE,
  INDEX `idx_field_352`(`field_352`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_21
-- ----------------------------
INSERT INTO `app_entity_21` VALUES (3, 0, 0, 0, 1699265552, 1699273263, 1, 0, '', '', 'Δοκιμαστική Διαδικασία Λονδίνο', '', '1', '');
INSERT INTO `app_entity_21` VALUES (4, 0, 0, 0, 1699268395, 1699269204, 1, 0, '', '', 'Δοκιμαστική Διαδικασία 2 Ντουπάι', '2', '6', '');
INSERT INTO `app_entity_21` VALUES (5, 0, 0, 0, 1699271794, 0, 1, 0, '1', '', 'Ετήσιος Απολογισμός Λονδίνου', '', '', '');

-- ----------------------------
-- Table structure for app_entity_21_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_21_values`;
CREATE TABLE `app_entity_21_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_21_values
-- ----------------------------
INSERT INTO `app_entity_21_values` VALUES (12, 4, 333, 2);
INSERT INTO `app_entity_21_values` VALUES (13, 4, 334, 6);
INSERT INTO `app_entity_21_values` VALUES (14, 5, 161, 1);
INSERT INTO `app_entity_21_values` VALUES (15, 3, 334, 1);

-- ----------------------------
-- Table structure for app_entity_22
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_22`;
CREATE TABLE `app_entity_22`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT 0,
  `parent_item_id` int NULL DEFAULT 0,
  `linked_id` int NULL DEFAULT 0,
  `date_added` bigint NOT NULL DEFAULT 0,
  `date_updated` bigint NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_167` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_168` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_169` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_170` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_171` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_172` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_173` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_174` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_175` bigint NOT NULL DEFAULT 0,
  `field_176` bigint NOT NULL DEFAULT 0,
  `field_177` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_356` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_357` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_358` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_359` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_360` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_361` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_362` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_field_177`(`field_177`(128) ASC) USING BTREE,
  INDEX `idx_field_362`(`field_362`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_22
-- ----------------------------
INSERT INTO `app_entity_22` VALUES (3, 0, 3, 0, 1699269147, 0, 1, 0, '42', 'Ετήσια Αναφορά Ε12', '46', '55', '', '', '', '', 0, 0, '1', '', '', '', '', '', '', '');
INSERT INTO `app_entity_22` VALUES (4, 0, 3, 0, 1699269170, 0, 1, 0, '42', 'Ετήσια Αναφορά Ε21', '46', '54', '', '', '', '', 0, 0, '3', '', '', '', '', '', '', '');
INSERT INTO `app_entity_22` VALUES (5, 0, 4, 0, 1699269232, 1699269246, 1, 0, '42', 'Δοκιμαστική Αναφορά Ε12', '46', '53', '', '', '', '1', 0, 0, '', '', '', '', '', '', '', '');
INSERT INTO `app_entity_22` VALUES (6, 0, 4, 0, 1699271099, 0, 1, 0, '42', 'Παραβίαση ΠΟΠ', '46', '55', '1', '', '', '', 0, 0, '', '', '', '', '', '', '', '');
INSERT INTO `app_entity_22` VALUES (7, 0, 3, 0, 1699271526, 0, 1, 0, '42', 'Παραβίαση ΠΟΠ 2', '46', '55', '', '', '', '', 0, 0, '', 'δσσδφσ', 'φσδφσδ', 'σδφσδ', 'σδφσδ', 'σδφσδ', 'σδδφσδ', '');
INSERT INTO `app_entity_22` VALUES (8, 0, 5, 0, 1699271953, 1699272031, 1, 0, '42', 'Παραβίαση ΠΟΠ Λονδίνου', '46', '53', '', '', '', '', 1698789600, 1699912800, '', '', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for app_entity_22_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_22_values`;
CREATE TABLE `app_entity_22_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_22_values
-- ----------------------------
INSERT INTO `app_entity_22_values` VALUES (10, 3, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (11, 3, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (12, 3, 170, 55);
INSERT INTO `app_entity_22_values` VALUES (13, 3, 177, 1);
INSERT INTO `app_entity_22_values` VALUES (14, 4, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (15, 4, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (16, 4, 170, 54);
INSERT INTO `app_entity_22_values` VALUES (17, 4, 177, 3);
INSERT INTO `app_entity_22_values` VALUES (18, 5, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (21, 5, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (22, 5, 170, 53);
INSERT INTO `app_entity_22_values` VALUES (23, 6, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (24, 6, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (25, 6, 170, 55);
INSERT INTO `app_entity_22_values` VALUES (26, 6, 171, 1);
INSERT INTO `app_entity_22_values` VALUES (27, 7, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (28, 7, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (29, 7, 170, 55);
INSERT INTO `app_entity_22_values` VALUES (42, 8, 167, 42);
INSERT INTO `app_entity_22_values` VALUES (43, 8, 169, 46);
INSERT INTO `app_entity_22_values` VALUES (44, 8, 170, 53);
INSERT INTO `app_entity_22_values` VALUES (45, 8, 362, 1);

-- ----------------------------
-- Table structure for app_entity_23
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_23`;
CREATE TABLE `app_entity_23`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT 0,
  `parent_item_id` int NULL DEFAULT 0,
  `linked_id` int NULL DEFAULT 0,
  `date_added` bigint NOT NULL DEFAULT 0,
  `date_updated` bigint NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_182` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_183` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_184` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_185` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_186` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_194` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_23
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_23_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_23_values`;
CREATE TABLE `app_entity_23_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_23_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_24
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_24`;
CREATE TABLE `app_entity_24`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT 0,
  `parent_item_id` int NULL DEFAULT 0,
  `linked_id` int NULL DEFAULT 0,
  `date_added` bigint NOT NULL DEFAULT 0,
  `date_updated` bigint NOT NULL DEFAULT 0,
  `created_by` int NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_191` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_192` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_193` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_195` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_24
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_24_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_24_values`;
CREATE TABLE `app_entity_24_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_24_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_33
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_33`;
CREATE TABLE `app_entity_33`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT 0,
  `parent_item_id` int UNSIGNED NULL DEFAULT 0,
  `linked_id` int UNSIGNED NULL DEFAULT 0,
  `date_added` bigint NULL DEFAULT 0,
  `date_updated` bigint NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_325` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_326` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_327` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_328` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_329` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_330` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_331` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_363` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_field_331`(`field_331`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_33
-- ----------------------------
INSERT INTO `app_entity_33` VALUES (1, 0, 0, 0, 1699088727, 1699096956, 1, 0, 'Λονδίνο', 'ecocom.london@mfa.gr', '', 'tyryrt', 'Αντώνης', 'Τεστ', '', '');
INSERT INTO `app_entity_33` VALUES (2, 0, 0, 0, 1699088947, 1699088961, 1, 0, 'Τίρανα', 'ecocom.london@mfa.gr', '', '', 'Αντώνης', 'Τεστ', '', '');
INSERT INTO `app_entity_33` VALUES (3, 0, 0, 0, 1699088947, 1699088969, 1, 0, 'Τελ Αβίβ', 'ecocom.london@mfa.gr', '', '', 'Αντώνης', 'Τεστ', '', '');
INSERT INTO `app_entity_33` VALUES (4, 0, 0, 0, 1699088947, 1699088977, 1, 0, 'Σκόπια', 'ecocom.london@mfa.gr', '', '', 'Αντώνης', 'Τεστ', '', '');
INSERT INTO `app_entity_33` VALUES (5, 0, 0, 0, 1699088947, 1699088986, 1, 0, 'Μόναχο', 'ecocom.london@mfa.gr', '', '', 'Αντώνης', 'Τεστ', '', '');
INSERT INTO `app_entity_33` VALUES (6, 0, 0, 0, 1699088947, 1699088992, 1, 0, 'Ντουμπάι', 'ecocom.london@mfa.gr', '', '', 'Αντώνης', 'Τεστ', '', '');

-- ----------------------------
-- Table structure for app_entity_33_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_33_values`;
CREATE TABLE `app_entity_33_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_33_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_34
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_34`;
CREATE TABLE `app_entity_34`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT 0,
  `parent_item_id` int UNSIGNED NULL DEFAULT 0,
  `linked_id` int UNSIGNED NULL DEFAULT 0,
  `date_added` bigint NULL DEFAULT 0,
  `date_updated` bigint NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_350` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_351` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_34
-- ----------------------------
INSERT INTO `app_entity_34` VALUES (1, 0, 0, 0, 1699267732, 0, 1, 0, 'Ε4 Κατάλογος Εγγράφων Ποιότητας (vs-1) ΕΦΑΡΜΟΓΗ', 'https://docs.google.com/document/d/1CrN_-opy64CH0VCUxJSmMjVRlipT8-RL/edit');
INSERT INTO `app_entity_34` VALUES (2, 0, 0, 0, 1699267765, 0, 1, 0, 'Εγχειρίδιο Διαχείρισης Ποιότητας (vs-1)', 'https://docs.google.com/document/d/1ICT-5s1IckEdIJtfp6C_rfUi3gfhSBj_/edit');
INSERT INTO `app_entity_34` VALUES (3, 0, 0, 0, 1699267807, 0, 1, 0, '1 Ανασκόπηση Συστήματος Διαχείρισης Ποιότητας (vs-1)', 'https://drive.google.com/drive/u/0/folders/1up4YdlPBrN1Kvxk9qse_TcEPSc_Ic0ja');
INSERT INTO `app_entity_34` VALUES (4, 0, 0, 0, 1699267834, 0, 1, 0, '2 Αντιμετώπιση Παραπόνων Πελατών (vs-1)', 'https://drive.google.com/drive/u/0/folders/1ooY8Kih7KNmywaS5mojColackkKf88qj');

-- ----------------------------
-- Table structure for app_entity_34_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_34_values`;
CREATE TABLE `app_entity_34_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_34_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_35
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_35`;
CREATE TABLE `app_entity_35`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT 0,
  `parent_item_id` int UNSIGNED NULL DEFAULT 0,
  `linked_id` int UNSIGNED NULL DEFAULT 0,
  `date_added` bigint NULL DEFAULT 0,
  `date_updated` bigint NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_353` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_354` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_355` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_35
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_35_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_35_values`;
CREATE TABLE `app_entity_35_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_35_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_36
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_36`;
CREATE TABLE `app_entity_36`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT 0,
  `parent_item_id` int UNSIGNED NULL DEFAULT 0,
  `linked_id` int UNSIGNED NULL DEFAULT 0,
  `date_added` bigint NULL DEFAULT 0,
  `date_updated` bigint NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_341` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_342` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_343` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_344` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_345` bigint NOT NULL,
  `field_346` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_347` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_348` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_349` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_field_345`(`field_345` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_36
-- ----------------------------
INSERT INTO `app_entity_36` VALUES (1, 0, 0, 0, 1699267400, 0, 1, 0, 'Ε12 Παραβιάσεις ΠΟΠ-ΠΓΕ-ΣΗΜΑΤΑ για ΣΔΠ', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (2, 0, 0, 0, 1699267412, 0, 1, 0, 'Ε21 Στόχοι & Δείκτες Γραφείων ΟΕΥ', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (3, 0, 0, 0, 1699267420, 0, 1, 0, 'Ε22 Ημερολόγιο Δράσεων Εξωστρέφειας', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (4, 0, 0, 0, 1699267427, 0, 1, 0, 'Ε23 Κατάλογος Εγχωρίων Εταιριών με Ελληνική Εταιρική Συμμετοχή', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (5, 0, 0, 0, 1699267435, 0, 1, 0, 'E24 Κατάλογος Ελλήνων Στελεχών Εγχώριων Επιχειρήσεων', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (6, 0, 0, 0, 1699267442, 0, 1, 0, 'Ε25 Κατάλογος Αιτημάτων από Ελλάδα', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (7, 0, 0, 0, 1699267449, 0, 1, 0, 'Ε26 Κατάλογος Οικονομικών Εταίρων Ελληνικών Επιχειρήσεων', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (8, 0, 0, 0, 1699267456, 0, 1, 0, 'Ε27 Πηγές Πληροφόρησης – Ενημέρωσης', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (9, 0, 0, 0, 1699267462, 0, 1, 0, 'Ε28 Χρήσιμες Διευθύνσεις', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (10, 0, 0, 0, 1699267470, 0, 1, 0, 'E30 Διεθνείς Εμπορικές Εκθέσεις', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (11, 0, 0, 0, 1699267477, 0, 1, 0, 'Ε31 Ετήσιος Προγραμματισμός Δράσεων', '', '', '', 0, '', '', '', '');
INSERT INTO `app_entity_36` VALUES (12, 0, 0, 0, 1699267483, 0, 1, 0, 'Ε32 Στοιχεία Προμηθευτών Γραφείου', '', '', '', 0, '', '', '', '');

-- ----------------------------
-- Table structure for app_entity_36_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_36_values`;
CREATE TABLE `app_entity_36_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_36_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_entity_37
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_37`;
CREATE TABLE `app_entity_37`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NULL DEFAULT 0,
  `parent_item_id` int UNSIGNED NULL DEFAULT 0,
  `linked_id` int UNSIGNED NULL DEFAULT 0,
  `date_added` bigint NULL DEFAULT 0,
  `date_updated` bigint NULL DEFAULT 0,
  `created_by` int UNSIGNED NULL DEFAULT NULL,
  `sort_order` int NULL DEFAULT 0,
  `field_370` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_371` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_372` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_373` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_374` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_field_373`(`field_373`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_37
-- ----------------------------
INSERT INTO `app_entity_37` VALUES (1, 0, 0, 0, 1699278816, 1699278821, 1, 0, 'Antonis Skan', '', '', '1', '');

-- ----------------------------
-- Table structure for app_entity_37_values
-- ----------------------------
DROP TABLE IF EXISTS `app_entity_37_values`;
CREATE TABLE `app_entity_37_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `items_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_items_fields_id`(`items_id` ASC, `fields_id` ASC) USING BTREE,
  INDEX `idx_value_id`(`value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_entity_37_values
-- ----------------------------
INSERT INTO `app_entity_37_values` VALUES (1, 1, 373, 1);

-- ----------------------------
-- Table structure for app_ext_calendar
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_calendar`;
CREATE TABLE `app_ext_calendar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `enable_ical` tinyint(1) NOT NULL,
  `in_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `default_view` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_modes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `event_limit` smallint NOT NULL,
  `highlighting_weekends` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `max_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_slot_duration` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_background` int NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filters_panel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default',
  `reminder_status` tinyint(1) NOT NULL,
  `reminder_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reminder_minutes` smallint NOT NULL,
  `reminder_item_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_calendar_access
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_calendar_access`;
CREATE TABLE `app_ext_calendar_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `calendar_id` int NULL DEFAULT NULL,
  `calendar_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `access_groups_id` int NOT NULL,
  `access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_calendar_id`(`calendar_id` ASC) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_calendar_access
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_calendar_events
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_calendar_events`;
CREATE TABLE `app_ext_calendar_events`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` bigint UNSIGNED NOT NULL,
  `end_date` bigint NOT NULL,
  `event_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_public` tinyint(1) NULL DEFAULT NULL,
  `bg_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_interval` int NULL DEFAULT NULL,
  `repeat_days` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_end` int NULL DEFAULT NULL,
  `repeat_limit` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_calendar_events
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_call_history
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_call_history`;
CREATE TABLE `app_ext_call_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  `direction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `duration` int NOT NULL,
  `sms_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recording` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_star` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `module` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE,
  INDEX `idx_direction`(`direction` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_module`(`module` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_call_history
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_access
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_access`;
CREATE TABLE `app_ext_chat_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_groups_id` int NOT NULL,
  `access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_access
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_conversations
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_conversations`;
CREATE TABLE `app_ext_chat_conversations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_conversations
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_conversations_messages
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_conversations_messages`;
CREATE TABLE `app_ext_chat_conversations_messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversations_id` int NOT NULL,
  `users_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_conversations_id`(`conversations_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_conversations_messages
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_messages
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_messages`;
CREATE TABLE `app_ext_chat_messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `assigned_to` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_assigned_to`(`assigned_to` ASC) USING BTREE,
  INDEX `idx_users_assigned`(`users_id` ASC, `assigned_to` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_messages
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_unread_messages
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_unread_messages`;
CREATE TABLE `app_ext_chat_unread_messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `assigned_to` int NOT NULL,
  `messages_id` int NOT NULL,
  `conversations_id` int NOT NULL,
  `notification_status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_assigned_to`(`assigned_to` ASC) USING BTREE,
  INDEX `idx_messages_id`(`messages_id` ASC) USING BTREE,
  INDEX `idx_conversations_id`(`conversations_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_unread_messages
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_chat_users_online
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_chat_users_online`;
CREATE TABLE `app_ext_chat_users_online`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `date_check` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_chat_users_online
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_comments_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_comments_templates`;
CREATE TABLE `app_ext_comments_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_comments_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_comments_templates_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_comments_templates_fields`;
CREATE TABLE `app_ext_comments_templates_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `templates_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_templates_id`(`templates_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_comments_templates_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_cryptopro_certificates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_cryptopro_certificates`;
CREATE TABLE `app_ext_cryptopro_certificates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `thumbprint` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `certbase64` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_id`(`users_id` ASC) USING BTREE,
  INDEX `thumbprint`(`thumbprint` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_cryptopro_certificates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_currencies
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_currencies`;
CREATE TABLE `app_ext_currencies`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` float(13, 8) NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_currencies
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_email_notification_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_email_notification_rules`;
CREATE TABLE `app_ext_email_notification_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `action_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_user_group` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notification_days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notification_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_email_notification_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_email_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_email_rules`;
CREATE TABLE `app_ext_email_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `action_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_assigned_users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_assigned_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `monitor_fields_id` int NOT NULL,
  `monitor_choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_fields_id` int NOT NULL,
  `number_of_days` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `attach_attachments` tinyint(1) NOT NULL,
  `attach_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_monitor_fields_id`(`monitor_fields_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_email_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_email_rules_blocks
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_email_rules_blocks`;
CREATE TABLE `app_ext_email_rules_blocks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_email_rules_blocks
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_entities_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_entities_templates`;
CREATE TABLE `app_ext_entities_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_entities_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_entities_templates_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_entities_templates_fields`;
CREATE TABLE `app_ext_entities_templates_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `templates_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_templates_id`(`templates_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_entities_templates_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_export_selected
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_export_selected`;
CREATE TABLE `app_ext_export_selected`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entities_id` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_filename` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `export_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `export_url` tinyint(1) NOT NULL,
  `filename` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_export_selected
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_export_selected_blocks
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_export_selected_blocks`;
CREATE TABLE `app_ext_export_selected_blocks`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `templates_id` int NOT NULL,
  `block_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `templates_id`(`templates_id` ASC) USING BTREE,
  INDEX `fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_export_selected_blocks
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_export_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_export_templates`;
CREATE TABLE `app_ext_export_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'html',
  `label_size` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `template_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `save_as` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `save_attachments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `page_orientation` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `split_into_pages` tinyint(1) NOT NULL DEFAULT 1,
  `template_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_export_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_file_storage_queue
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_file_storage_queue`;
CREATE TABLE `app_ext_file_storage_queue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `modules_id` int NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_file_storage_queue
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_file_storage_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_file_storage_rules`;
CREATE TABLE `app_ext_file_storage_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `modules_id` int NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_file_storage_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_functions
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_functions`;
CREATE TABLE `app_ext_functions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `reports_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `functions_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `functions_formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_functions
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_funnelchart
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_funnelchart`;
CREATE TABLE `app_ext_funnelchart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `group_by_field` int NOT NULL,
  `hide_zero_values` tinyint(1) NOT NULL,
  `exclude_choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sum_by_field` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `colors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_funnelchart
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_ganttchart
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_ganttchart`;
CREATE TABLE `app_ext_ganttchart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `weekends` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gantt_date_format` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `progress` int NULL DEFAULT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_background` int NOT NULL DEFAULT 0,
  `default_fields_in_listing` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grid_width` smallint NOT NULL,
  `default_view` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `skin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `auto_scheduling` tinyint(1) NOT NULL,
  `highlight_critical_path` tinyint(1) NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_ganttchart
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_ganttchart_access
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_ganttchart_access`;
CREATE TABLE `app_ext_ganttchart_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganttchart_id` int NOT NULL,
  `access_groups_id` int NOT NULL,
  `access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ganttchart_id`(`ganttchart_id` ASC) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_ganttchart_access
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_ganttchart_depends
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_ganttchart_depends`;
CREATE TABLE `app_ext_ganttchart_depends`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganttchart_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `item_id` int NOT NULL,
  `depends_id` int NOT NULL,
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_item_id`(`item_id` ASC) USING BTREE,
  INDEX `idx_depends_id`(`depends_id` ASC) USING BTREE,
  INDEX `idx_ganttchart_id`(`ganttchart_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_ganttchart_depends
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_global_search_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_global_search_entities`;
CREATE TABLE `app_ext_global_search_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `fields_for_search` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_global_search_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_graphicreport
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_graphicreport`;
CREATE TABLE `app_ext_graphicreport`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `xaxis` int NOT NULL,
  `yaxis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allowed_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `period` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `show_totals` tinyint(1) NOT NULL,
  `hide_zero` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_graphicreport
-- ----------------------------
INSERT INTO `app_ext_graphicreport` VALUES (1, 22, 'Τεστ', 165, '173:,173:', '', 'line', 'monthly', 1, 1);

-- ----------------------------
-- Table structure for app_ext_image_map
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_image_map`;
CREATE TABLE `app_ext_image_map`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `scale` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_image_map
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_import_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_import_templates`;
CREATE TABLE `app_ext_import_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `multilevel_import` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `import_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `import_action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filetype` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_encoding` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_item_id` int NOT NULL,
  `text_delimiter` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_use_column` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_import_line` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_import_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_ipages
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_ipages`;
CREATE TABLE `app_ext_ipages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bg_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `html_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_menu` tinyint(1) NOT NULL DEFAULT 0,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_ipages
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_item_pivot_tables
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_item_pivot_tables`;
CREATE TABLE `app_ext_item_pivot_tables`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allowed_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  `related_entities_id` int NOT NULL,
  `related_entities_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rows_per_page` int NOT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_related_entities_id`(`related_entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_item_pivot_tables
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_item_pivot_tables_calcs
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_item_pivot_tables_calcs`;
CREATE TABLE `app_ext_item_pivot_tables_calcs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `select_query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `where_query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_item_pivot_tables_calcs
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_items_export_templates_blocks
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_items_export_templates_blocks`;
CREATE TABLE `app_ext_items_export_templates_blocks`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `templates_id` int NOT NULL,
  `block_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `templates_id`(`templates_id` ASC) USING BTREE,
  INDEX `fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_items_export_templates_blocks
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_kanban
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_kanban`;
CREATE TABLE `app_ext_kanban`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `in_menu` tinyint(1) NOT NULL DEFAULT 0,
  `heading_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_by_field` int NOT NULL,
  `exclude_choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sum_by_field` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_kanban
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail`;
CREATE TABLE `app_ext_mail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject_cropped` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `groups_id` int NOT NULL,
  `is_new_group` tinyint(1) NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_to_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reply_to_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cc_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cc_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bcc_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bcc_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `error_msg` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_sent` tinyint(1) NOT NULL,
  `is_star` tinyint(1) NOT NULL,
  `in_trash` tinyint(1) NOT NULL,
  `is_spam` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE,
  INDEX `idx_groups_id`(`groups_id` ASC) USING BTREE,
  INDEX `idx_to_email`(`to_email`(128) ASC) USING BTREE,
  INDEX `idx_from_email`(`from_email`(128) ASC) USING BTREE,
  INDEX `idx_date_added`(`date_added` ASC) USING BTREE,
  INDEX `idx_is_new`(`is_new` ASC) USING BTREE,
  INDEX `idx_is_sent`(`is_sent` ASC) USING BTREE,
  INDEX `idx_is_star`(`is_star` ASC) USING BTREE,
  INDEX `idx_in_trash`(`in_trash` ASC) USING BTREE,
  INDEX `idx_is_spam`(`is_spam` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts`;
CREATE TABLE `app_ext_mail_accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `bg_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imap_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mailbox` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `delete_emails` tinyint(1) NOT NULL,
  `is_fetched` tinyint(1) NOT NULL,
  `use_smtp` tinyint(1) NOT NULL,
  `smtp_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `smtp_port` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `smtp_encryption` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `smtp_login` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `smtp_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_autoreply` tinyint(1) NOT NULL,
  `autoreply_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `not_group_by_subject` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts_entities`;
CREATE TABLE `app_ext_mail_accounts_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `parent_item_id` int NOT NULL,
  `from_name` int NOT NULL,
  `from_email` int NOT NULL,
  `subject` int NOT NULL,
  `body` int NOT NULL,
  `attachments` int NOT NULL,
  `bind_to_sender` tinyint(1) NOT NULL,
  `auto_create` int NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hide_buttons` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `related_emails_position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts_entities_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts_entities_fields`;
CREATE TABLE `app_ext_mail_accounts_entities_fields`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_entities_id` int UNSIGNED NOT NULL,
  `filters_id` int NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_account_entities_id`(`account_entities_id` ASC) USING BTREE,
  INDEX `idx_filters_id`(`filters_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts_entities_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts_entities_filters
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts_entities_filters`;
CREATE TABLE `app_ext_mail_accounts_entities_filters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_entities_id` int NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `has_words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_item_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_entities_id`(`account_entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts_entities_filters
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts_entities_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts_entities_rules`;
CREATE TABLE `app_ext_mail_accounts_entities_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_entities_id` int NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `has_words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_entities_id`(`account_entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts_entities_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_accounts_users
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_accounts_users`;
CREATE TABLE `app_ext_mail_accounts_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `users_id` int NOT NULL,
  `send_mail_as` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_accounts_users
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_contacts
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_contacts`;
CREATE TABLE `app_ext_mail_contacts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE,
  INDEX `idx_name`(`name`(128) ASC) USING BTREE,
  INDEX `idx_email`(`email`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_filters
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_filters`;
CREATE TABLE `app_ext_mail_filters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `has_words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_filters
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_groups`;
CREATE TABLE `app_ext_mail_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `subject_cropped` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_check`(`accounts_id` ASC, `subject_cropped`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_groups
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_groups_from
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_groups_from`;
CREATE TABLE `app_ext_mail_groups_from`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail_groups_id` int NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mail_groups_id`(`mail_groups_id` ASC, `from_email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_groups_from
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_templates`;
CREATE TABLE `app_ext_mail_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `accounts_id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_accounts_id`(`accounts_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mail_to_items
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mail_to_items`;
CREATE TABLE `app_ext_mail_to_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail_groups_id` int NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_mail_groups_id`(`mail_groups_id` ASC) USING BTREE,
  INDEX `idx_from_email`(`from_email`(128) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mail_to_items
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_map_reports
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_map_reports`;
CREATE TABLE `app_ext_map_reports`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `background` int NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_sidebar` tinyint(1) NOT NULL,
  `fields_in_sidebar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sidebar_width` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `zoom` tinyint(1) NOT NULL,
  `latlng` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_public_access` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_map_reports
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_mind_map
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_mind_map`;
CREATE TABLE `app_ext_mind_map`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `use_background` int NOT NULL,
  `icons` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shape` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_mind_map
-- ----------------------------
INSERT INTO `app_ext_mind_map` VALUES (1, 21, 'Διαδιακασίες', 0, '{\"26\":\"\",\"25\":\"\",\"24\":\"\",\"23\":\"\",\"22\":\"\",\"21\":\"\",\"20\":\"\",\"19\":\"\",\"18\":\"\",\"17\":\"\",\"16\":\"\",\"15\":\"\",\"14\":\"\",\"13\":\"\",\"12\":\"\",\"6\":\"\",\"4\":\"\",\"5\":\"\"}', 0, 0, '0', '', 'box');

-- ----------------------------
-- Table structure for app_ext_modules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_modules`;
CREATE TABLE `app_ext_modules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `module` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_active`(`is_active` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_modules
-- ----------------------------
INSERT INTO `app_ext_modules` VALUES (1, 0, 'sms', 'curl_query', 0);

-- ----------------------------
-- Table structure for app_ext_modules_cfg
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_modules_cfg`;
CREATE TABLE `app_ext_modules_cfg`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `modules_id` int UNSIGNED NOT NULL,
  `cfg_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cfg_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_modules_cfg
-- ----------------------------
INSERT INTO `app_ext_modules_cfg` VALUES (1, 1, 'url', '');
INSERT INTO `app_ext_modules_cfg` VALUES (2, 1, 'postfields', '');
INSERT INTO `app_ext_modules_cfg` VALUES (3, 1, 'userpwd', '');

-- ----------------------------
-- Table structure for app_ext_pivot_calendars
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_calendars`;
CREATE TABLE `app_ext_pivot_calendars`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `default_view` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_modes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `event_limit` smallint NOT NULL DEFAULT 6,
  `highlighting_weekends` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `max_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_slot_duration` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_legend` tinyint(1) NOT NULL DEFAULT 0,
  `in_menu` tinyint(1) NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable_ical` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivot_calendars_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_calendars_entities`;
CREATE TABLE `app_ext_pivot_calendars_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `calendars_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `bg_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `background` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_background` int NOT NULL,
  `reminder_status` tinyint(1) NOT NULL,
  `reminder_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reminder_minutes` smallint NOT NULL,
  `reminder_item_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_calendars_id`(`calendars_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_calendars_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivot_map_reports
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_map_reports`;
CREATE TABLE `app_ext_pivot_map_reports`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_public_access` tinyint(1) NOT NULL DEFAULT 0,
  `in_menu` tinyint(1) NOT NULL,
  `zoom` tinyint(1) NOT NULL,
  `latlng` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_legend` tinyint(1) NOT NULL,
  `display_sidebar` tinyint(1) NOT NULL,
  `sidebar_width` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_map_reports
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivot_map_reports_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_map_reports_entities`;
CREATE TABLE `app_ext_pivot_map_reports_entities`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `background` int NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_sidebar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `marker_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `marker_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_map_reports_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivot_tables
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_tables`;
CREATE TABLE `app_ext_pivot_tables`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `filters_panel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `height` smallint NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  `chart_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_height` smallint NOT NULL,
  `colors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_types` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_show_labels` tinyint(1) NOT NULL,
  `chart_number_format` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_number_prefix` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chart_number_suffix` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_tables
-- ----------------------------
INSERT INTO `app_ext_pivot_tables` VALUES (1, 22, 'Privot test', 0, 'default', 0, '{\"26\":\"\",\"25\":\"\",\"24\":\"\",\"23\":\"\",\"22\":\"\",\"21\":\"\",\"20\":\"\",\"19\":\"\",\"18\":\"\",\"17\":\"\",\"16\":\"\",\"15\":\"\",\"14\":\"\",\"13\":\"\",\"12\":\"\",\"6\":\"\",\"4\":\"\",\"5\":\"\"}', 0, 'pie', 'right', 100, ',,,,', ',,,,', 1, '', '', '');

-- ----------------------------
-- Table structure for app_ext_pivot_tables_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_tables_fields`;
CREATE TABLE `app_ext_pivot_tables_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `fields_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cfg_date_format` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entitites_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_tables_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivot_tables_settings
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivot_tables_settings`;
CREATE TABLE `app_ext_pivot_tables_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `users_id` int NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivot_tables_settings
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivotreports
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivotreports`;
CREATE TABLE `app_ext_pivotreports`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allowed_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allow_edit` tinyint(1) NOT NULL,
  `cfg_numer_format` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  `reports_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_mode` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivotreports
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivotreports_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivotreports_fields`;
CREATE TABLE `app_ext_pivotreports_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pivotreports_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `fields_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cfg_date_format` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pivotreports_id`(`pivotreports_id` ASC) USING BTREE,
  INDEX `idx_entitites_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivotreports_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_pivotreports_settings
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_pivotreports_settings`;
CREATE TABLE `app_ext_pivotreports_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `users_id` int NOT NULL,
  `reports_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_mode` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_pivotreports_settings
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_process_form_rows
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_process_form_rows`;
CREATE TABLE `app_ext_process_form_rows`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `process_id` int NOT NULL,
  `forms_tabs_id` int NOT NULL,
  `columns` tinyint NOT NULL,
  `column1_width` tinyint NOT NULL,
  `column2_width` tinyint NOT NULL,
  `column3_width` tinyint NOT NULL,
  `column4_width` tinyint NOT NULL,
  `column5_width` tinyint NOT NULL,
  `column6_width` tinyint NOT NULL,
  `field_name_new_row` tinyint(1) NOT NULL,
  `column1_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column2_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column3_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column4_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column5_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column6_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entities_id`(`process_id` ASC) USING BTREE,
  INDEX `forms_tabs_id`(`forms_tabs_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_process_form_rows
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_process_form_tabs
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_process_form_tabs`;
CREATE TABLE `app_ext_process_form_tabs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `process_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_process_id`(`process_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_process_form_tabs
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_processes
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_processes`;
CREATE TABLE `app_ext_processes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `print_template` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to_all` tinyint(1) NOT NULL,
  `access_to_assigned` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `window_width` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `confirmation_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `warning_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allow_comments` tinyint(1) UNSIGNED NOT NULL,
  `preview_prcess_actions` tinyint(1) UNSIGNED NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payment_modules` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `apply_fields_access_rules` tinyint(1) NOT NULL DEFAULT 0,
  `apply_fields_display_rules` tinyint(1) NOT NULL,
  `hide_entity_name` tinyint(1) NOT NULL DEFAULT 0,
  `success_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `success_message_status` tinyint(1) NOT NULL DEFAULT 1,
  `redirect_to_items_listing` tinyint(1) NOT NULL DEFAULT 0,
  `disable_comments` tinyint(1) NOT NULL,
  `javascript_in_from` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `javascript_onsubmit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_form_wizard` tinyint(1) NOT NULL DEFAULT 0,
  `is_form_wizard_progress_bar` tinyint NOT NULL,
  `submit_button_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_processes
-- ----------------------------
INSERT INTO `app_ext_processes` VALUES (1, 25, 'Αυτοματισμός 1', 'Ενημέρωση', 'menu_more_actions,menu_with_selected,in_listing', '', '', '', '', '', 0, '', '', '&Epsilon;&pi;&iota;&beta;&epsilon;&beta;&alpha;&iota;ώ&sigma;&tau;&epsilon; &tau;&eta;&nu; &epsilon;&rho;&gamma;&alpha;&sigma;ί&alpha;', '', 1, 0, '', '', 1, 0, 0, 0, '', 0, 0, 0, '', '', 0, 1, 'ΟΚ', 0);
INSERT INTO `app_ext_processes` VALUES (2, 34, 'Δοκιμαστικά2', 'Ενημέρωση για νέο ΣΔΠ', '', '#009688', '', '', '', '', 0, '', '', '', '', 0, 0, '', '', 1, 0, 0, 0, '', 0, 0, 0, '', '', 0, 1, '', 0);
INSERT INTO `app_ext_processes` VALUES (3, 37, 'test', '', 'default', '', '', '', '', '', 0, '', '', '', '', 0, 0, '', '', 1, 0, 0, 0, '', 0, 0, 0, '', '', 0, 1, '', 0);

-- ----------------------------
-- Table structure for app_ext_processes_actions
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_processes_actions`;
CREATE TABLE `app_ext_processes_actions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `process_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_process_id`(`process_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_processes_actions
-- ----------------------------
INSERT INTO `app_ext_processes_actions` VALUES (1, 1, 1, 'insert_item_subentity_27', '', 1, '');

-- ----------------------------
-- Table structure for app_ext_processes_actions_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_processes_actions_fields`;
CREATE TABLE `app_ext_processes_actions_fields`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `actions_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enter_manually` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_actions_id`(`actions_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_processes_actions_fields
-- ----------------------------
INSERT INTO `app_ext_processes_actions_fields` VALUES (1, 1, 263, 'τεστ1', 0);

-- ----------------------------
-- Table structure for app_ext_processes_buttons_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_processes_buttons_groups`;
CREATE TABLE `app_ext_processes_buttons_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_processes_buttons_groups
-- ----------------------------
INSERT INTO `app_ext_processes_buttons_groups` VALUES (1, 25, 'Εκτέλεση εργασίας', '', '', 'default', 0);

-- ----------------------------
-- Table structure for app_ext_processes_clone_subitems
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_processes_clone_subitems`;
CREATE TABLE `app_ext_processes_clone_subitems`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `actions_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `from_entity_id` int NOT NULL,
  `to_entity_id` int NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_from_entity_id`(`from_entity_id` ASC) USING BTREE,
  INDEX `idx_to_entity_id`(`to_entity_id` ASC) USING BTREE,
  INDEX `idx_actions_id`(`actions_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_processes_clone_subitems
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_public_forms
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_public_forms`;
CREATE TABLE `app_ext_public_forms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `parent_item_id` int NOT NULL,
  `hide_parent_item` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `inactive_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_save_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `successful_sending_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `after_submit_action` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `after_submit_redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agreement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hidden_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_email` int NOT NULL,
  `customer_message_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_notification` tinyint(1) NOT NULL,
  `check_enquiry` tinyint(1) NOT NULL,
  `disable_submit_form` tinyint(1) NOT NULL,
  `check_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_page_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_page_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_page_comments` tinyint(1) NOT NULL,
  `check_page_comments_heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_page_comments_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notify_field_change` int UNSIGNED NOT NULL,
  `notify_message_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notify_message_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `check_enquiry_fields` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `form_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `form_js` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_public_forms
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_recurring_tasks
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_recurring_tasks`;
CREATE TABLE `app_ext_recurring_tasks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `repeat_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_interval` int NOT NULL,
  `repeat_days` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_start` bigint UNSIGNED NOT NULL,
  `repeat_end` bigint UNSIGNED NOT NULL,
  `repeat_limit` int NOT NULL,
  `repeat_time` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_recurring_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_recurring_tasks_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_recurring_tasks_fields`;
CREATE TABLE `app_ext_recurring_tasks_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tasks_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tasks_id`(`tasks_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_recurring_tasks_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_report_page
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_report_page`;
CREATE TABLE `app_ext_report_page`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_editor` tinyint(1) NOT NULL,
  `save_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `save_as` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `page_orientation` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `css` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_report_page
-- ----------------------------
INSERT INTO `app_ext_report_page` VALUES (1, 27, 1, 'fek', '', 'print', 1, '', 'pdf', '', '', '', '', '', '', 'portrait', '{\"filter_by_date\":\"0\",\"filter_by_date_mode\":\"day\",\"filter_by_date_heading\":\"\",\"filter_by_user\":\"0\",\"filter_by_user_heading\":\"\",\"filter_by_entity1\":\"0\",\"filter_by_entity1_id\":\"21\",\"filter_by_entity1_heading\":\"\",\"filter_by_entity2\":\"0\",\"filter_by_entity2_id\":\"21\",\"filter_by_entity2_heading\":\"\",\"filter_by_entity3\":\"0\",\"filter_by_entity3_id\":\"21\",\"filter_by_entity3_heading\":\"\",\"filter_by_list1\":\"0\",\"filter_by_list1_id\":\"\",\"filter_by_list1_heading\":\"\",\"filter_by_list2\":\"0\",\"filter_by_list2_id\":\"\",\"filter_by_list2_heading\":\"\",\"filter_by_list3\":\"0\",\"filter_by_list3_id\":\"\",\"filter_by_list3_heading\":\"\"}', '', 0);
INSERT INTO `app_ext_report_page` VALUES (2, 22, 0, 'Εργασίες σε Εξέλιξη', '<strong>&Tau;&epsilon;&sigma;&tau;</strong><br />\r\n<br />\r\n&nbsp;', 'print', 1, '', '', '', '', '', '', '', '', 'portrait', '{\"filter_by_date\":\"0\",\"filter_by_date_mode\":\"day\",\"filter_by_date_heading\":\"\",\"filter_by_user\":\"0\",\"filter_by_user_heading\":\"\",\"filter_by_entity1\":\"0\",\"filter_by_entity1_id\":\"21\",\"filter_by_entity1_heading\":\"\",\"filter_by_entity2\":\"0\",\"filter_by_entity2_id\":\"21\",\"filter_by_entity2_heading\":\"\",\"filter_by_entity3\":\"0\",\"filter_by_entity3_id\":\"21\",\"filter_by_entity3_heading\":\"\",\"filter_by_list1\":\"0\",\"filter_by_list1_id\":\"\",\"filter_by_list1_heading\":\"\",\"filter_by_list2\":\"0\",\"filter_by_list2_id\":\"\",\"filter_by_list2_heading\":\"\",\"filter_by_list3\":\"0\",\"filter_by_list3_id\":\"\",\"filter_by_list3_heading\":\"\"}', '', 0);
INSERT INTO `app_ext_report_page` VALUES (3, 1, 1, 'Madeline Phelan', '', 'print', 1, 'Test file ext', 'pdf', 'download', 'menu_more_actions', '#F44336', '', '', '', 'portrait', '{\"filter_by_date\":\"0\",\"filter_by_date_mode\":\"day\",\"filter_by_date_heading\":\"\",\"filter_by_user\":\"0\",\"filter_by_user_heading\":\"\",\"filter_by_entity1\":\"0\",\"filter_by_entity1_id\":\"21\",\"filter_by_entity1_heading\":\"\",\"filter_by_entity2\":\"0\",\"filter_by_entity2_id\":\"21\",\"filter_by_entity2_heading\":\"\",\"filter_by_entity3\":\"0\",\"filter_by_entity3_id\":\"21\",\"filter_by_entity3_heading\":\"\",\"filter_by_list1\":\"0\",\"filter_by_list1_id\":\"\",\"filter_by_list1_heading\":\"\",\"filter_by_list2\":\"0\",\"filter_by_list2_id\":\"\",\"filter_by_list2_heading\":\"\",\"filter_by_list3\":\"0\",\"filter_by_list3_id\":\"\",\"filter_by_list3_heading\":\"\"}', '', 1);

-- ----------------------------
-- Table structure for app_ext_report_page_blocks
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_report_page_blocks`;
CREATE TABLE `app_ext_report_page_blocks`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `report_id` int NOT NULL,
  `block_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_id` int NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `report_id`(`report_id` ASC) USING BTREE,
  INDEX `field_id`(`field_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_report_page_blocks
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_resource_timeline
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_resource_timeline`;
CREATE TABLE `app_ext_resource_timeline`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_legend` tinyint(1) NOT NULL,
  `listing_width` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_width` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_popup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `default_view` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `max_time` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_modes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_slot_duration` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_resource_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_resource_timeline_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_resource_timeline_entities`;
CREATE TABLE `app_ext_resource_timeline_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `calendars_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `related_entity_field_id` int NOT NULL,
  `bg_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_popup` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `background` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_background` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_calendars_id`(`calendars_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_resource_timeline_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_rss_feeds
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_rss_feeds`;
CREATE TABLE `app_ext_rss_feeds`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `rss_id` int UNSIGNED NOT NULL,
  `entities_id` int UNSIGNED NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int UNSIGNED NOT NULL,
  `end_date` int UNSIGNED NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rss_id`(`rss_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_rss_feeds
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_signed_items
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_signed_items`;
CREATE TABLE `app_ext_signed_items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `users_id` int NOT NULL,
  `date_added` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ogrn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `items_id`(`items_id` ASC) USING BTREE,
  INDEX `users_id`(`users_id` ASC) USING BTREE,
  INDEX `fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_signed_items
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_signed_items_signatures
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_signed_items_signatures`;
CREATE TABLE `app_ext_signed_items_signatures`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `signed_items_id` int NOT NULL,
  `signed_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `singed_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `signed_items_id`(`signed_items_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_signed_items_signatures
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_smart_input_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_smart_input_rules`;
CREATE TABLE `app_ext_smart_input_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `modules_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_smart_input_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_sms_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_sms_rules`;
CREATE TABLE `app_ext_sms_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `modules_id` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT 1,
  `action_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_id` int NOT NULL,
  `monitor_fields_id` int NOT NULL,
  `monitor_choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_fields_id` int NOT NULL,
  `date_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `number_of_days` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `send_to_assigned_users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE,
  INDEX `idx_monitor_fields_id`(`monitor_fields_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_sms_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_subscribe_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_subscribe_rules`;
CREATE TABLE `app_ext_subscribe_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `modules_id` int NOT NULL,
  `contact_list_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_email_field_id` int NOT NULL,
  `contact_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_modules_id`(`modules_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`contact_email_field_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_subscribe_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_timeline_reports
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_timeline_reports`;
CREATE TABLE `app_ext_timeline_reports`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `in_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `heading_template` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allowed_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `use_background` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_timeline_reports
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_timer
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_timer`;
CREATE TABLE `app_ext_timer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `seconds` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_timer
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_timer_configuration
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_timer_configuration`;
CREATE TABLE `app_ext_timer_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_timer_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_track_changes
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_track_changes`;
CREATE TABLE `app_ext_track_changes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `track_actions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color_insert` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color_update` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color_comment` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color_delete` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rows_per_page` smallint NOT NULL,
  `keep_history` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_track_changes
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_track_changes_entities
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_track_changes_entities`;
CREATE TABLE `app_ext_track_changes_entities`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `track_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_track_changes_entities
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_track_changes_log
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_track_changes_log`;
CREATE TABLE `app_ext_track_changes_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `comments_id` int NOT NULL,
  `items_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `is_cron` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_comments_id`(`comments_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_track_changes_log
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_track_changes_log_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_track_changes_log_fields`;
CREATE TABLE `app_ext_track_changes_log_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `log_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_log_id`(`log_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_track_changes_log_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_xml_export_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_xml_export_templates`;
CREATE TABLE `app_ext_xml_export_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `template_header` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_footer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transliterate_filename` tinyint(1) NOT NULL DEFAULT 0,
  `related_entities_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_xml_export_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_ext_xml_import_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_ext_xml_import_templates`;
CREATE TABLE `app_ext_xml_import_templates`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `button_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `data_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `import_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `import_fields_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `import_action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_by_field` int NOT NULL,
  `update_by_field_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_item_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_ext_xml_import_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_favorites
-- ----------------------------
DROP TABLE IF EXISTS `app_favorites`;
CREATE TABLE `app_favorites`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_Id`(`items_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for app_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_fields`;
CREATE TABLE `app_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `forms_tabs_id` int NOT NULL,
  `comments_forms_tabs_id` int NOT NULL DEFAULT 0,
  `forms_rows_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_heading` tinyint(1) NULL DEFAULT 0,
  `tooltip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tooltip_display_as` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tooltip_in_item_page` tinyint(1) NOT NULL DEFAULT 0,
  `tooltip_item_page` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_required` tinyint(1) NULL DEFAULT 0,
  `required_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `configuration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NULL DEFAULT 0,
  `listing_status` tinyint NOT NULL DEFAULT 0,
  `listing_sort_order` int NOT NULL DEFAULT 0,
  `comments_status` tinyint(1) NOT NULL DEFAULT 0,
  `comments_sort_order` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_form_tabs_id`(`forms_tabs_id` ASC) USING BTREE,
  INDEX `idx_comments_forms_tabs_id`(`comments_forms_tabs_id` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 375 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_fields
-- ----------------------------
INSERT INTO `app_fields` VALUES (1, 1, 1, 0, '', 'fieldtype_action', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (2, 1, 1, 0, '', 'fieldtype_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (3, 1, 1, 0, '', 'fieldtype_date_added', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (4, 1, 1, 0, '', 'fieldtype_created_by', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (5, 1, 1, 0, '', 'fieldtype_user_status', '', '', NULL, '', '', 0, '', '', NULL, '', '', 0, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (6, 1, 1, 0, '', 'fieldtype_user_accessgroups', '', '', NULL, '', '', 0, '', '', NULL, '', '', 1, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (7, 1, 1, 0, '', 'fieldtype_user_firstname', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 3, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (8, 1, 1, 0, '', 'fieldtype_user_lastname', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 4, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (9, 1, 1, 0, '', 'fieldtype_user_email', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 6, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (10, 1, 1, 0, '', 'fieldtype_user_photo', '', '', NULL, '', '', 0, '', '', NULL, '', '', 5, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (12, 1, 1, 0, '', 'fieldtype_user_username', '', '', 1, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 2, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (13, 1, 1, 0, '', 'fieldtype_user_language', '', '', 0, '', '', 0, '', '', 0, '', '', 7, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (14, 1, 1, 0, '', 'fieldtype_user_skin', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (152, 21, 24, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (153, 21, 24, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (154, 21, 24, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (155, 21, 24, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (161, 21, 25, 0, '', 'fieldtype_users', 'Ομάδα', '', 0, '', '', 0, '', '', 0, '', '{\"display_as\":\"checkboxes\"}', 0, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (163, 22, 26, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (164, 22, 26, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (165, 22, 26, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 10, 0, 0);
INSERT INTO `app_fields` VALUES (166, 22, 26, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 11, 0, 0);
INSERT INTO `app_fields` VALUES (167, 22, 26, 0, '', 'fieldtype_dropdown', 'Τύπος', '', 0, '', '', 0, '', '', 1, '', '{\"default_text\":\"\",\"width\":\"input-medium\",\"use_search\":\"0\",\"use_global_list\":\"\",\"display_parent_name\":\"0\",\"parent_name_separator\":\":\"}', 1, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (168, 22, 26, 0, '', 'fieldtype_input', 'Έργασία', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 2, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (169, 22, 26, 0, '', 'fieldtype_dropdown', 'Κατάσταση', '', 0, '', '', 0, '', '', 1, '', '{\"default_text\":\"\",\"width\":\"input-large\",\"use_search\":\"0\",\"use_global_list\":\"\",\"display_parent_name\":\"0\",\"parent_name_separator\":\":\"}', 3, 1, 5, 1, 0);
INSERT INTO `app_fields` VALUES (170, 22, 26, 0, '', 'fieldtype_dropdown', 'Προεταιρότητα', '', 0, '', '', 0, '', '', 1, '', '{\"default_text\":\"\",\"width\":\"input-medium\",\"use_search\":\"0\",\"use_global_list\":\"\",\"display_parent_name\":\"0\",\"parent_name_separator\":\":\"}', 4, 1, 2, 1, 1);
INSERT INTO `app_fields` VALUES (171, 22, 26, 0, '', 'fieldtype_users', 'Ανάθεση', '', 0, '', '', 0, '', '', 0, '', '{\"display_as\":\"checkboxes\"}', 5, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (172, 22, 26, 0, '', 'fieldtype_textarea_wysiwyg', 'Περιγραφή', '', 0, '', '', 0, '', '', 0, '', '{\"toolbar\":\"\",\"allow_search\":\"1\",\"number_characters_in_list\":\"\"}', 6, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (173, 22, 27, 0, '', 'fieldtype_input_numeric', 'Εκτίμηση Χρόνου', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-small\",\"number_format\":\"2\\/.\\/*\",\"is_unique\":\"0\",\"unique_error_msg\":\"\",\"default_value\":\"\",\"prefix\":\"\",\"suffix\":\"\",\"min_value\":\"\",\"max_value\":\"\"}', 1, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (174, 22, 27, 0, '', 'fieldtype_input_numeric_comments', 'Εκτίμηση Ωρών Εργασίας', '', 0, '', '', 0, '', '', 0, '', '{\"number_format\":\"2\\/.\\/*\",\"default_value\":\"\",\"prefix\":\"\",\"suffix\":\"\"}', 2, 1, 8, 1, 2);
INSERT INTO `app_fields` VALUES (175, 22, 27, 0, '', 'fieldtype_input_date', 'Ημ/νία Έναρξης', '', 0, '', '', 0, '', '', 0, '', '{\"date_format\":\"\",\"default_value\":\"\",\"min_date\":\"\",\"max_date\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\",\"background\":\"\",\"day_before_date\":\"\",\"day_before_date_color\":\"\",\"day_before_date2\":\"\",\"day_before_date2_color\":\"\",\"disable_color_by_field\":\"\"}', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (176, 22, 27, 0, '', 'fieldtype_input_date', 'Ημ/νία Λήξης', '', 0, '', '', 0, '', '', 0, '', '{\"date_format\":\"\",\"default_value\":\"\",\"min_date\":\"\",\"max_date\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\",\"background\":\"\",\"day_before_date\":\"\",\"day_before_date_color\":\"\",\"day_before_date2\":\"\",\"day_before_date2_color\":\"\",\"disable_color_by_field\":\"\"}', 4, 1, 9, 0, 0);
INSERT INTO `app_fields` VALUES (177, 22, 26, 0, '', 'fieldtype_entity', 'Αρχεία Εργασίας', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"34\",\"display_as\":\"dropdown_muliple\",\"default_text\":\"\",\"default_value\":\"\",\"width\":\"input-small\",\"fields_in_popup\":\"\"}', 7, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (178, 23, 28, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (179, 23, 28, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (180, 23, 28, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (181, 23, 28, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (182, 23, 28, 0, '', 'fieldtype_grouped_users', 'Department', '', 0, '', '', 0, '', '', 1, '', '', 0, 1, 4, 1, 0);
INSERT INTO `app_fields` VALUES (183, 23, 28, 0, '', 'fieldtype_dropdown', 'Type', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\"}', 2, 1, 2, 1, 1);
INSERT INTO `app_fields` VALUES (184, 23, 28, 0, '', 'fieldtype_input', 'Subject', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 3, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (185, 23, 28, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 4, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (186, 23, 28, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\"}', 1, 1, 5, 1, 2);
INSERT INTO `app_fields` VALUES (187, 24, 29, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (188, 24, 29, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (189, 24, 29, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (190, 24, 29, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (191, 24, 29, 0, '', 'fieldtype_input', 'Name', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 1, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (192, 24, 29, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 2, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (193, 24, 29, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-medium\"}', 0, 1, 2, 1, 0);
INSERT INTO `app_fields` VALUES (194, 23, 28, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 5, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (195, 24, 29, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (196, 1, 1, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0);
INSERT INTO `app_fields` VALUES (197, 21, 24, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0);
INSERT INTO `app_fields` VALUES (198, 22, 26, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0);
INSERT INTO `app_fields` VALUES (199, 23, 28, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0);
INSERT INTO `app_fields` VALUES (200, 24, 29, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0);
INSERT INTO `app_fields` VALUES (201, 1, 1, 0, '', 'fieldtype_user_last_login_date', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (202, 1, 1, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (203, 21, 24, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (204, 22, 26, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (205, 23, 28, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (206, 24, 29, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (305, 33, 43, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (306, 33, 43, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 1, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (307, 33, 43, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (308, 33, 43, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 8, 0, 0);
INSERT INTO `app_fields` VALUES (309, 33, 43, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 9, 0, 0);
INSERT INTO `app_fields` VALUES (310, 33, 43, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', 0, '', '', 5, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (311, 34, 44, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (312, 34, 44, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 1, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (313, 34, 44, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (314, 34, 44, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (315, 34, 44, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (316, 34, 44, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', 0, '', '', 5, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (317, 35, 45, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (318, 35, 45, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 1, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (319, 35, 45, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (320, 35, 45, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (321, 35, 45, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (322, 35, 45, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', 0, '', '', 5, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (324, 21, 24, 0, '', 'fieldtype_input_url', 'Φάκελος Αρχείων', '', 0, '', '', 0, '', '', 0, '', '{\"target\":\"_blank\",\"preview_text\":\"\",\"prefix\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 1, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (325, 33, 43, 0, '', 'fieldtype_input', 'Γραφείο', '', 1, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 0, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (326, 33, 43, 0, '', 'fieldtype_input', 'email', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 1, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (327, 33, 43, 0, '', 'fieldtype_input', 'Διεύθυνση', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 2, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (328, 33, 43, 0, '', 'fieldtype_input', 'Τηλέφωνο', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-small\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 3, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (329, 33, 46, 0, '', 'fieldtype_input', 'Επώνυμο', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 0, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (330, 33, 46, 0, '', 'fieldtype_input', 'Όνομα', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 1, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (331, 33, 47, 0, '', 'fieldtype_entity_ajax', 'Εργασίες ΣΔΠ', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"21\",\"width\":\"input-xlarge\",\"display_as\":\"dropdown_multiple\",\"default_text\":\"\",\"default_value\":\"\",\"heading_template\":\"\",\"copy_values\":\"\",\"mysql_query_where\":\"\"}', 0, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (332, 21, 24, 0, '', 'fieldtype_input', 'Τίτλος Έργου/Δράσης', '', 1, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 0, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (333, 21, 24, 0, '', 'fieldtype_entity_ajax', 'Είδος Δράσης', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"36\",\"width\":\"input-xlarge\",\"display_as\":\"dropdown\",\"default_text\":\"\",\"default_value\":\"\",\"heading_template\":\"\",\"copy_values\":\"\",\"mysql_query_where\":\"\"}', 4, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (334, 21, 24, 0, '', 'fieldtype_entity', 'Γραφεία ΟΕΥ', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"33\",\"display_as\":\"dropdown\",\"default_text\":\"\",\"default_value\":\"\",\"width\":\"input-large\",\"fields_in_popup\":\"\"}', 5, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (335, 36, 48, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (336, 36, 48, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 1, 1, 8, 0, 0);
INSERT INTO `app_fields` VALUES (337, 36, 48, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 9, 0, 0);
INSERT INTO `app_fields` VALUES (338, 36, 48, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 10, 0, 0);
INSERT INTO `app_fields` VALUES (339, 36, 48, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 11, 0, 0);
INSERT INTO `app_fields` VALUES (340, 36, 48, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', 0, '', '', 5, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (341, 36, 48, 0, '', 'fieldtype_input', 'ΤΙΤΛΟΣ ΔΙΑΔΙΚΑΣΙΑΣ', '', 1, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 6, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (342, 36, 48, 0, '', 'fieldtype_input', 'ΟΡΓΑΝΩΤΙΚΟ ΤΜΗΜΑ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 7, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (343, 36, 48, 0, '', 'fieldtype_input', 'ΚΩΔΙΚΟΣ ΔΙΑΔΙΚΑΣΙΑΣ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 8, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (344, 36, 48, 0, '', 'fieldtype_input', 'ΕΚΔΟΣΗ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 9, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (345, 36, 48, 0, '', 'fieldtype_input_date', 'ΗΜΕΡΟΜΗΝΙΑ ΕΚΔΟΣΗΣ', '', 0, '', '', 0, '', '', 0, '', '{\"date_format\":\"\",\"default_value\":\"\",\"min_date\":\"\",\"max_date\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\",\"background\":\"\",\"day_before_date\":\"\",\"day_before_date_color\":\"\",\"day_before_date2\":\"\",\"day_before_date2_color\":\"\",\"disable_color_by_field\":\"\"}', 10, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (346, 36, 48, 0, '', 'fieldtype_input', 'ΣΥΝΤΑΚΤΗΣ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 11, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (347, 36, 50, 0, '', 'fieldtype_input_file', 'Αρχείο 1', '', 0, '', '', 0, '', '', 0, '', '{\"allowed_extensions\":\"\"}', 1, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (348, 36, 50, 0, '', 'fieldtype_input_file', 'Αρχείο 2', '', 0, '', '', 0, '', '', 0, '', '{\"allowed_extensions\":\"\"}', 2, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (349, 36, 50, 0, '', 'fieldtype_input_url', 'Φάκελος Αρχείων', '', 0, '', '', 0, '', '', 0, '', '{\"target\":\"_blank\",\"preview_text\":\"\",\"prefix\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 3, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (350, 34, 44, 0, '', 'fieldtype_input', 'Τίτλος Αρχείου', '', 1, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 6, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (351, 34, 44, 0, '', 'fieldtype_input_url', 'URL Αρχείων', '', 0, '', '', 0, '', '', 0, '', '{\"target\":\"_blank\",\"preview_text\":\"\",\"prefix\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 7, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (352, 21, 24, 0, '', 'fieldtype_entity_ajax', 'Αρχεία ΣΔΠ', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"34\",\"width\":\"input-xlarge\",\"display_as\":\"dropdown\",\"default_text\":\"\",\"default_value\":\"\",\"display_as_link\":\"1\",\"fields_in_popup\":[\"351\"],\"fields_for_search\":[\"350\"],\"heading_template\":\"[350]\",\"copy_values\":\"\",\"mysql_query_where\":\"\"}', 6, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (353, 35, 45, 0, '', 'fieldtype_input', 'Τίτλος Αρχείου', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-xlarge\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 6, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (354, 35, 45, 0, '', 'fieldtype_input_file', 'Αρχείο', '', 0, '', '', 0, '', '', 0, '', '{\"allowed_extensions\":\"\"}', 7, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (355, 35, 45, 0, '', 'fieldtype_input_url', 'URL Αρχείων', '', 0, '', '', 0, '', '', 0, '', '{\"target\":\"_blank\",\"preview_text\":\"\",\"prefix\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 8, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (356, 22, 51, 0, '', 'fieldtype_input', 'ΧΩΡΑ ΔΙΑΠΙΣΤΕΥΣΗΣ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 1, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (357, 22, 51, 0, '', 'fieldtype_input', 'ΠΡΟΪΟΝ ΠΟΠ/ΠΓΕ ΗΗ ΣΗΜΑ ΠΟΥ ΠΑΡΑΒΙΑΖΕΤΑΙ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 2, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (358, 22, 51, 0, '', 'fieldtype_input', 'ΧΩΡΑ ΠΡΟΕΛΕΥΣΗΣ/ ΠΑΡΑΓΩΓΗΣ ΠΡΟΪΟΝΤΟΣ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 3, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (359, 22, 51, 0, '', 'fieldtype_input', ' Ε12 Παραβιάσεις ΠΟΠ-ΠΓΕ-Εμπορικά Σήματα (vs-1) Ε12 Παραβιάσεις ΠΟΠ-ΠΓΕ-Εμπορικά Σήματα (vs-1) 100% 11      	 ΕΜΠΟΡΙΚΟ ΟΝΟΜΑ ΠΡΟΪΟΝΤΟΣ/ΣΗΜΑ Ενεργοποίηση υποστήριξης αναγνώστη οθόνης Για να ενεργοποιήσετε την υποστήριξη ανάγνωσης οθόνης, πατήστε Ctrl+Alt+Z', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 4, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (360, 22, 51, 0, '', 'fieldtype_input', 'ΕΤΑΙΡΕΙΑ', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 5, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (361, 22, 51, 0, '', 'fieldtype_input', 'ΣΥΣΤΑΣΗ ΠΡΟΪΟΝΤΟΣ (αφορά κυρίως τα τυριά, αναφορά σε είδος γάλακτος)', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 6, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (362, 22, 26, 0, '', 'fieldtype_entity_ajax', 'Είδος εργασίας', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"36\",\"width\":\"input-xlarge\",\"display_as\":\"dropdown\",\"default_text\":\"\",\"default_value\":\"\",\"heading_template\":\"\",\"copy_values\":\"\",\"mysql_query_where\":\"\"}', 8, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (363, 33, 52, 0, '', 'fieldtype_input_numeric', 'Προυπολογισμός Έτους', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"number_format\":\"2\\/.\\/*\",\"is_unique\":\"0\",\"unique_error_msg\":\"\",\"default_value\":\"\",\"prefix\":\"\",\"suffix\":\"\",\"min_value\":\"\",\"max_value\":\"\"}', 1, 0, 0, 0, 0);
INSERT INTO `app_fields` VALUES (364, 37, 53, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0);
INSERT INTO `app_fields` VALUES (365, 37, 53, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 1, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (366, 37, 53, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 6, 0, 0);
INSERT INTO `app_fields` VALUES (367, 37, 53, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 7, 0, 0);
INSERT INTO `app_fields` VALUES (368, 37, 53, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 8, 0, 0);
INSERT INTO `app_fields` VALUES (369, 37, 53, 0, '', 'fieldtype_parent_item_id', '', '', 0, '', '', 0, '', '', 0, '', '', 5, 1, 5, 0, 0);
INSERT INTO `app_fields` VALUES (370, 37, 53, 0, '', 'fieldtype_input', 'Όνομα Επαφής', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"1\",\"unique_error_msg\":\"\"}', 6, 1, 4, 0, 0);
INSERT INTO `app_fields` VALUES (371, 37, 53, 0, '', 'fieldtype_input', 'email', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"1\",\"unique_error_msg\":\"\"}', 7, 1, 1, 0, 0);
INSERT INTO `app_fields` VALUES (372, 37, 53, 0, '', 'fieldtype_input', 'Τηλέφωνο', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-large\",\"default_value\":\"\",\"is_unique\":\"0\",\"unique_error_msg\":\"\"}', 8, 1, 2, 0, 0);
INSERT INTO `app_fields` VALUES (373, 37, 53, 0, '', 'fieldtype_entity_ajax', 'Γραφεία ΟΕΥ', '', 0, '', '', 0, '', '', 0, '', '{\"entity_id\":\"33\",\"width\":\"input-xlarge\",\"display_as\":\"dropdown\",\"default_text\":\"\",\"default_value\":\"\",\"heading_template\":\"\",\"copy_values\":\"\",\"mysql_query_where\":\"\"}', 9, 1, 3, 0, 0);
INSERT INTO `app_fields` VALUES (374, 37, 54, 0, '', 'fieldtype_input_file', 'Βιογραφικό', '', 0, '', '', 0, '', '', 0, '', '{\"allowed_extensions\":\"\"}', 1, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for app_fields_access
-- ----------------------------
DROP TABLE IF EXISTS `app_fields_access`;
CREATE TABLE `app_fields_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_groups_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `access_schema` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_access_groups_id`(`access_groups_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_fields_access
-- ----------------------------

-- ----------------------------
-- Table structure for app_fields_choices
-- ----------------------------
DROP TABLE IF EXISTS `app_fields_choices`;
CREATE TABLE `app_fields_choices`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `fields_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  `bg_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_fields_choices
-- ----------------------------
INSERT INTO `app_fields_choices` VALUES (42, 0, 167, 1, 'Task', 1, '', 1, '', '', '');
INSERT INTO `app_fields_choices` VALUES (43, 0, 167, 1, 'Change', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (44, 0, 167, 1, 'Bug', 0, '#ff7a00', 3, '', '', '');
INSERT INTO `app_fields_choices` VALUES (45, 0, 167, 1, 'Idea', 0, '', 0, '', '', '');
INSERT INTO `app_fields_choices` VALUES (46, 0, 169, 1, 'New', 1, '', 0, '', '', '');
INSERT INTO `app_fields_choices` VALUES (47, 0, 169, 1, 'Open', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (48, 0, 169, 1, 'Waiting', 0, '', 3, '', '', '');
INSERT INTO `app_fields_choices` VALUES (49, 0, 169, 1, 'Done', 0, '', 4, '', '', '');
INSERT INTO `app_fields_choices` VALUES (50, 0, 169, 1, 'Closed', 0, '', 5, '', '', '');
INSERT INTO `app_fields_choices` VALUES (51, 0, 169, 1, 'Paid', 0, '', 6, '', '', '');
INSERT INTO `app_fields_choices` VALUES (52, 0, 169, 1, 'Canceled', 0, '', 7, '', '', '');
INSERT INTO `app_fields_choices` VALUES (53, 0, 170, 1, 'Urgent', 0, '#ff0000', 1, '', '', '');
INSERT INTO `app_fields_choices` VALUES (54, 0, 170, 1, 'High', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (55, 0, 170, 1, 'Medium', 1, '', 3, '', '', '');
INSERT INTO `app_fields_choices` VALUES (56, 0, 182, 1, 'Support', 0, '', 0, '', '', '');
INSERT INTO `app_fields_choices` VALUES (57, 0, 183, 1, 'Request a Change', 0, '', 1, '', '', '');
INSERT INTO `app_fields_choices` VALUES (58, 0, 183, 1, 'Report a Bug', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (59, 0, 183, 1, 'Ask a Question', 0, '', 3, '', '', '');
INSERT INTO `app_fields_choices` VALUES (60, 0, 186, 1, 'New', 1, '', 0, '', '', '');
INSERT INTO `app_fields_choices` VALUES (61, 0, 186, 1, 'Open', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (62, 0, 186, 1, 'Waiting On Client', 0, '', 3, '', '', '');
INSERT INTO `app_fields_choices` VALUES (63, 0, 186, 1, 'Closed', 0, '', 4, '', '', '');
INSERT INTO `app_fields_choices` VALUES (64, 0, 186, 1, 'Canceled', 0, '', 5, '', '', '');
INSERT INTO `app_fields_choices` VALUES (65, 0, 193, 1, 'Open', 0, '', 1, '', '', '');
INSERT INTO `app_fields_choices` VALUES (66, 0, 193, 1, 'Closed', 0, '', 2, '', '', '');
INSERT INTO `app_fields_choices` VALUES (67, 0, 193, 1, 'New', 1, '', 0, '', '', '');
INSERT INTO `app_fields_choices` VALUES (109, 0, 167, 1, 'Παραβίαση ΠΟΠ', 0, '', 0, '', '', '');

-- ----------------------------
-- Table structure for app_filters_panels
-- ----------------------------
DROP TABLE IF EXISTS `app_filters_panels`;
CREATE TABLE `app_filters_panels`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_active_filters` tinyint(1) NOT NULL,
  `position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` tinyint(1) NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_filters_panels
-- ----------------------------

-- ----------------------------
-- Table structure for app_filters_panels_fields
-- ----------------------------
DROP TABLE IF EXISTS `app_filters_panels_fields`;
CREATE TABLE `app_filters_panels_fields`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `panels_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `height` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `search_type_match` tinyint(1) NOT NULL,
  `exclude_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exclude_values_not_in_listing` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_panels_id`(`panels_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_filters_panels_fields
-- ----------------------------

-- ----------------------------
-- Table structure for app_forms_fields_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_forms_fields_rules`;
CREATE TABLE `app_forms_fields_rules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visible_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hidden_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_forms_fields_rules
-- ----------------------------
INSERT INTO `app_forms_fields_rules` VALUES (2, 22, 167, 1, '109', '356,357,358,359,360,361', '', 0);

-- ----------------------------
-- Table structure for app_forms_rows
-- ----------------------------
DROP TABLE IF EXISTS `app_forms_rows`;
CREATE TABLE `app_forms_rows`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `forms_tabs_id` int NOT NULL,
  `columns` tinyint NOT NULL,
  `column1_width` tinyint NOT NULL,
  `column2_width` tinyint NOT NULL,
  `column3_width` tinyint NOT NULL,
  `column4_width` tinyint NOT NULL,
  `column5_width` tinyint NOT NULL,
  `column6_width` tinyint NOT NULL,
  `field_name_new_row` tinyint(1) NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `forms_tabs_id`(`forms_tabs_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_forms_rows
-- ----------------------------

-- ----------------------------
-- Table structure for app_forms_tabs
-- ----------------------------
DROP TABLE IF EXISTS `app_forms_tabs`;
CREATE TABLE `app_forms_tabs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `parent_id` int NOT NULL DEFAULT 0,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_forms_tabs
-- ----------------------------
INSERT INTO `app_forms_tabs` VALUES (1, 1, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (24, 21, 0, 0, 'Στοιχεία Έργου-Δράσης', '', 0);
INSERT INTO `app_forms_tabs` VALUES (25, 21, 0, 0, 'Ομάδα Παρακολούθησης-Διαχείρισης', '', 5);
INSERT INTO `app_forms_tabs` VALUES (26, 22, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (27, 22, 0, 0, 'Time', '', 1);
INSERT INTO `app_forms_tabs` VALUES (28, 23, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (29, 24, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (43, 33, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (44, 34, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (45, 35, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (46, 33, 0, 0, 'Προιστάμενος', '', 1);
INSERT INTO `app_forms_tabs` VALUES (47, 33, 0, 0, 'Εργασίες ΣΔΠ', '', 2);
INSERT INTO `app_forms_tabs` VALUES (48, 36, 0, 0, 'Πληροφορίες Διαδικασίας', '', 0);
INSERT INTO `app_forms_tabs` VALUES (50, 36, 0, 0, 'Αρχεία Διαδικασίας', '', 1);
INSERT INTO `app_forms_tabs` VALUES (51, 22, 0, 0, 'Παραβίαση ΠΟΠ', '', 2);
INSERT INTO `app_forms_tabs` VALUES (52, 33, 0, 0, 'Οικονομικά', '', 3);
INSERT INTO `app_forms_tabs` VALUES (53, 37, 0, 0, 'Info', '', 0);
INSERT INTO `app_forms_tabs` VALUES (54, 37, 0, 0, 'Στοιχεία Βιογραφικού', '', 1);

-- ----------------------------
-- Table structure for app_global_lists
-- ----------------------------
DROP TABLE IF EXISTS `app_global_lists`;
CREATE TABLE `app_global_lists`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_global_lists
-- ----------------------------
INSERT INTO `app_global_lists` VALUES (1, 'Κατάσταση Έργου', '');

-- ----------------------------
-- Table structure for app_global_lists_choices
-- ----------------------------
DROP TABLE IF EXISTS `app_global_lists_choices`;
CREATE TABLE `app_global_lists_choices`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `lists_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  `bg_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NULL DEFAULT NULL,
  `users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_lists_id`(`lists_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_global_lists_choices
-- ----------------------------

-- ----------------------------
-- Table structure for app_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `app_global_vars`;
CREATE TABLE `app_global_vars`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `is_folder` tinyint(1) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_global_vars
-- ----------------------------

-- ----------------------------
-- Table structure for app_help_pages
-- ----------------------------
DROP TABLE IF EXISTS `app_help_pages`;
CREATE TABLE `app_help_pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `created_by` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` int NOT NULL,
  `end_date` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_help_pages
-- ----------------------------

-- ----------------------------
-- Table structure for app_holidays
-- ----------------------------
DROP TABLE IF EXISTS `app_holidays`;
CREATE TABLE `app_holidays`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for app_image_map_labels
-- ----------------------------
DROP TABLE IF EXISTS `app_image_map_labels`;
CREATE TABLE `app_image_map_labels`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `choices_id` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_map_id`(`map_id` ASC) USING BTREE,
  INDEX `idx_choices_id`(`choices_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_image_map_labels
-- ----------------------------

-- ----------------------------
-- Table structure for app_image_map_markers
-- ----------------------------
DROP TABLE IF EXISTS `app_image_map_markers`;
CREATE TABLE `app_image_map_markers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `map_id` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_map_id`(`map_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_image_map_markers
-- ----------------------------

-- ----------------------------
-- Table structure for app_image_map_markers_nested
-- ----------------------------
DROP TABLE IF EXISTS `app_image_map_markers_nested`;
CREATE TABLE `app_image_map_markers_nested`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_image_map_markers_nested
-- ----------------------------

-- ----------------------------
-- Table structure for app_items_export_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_items_export_templates`;
CREATE TABLE `app_items_export_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `users_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `templates_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cidx`(`entities_id` ASC, `users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_items_export_templates
-- ----------------------------
INSERT INTO `app_items_export_templates` VALUES (1, 22, 1, 'Export ΠΟΠ', '198,164,165,166,167,168,204,169,170,171,177,362,356,357,358,359,360,361,url', 1);

-- ----------------------------
-- Table structure for app_listing_highlight_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_listing_highlight_rules`;
CREATE TABLE `app_listing_highlight_rules`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `entities_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `fields_id` int UNSIGNED NOT NULL,
  `fields_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bg_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_listing_highlight_rules
-- ----------------------------
INSERT INTO `app_listing_highlight_rules` VALUES (2, 25, 1, 253, '80', '#F44336', 0, '');

-- ----------------------------
-- Table structure for app_listing_sections
-- ----------------------------
DROP TABLE IF EXISTS `app_listing_sections`;
CREATE TABLE `app_listing_sections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `listing_types_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_as` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `display_field_names` tinyint(1) NOT NULL,
  `text_align` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_listing_types_id`(`listing_types_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_listing_sections
-- ----------------------------

-- ----------------------------
-- Table structure for app_listing_types
-- ----------------------------
DROP TABLE IF EXISTS `app_listing_types`;
CREATE TABLE `app_listing_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_default` tinyint NOT NULL,
  `width` smallint NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_listing_types
-- ----------------------------
INSERT INTO `app_listing_types` VALUES (1, 25, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (2, 25, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (3, 25, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (4, 25, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (5, 25, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (6, 28, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (7, 28, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (8, 28, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (9, 28, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (10, 28, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (11, 29, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (12, 29, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (13, 29, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (14, 29, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (15, 29, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (16, 33, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (17, 33, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (18, 33, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (19, 33, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (20, 33, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (21, 21, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (22, 21, 'tree_table', 1, 0, 0, '{\"heading_width_based_content\":\"0\",\"change_col_width_in_listing\":\"0\",\"editable_fields_in_listing\":\"0\",\"display_nested_records\":\"\"}');
INSERT INTO `app_listing_types` VALUES (23, 21, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (24, 21, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (25, 21, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (26, 36, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (27, 36, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (28, 36, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (29, 36, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (30, 36, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (31, 34, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (32, 34, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (33, 34, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (34, 34, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (35, 34, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (36, 22, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (37, 22, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (38, 22, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (39, 22, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (40, 22, 'mobile', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (41, 37, 'table', 1, 1, 0, '');
INSERT INTO `app_listing_types` VALUES (42, 37, 'tree_table', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (43, 37, 'list', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (44, 37, 'grid', 0, 0, 0, '');
INSERT INTO `app_listing_types` VALUES (45, 37, 'mobile', 0, 0, 0, '');

-- ----------------------------
-- Table structure for app_logs
-- ----------------------------
DROP TABLE IF EXISTS `app_logs`;
CREATE TABLE `app_logs`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `log_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` int NOT NULL,
  `http_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_ajax` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seconds` decimal(11, 4) NOT NULL,
  `errno` int UNSIGNED NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linenum` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_date_added`(`date_added` ASC) USING BTREE,
  INDEX `idx_ip_address`(`ip_address` ASC) USING BTREE,
  INDEX `idx_log_type`(`log_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_logs
-- ----------------------------

-- ----------------------------
-- Table structure for app_mind_map
-- ----------------------------
DROP TABLE IF EXISTS `app_mind_map`;
CREATE TABLE `app_mind_map`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `items_id` int NULL DEFAULT NULL,
  `fields_id` int NULL DEFAULT NULL,
  `reports_id` int NULL DEFAULT NULL,
  `mm_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_layout` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_shape` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_side` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_collapsed` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_items_id` int NULL DEFAULT 0,
  `parent_entity_item_id` int NOT NULL DEFAULT 0,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_mind_map
-- ----------------------------
INSERT INTO `app_mind_map` VALUES (1, 21, NULL, NULL, 1, 'root', '', 'Start', 'map', '', '', '', '', '', '', 0, 0, 0);
INSERT INTO `app_mind_map` VALUES (3, 21, NULL, NULL, 1, '3', 'root', 'Δοκιμαστική Διαδικασία Λονδίνο', 'graph-right', '', 'right', '#999', '', '', '', 3, 0, 0);
INSERT INTO `app_mind_map` VALUES (4, 21, NULL, NULL, 1, '4', 'root', 'Δοκιμαστική Διαδικασία 2 Ντουπάι', '', '', 'left', '#999', '', '', '', 4, 0, 1);
INSERT INTO `app_mind_map` VALUES (5, 21, NULL, NULL, 1, '5', 'root', 'Ετήσιος Απολογισμός Λονδίνου', '', '', 'right', '#999', '', '', '', 5, 0, 2);

-- ----------------------------
-- Table structure for app_nested_entities_menu
-- ----------------------------
DROP TABLE IF EXISTS `app_nested_entities_menu`;
CREATE TABLE `app_nested_entities_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_nested_entities_menu
-- ----------------------------

-- ----------------------------
-- Table structure for app_portlets
-- ----------------------------
DROP TABLE IF EXISTS `app_portlets`;
CREATE TABLE `app_portlets`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_id` int NOT NULL,
  `is_collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name` ASC, `users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_portlets
-- ----------------------------
INSERT INTO `app_portlets` VALUES (1, 'filters_preview_68', 1, 0);
INSERT INTO `app_portlets` VALUES (2, 'filters_preview_72', 1, 0);
INSERT INTO `app_portlets` VALUES (3, 'dashboard_standard_report76', 1, 0);
INSERT INTO `app_portlets` VALUES (4, 'filters_preview_67', 1, 1);
INSERT INTO `app_portlets` VALUES (5, 'item_info_5', 1, 0);
INSERT INTO `app_portlets` VALUES (6, 'filters_preview_82', 1, 1);
INSERT INTO `app_portlets` VALUES (7, 'filters_preview_66', 1, 1);
INSERT INTO `app_portlets` VALUES (8, 'filters_preview_97', 1, 0);
INSERT INTO `app_portlets` VALUES (9, 'dashboard_standard_report109', 1, 1);
INSERT INTO `app_portlets` VALUES (10, 'dashboard_standard_report102', 1, 0);

-- ----------------------------
-- Table structure for app_records_visibility_rules
-- ----------------------------
DROP TABLE IF EXISTS `app_records_visibility_rules`;
CREATE TABLE `app_records_visibility_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merged_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merged_fields_empty_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mysql_query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `php_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_records_visibility_rules
-- ----------------------------

-- ----------------------------
-- Table structure for app_reports
-- ----------------------------
DROP TABLE IF EXISTS `app_reports`;
CREATE TABLE `app_reports`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT 0,
  `entities_id` int NOT NULL,
  `created_by` int NOT NULL,
  `reports_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bg_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL DEFAULT 0,
  `in_dashboard` tinyint NOT NULL DEFAULT 0,
  `in_dashboard_counter` tinyint(1) NOT NULL DEFAULT 0,
  `in_dashboard_icon` tinyint(1) NOT NULL,
  `in_dashboard_counter_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_dashboard_counter_bg_color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_dashboard_counter_fields` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dashboard_counter_hide_count` tinyint(1) NOT NULL DEFAULT 0,
  `dashboard_counter_hide_zero_count` tinyint(1) NOT NULL,
  `dashboard_counter_sum_by_field` int NOT NULL,
  `in_header` tinyint(1) NOT NULL DEFAULT 0,
  `in_header_autoupdate` tinyint(1) NOT NULL,
  `dashboard_sort_order` int NULL DEFAULT NULL,
  `header_sort_order` int NOT NULL DEFAULT 0,
  `dashboard_counter_sort_order` int NOT NULL DEFAULT 0,
  `listing_order_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `displays_assigned_only` tinyint(1) NOT NULL DEFAULT 0,
  `parent_entity_id` int NOT NULL DEFAULT 0,
  `parent_item_id` int NOT NULL DEFAULT 0,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rows_per_page` int NOT NULL DEFAULT 0,
  `notification_days` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notification_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_col_width` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_parent_entity_id`(`parent_entity_id` ASC) USING BTREE,
  INDEX `idx_parent_item_id`(`parent_item_id` ASC) USING BTREE,
  INDEX `idx_reports_type`(`reports_type` ASC) USING BTREE,
  INDEX `idx_in_dashboard`(`in_dashboard` ASC) USING BTREE,
  INDEX `idx_in_dashboard_counter`(`in_dashboard_counter` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_reports
-- ----------------------------
INSERT INTO `app_reports` VALUES (59, 0, 21, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (61, 0, 22, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (63, 0, 23, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (67, 0, 21, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', 'table', '');
INSERT INTO `app_reports` VALUES (71, 0, 1, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (75, 0, 21, 0, 'related_items_228', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '158', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (96, 0, 33, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (97, 0, 34, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (98, 0, 33, 1, 'standard', 'Ενεργά Γραφεία ΟΕΥ', '', '', '', '', 0, 0, 1, 1, '', '', '', 0, 0, 0, 1, 1, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', 'table', '');
INSERT INTO `app_reports` VALUES (99, 0, 22, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 3, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (100, 0, 35, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 3, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (101, 0, 36, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (102, 0, 21, 1, 'standard', 'Ενεργές Διαδικασίες', '', '', '', '', 0, 1, 1, 0, '', '', '', 0, 0, 0, 1, 1, NULL, 0, 0, '332_asc', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (103, 0, 24, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 3, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (104, 0, 23, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 3, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (105, 0, 36, 1, 'standard', 'Βιβλιοθήκη Διαδικασίων', '', '', '', '', 0, 0, 1, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (106, 0, 22, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 4, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (107, 0, 34, 0, 'entityfield352', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (108, 0, 35, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 4, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (109, 110, 22, 1, 'standard', 'Εργασίες σε Εξέλιξη', '', '', '', '', 0, 1, 1, 0, '', '', '', 0, 0, 0, 1, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (110, 0, 21, 1, 'parent', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (111, 0, 27, 1, 'report_page1', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (112, 113, 22, 1, 'report_page2', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (113, 0, 21, 1, 'parent', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (114, 0, 34, 1, 'process2', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (115, 116, 22, 1, 'entity_menu', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (116, 0, 21, 1, 'parent', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (117, 0, 21, 1, 'default_pivot_tables1', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (118, 119, 22, 1, 'default_pivot_tables1', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (119, 0, 21, 1, 'parent', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (120, 0, 21, 1, 'form_add_in22', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (121, 122, 22, 1, 'graphicreport1', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (122, 0, 21, 1, 'parent', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (123, 0, 22, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 5, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (124, 0, 24, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 21, 4, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (125, 0, 37, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (126, 0, 37, 1, 'process3', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');
INSERT INTO `app_reports` VALUES (127, 0, 1, 1, 'report_page3', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');

-- ----------------------------
-- Table structure for app_reports_filters
-- ----------------------------
DROP TABLE IF EXISTS `app_reports_filters`;
CREATE TABLE `app_reports_filters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `filters_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filters_condition` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_reports_filters
-- ----------------------------
INSERT INTO `app_reports_filters` VALUES (70, 61, 169, '46,47,48', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (72, 63, 186, '60,61,62', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (80, 99, 169, '46,47,48', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (81, 104, 186, '60,61,62', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (82, 106, 169, '46,47,48', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (83, 115, 169, '46,47,48', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (84, 123, 169, '46,47,48', 'include', 1);
INSERT INTO `app_reports_filters` VALUES (85, 112, 169, '47', 'include', 1);

-- ----------------------------
-- Table structure for app_reports_filters_templates
-- ----------------------------
DROP TABLE IF EXISTS `app_reports_filters_templates`;
CREATE TABLE `app_reports_filters_templates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fields_id` int NOT NULL,
  `users_id` int NOT NULL,
  `filters_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filters_condition` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cidx`(`fields_id` ASC, `users_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_reports_filters_templates
-- ----------------------------

-- ----------------------------
-- Table structure for app_reports_groups
-- ----------------------------
DROP TABLE IF EXISTS `app_reports_groups`;
CREATE TABLE `app_reports_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bg_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `in_dashboard` tinyint(1) NOT NULL,
  `sort_order` smallint NOT NULL,
  `counters_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reports_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int NOT NULL,
  `is_common` tinyint(1) NOT NULL DEFAULT 0,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_reports_groups
-- ----------------------------

-- ----------------------------
-- Table structure for app_reports_sections
-- ----------------------------
DROP TABLE IF EXISTS `app_reports_sections`;
CREATE TABLE `app_reports_sections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `count_columns` tinyint(1) NOT NULL DEFAULT 2,
  `reports_groups_id` int NOT NULL,
  `report_left` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `report_right` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` smallint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_groups_id`(`reports_groups_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_reports_sections
-- ----------------------------
INSERT INTO `app_reports_sections` VALUES (1, 1, 2, 0, 'calendar_personal', 'calendar_public', 0);
INSERT INTO `app_reports_sections` VALUES (2, 1, 2, 1, 'standard82', '', 0);

-- ----------------------------
-- Table structure for app_sessions
-- ----------------------------
DROP TABLE IF EXISTS `app_sessions`;
CREATE TABLE `app_sessions`  (
  `sesskey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiry` bigint UNSIGNED NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`sesskey`) USING BTREE,
  INDEX `idx_expiry`(`expiry` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_sessions
-- ----------------------------
INSERT INTO `app_sessions` VALUES ('ruhjuijn53tdb4clm37eq8jf3b', 1699891603, 'uploadify_attachments|a:0:{}uploadify_attachments_queue|a:0:{}alerts|O:6:\"alerts\":1:{s:8:\"messages\";a:0:{}}app_send_to|N;app_session_token|s:10:\"yHwF5corha\";app_current_users_filter|a:0:{}app_previously_logged_user|i:0;two_step_verification_info|a:0:{}app_email_verification_code|s:0:\"\";app_force_print_template|N;app_current_version|s:5:\"3.4.4\";app_selected_items|a:2:{i:102;a:0:{}i:109;a:0:{}}listing_page_keeper|a:0:{}user_roles_dropdown_change_holder|a:0:{}app_subentity_form_items|a:0:{}app_subentity_form_items_deleted|a:0:{}app_calendar_reminder|O:17:\"calendar_reminder\":4:{s:25:\"\0calendar_reminder\0events\";b:0;s:26:\"\0calendar_reminder\0reports\";a:0:{}s:29:\"\0calendar_reminder\0check_time\";s:16:\"2023-11-13 17:39\";s:31:\"\0calendar_reminder\0remind_later\";a:0:{}}plugin_ext_current_version|s:0:\"\";app_logged_users_id|s:1:\"1\";processes_filter|i:0;report_page_filter|i:0;');

-- ----------------------------
-- Table structure for app_user_filters_values
-- ----------------------------
DROP TABLE IF EXISTS `app_user_filters_values`;
CREATE TABLE `app_user_filters_values`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `filters_id` int NOT NULL,
  `reports_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `filters_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `filters_condition` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_filters_id`(`filters_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_filters_values
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `app_user_roles`;
CREATE TABLE `app_user_roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `entities_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_roles_access
-- ----------------------------
DROP TABLE IF EXISTS `app_user_roles_access`;
CREATE TABLE `app_user_roles_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_roles_id` int NOT NULL,
  `fields_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `access_schema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comments_access` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE,
  INDEX `idx_user_roles_id`(`user_roles_id` ASC) USING BTREE,
  INDEX `entities_id`(`entities_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_roles_access
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_roles_to_items
-- ----------------------------
DROP TABLE IF EXISTS `app_user_roles_to_items`;
CREATE TABLE `app_user_roles_to_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `fields_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `users_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_roles_id`(`roles_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_fields_id`(`fields_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_roles_to_items
-- ----------------------------

-- ----------------------------
-- Table structure for app_users_alerts
-- ----------------------------
DROP TABLE IF EXISTS `app_users_alerts`;
CREATE TABLE `app_users_alerts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `location` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` bigint UNSIGNED NOT NULL,
  `end_date` bigint UNSIGNED NOT NULL,
  `assigned_to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `users_groups` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_alerts
-- ----------------------------
INSERT INTO `app_users_alerts` VALUES (1, 0, 'Ανακοίνωση Διοικητή', '&Alpha;&nu;&alpha;&kappa;&omicron;ί&nu;&omega;&sigma;&eta; &Delta;&iota;&omicron;&iota;&kappa;&eta;&tau;ή&Alpha;&nu;&alpha;&kappa;&omicron;ί&nu;&omega;&sigma;&eta; &Delta;&iota;&omicron;&iota;&kappa;&eta;&tau;ή&Alpha;&nu;&alpha;&kappa;&omicron;ί&nu;&omega;&sigma;&eta; &Delta;&iota;&omicron;&iota;&kappa;&eta;&tau;ή&Alpha;&nu;&alpha;&kappa;&omicron;ί&nu;&omega;&sigma;&eta; &Delta;&iota;&omicron;&iota;&kappa;&eta;&tau;ή&Alpha;&nu;&alpha;&kappa;&omicron;ί&nu;&omega;&sigma;&eta; &Delta;&iota;&omicron;&iota;&kappa;&eta;&tau;ή', 'warning', 'all', 1698354000, 1698440400, '', '', 1);
INSERT INTO `app_users_alerts` VALUES (2, 1, 'Δοκιμαστική Λειτουργία', '&Delta;&omicron;&kappa;&iota;&mu;&alpha;&sigma;&tau;&iota;&kappa;ή &Lambda;&epsilon;&iota;&tau;&omicron;&upsilon;&rho;&gamma;ί&alpha;', 'info', 'dashboard', 1699221600, 1699480800, '', '', 1);

-- ----------------------------
-- Table structure for app_users_alerts_viewed
-- ----------------------------
DROP TABLE IF EXISTS `app_users_alerts_viewed`;
CREATE TABLE `app_users_alerts_viewed`  (
  `users_id` int NOT NULL,
  `alerts_id` int NOT NULL,
  INDEX `idx_ueser_alerts`(`users_id` ASC, `alerts_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_alerts_viewed
-- ----------------------------

-- ----------------------------
-- Table structure for app_users_configuration
-- ----------------------------
DROP TABLE IF EXISTS `app_users_configuration`;
CREATE TABLE `app_users_configuration`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `configuration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `configuration_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_configuration
-- ----------------------------
INSERT INTO `app_users_configuration` VALUES (1, 1, 'hidden_common_reports', '');
INSERT INTO `app_users_configuration` VALUES (2, 1, 'sidebar-status', '');
INSERT INTO `app_users_configuration` VALUES (3, 1, 'disable_notification', '1');
INSERT INTO `app_users_configuration` VALUES (4, 1, 'disable_internal_notification', '');
INSERT INTO `app_users_configuration` VALUES (5, 1, 'disable_highlight_unread', '');
INSERT INTO `app_users_configuration` VALUES (6, 1, 'sidebar-pos-option', '');
INSERT INTO `app_users_configuration` VALUES (7, 1, 'page-scale-option', 'page-scale-reduced');

-- ----------------------------
-- Table structure for app_users_filters
-- ----------------------------
DROP TABLE IF EXISTS `app_users_filters`;
CREATE TABLE `app_users_filters`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `reports_id` int NOT NULL,
  `users_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fields_in_listing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `listing_order_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_filters
-- ----------------------------

-- ----------------------------
-- Table structure for app_users_login_log
-- ----------------------------
DROP TABLE IF EXISTS `app_users_login_log`;
CREATE TABLE `app_users_login_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_login_log
-- ----------------------------
INSERT INTO `app_users_login_log` VALUES (5, 1, 'admin', '85.72.163.115', 1, 1698346917);
INSERT INTO `app_users_login_log` VALUES (6, 1, 'admin', '85.72.163.115', 1, 1698382028);
INSERT INTO `app_users_login_log` VALUES (7, 1, 'admin', '195.251.0.195', 1, 1698387425);
INSERT INTO `app_users_login_log` VALUES (8, 1, 'admin', '85.72.163.115', 1, 1698418706);
INSERT INTO `app_users_login_log` VALUES (9, 1, 'admin', '85.72.163.115', 1, 1698421112);
INSERT INTO `app_users_login_log` VALUES (10, 1, 'admin', '85.72.163.115', 1, 1698423468);
INSERT INTO `app_users_login_log` VALUES (11, 1, 'admin', '202.141.226.196', 1, 1698426226);
INSERT INTO `app_users_login_log` VALUES (12, 1, 'admin', '85.72.163.115', 1, 1698563803);
INSERT INTO `app_users_login_log` VALUES (13, 1, 'admin', '85.72.163.115', 1, 1698643981);
INSERT INTO `app_users_login_log` VALUES (14, 0, 'admin2@enginius.gr', '94.66.181.254', 0, 1698677399);
INSERT INTO `app_users_login_log` VALUES (15, 1, 'admin', '94.66.181.254', 1, 1698677424);
INSERT INTO `app_users_login_log` VALUES (16, 1, 'admin', '202.141.226.196', 1, 1698685782);
INSERT INTO `app_users_login_log` VALUES (17, 1, 'admin', '202.141.226.196', 1, 1698686494);
INSERT INTO `app_users_login_log` VALUES (18, 1, 'admin', '85.72.163.115', 1, 1698691091);
INSERT INTO `app_users_login_log` VALUES (19, 1, 'admin', '85.72.163.115', 1, 1698730143);
INSERT INTO `app_users_login_log` VALUES (20, 1, 'admin', '85.72.163.115', 1, 1698776349);
INSERT INTO `app_users_login_log` VALUES (21, 1, 'admin', '85.72.163.115', 1, 1698816749);
INSERT INTO `app_users_login_log` VALUES (22, 1, 'admin', '85.72.163.115', 1, 1698816749);
INSERT INTO `app_users_login_log` VALUES (23, 0, 'admin2@enginius.gr', '195.251.0.195', 0, 1699001578);
INSERT INTO `app_users_login_log` VALUES (24, 0, 'aade@velocitycloud.co', '195.251.0.195', 0, 1699001589);
INSERT INTO `app_users_login_log` VALUES (25, 0, 'admin@velocitycloud.co', '195.251.0.195', 0, 1699001595);
INSERT INTO `app_users_login_log` VALUES (26, 1, 'admin', '195.251.0.195', 1, 1699001606);
INSERT INTO `app_users_login_log` VALUES (27, 1, 'admin', '195.251.0.195', 1, 1699001843);
INSERT INTO `app_users_login_log` VALUES (28, 1, 'admin', '84.205.227.11', 1, 1699008912);
INSERT INTO `app_users_login_log` VALUES (29, 1, 'admin', '85.72.163.115', 1, 1699080162);
INSERT INTO `app_users_login_log` VALUES (30, 1, 'admin', '85.72.163.115', 1, 1699109661);
INSERT INTO `app_users_login_log` VALUES (31, 1, 'admin', '85.72.163.115', 1, 1699109661);
INSERT INTO `app_users_login_log` VALUES (32, 1, 'admin', '85.72.163.115', 1, 1699161562);
INSERT INTO `app_users_login_log` VALUES (33, 1, 'admin', '85.72.163.115', 1, 1699161562);
INSERT INTO `app_users_login_log` VALUES (34, 1, 'admin', '79.107.103.98', 1, 1699262873);
INSERT INTO `app_users_login_log` VALUES (35, 1, 'admin', '94.66.181.254', 1, 1699278122);
INSERT INTO `app_users_login_log` VALUES (36, 1, 'admin', '91.140.30.177', 1, 1699347467);
INSERT INTO `app_users_login_log` VALUES (37, 1, 'admin', '::1', 1, 1699367752);
INSERT INTO `app_users_login_log` VALUES (38, 1, 'admin', '::1', 1, 1699444445);
INSERT INTO `app_users_login_log` VALUES (39, 1, 'admin', '::1', 1, 1699454666);
INSERT INTO `app_users_login_log` VALUES (40, 1, 'admin', '::1', 1, 1699536219);
INSERT INTO `app_users_login_log` VALUES (41, 1, 'admin', '::1', 1, 1699547782);
INSERT INTO `app_users_login_log` VALUES (42, 1, 'admin', '::1', 1, 1699548166);
INSERT INTO `app_users_login_log` VALUES (43, 1, 'admin', '::1', 1, 1699884575);

-- ----------------------------
-- Table structure for app_users_notifications
-- ----------------------------
DROP TABLE IF EXISTS `app_users_notifications`;
CREATE TABLE `app_users_notifications`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `entities_id` int NOT NULL,
  `items_id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_added` bigint UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_entities_id`(`entities_id` ASC) USING BTREE,
  INDEX `idx_items_id`(`items_id` ASC) USING BTREE,
  INDEX `idx_uei`(`users_id` ASC, `entities_id` ASC) USING BTREE,
  INDEX `idx_created_by`(`created_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_notifications
-- ----------------------------
INSERT INTO `app_users_notifications` VALUES (26, 0, 21, 3, 'New Project: 3', 'new_item', 1699265552, 1);
INSERT INTO `app_users_notifications` VALUES (27, 0, 21, 4, 'New Project: Δοκιμαστική Διαδικασία 2', 'new_item', 1699268395, 1);
INSERT INTO `app_users_notifications` VALUES (28, 0, 22, 3, 'New Task Ετήσια Αναφορά Ε12 - Δοκιμαστική Διαδικασία', 'new_item', 1699269147, 1);
INSERT INTO `app_users_notifications` VALUES (29, 0, 22, 4, 'New Task Ετήσια Αναφορά Ε21 - Δοκιμαστική Διαδικασία', 'new_item', 1699269170, 1);
INSERT INTO `app_users_notifications` VALUES (30, 0, 22, 5, 'New Task Δοκιμαστική Αναφορά Ε12 - Δοκιμαστική Διαδικασία 2 Ντουπάι', 'new_item', 1699269232, 1);
INSERT INTO `app_users_notifications` VALUES (31, 0, 22, 7, 'New Task Παραβίαση ΠΟΠ 2 - Δοκιμαστική Διαδικασία Λονδίνο', 'new_item', 1699271526, 1);
INSERT INTO `app_users_notifications` VALUES (32, 0, 22, 8, 'New Task Παραβίαση ΠΟΠ Λονδίνου - Ετήσιος Απολογισμός Λονδίνου', 'new_item', 1699271953, 1);

-- ----------------------------
-- Table structure for app_users_search_settings
-- ----------------------------
DROP TABLE IF EXISTS `app_users_search_settings`;
CREATE TABLE `app_users_search_settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` int NOT NULL,
  `reports_id` int NOT NULL,
  `configuration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `configuration_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_users_id`(`users_id` ASC) USING BTREE,
  INDEX `idx_users_reports_id`(`users_id` ASC, `reports_id` ASC) USING BTREE,
  INDEX `idx_reports_id`(`reports_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 259 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_users_search_settings
-- ----------------------------
INSERT INTO `app_users_search_settings` VALUES (157, 1, 82, 'search_keywords', '');
INSERT INTO `app_users_search_settings` VALUES (158, 1, 82, 'use_search_fields', '');
INSERT INTO `app_users_search_settings` VALUES (159, 1, 82, 'search_in_comments', 'false');
INSERT INTO `app_users_search_settings` VALUES (160, 1, 82, 'search_in_all', 'false');
INSERT INTO `app_users_search_settings` VALUES (161, 1, 82, 'search_type_and', 'false');
INSERT INTO `app_users_search_settings` VALUES (162, 1, 82, 'search_type_match', 'false');
INSERT INTO `app_users_search_settings` VALUES (253, 1, 109, 'search_keywords', '');
INSERT INTO `app_users_search_settings` VALUES (254, 1, 109, 'use_search_fields', '168');
INSERT INTO `app_users_search_settings` VALUES (255, 1, 109, 'search_in_comments', 'false');
INSERT INTO `app_users_search_settings` VALUES (256, 1, 109, 'search_in_all', 'false');
INSERT INTO `app_users_search_settings` VALUES (257, 1, 109, 'search_type_and', 'false');
INSERT INTO `app_users_search_settings` VALUES (258, 1, 109, 'search_type_match', 'false');

SET FOREIGN_KEY_CHECKS = 1;
