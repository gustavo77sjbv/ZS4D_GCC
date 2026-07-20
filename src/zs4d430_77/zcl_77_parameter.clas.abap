CLASS zcl_77_parameter DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_77_parameter IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z77_C_EmployeeQueryP( p_target_curr = 'USD'
*                                   , p_date = @sy-datum
                                   )
      FIELDS employeeid,
             firstname,
             lastname,
             departmentid,
             departmentdescription,
             EntryDate,
*             assistantname,
*             \_Department\_Head-LastName AS headname,
*             MonthlySalaryConverted,
             CurrencyCode,
             CompanyAffiliation
      INTO TABLE @DATA(result).

    out->write( result ).
  ENDMETHOD.
ENDCLASS.
