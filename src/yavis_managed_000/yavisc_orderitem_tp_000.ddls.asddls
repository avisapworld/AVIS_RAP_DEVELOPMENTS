@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for Order item tran view'
@Metadata.ignorePropagatedAnnotations: true

//@UI.presentationVariant: [{ 
//    visualizations: [{ type: #AS_LINEITEM }] 
//}]

define view entity YAVISC_ORDERITEM_TP_000
 as projection on YAVIS_ORDERITEM_TP_000
{


    key Uuid,
    ParentUuid,
     //@UI.lineItem: [ { position: 10, label: 'Item ID' } ]
    ItemId,
    ProductId,
    Uom,
    @Semantics.quantity.unitOfMeasure: 'Uom'
    ReqQuantity,
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Amount,
    Status,
    /* Associations */
    _Order : redirected to parent YAVISC_ORDER_TP_000
}
