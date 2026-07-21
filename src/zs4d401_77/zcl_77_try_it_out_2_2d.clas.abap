CLASS zcl_77_try_it_out_2_2d DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_77_try_it_out_2_2d IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  UNIT 2.2 -- Try It Out - Conversions of Forced Type

* result has type C.
* and is displayed unformatted in the console

   DATA(result1) = '20230101'.
   out->write( result1 ).

* result2 is forced to have type D
* and is displayed with date formatting in the console

   DATA(result2) = CONV d( '20230101' ).
   out->write( result2 ).




* The method do_something( ) has an importing parameter of type string.
* Attempting to pass var results in a syntax error
* The CONV #( ) expression converts var into the expected type
* Note that CONV #( ) can lead to conversion exceptions


* lcl_class=>do_something( var ).
  ENDMETHOD.
ENDCLASS.
