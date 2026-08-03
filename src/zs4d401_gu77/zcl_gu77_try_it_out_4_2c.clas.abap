CLASS zcl_gu77_try_it_out_4_2c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GU77_TRY_IT_OUT_4_2C IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Unit 4.2 Try It Out: CASE distinctions


    SELECT FROM /dmo/customer
         FIELDS customer_id,
                title,
                CASE title
                  WHEN 'Mr.'  THEN 'Mister'
                  WHEN 'Mrs.' THEN 'Misses'
                  ELSE             ' '
               END AS title_long

        WHERE country_code = 'AT'
         INTO TABLE @DATA(result_simple).

    out->write(
      EXPORTING
        data   = result_simple
        name   = 'RESULT_SIMPLE'
    ).

**********************************************************************

    SELECT FROM /DMO/flight
         FIELDS flight_date,
                seats_max,
                seats_occupied,
                CASE
                  WHEN seats_occupied < seats_max THEN 'Seats Avaliable'
                  WHEN seats_occupied = seats_max THEN 'Fully Booked'
                  WHEN seats_occupied > seats_max THEN 'Overbooked!'
                  ELSE                                 'This is impossible'
                END AS Booking_State

          WHERE carrier_id    = 'LH'
            AND connection_id = '0400'
           INTO TABLE @DATA(result_complex).

    out->write(
      EXPORTING
        data   = result_complex
        name   = 'RESULT_COMPLEX'
    ).




  ENDMETHOD.
ENDCLASS.
