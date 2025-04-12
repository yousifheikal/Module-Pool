class ZUPDATE_EMP definition
  public
  final
  create public .

public section.

  interfaces ZEMPLOYEES .

  aliases IS_DATA
    for ZEMPLOYEES~IS_DATA .
  aliases IT_DATA
    for ZEMPLOYEES~IT_DATA .
  aliases RETURN_MAIN_SCREEN
    for ZEMPLOYEES~RETURN_MAIN_SCREEN .

  data ID type ZEMP_ID .

  methods GET_EMPLOYEE .
  methods UPDATE_CORE_DATA
    importing
      value(ZFIRST_NAME) type ZFIRST_NAME
      value(ZLAST_NAME) type ZLAST_NAME
      value(ZGENDER) type ZGENDER
      value(ZDOB) type ZDOB
      value(ZPOSITIONS) type ZPOSITION
      value(ZJOIN_DATE) type ZJOIN_DATE
      value(ZSALARY) type ZSALARY .
protected section.
private section.

  aliases STR
    for ZEMPLOYEES~STR .
ENDCLASS.



CLASS ZUPDATE_EMP IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZUPDATE_EMP->GET_EMPLOYEE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_EMPLOYEE.

    SELECT * FROM ZEMPLOYEE INTO TABLE it_data WHERE EMP_ID = ID.


    READ TABLE IT_DATA INTO IS_DATA INDEX 1.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZUPDATE_EMP->UPDATE_CORE_DATA
* +-------------------------------------------------------------------------------------------------+
* | [--->] ZFIRST_NAME                    TYPE        ZFIRST_NAME
* | [--->] ZLAST_NAME                     TYPE        ZLAST_NAME
* | [--->] ZGENDER                        TYPE        ZGENDER
* | [--->] ZDOB                           TYPE        ZDOB
* | [--->] ZPOSITIONS                     TYPE        ZPOSITION
* | [--->] ZJOIN_DATE                     TYPE        ZJOIN_DATE
* | [--->] ZSALARY                        TYPE        ZSALARY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method UPDATE_CORE_DATA.



    UPDATE ZEMPLOYEE
    SET: first_name = zfirst_name,
         last_name =  zlast_name,
         gender =  zgender,
         dob =  zdob,
         positions =  zpositions,
         join_date =  zjoin_date,
         salary =  zsalary
    WHERE EMP_ID =  ID.

    GET_EMPLOYEE( ).

    IF SY-subrc EQ 0.
      CLEAR sy-ucomm.
      MESSAGE 'Update Data Successful' TYPE 'I'.
    ELSE.
      CLEAR sy-ucomm.
      MESSAGE 'Update Data Failed' TYPE 'E'.
    ENDIF.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZUPDATE_EMP->ZEMPLOYEES~RETURN_MAIN_SCREEN
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method ZEMPLOYEES~RETURN_MAIN_SCREEN.

    IF SY-ucomm EQ 'RETURN'.

      LEAVE TO TRANSACTION 'ZCYCLE'.

    ENDIF.

  endmethod.
ENDCLASS.