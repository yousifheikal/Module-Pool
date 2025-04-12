*&---------------------------------------------------------------------*
*& Modulpool Z_UPDATE_EMP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z_UPDATE_EMP.

TABLES: ZEMPLOYEE.
*&---------------------------------------------------------------------*
TYPES: BEGIN OF STR,
      first_name     TYPE ZEMPLOYEE-first_name,
      LAST_NAME      TYPE ZEMPLOYEE-last_name,
      GENDER         TYPE ZEMPLOYEE-gender,
      DOB            TYPE ZEMPLOYEE-dob,
      POSITIONS      TYPE ZEMPLOYEE-positions,
      JOIN_DATE      TYPE ZEMPLOYEE-join_date,
      SALARY         TYPE ZEMPLOYEE-salary,
      NATIONAL_ID    TYPE ZEMPLOYEE-national_id,
      EMAIL          TYPE ZEMPLOYEE-email,
      PHONE          TYPE ZEMPLOYEE-phone,
      ADDRESS        TYPE ZEMPLOYEE-address,
      MARITAL_STATUS TYPE ZEMPLOYEE-marital_status,
      STATUS         TYPE ZEMPLOYEE-status,
  END OF STR.

DATA: IT_DATA1 TYPE TABLE OF STR,
      IS_DATA1 TYPE STR.

DATA ID TYPE ZEMP_ID.

*&---------------------------------------------------------------------*
*&SPWIZARD: FUNCTION CODES FOR TABSTRIP 'Z_UPDATE'
CONSTANTS: BEGIN OF C_Z_UPDATE,
             TAB1 LIKE SY-UCOMM VALUE 'Z_UPDATE_FC1',
             TAB2 LIKE SY-UCOMM VALUE 'Z_UPDATE_FC2',
             TAB3 LIKE SY-UCOMM VALUE 'Z_UPDATE_FC3',
           END OF C_Z_UPDATE.
*&SPWIZARD: DATA FOR TABSTRIP 'Z_UPDATE'
CONTROLS:  Z_UPDATE TYPE TABSTRIP.
DATA:      BEGIN OF G_Z_UPDATE,
             SUBSCREEN   LIKE SY-DYNNR,
             PROG        LIKE SY-REPID VALUE 'Z_UPDATE_EMP',
             PRESSED_TAB LIKE SY-UCOMM VALUE C_Z_UPDATE-TAB1,
           END OF G_Z_UPDATE.
DATA:      OK_CODE LIKE SY-UCOMM.

*&SPWIZARD: OUTPUT MODULE FOR TS 'Z_UPDATE'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: SETS ACTIVE TAB
MODULE Z_UPDATE_ACTIVE_TAB_SET OUTPUT.
  Z_UPDATE-ACTIVETAB = G_Z_UPDATE-PRESSED_TAB.
  CASE G_Z_UPDATE-PRESSED_TAB.
    WHEN C_Z_UPDATE-TAB1.
      G_Z_UPDATE-SUBSCREEN = '0200'.
    WHEN C_Z_UPDATE-TAB2.
      G_Z_UPDATE-SUBSCREEN = '0300'.
    WHEN C_Z_UPDATE-TAB3.
      G_Z_UPDATE-SUBSCREEN = '0400'.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TS 'Z_UPDATE'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GETS ACTIVE TAB
MODULE Z_UPDATE_ACTIVE_TAB_GET INPUT.
  OK_CODE = SY-UCOMM.
  CASE OK_CODE.
    WHEN C_Z_UPDATE-TAB1.
      G_Z_UPDATE-PRESSED_TAB = C_Z_UPDATE-TAB1.
    WHEN C_Z_UPDATE-TAB2.
      G_Z_UPDATE-PRESSED_TAB = C_Z_UPDATE-TAB2.
    WHEN C_Z_UPDATE-TAB3.
      G_Z_UPDATE-PRESSED_TAB = C_Z_UPDATE-TAB3.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

INCLUDE z_update_emp_user_command_0i01.

INCLUDE z_update_emp_user_command_0i02.

INCLUDE z_update_emp_status_0100o01.