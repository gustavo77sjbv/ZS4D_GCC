CLASS zcl_gu77_try_it_out_7_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gu77_try_it_out_7_4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
* Try It Out: Factory Methods Implementation

* Debug the method to show that the class returns objects, but that there are different
* objects for the same combination of airline and flight number


    connection = lcl_connection=>get_connection( airlineid = 'LH' connectionnumber = '0400' ).


    connection = lcl_connection=>get_connection( airlineid = 'LH' connectionnumber = '0400' ).


  ENDMETHOD.
ENDCLASS.
