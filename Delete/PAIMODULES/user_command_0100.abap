*----------------------------------------------------------------------*
***INCLUDE Z_DELETE_EMP_USER_COMMAND_0I02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.


  IF SY-ucomm EQ 'ONE'.

    CALL SCREEN 0200.

  ELSEIF SY-ucomm EQ 'ALL'.
        CALL SCREEN 0300.

   ELSEIF SY-ucomm EQ 'RETURN'.
        LEAVE TO TRANSACTION 'ZCYCLE'.
  ENDIF.

ENDMODULE.