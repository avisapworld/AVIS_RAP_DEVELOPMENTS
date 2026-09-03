@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order item consumption read-only'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity YAVISC_ORDERITEM_000 as select from YAVISR_ORDERITEM_000
{
  key UUID,
      ParentUUID,
      ItemID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      ProductID,
      UOM,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      ReqQuantity,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,
    @ObjectModel.text.element: [ 'ItemStatusText' ]
      Status,
      @Semantics.text
     @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      _ItemStatusTxt.StatusText as ItemStatusText,
      /* Associations */
      _Order,
      _ItemStatusTxt
}
