@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z77_C_EMPLOYEEQUERYP
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of Evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
  as select from Z77_R_EMPLOYEE as Employee
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



      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      //CurrencyCode,

      //      cast('USD' as /dmo/currency_code)                                                         as CurrencyCodeUSD,
      $parameters.p_target_curr                                                                 as CurrencyCode,

      //      division( dats_days_between( EntryDate, $parameters.p_date), 365, 1 )                   as CompanyAffiliation, //GCC
      dats_days_between( EntryDate, $parameters.p_date )                                        as CompanyAffiliation, //GCC
      //      @EndUserText.label: 'Annual Salary'
      //      @Semantics.amount.currencyCode: 'CurrencyCode'
      //      currency_conversion( amount => AnnualSalary,
      //                  source_currency => CurrencyCode,
      //                  target_currency => $projection.CurrencyCode,
      //                  exchange_rate_date => $parameters.p_date)                                  as AnnualSalaryConverted, //GCC
      //
      //
      //
      //      @EndUserText.label: 'Monthly Salary'
      //      @Semantics.amount.currencyCode: 'CurrencyCode'
      //      cast( $projection.AnnualSalaryConverted as abap.fltp) / 12.0                              as MonthlySalary, //GCC

      /* Associations */
      _Department
}
