/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     1/23/2017 3:35:02 PM                         */
/*==============================================================*/


alter table TPRODUCT
   drop constraint FK_TPRODUCT_TPRODUCT_TYPE;

alter table TPRODUCT_CONFIG
   drop constraint FK_TPRODUCT_CONFIG_TPRODUCT;

drop table TPRODUCT cascade constraints;

drop table TPRODUCT_CONFIG cascade constraints;

drop table TPRODUCT_TYPE cascade constraints;


drop sequence SEQ_PROD_ID;


create sequence SEQ_PROD_ID;

/*==============================================================*/
/* Table: TPRODUCT                                              */
/*==============================================================*/
create table TPRODUCT  (
   PROD_ID              NUMBER                          not null,
   PROD_TYPE_CD         CHAR(1)                         not null,
   PROD_NAME            VARCHAR2(200),
   constraint PK_TPRODUCT primary key (PROD_ID)
);

/*==============================================================*/
/* Table: TPRODUCT_CONFIG                                       */
/*==============================================================*/
create table TPRODUCT_CONFIG  (
   PROD_ID              NUMBER                          not null,
   PROD_CFG             CLOB,
   constraint PK_TPRODUCT_CONFIG primary key (PROD_ID)
);

/*==============================================================*/
/* Table: TPRODUCT_TYPE                                         */
/*==============================================================*/
create table TPRODUCT_TYPE  (
   PROD_TYPE_CD         CHAR(1)                         not null,
   PROD_TYPE_DESC       VARCHAR2(50)                    not null,
   constraint PK_TPRODUCT_TYPE primary key (PROD_TYPE_CD)
);

alter table TPRODUCT
   add constraint FK_TPRODUCT_TPRODUCT_TYPE foreign key (PROD_TYPE_CD)
      references TPRODUCT_TYPE (PROD_TYPE_CD);

alter table TPRODUCT_CONFIG
   add constraint FK_TPRODUCT_CONFIG_TPRODUCT foreign key (PROD_ID)
      references TPRODUCT (PROD_ID);

