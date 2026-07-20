CLASS zcl_77_path_exp DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZCL_77_PATH_EXP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z77_C_EmployeeQuery
      FIELDS employeeid,
             firstname,
             lastname,
             departmentid,
             departmentdescription,
             assistantname,
             \_Department\_Head-LastName AS headname
      INTO TABLE @DATA(result).

    out->write( result ).
  ENDMETHOD.
ENDCLASS.
