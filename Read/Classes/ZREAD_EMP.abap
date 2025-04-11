class ZREAD_EMP definition
  public
  final
  create public .

public section.

  interfaces ZEMPLOYEES .

  aliases IS_DATA
    for ZEMPLOYEES~IS_DATA .
  aliases IT_DATA
    for ZEMPLOYEES~IT_DATA .

  types:
    ZEMP_ID TYPE RANGE OF ZEMPLOYEE-EMP_ID .
  types:
    ZJOIND TYPE RANGE OF ZEMPLOYEE-join_date .
  types:
    ZSALARY TYPE RANGE OF ZEMPLOYEE-salary .

  DATA: ID TYPE ZEMP_ID,
        JOIN TYPE ZJOIND,
        SALARY TYPE ZSALARY.

  methods GET_DATA .
protected section.
private section.

  aliases STR
    for ZEMPLOYEES~STR .
ENDCLASS.



CLASS ZREAD_EMP IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZREAD_EMP->GET_DATA
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_DATA.

    SELECT DISTINCT * FROM ZEMPLOYEE INTO CORRESPONDING FIELDS OF TABLE it_data WHERE EMP_ID IN ID AND JOIN_DATE IN JOIN AND SALARY IN SALARY .

  endmethod.
ENDCLASS.