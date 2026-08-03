CLASS zcl_gu77_try_it_out_4_2b DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gu77_try_it_out_4_2b IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.2 Try It Out: The CAST Expression


    SELECT FROM /dmo/carrier
         FIELDS '19891109'                           AS char_8,
                CAST( '19891109' AS CHAR( 4 ) )      AS char_4,
                CAST( '19891109' AS NUMC( 8  ) )     AS numc_8,

                CAST( '19891109' AS INT4 )          AS integer,
                CAST( '19891109' AS DEC( 10, 2 ) )  AS dec_10_2,
                CAST( '19891109' AS FLTP )          AS fltp,

                CAST( '19891109' AS DATS )          AS date

*             CAST( '19891109' AS DEC( 6, 2 ) )  AS my_dec_6_2 "overflow - dump

           INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).



  ENDMETHOD.
ENDCLASS.
