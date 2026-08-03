CLASS zcl_gu77_try_it_out_2_2b DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gu77_try_it_out_2_2b IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  UNIT 2.2 -- Try It Out - UNSuccessful Assignments



    DATA long_char TYPE c LENGTH 10.
    DATA short_char TYPE c LENGTH 5.


    DATA result TYPE p LENGTH 3 DECIMALS 2.


    long_char = 'ABCDEFGHIJ'.
    short_char = long_char.


    out->write( long_char ).
    out->write( short_char ).


    result = 1 / 8.
    out->write( |1 / 8 is rounded to { result NUMBER = USER }| ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA var_string TYPE string.
    DATA var_int TYPE i.
    DATA var_pack TYPE p LENGTH 3 DECIMALS 2.

    TRY.
        var_string = `ABCDE`.
        var_int = var_string.
      CATCH cx_sy_conversion_no_number INTO FINAL(exc).
*     CATCH cx_sy_arithmetic_error cx_sy_conversion_error INTO FINAL(exc).
        out->write( exc->get_text( ) ).
    ENDTRY.


    TRY.
        var_string = `1000`.
        var_pack = var_string.
      CATCH cx_sy_conversion_overflow  INTO FINAL(exc2).
        out->write( exc2->get_text( ) ).
    ENDTRY.




  ENDMETHOD.
ENDCLASS.
