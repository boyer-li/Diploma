/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/12/2022 11:18:11 PM                       */
/*==============================================================*/

CREATE DATABASE shgt_mall;
USE shgt_mall;


DROP TABLE IF EXISTS LoginLog;

DROP TABLE IF EXISTS Manager;

DROP TABLE IF EXISTS Message;

DROP TABLE IF EXISTS `Order`;

DROP TABLE IF EXISTS Product;

DROP TABLE IF EXISTS ProductType;

DROP TABLE IF EXISTS Refunds;

DROP TABLE IF EXISTS USER;

DROP TABLE IF EXISTS banner;

/*==============================================================*/
/* Table: LoginLog                                              */
/*==============================================================*/
CREATE TABLE LoginLog
(
   logId                VARCHAR(32) NOT NULL,
   userId               VARCHAR(32),
   loginTime            DATETIME,
   logoutTime           DATETIME,
   PRIMARY KEY (logId)
);

/*==============================================================*/
/* Table: Manager                                               */
/*==============================================================*/
CREATE TABLE Manager
(
   managerId            VARCHAR(32) NOT NULL,
   managerName          VARCHAR(10),
   PASSWORD             VARCHAR(10),
   PRIMARY KEY (managerId)
);

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
CREATE TABLE Message
(
   messageId            VARCHAR(32) NOT NULL,
   sentTime             DATETIME,
   fromUserId           VARCHAR(32),
   toUserId             VARCHAR(32),
   details              VARCHAR(255),
   STATUS               VARCHAR(32),
   PRIMARY KEY (messageId)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
CREATE TABLE `Order`
(
   orderId              VARCHAR(32) NOT NULL,
   productId            VARCHAR(32),
   userId               VARCHAR(32),
   TIME                 DATETIME,
   orderRemarks         VARCHAR(20),
   orderStatus          VARCHAR(20),
   address              VARCHAR(255),
   phoneNumber          VARCHAR(20),
   PRIMARY KEY (orderId)
);

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
CREATE TABLE Product
(
   productId            VARCHAR(32) NOT NULL,
   typeId               VARCHAR(32),
   productName          VARCHAR(10),
   description          VARCHAR(50),
   price                INT,
   pictureUrl           VARCHAR(20),
   PRIMARY KEY (productId)
);

/*==============================================================*/
/* Table: ProductType                                           */
/*==============================================================*/
CREATE TABLE ProductType
(
   typeId               VARCHAR(32) NOT NULL,
   typeName             VARCHAR(10),
   PRIMARY KEY (typeId)
);

/*==============================================================*/
/* Table: Refunds                                               */
/*==============================================================*/
CREATE TABLE Refunds
(
   refundId             VARCHAR(32) NOT NULL,
   orderId              VARCHAR(32),
   reasons              VARCHAR(255),
   buyerId              VARCHAR(32),
   sellerId             VARCHAR(32),
   STATUS               VARCHAR(20),
   refundAmount         INT,
   PRIMARY KEY (refundId)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
CREATE TABLE USER
(
   userId               VARCHAR(32) NOT NULL,
   userName             VARCHAR(10),
   PASSWORD             VARCHAR(10),
   avatarUrl            VARCHAR(20),
   description          VARCHAR(50),
   gender               TINYINT,
   birthday             DATE,
   balance              INT,
   PRIMARY KEY (userId)
);

/*==============================================================*/
/* Table: banner                                                */
/*==============================================================*/
CREATE TABLE banner
(
   bannerId             VARCHAR(32) NOT NULL,
   bannerTitle          VARCHAR(20),
   bannerUrl            VARCHAR(52),
   PRIMARY KEY (bannerId)
);

ALTER TABLE LoginLog ADD CONSTRAINT FK_Reference_3 FOREIGN KEY (userId)
      REFERENCES USER (userId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Order` ADD CONSTRAINT FK_order_product FOREIGN KEY (productId)
      REFERENCES Product (productId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `Order` ADD CONSTRAINT FK_order_user FOREIGN KEY (userId)
      REFERENCES USER (userId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Product ADD CONSTRAINT FK_Reference_8 FOREIGN KEY (typeId)
      REFERENCES ProductType (typeId) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE Refunds ADD CONSTRAINT FK_Reference_7 FOREIGN KEY (orderId)
      REFERENCES `Order` (orderId) ON DELETE RESTRICT ON UPDATE RESTRICT;

