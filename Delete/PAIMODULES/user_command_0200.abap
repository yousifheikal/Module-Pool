*----------------------------------------------------------------------*
***INCLUDE Z_DELETE_EMP_USER_COMMAND_0I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  SELECT * FROM ZEMPLOYEE INTO CORRESPONDING FIELDS OF TABLE it_data WHERE EMP_ID = ZEMPLOYEE-EMP_ID.

  IF SY-ucomm EQ 'DEL1'.

    CALL SCREEN 0400 STARTING AT 5 3.

    IF SY-ucomm = 'YES'.

    DELETE FROM ZEMPLOYEE WHERE EMP_ID = ZEMPLOYEE-EMP_ID.
    CLEAR SY-ucomm.

    IF SY-subrc EQ 0.
      MESSAGE 'Delete Employee In DataBase Success' TYPE 'I'.
      CLEAR it_data.
      REFRESH it_data.
    ELSE.
      MESSAGE 'Delete Employee In DataBase Not Success' TYPE 'E'.
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