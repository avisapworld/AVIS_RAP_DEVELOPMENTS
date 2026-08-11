@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Order Base View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity YAVISC_ORDER_000
  as select from YAVISR_ORDER_000
  association [1..*] to YAVISC_ORDERITEM_000 as _Item on $projection.Uuid = _Item.ParentUUID
{

  key Uuid,
      OrderId,
      CustomerId,
      OrderDate,
      @ObjectModel.text.element: [ 'OrderStatusText' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Status,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      NetAmount,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      @Semantics.text
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      _OrderStatusTxt.StatusText as OrderStatusText,
      /*Associations*/
      @Search.defaultSearchElement: true
      _Item
      

}
