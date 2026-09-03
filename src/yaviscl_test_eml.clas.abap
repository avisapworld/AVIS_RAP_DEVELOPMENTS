CLASS yaviscl_test_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS yaviscl_test_eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_read TYPE TABLE FOR READ RESULT YAVIS_Order_TP_000.

**************START OF READ ORDER & ITEMS EML************************************************
    READ ENTITIES OF YAVIS_Order_TP_000
    ENTITY YAVIS_Order_TP_000
    ALL FIELDS WITH VALUE #( ( %tky-Uuid = 'BA58FD524F671FE1A9F3F6B5EC9225B8' ) )
   RESULT DATA(lt_read_order)
   BY \_Item
   ALL FIELDS WITH VALUE #( ( %tky-Uuid = 'BA58FD524F671FE1A9F3F6B5EC9225B8' ) )
   RESULT DATA(lt_read_items)
   FAILED DATA(lt_failed_read)
   REPORTED DATA(lt_reported_read).

    IF lt_failed_read IS INITIAL.

      out->write(
        EXPORTING
          data   =  lt_read_order
          name   = 'READ Order'
*  RECEIVING
*    output =
      ).

      out->write(
        EXPORTING
          data   =  lt_read_items
          name   = 'READ Items'
*  RECEIVING
*    output =
      ).

    ELSE.

      out->write(
        EXPORTING
          data   =  lt_failed_read
          name   = 'Failed'
*  RECEIVING
*    output =
      ).

      out->write(
        EXPORTING
          data   =  lt_reported_read
          name   = 'Reported'
*  RECEIVING
*    output =
      ).

    ENDIF.
**********************END OF READ ORDER & ITEMS EML************************************************


***********START OF MODIFY/UPDATE EML*************************************

    MODIFY ENTITIES OF YAVIS_Order_TP_000
    ENTITY YAVIS_Order_TP_000
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( ( %tky-Uuid = 'BA58FD524F671FE1A9F3F6B5EC9225B8'
                          Status = '02' ) )
    FAILED DATA(lt_update_failed1)
    REPORTED DATA(lt_update_reported1).

    COMMIT ENTITIES.

    IF lt_update_failed1 IS INITIAL.
      READ ENTITIES OF YAVIS_Order_TP_000
      ENTITY YAVIS_Order_TP_000
      ALL FIELDS WITH VALUE #( (  %tky-Uuid = 'BA58FD524F671FE1A9F3F6B5EC9225B8' ) )
      RESULT DATA(lt_read_updated_status).
      out->write(
        EXPORTING
          data   =  lt_read_updated_status
          name   = 'Updated Result: Order'
*  RECEIVING
*    output =
      ).

      out->write(
        EXPORTING
          data   =  lt_update_failed1
          name   = 'Update Failed: Order'
*  RECEIVING
*    output =
      ).

      out->write(
        EXPORTING
          data   =  lt_update_reported1
          name   = 'Update Reported: Order'
*  RECEIVING
*    output =
      ).

    ENDIF.
******************END OF MODIFY/UPDATE EML****************************************************

******************START OF CREATE ORDER EML****************************************************
    MODIFY ENTITIES OF YAVIS_Order_TP_000
    ENTITY YAVIS_Order_TP_000
    CREATE
    FIELDS (  OrderId Status NetAmount CurrencyCode CustomerId )
    AUTO FILL CID
    WITH VALUE #( ( OrderId = '3'
    Status = '01'
    NetAmount = '150'
    CurrencyCode = 'EUR'
    CustomerId = '2' ) )
    MAPPED DATA(lt_mapped_order1)
    FAILED DATA(lt_failed_order1)
    REPORTED DATA(lt_reported_order1).
    COMMIT ENTITIES
RESPONSE OF YAVIS_Order_TP_000
FAILED DATA(lt_failed_order_cmmt).
    IF lt_failed_order_cmmt IS INITIAL.

      SELECT SINGLE * FROM zyrdorder000 WHERE order_id = '3' INTO @DATA(ls_new_order).
      IF sy-subrc IS INITIAL.
        out->write(
          EXPORTING
            data   =  ls_new_order
            name   = 'New Order Created'
*  RECEIVING
*    output =
        ).
      ENDIF.

    ELSE.
      out->write(
              EXPORTING
                data   =  lt_failed_order_cmmt
                name   = 'Create Failed: Order'
*  RECEIVING
*    output =
            ).
    ENDIF.
******************END OF CREATE ORDER EML****************************************************



  ENDMETHOD.

ENDCLASS.
