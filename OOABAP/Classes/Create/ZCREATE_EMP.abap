class ZCREATE_EMP definition
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

  methods INSERT_PAGE1
    importing
      value(FIRST_NAME) type ZFIRST_NAME
      value(LAST_NAME) type ZLAST_NAME
      value(GENDER) type ZGENDER
      value(DOB) type ZDOB
      value(POSITIONS) type ZPOSITION
      value(JOIN_DATE) type ZJOIN_DATE
      value(SALARY) type ZSALARY .
  methods INSERT_PAGE2
    importing
      value(NATIONAL_ID) type ZNATIONAL_ID
      value(EMAIL) type ZEMAIL
      value(PHONE) type ZPHONE
      value(MARITAL_STATUS) type ZMARITAL_STATUS
      value(STATUS) type ZSTATU
      value(ADDRESS) type ZADDRESS .
protected section.
private section.

  aliases STR
    for ZEMPLOYEES~STR .
ENDCLASS.



CLASS ZCREATE_EMP IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCREATE_EMP->INSERT_PAGE1
* +-------------------------------------------------------------------------------------------------+
* | [--->] FIRST_NAME                     TYPE        ZFIRST_NAME
* | [--->] LAST_NAME                      TYPE        ZLAST_NAME
* | [--->] GENDER                         TYPE        ZGENDER
* | [--->] DOB                            TYPE        ZDOB
* | [--->] POSITIONS                      TYPE        ZPOSITION
* | [--->] JOIN_DATE                      TYPE        ZJOIN_DATE
* | [--->] SALARY                         TYPE        ZSALARY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSERT_PAGE1.

      "  LAST ROW IN TABLE
      SELECT MAX( EMP_ID ) FROM ZEMPLOYEE INTO ID.

      IF ID IS INITIAL.
        ID = 1.
      ELSE.
        ID = ID + 1.
        SHIFT ID LEFT DELETING LEADING '0'.
      ENDIF.

     is_data-mandt = sy-mandt.
      is_data-emp_id = ID.
      is_data-first_name =   FIRST_NAME.
      is_data-last_name =  LAST_NAME.
      is_data-full_name = |{  is_data-first_name } {  is_data-last_name }|.

      is_data-gender =  GENDER.
      is_data-dob =  DOB.
      is_data-positions =  POSITIONS.
      is_data-join_date =  JOIN_DATE.
      is_data-salary =  SALARY.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCREATE_EMP->INSERT_PAGE2
* +-------------------------------------------------------------------------------------------------+
* | [--->] NATIONAL_ID                    TYPE        ZNATIONAL_ID
* | [--->] EMAIL                          TYPE        ZEMAIL
* | [--->] PHONE                          TYPE        ZPHONE
* | [--->] MARITAL_STATUS                 TYPE        ZMARITAL_STATUS
* | [--->] STATUS                         TYPE        ZSTATU
* | [--->] ADDRESS                        TYPE        ZADDRESS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSERT_PAGE2.

    is_data-national_id =  NATIONAL_ID.
    is_data-email = EMAIL.
    is_data-phone = PHONE.
    is_data-address = ADDRESS.
    is_data-marital_status = MARITAL_STATUS.
    is_data-status = STATUS.

    is_data-created_by = SY-uname.
    is_data-created_on = SY-datum.

   APPEND  is_data TO  it_data.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCREATE_EMP->ZEMPLOYEES~RETURN_MAIN_SCREEN
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method ZEMPLOYEES~RETURN_MAIN_SCREEN.

    IF SY-ucomm EQ 'RETURN'.

      LEAVE TO TRANSACTION 'ZCYCLE'.

    ENDIF.

  endmethod.
ENDCLASS.