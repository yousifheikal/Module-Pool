*----------------------------------------------------------------------*
***INCLUDE Z_CREATE_EMP_USER_COMMAND_0I03.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.


  IF SY-ucomm EQ 'SUBMIT'.

    INSERT ZEMPLOYEE FROM Is_data.

    IF sy-subrc = 0.
      MESSAGE 'Insert successful' TYPE 'I'.
      CALL SCREEN 0100.
    ELSE.
      MESSAGE 'Insert failed' TYPE 'I'.
    ENDIF.

  ELSEIF SY-ucomm EQ 'CANCEL'.

    CLEAR: is_data, it_data.
    REFRESH it_data.
    CALL SCREEN 0100.

  ENDIF.

ENDMODULE.