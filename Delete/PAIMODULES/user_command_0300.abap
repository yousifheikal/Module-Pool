*----------------------------------------------------------------------*
***INCLUDE Z_DELETE_EMP_USER_COMMAND_0I04.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.

  IF SY-ucomm EQ 'ALL1'.
  SELECT * FROM ZEMPLOYEE INTO CORRESPONDING FIELDS OF TABLE it_data.
  ENDIF.

  IF SY-ucomm EQ 'DEL2'.

    CALL SCREEN 0400 STARTING AT 5 3.

    IF SY-ucomm = 'YES'.

    DELETE ZEMPLOYEE .
    CLEAR SY-ucomm.

    IF SY-subrc EQ 0.
      MESSAGE 'Delete Employees In DataBase Success' TYPE 'I'.
      CLEAR it_data.
      REFRESH it_data.
    ELSE.
      MESSAGE 'Delete Employese In DataBase Not Success' TYPE 'E'.
      CLEAR it_data.
      REFRESH it_data.
    ENDIF.
    ELSEIF SY-ucomm = 'NO'.
      CLEAR it_data.
      REFRESH it_data.
      CLEAR SY-ucomm.
    ENDIF.

  ENDIF.

ENDMODULE.