@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Order root view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YAVISC_ORDER_TP_000
provider contract transactional_query
 as projection on YAVIS_Order_TP_000
{
    key Uuid,
      //@UI.lineItem: [ { position: 10, label: 'Order ID' } ]
    OrderId,
    CustomerId,
    OrderDate,
    Status,
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    NetAmount,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Item : redirected to composition child YAVISC_ORDERITEM_TP_000
}
