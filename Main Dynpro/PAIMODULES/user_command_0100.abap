*----------------------------------------------------------------------*
***INCLUDE Z_CYCLE_EMP_USER_COMMAND_01I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.



  IF SY-ucomm EQ 'SUBMIT'.

    IF R1 = 'X'.
      LEAVE TO TRANSACTION 'ZCREATE_EMP'.
    ELSEIF R2 = 'X'.
      LEAVE TO TRANSACTION 'ZREAD_EMP'.
    ELSEIF R3 = 'X'.
      LEAVE TO TRANSACTION 'ZUPDATE_EMP'.
    ELSEIF R4 = 'X'.
      LEAVE TO TRANSACTION 'ZDELETE_EMP'.
    ENDIF.


  ENDIF.
*
  CASE SY-ucomm.

    WHEN 'CREATE'.
      LEAVE TO TRANSACTION 'ZCREATE_EMP'.

    WHEN 'UPDATE'.
      LEAVE TO TRANSACTION 'ZUPDATE_EMP'.

    WHEN 'DELETE'.
      LEAVE TO TRANSACTION 'ZDELETE_EMP'.

    WHEN 'READ'.
      LEAVE TO TRANSACTION 'ZREAD_EMP'.

    WHEN 'DISPLAY'.
      LEAVE TO TRANSACTION 'ZREAD_EMP'.

   ENDCASE.

ENDMODULE.