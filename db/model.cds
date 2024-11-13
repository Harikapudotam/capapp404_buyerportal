namespace harika.ust;
using {OP_API_PRODUCT_SRV_0001 as prod_api} from '../srv/external/OP_API_PRODUCT_SRV_0001'; // our csn file path
using {  managed } from '@sap/cds/common';
entity Status {
    key ID : UUID ; // Adding a key for the Status entity
    saved  : localized String(40) @mandatory; // General name field for status
    Ordered : localized String(40);
    InApproval : localized String(40);
    Rejected : localized String(40);
}

entity RequestHeader : managed{
    key RequestNo : UUID @mandatory;
    RequestDescr : String(40) @mandatory;
    Status       : Association to Status; // Association to Status entity
    // @semantics.TotalPrice.currencyCode : 'currency'
    TotalPrice   : Decimal(10,2); // Use Decimal for currency representation
    items        : Composition of many RequestItem on items.RequestHeader = $self; // Composition
}

entity RequestItem : managed {
    key ItemNo     : UUID @mandatory; 
    
    RequestHeader  : Association to RequestHeader @title: 'Request Header'; // Association back to RequestHeader
    ItemDescr      : localized String(40) @mandatory;
    MaterialNum    : Association to Material;//String(40) @mandatory;
    Quantity       : Decimal(10,2) @mandatory; // Consider using Decimal for quantity
    UnitPrice      : Decimal(10,2) @mandatory; // Use Decimal for currency representation
}
entity Material as projection on prod_api.A_Product{
    key Product as MID,
    ProductType as Desc,
}