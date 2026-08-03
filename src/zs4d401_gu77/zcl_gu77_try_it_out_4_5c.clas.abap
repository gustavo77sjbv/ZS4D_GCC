CLASS zcl_gu77_try_it_out_4_5c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_4_5C IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.5 Try It Out: Aggregate Functions


    SELECT FROM /dmo/connection
         FIELDS carrier_id,
                connection_id,
                airport_from_id,
                distance
          WHERE carrier_id = 'LH'
           INTO TABLE @DATA(result_raw).


    out->write(
      EXPORTING
        data   = result_raw
        name   = 'RESULT_RAW'
    ).

*********************************************************************

    SELECT FROM /dmo/connection
         FIELDS MAX( distance ) AS max,
                MIN( distance ) AS min,
                SUM( distance ) AS sum,
                AVG( distance ) AS average,
                COUNT( * ) AS count,
                COUNT( DISTINCT airport_from_id ) AS count_dist

          WHERE carrier_id = 'LH'
           INTO TABLE @DATA(result_aggregate).

    out->write(
      EXPORTING
        data   = result_aggregate
        name   = 'RESULT_AGGREGATED'
    ).


  ENDMETHOD.
ENDCLASS.
