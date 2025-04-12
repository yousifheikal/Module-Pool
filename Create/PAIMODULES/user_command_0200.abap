*----------------------------------------------------------------------*
***INCLUDE Z_CREATE_EMP_USER_COMMAND_0I02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.


  IF SY-ucomm EQ 'NEXT2'.

     OBJ->INSERT_PAGE2( NATIONAL_ID = ZEMPLOYEE-NATIONAL_ID EMAIL = ZEMPLOYEE-EMAIL
                     PHONE = ZEMPLOYEE-PHONE ADDRESS = ZEMPLOYEE-ADDRESS
                     MARITAL_STATUS = ZEMPLOYEE-MARITAL_STATUS STATUS = ZEMPLOYEE-STATUS ).

    is_data = OBJ->IS_DATA.
    it_data = OBJ->IT_DATA.

    CALL SCREEN 0300.

  ELSEIF SY-ucomm EQ 'BACK'.
    CALL SCREEN 0100.
  ENDIF.


ENDMODULE.