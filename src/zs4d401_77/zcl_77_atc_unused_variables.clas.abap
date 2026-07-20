CLASS zcl_77_atc_unused_variables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_77_atc_unused_variables IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carrier_list TYPE TABLE OF /dmo/carrier . "#EC NEEDED
    DATA connection_list TYPE TABLE OF /dmo/connection.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @DATA(connections).

*    connection_list = connection_list.
    connection_list = connections.

*    out->write( connections ).
    out->write( connection_list ).

  ENDMETHOD.
ENDCLASS.
