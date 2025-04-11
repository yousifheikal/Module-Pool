*&---------------------------------------------------------------------*
*& Report Z_READ_EMP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_READ_EMP.


TABLES ZEMPLOYEE.

*&-----------------------------------------S----------------------------*
* Field catalog and layout
DATA: it_fcat  TYPE slis_t_fieldcat_alv,
      wa_fcat  TYPE slis_fieldcat_alv,
      it_fcat1 TYPE slis_t_fieldcat_alv,
      wa_fcat1 TYPE slis_fieldcat_alv,
      it_lay   TYPE slis_layout_alv.


* ---------------------------------------------------------------------------

*INPUTS FILTER (EMP GROUP - EMP SUB GROUP)
selection-screen BEGIN OF BLOCK Emp WITH FRAME TITLE emp_t.

SELECT-OPTIONS: EMP_ID FOR ZEMPLOYEE-EMP_ID.
SELECT-OPTIONS: JOIND FOR ZEMPLOYEE-JOIN_DATE.
SELECT-OPTIONS: SALARY FOR ZEMPLOYEE-SALARY.

SELECTION-SCREEN END OF BLOCK emp.

INITIALIZATION.
  emp_t = 'Employees Information'.

* ---------------------------------------------------------------------------


START-OF-SELECTION.

DATA(OBJ) = NEW ZREAD_EMP( ).

OBJ->id = EMP_ID[].
OBJ->join = JOIND[].
OBJ->salary = SALARY[].

OBJ->get_data( ).

PERFORM DISPLAY_ALV.


*&---------------------------------------------------------------------*
*& Form DISPLAY_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .

  CLEAR it_fcat.
  REFRESH it_fcat.


  PERFORM BUILD_FIELD_CATALOG USING:
                                   'EMP_ID' 'EMPLOYEE NUMBER' 'C' '',
                                   'FULL_NAME' 'FULL NAME' 'C' '',
                                   'GENDER' 'GENDER' 'C' '',
                                   'DOB' 'Date of Birth' 'C' '',
                                   'POSITIONS' 'POSITION' 'C' '',
                                   'JOIN_DATE' 'Date of Joining' 'C' '',
                                   'SALARY  ' 'Salary Amount' 'C' '',
                                   'NATIONAL_ID' 'National ID or Resident ID' 'C' '',
                                   'EMAIL' 'Email Address' 'C' '',
                                   'PHONE' 'Phone Number' 'C' '',
                                   'ADDRESS' 'Home Address' 'C' '',
                                   'MARITAL_STATUS' 'Marital Status (S/M/D/W)' 'C' '',
                                   'STATUS' 'Employment Status' 'C' '',
                                   'CREATED_BY' 'CREATED BY' 'C' '',
                                   'CREATED_ON' 'CREATED ON' 'C' '',
                                   'CHANGED_BY' 'CHANGED BY' 'C' '',
                                   'CHANGED_ON' 'CHANGED ON' 'C' ''.



  it_lay-COLWIDTH_OPTIMIZE = 'X'.
  it_lay-ZEBRA = 'X'.


    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-repid
*      i_callback_user_command = 'USER_COMMAND'
      is_layout               = it_lay
      it_fieldcat             = it_fcat
    TABLES
      t_outtab                = OBJ->it_data
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form BUILD_FIELD_CATALOG
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_
*&      --> P_
*&      --> P_
*&      --> P_
*&---------------------------------------------------------------------*
FORM build_field_catalog  USING
                                 p_fieldname TYPE slis_fieldname
                                 p_seltext   TYPE scrtext_l
                                 p_just      TYPE just
                                 p_hotspot   TYPE char1.

  CLEAR WA_FCAT.

  wa_fcat-fieldname  = p_fieldname.
  wa_fcat-seltext_l  = p_seltext.
  wa_fcat-just       = p_just.
  wa_fcat-hotspot    = p_hotspot.

 APPEND wa_fcat TO it_fcat.

ENDFORM.