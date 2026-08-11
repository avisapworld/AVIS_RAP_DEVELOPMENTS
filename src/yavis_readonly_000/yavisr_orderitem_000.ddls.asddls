@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item Base View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity YAVISR_ORDERITEM_000
  as select from ZYRDR_ITEM000
  association [1..1] to YAVISR_ORDER_000     as _Order         on $projection.ParentUUID = _Order.Uuid
  association [0..1] to YAVISI_ITEMSTATUS_VH as _ItemStatusTxt on $projection.Status = _ItemStatusTxt.Status
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
      _Order,
      _ItemStatusTxt
}
