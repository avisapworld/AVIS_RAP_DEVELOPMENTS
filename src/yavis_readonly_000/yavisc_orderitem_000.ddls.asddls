@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumpton View For OrderItem'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity YAVISC_ORDERITEM_000
  as select from YAVISR_ORDERITEM_000
  association [1..1] to YAVISC_ORDER_000 as _Order on $projection.ParentUUID = _Order.Uuid
{
  key UUID,
      ParentUUID,
      ItemID,
      ProductID,
      UOM,
      @Semantics.quantity.unitOfMeasure: 'UOM'
      ReqQuantity,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,
      Status,
      /* Associations */
      _Order
}
