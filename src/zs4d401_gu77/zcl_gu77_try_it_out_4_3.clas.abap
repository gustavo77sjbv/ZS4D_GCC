CLASS zcl_gu77_try_it_out_4_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_4_3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.3 Try It Out: Arithmetic Expressions


 SELECT FROM /dmo/flight
         FIELDS seats_max,
                seats_occupied,

                seats_max - seats_occupied           AS seats_avaliable,

                (   CAST( seats_occupied AS FLTP )
                  * CAST( 100 AS FLTP )
                ) / CAST(  seats_max AS FLTP )       AS percentage_fltp

           WHERE carrier_id = 'LH' AND connection_id = '0400'
            INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).



  ENDMETHOD.
ENDCLASS.
