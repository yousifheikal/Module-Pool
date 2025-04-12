*----------------------------------------------------------------------*
***INCLUDE Z_CREATE_EMP_USER_COMMAND_0I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  DATA(OBJ) = NEW ZCREATE_EMP( ).

  OBJ->zemployees~return_main_screen( ).

    IF SY-ucomm EQ 'NEXT'.

    OBJ->insert_page1( first_name = ZEMPLOYEE-FIRST_NAME LAST_NAME = ZEMPLOYEE-LAST_NAME
                       GENDER = ZEMPLOYEE-GENDER DOB = ZEMPLOYEE-DOB
                       POSITIONS = ZEMPLOYEE-POSITIONS JOIN_DATE = ZEMPLOYEE-JOIN_DATE SALARY = ZEMPLOYEE-SALARY ).
       CALL SCREEN 0200.
    ENDIF.

ENDMODULE.