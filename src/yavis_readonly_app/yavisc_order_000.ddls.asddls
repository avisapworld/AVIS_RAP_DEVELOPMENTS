@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order consumption view read-only'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity YAVISC_ORDER_000
  as select from YAVISR_ORDER_000
  association [1..*] to YAVISC_ORDERITEM_000 as _Item on $projection.Uuid = _Item.ParentUUID
{
  key Uuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      OrderId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
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
      /* Associations */
       @Search.defaultSearchElement: true
      _Item
}
