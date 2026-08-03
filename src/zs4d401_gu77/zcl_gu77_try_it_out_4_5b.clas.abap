CLASS zcl_gu77_try_it_out_4_5b DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_4_5B IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.5 Try It Out: SELECT DISTINCT


 SELECT FROM /dmo/connection
    FIELDS
           DISTINCT
           airport_from_id,
           distance_unit

  ORDER BY airport_from_id
      INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).


  ENDMETHOD.
ENDCLASS.
