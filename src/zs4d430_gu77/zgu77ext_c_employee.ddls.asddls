extend view entity ZGU77_C_EMPLOYEEQUERYP_v2 with 
association [1..1] to I_Country as _ZZCountryZem on $projection.ZZCountryZem = _ZZCountryZem.Country
{
   
    Employee.ZZCountryZem as ZZCountryZem,
    Employee.ZZTitleZem as ZZTitleZem,
    
    concat_with_space( Employee.FirstName, Employee.LastName, 1 ) as ZZFullNameZem,
    _ZZCountryZem.IsEuropeanUnionMember as ZZEUBasedZem
   
}
