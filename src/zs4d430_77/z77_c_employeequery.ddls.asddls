@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z77_C_EMPLOYEEQUERY
  as select from Z77_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,
      _Department.Description                                                                   as DepartmentDescription,

      concat_with_space( _Department._Assistant.LastName, _Department._Assistant.FirstName, 1 ) as AssistantName,

      @EndUserText.label: 'Employee Role'
      case EmployeeId
        when _Department.HeadId then 'H'
        when _Department.AssistantId then 'A'
        else ''
      end                                                                                       as EmployeeRole,

      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion( amount => AnnualSalary,
                  source_currency => CurrencyCode,
                  target_currency => $projection.CurrencyCodeUSD,
                  exchange_rate_date => $session.system_date )                                  as AnnualSalaryConverted, //GCC



      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      cast( $projection.AnnualSalaryConverted as abap.fltp) / 12.0                              as MonthlySalary, //GCC

      //      @Semantics.amount.currencyCode: 'CurrencyCode'
      //      AnnualSalary,

      CurrencyCode,
      cast('USD' as /dmo/currency_code)                                                         as CurrencyCodeUSD,

      division( dats_days_between( EntryDate, $session.system_date), 365, 1 )                   as CompanyAffiliation, //GCC

      /* Associations */
      _Department
}
