CLASS zcl_77_try_it_out_4_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_77_try_it_out_4_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.1 - Try It Out: The Join Syntax


*    SELECT FROM /dmo/carrier INNER JOIN /dmo/connection
    SELECT FROM /dmo/carrier AS a INNER JOIN /dmo/connection AS c
             ON a~carrier_id = c~carrier_id

         FIELDS a~carrier_id,
                name AS carrier_name,
                connection_id,
               airport_from_id,
               airport_to_id

          WHERE a~currency_code = 'EUR'
           INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).



  ENDMETHOD.
ENDCLASS.
