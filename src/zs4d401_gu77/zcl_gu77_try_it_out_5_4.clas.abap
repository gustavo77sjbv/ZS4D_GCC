CLASS zcl_gu77_try_it_out_5_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_5_4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Try It Out: Secondary Keys


data(object) = new lcl_flights( ).


* object->read_primary( ).
object->read_non_key( ).
object->read_secondary_1( ).
object->read_secondary_2( ).
object->read_secondary_3( ).


out->write( 'Done' ).




  ENDMETHOD.
ENDCLASS.
