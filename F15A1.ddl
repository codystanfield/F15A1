-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-21 22:14:23 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE F15A1_Auth CASCADE CONSTRAINTS ;

DROP TABLE F15A1_Comment CASCADE CONSTRAINTS ;

DROP TABLE F15A1_Hist CASCADE CONSTRAINTS ;

DROP TABLE F15A1_Lab CASCADE CONSTRAINTS ;

DROP TABLE F15A1_Stat_Code CASCADE CONSTRAINTS ;

DROP TABLE F15A1_Task CASCADE CONSTRAINTS ;

DROP TABLE F15A1_contact CASCADE CONSTRAINTS ;

DROP TABLE F15A1_doc CASCADE CONSTRAINTS ;

DROP TABLE F15A1_emp CASCADE CONSTRAINTS ;

DROP TABLE F15A1_rfe CASCADE CONSTRAINTS ;

DROP TABLE F15A1_rtc CASCADE CONSTRAINTS ;

DROP TABLE rfe_task_relationship CASCADE CONSTRAINTS ;

CREATE TABLE F15A1_Auth
  ( auth_id INTEGER NOT NULL , RIGHT VARCHAR2 (10)
  ) ;
ALTER TABLE F15A1_Auth ADD CONSTRAINT F15A1_Auth_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15A1_Comment
  (
    comment_id         INTEGER NOT NULL ,
    F15A1_rfe_rfe_id   INTEGER ,
    F15A1_emp_emp_id   INTEGER ,
    comment_entry_date DATE ,
    comment_comment    VARCHAR2 (4000)
  ) ;
ALTER TABLE F15A1_Comment ADD CONSTRAINT F15A1_Comment_PK PRIMARY KEY ( comment_id ) ;


CREATE TABLE F15A1_Hist
  (
    hist_id                INTEGER NOT NULL ,
    F15A1_rfe_rfe_id       INTEGER ,
    F15A1_Stat_Code_SC     INTEGER ,
    history_effective_date DATE ,
    F15A1_emp_emp_id       INTEGER
  ) ;
ALTER TABLE F15A1_Hist ADD CONSTRAINT F15A1_Hist_PK PRIMARY KEY ( hist_id ) ;


CREATE TABLE F15A1_Lab
  ( lab_id INTEGER NOT NULL , lab_name VARCHAR2 (50)
  ) ;
ALTER TABLE F15A1_Lab ADD CONSTRAINT F15A1_Lab_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15A1_Stat_Code
  (
    SC                 INTEGER NOT NULL ,
    status_text        VARCHAR2 (30) ,
    status_description VARCHAR2 (500)
  ) ;
ALTER TABLE F15A1_Stat_Code ADD CONSTRAINT F15A1_Stat_Code_PK PRIMARY KEY ( SC ) ;


CREATE TABLE F15A1_Task
  (
    task_id             INTEGER NOT NULL ,
    task_effective_date DATE ,
    task_abreviation    VARCHAR2 (15) ,
    task_description    VARCHAR2 (4000)
  ) ;
ALTER TABLE F15A1_Task ADD CONSTRAINT F15A1_Task_PK PRIMARY KEY ( task_id ) ;


CREATE TABLE F15A1_contact
  (
    contact_id             INTEGER NOT NULL ,
    F15A1_emp_emp_id       INTEGER ,
    F15A1_rfe_rfe_id       INTEGER ,
    contact_effective_date DATE ,
    contact_comment        VARCHAR2 (4000) ,
    F15A1_rtc_role_code_id INTEGER
  ) ;
ALTER TABLE F15A1_contact ADD CONSTRAINT F15A1_contact_PK PRIMARY KEY ( contact_id ) ;


CREATE TABLE F15A1_doc
  (
    doc_id           INTEGER NOT NULL ,
    F15A1_rfe_rfe_id INTEGER ,
    filename         VARCHAR2 (4000) ,
    file_mimetype    VARCHAR2 (512) ,
    file_charset     VARCHAR2 (512) ,
    file_blob BLOB ,
    file_comments VARCHAR2 (4000) ,
    tags          VARCHAR2 (4000)
  ) ;
ALTER TABLE F15A1_doc ADD CONSTRAINT F15A1_doc_PK PRIMARY KEY ( doc_id ) ;


CREATE TABLE F15A1_emp
  (
    emp_id             INTEGER NOT NULL ,
    F15A1_Lab_lab_id   INTEGER ,
    emp_name           VARCHAR2 (30) ,
    emp_email          VARCHAR2 (100) ,
    emp_office         VARCHAR2 (12) ,
    emp_phone          VARCHAR2 (8) ,
    emp_status         VARCHAR2 (1) ,
    F15A1_Auth_auth_id INTEGER ,
    emp_labdir_flag    CHAR (1) ,
    emp_chair_flag     CHAR (1) ,
    emp_execdir_flag   CHAR (1) ,
    emp_admin_flag     CHAR (1)
  ) ;
ALTER TABLE F15A1_emp ADD CONSTRAINT F15A1_emp_PK PRIMARY KEY ( emp_id ) ;


CREATE TABLE F15A1_rfe
  (
    rfe_id                   INTEGER NOT NULL ,
    F15A1_Stat_Code_SC       INTEGER ,
    rfe_explanation          VARCHAR2 (4000) ,
    rfe_alt_protections      VARCHAR2 (4000) ,
    rfe_approval_review_date DATE
  ) ;
ALTER TABLE F15A1_rfe ADD CONSTRAINT F15A1_rfe_PK PRIMARY KEY ( rfe_id ) ;


CREATE TABLE F15A1_rtc
  (
    role_code_id     INTEGER NOT NULL ,
    role_type        VARCHAR2 (30) ,
    role_description VARCHAR2 (500)
  ) ;
ALTER TABLE F15A1_rtc ADD CONSTRAINT F15A1_rtc_PK PRIMARY KEY ( role_code_id ) ;


CREATE TABLE rfe_task_relationship
  (
    token_pk           INTEGER NOT NULL ,
    F15A1_rfe_rfe_id   INTEGER NOT NULL ,
    F15A1_Task_task_id INTEGER NOT NULL
  ) ;
ALTER TABLE rfe_task_relationship ADD CONSTRAINT rfe_task_relationship_PK PRIMARY KEY ( token_pk ) ;


ALTER TABLE F15A1_Comment ADD CONSTRAINT F15A1_Comment_F15A1_emp_FK FOREIGN KEY ( F15A1_emp_emp_id ) REFERENCES F15A1_emp ( emp_id ) ;

ALTER TABLE F15A1_Comment ADD CONSTRAINT F15A1_Comment_F15A1_rfe_FK FOREIGN KEY ( F15A1_rfe_rfe_id ) REFERENCES F15A1_rfe ( rfe_id ) ;

ALTER TABLE F15A1_Hist ADD CONSTRAINT F15A1_Hist_F15A1_Stat_Code_FK FOREIGN KEY ( F15A1_Stat_Code_SC ) REFERENCES F15A1_Stat_Code ( SC ) ;

ALTER TABLE F15A1_Hist ADD CONSTRAINT F15A1_Hist_F15A1_emp_FK FOREIGN KEY ( F15A1_emp_emp_id ) REFERENCES F15A1_emp ( emp_id ) ;

ALTER TABLE F15A1_Hist ADD CONSTRAINT F15A1_Hist_F15A1_rfe_FK FOREIGN KEY ( F15A1_rfe_rfe_id ) REFERENCES F15A1_rfe ( rfe_id ) ;

ALTER TABLE F15A1_contact ADD CONSTRAINT F15A1_contact_F15A1_emp_FK FOREIGN KEY ( F15A1_emp_emp_id ) REFERENCES F15A1_emp ( emp_id ) ;

ALTER TABLE F15A1_contact ADD CONSTRAINT F15A1_contact_F15A1_rfe_FK FOREIGN KEY ( F15A1_rfe_rfe_id ) REFERENCES F15A1_rfe ( rfe_id ) ;

ALTER TABLE F15A1_contact ADD CONSTRAINT F15A1_contact_F15A1_rtc_FK FOREIGN KEY ( F15A1_rtc_role_code_id ) REFERENCES F15A1_rtc ( role_code_id ) ;

ALTER TABLE F15A1_doc ADD CONSTRAINT F15A1_doc_F15A1_rfe_FK FOREIGN KEY ( F15A1_rfe_rfe_id ) REFERENCES F15A1_rfe ( rfe_id ) ;

ALTER TABLE F15A1_emp ADD CONSTRAINT F15A1_emp_F15A1_Auth_FK FOREIGN KEY ( F15A1_Auth_auth_id ) REFERENCES F15A1_Auth ( auth_id ) ;

ALTER TABLE F15A1_emp ADD CONSTRAINT F15A1_emp_F15A1_Lab_FK FOREIGN KEY ( F15A1_Lab_lab_id ) REFERENCES F15A1_Lab ( lab_id ) ;

ALTER TABLE F15A1_rfe ADD CONSTRAINT F15A1_rfe_F15A1_Stat_Code_FK FOREIGN KEY ( F15A1_Stat_Code_SC ) REFERENCES F15A1_Stat_Code ( SC ) ;

ALTER TABLE rfe_task_relationship ADD CONSTRAINT FK_ASS_14 FOREIGN KEY ( F15A1_rfe_rfe_id ) REFERENCES F15A1_rfe ( rfe_id ) ;

ALTER TABLE rfe_task_relationship ADD CONSTRAINT FK_ASS_15 FOREIGN KEY ( F15A1_Task_task_id ) REFERENCES F15A1_Task ( task_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
