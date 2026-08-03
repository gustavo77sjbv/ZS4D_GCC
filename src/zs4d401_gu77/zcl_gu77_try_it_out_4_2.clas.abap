CLASS zcl_gu77_try_it_out_4_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_gu77_try_it_out_4_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.2 -Try It Out: Literals


    CONSTANTS c_number TYPE i VALUE 1234.
    CONSTANTS c_string TYPE string VALUE 'ABAP is nice !'.

    SELECT FROM /dmo/carrier
         FIELDS 'Hello'    AS Character,    " Type c
                 1         AS Integer1,     " Type i
                -1         AS Integer2,     " Type i

                @c_number  AS constant,      " Type i  (same as constant)
                @c_string AS my_string,
                'GCC'     AS my_gcc,
                77        AS my_77

          INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).


  ENDMETHOD.
ENDCLASS.
