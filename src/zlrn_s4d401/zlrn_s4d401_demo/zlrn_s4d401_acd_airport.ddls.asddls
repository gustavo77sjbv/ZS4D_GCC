@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo: CDS view with access control'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZLRN_S4D401_ACD_Airport
  as select from zlrn_airport
  {
    key airport_id as AirportId,
        name       as Name,
        city       as City,
        country    as Country,
        timzone    as Timzone
  }
