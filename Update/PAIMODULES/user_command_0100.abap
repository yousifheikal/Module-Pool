*----------------------------------------------------------------------*
***INCLUDE Z_UPDATE_EMP_USER_COMMAND_0I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.


  DATA(OBJ) = NEW ZUPDATE_EMP( ).

  OBJ->return_main_screen( ).

  OBJ->ID = ZEMPLOYEE-emp_id.

  OBJ->get_employee( ).

  IF SY-ucomm EQ 'SUBMIT1'.

  OBJ->update_core_data(
    EXPORTING
      zfirst_name =    ZEMPLOYEE-first_name              "  First Name
      zlast_name  =    ZEMPLOYEE-LAST_NAME               " Last Name
      zgender     =    ZEMPLOYEE-GENDER                  " Gender (M/F)
      zdob        =    ZEMPLOYEE-DOB                     " Date of Birth
      zpositions  =    ZEMPLOYEE-POSITIONS               " Job Title/Position
      zjoin_date  =    ZEMPLOYEE-JOIN_DATE               " Date of Joining
      zsalary     =    ZEMPLOYEE-SALARY                  " Salary Amount
  ).

  ENDIF.

  ZEMPLOYEE-first_name = OBJ->is_data-first_name.
  ZEMPLOYEE-LAST_NAME = OBJ->is_data-LAST_NAME.
  ZEMPLOYEE-GENDER = OBJ->is_data-GENDER.
  ZEMPLOYEE-DOB = OBJ->is_data-DOB.
  ZEMPLOYEE-POSITIONS = OBJ->is_data-POSITIONS.
  ZEMPLOYEE-JOIN_DATE = OBJ->is_data-JOIN_DATE.
  ZEMPLOYEE-SALARY = OBJ->is_data-SALARY.
  ZEMPLOYEE-NATIONAL_ID = OBJ->is_data-NATIONAL_ID.
  ZEMPLOYEE-EMAIL = OBJ->is_data-EMAIL.
  ZEMPLOYEE-PHONE = OBJ->is_data-PHONE.
  ZEMPLOYEE-ADDRESS = OBJ->is_data-ADDRESS.
  ZEMPLOYEE-MARITAL_STATUS = OBJ->is_data-MARITAL_STATUS.
  ZEMPLOYEE-STATUS = OBJ->is_data-STATUS.

ENDMODULE.