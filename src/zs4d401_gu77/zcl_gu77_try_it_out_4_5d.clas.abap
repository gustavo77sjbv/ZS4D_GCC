CLASS zcl_gu77_try_it_out_4_5d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_4_5D IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.5 Try It Out: GROUP BY


SELECT FROM /dmo/connection
     FIELDS
            carrier_id,

            MAX( distance ) AS max,
            MIN( distance ) AS min,
            SUM( distance ) AS sum,
            COUNT( * ) AS count

     GROUP BY carrier_id
     INTO TABLE @DATA(result).
    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).



  ENDMETHOD.
ENDCLASS.
