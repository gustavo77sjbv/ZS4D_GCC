@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZGU77_C_EMPLOYEEQUERY_V2
  as select from ZGU77_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,
      _Department.Description             as DepartmentDescription,
      //      _Departm<ent._Assistant.LastName           as AssistantName,
      concat_with_space(_Department._Assistant.FirstName,
                        _Department._Assistant.LastName,
                        1)                as AssistantName,
      @EndUserText.label: 'Employee Role'
      case EmployeeId
        when _Department.HeadId then 'H'
        when _Department.AssistantId then 'A'
        else ''
      end                                 as EmployeeRole,
      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( ( cast(AnnualSalary as abap.fltp) / 12.0 )
              as abap.dec(15,2))          as MonthlySalary,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      CurrencyCode,
      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
       cast( (cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0 )
              as abap.dec(15,2))                              as MonthlySalaryConverted,
      @EndUserText.label: 'Annual Salary in USD'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion( amount             => AnnualSalary,
                       source_currency    => CurrencyCode  ,
                       target_currency    => $projection.CurrencyCodeUSD,
                       exchange_rate_date => cast( '20230101' as abap.dats), /* $session.system_date, */
                       error_handling => 'SET_TO_NULL'
                     )                    as AnnualSalaryConverted,
      //      cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalaryUSD,
      cast( 'USD' as /dmo/currency_code ) as CurrencyCodeUSD,
      division( dats_days_between( EntryDate,
             $session.system_date ),
             365,
             1 )                          as CompanyAffiliation,
      /* Associations */
      _Department
}
