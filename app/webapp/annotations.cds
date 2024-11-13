using MyService as service from '../../srv/service';
annotate service.Request_Header @(
    UI.SelectionFields:[
        RequestNo,
        RequestDescr,
        Status_ID
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label : 'Request Number',
            Value : RequestNo,
        },
        
        {
            @cds.odata.valuelist,
            $Type : 'UI.DataField',
            Label : 'Request Description',
            Value : RequestDescr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Price',
            Value : TotalPrice,
        
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status_Saved',
            Value : Status.saved,
        },
        
        {
            $Type : 'UI.DataField',
            Label : 'Created',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : items.MaterialNum_MID,
            Label : '{i18n>Material}',
        },
    ],
    
    UI.HeaderInfo:{
        TypeName: 'Request1',
        TypeNamePlural: 'Request',
        Title: {Value : RequestDescr},
        Description: {Value : RequestNo}
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'General Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Item Details',
                    Target : '@UI.Identification'
                },
                // {
                //     $Type : 'UI.ReferenceFacet',
                //     Label: 'Status Details',
                //     Target : '@UI.FieldGroup#Spiderman'
                // },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Items',
            Target : 'items/@UI.LineItem'
        },
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label: 'Request Number',
            Value : RequestNo,
        },
        {
            $Type : 'UI.DataField',
            Label: 'Request Description',
            Value : RequestDescr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Price',
            Value : TotalPrice,
        },
        {
            $Type : 'UI.DataField',
            Label : 'created by',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created on',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Saved',
            Value : Status.saved,
        }
    ],
   // UI.FieldGroup #Spiderman: {
        //Label : 'PO pricing',
       // Data : [
            // {
            //     $Type : 'UI.DataField',
            //     Value : TotalPrice,
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : Status_ID,
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : TAX_AMOUNT,
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : CURRENCY_code,
            // },
        //],
   // }
//    UI.ValueList: {
//         entity: 'RequestHeader',
//         valueListEntity: 'RequestHeader',
//         value: 'RequestDescr', // Field to display in the value list
//         text: 'RequestDescr'   // The text to show in the suggestion list
//     }

 
);
 
 
annotate service.Request_Items with @(
 
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Label : 'Request Item Number',
            Value : ItemNo,
        },
        // {
        //    $Type : 'UI.DataField',
        //    Value : MaterialNum.MID,
        // },
        // {
        //  $Type : 'UI.DataField',
        //      Value : MaterialNum_MID,
        //  },
        {
            $Type : 'UI.DataField',
            Label : 'Item Description',
            Value  : ItemDescr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Quantity',
            Value : Quantity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Unit price',
            Value : UnitPrice,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Material',
            Value : MaterialNum_MID,
        }
 
 
    ]
 
);

// annotate service.POs with {
//     PARTNER_GUID@(
//         Common : {
//             Text : PARTNER_GUID.COMPANY_NAME,
//          },
//          ValueList.entity: CatalogService.BusinessPartnerSet
//     );
//     OVERALL_STATUS@(readonly,
//     )
// };

 
// annotate service.POItems with {
//     PRODUCT_GUID@(
//         Common : {
//             Text : PRODUCT_GUID.DESCRIPTION,
//          },
//          ValueList.entity: CatalogService.ProductSet
//     )
// };
 
// @cds.odata.valuelist
// annotate service.Request_Header with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : RequestDescr,
//     }]
// );
 
// @cds.odata.valuelist
// annotate service.ProductSet with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : DESCRIPTION,
//     }]
// );

// @cds.odata.valuelist
// annotate service.Request_Header with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : RequestDescr,
//     }]
// );


annotate service.Request_Header { 
  RequestDescr @Common.ValueList: { 
 CollectionPath : 'Request_Header', 
 Label : '', 
Parameters : [ 
{$Type: 'Common.ValueListParameterInOut', LocalDataProperty: RequestDescr, ValueListProperty: 'RequestDescr'}, 
//{$Type: 'Common.ValueListParameterOut', LocalDataProperty: RequestDescr, ValueListProperty: 'RequestDescr'}, 

] 
} 
}
annotate service.Request_Items {
    MaterialNum @(
        Common.ValueList:{
            CollectionPath : 'materials',
            Label : '',
            Parameters:[
                {$Type : 'Common.ValueListParameterInOut',LocalDataProperty :'MaterialNum_MID' ,ValueListProperty :'MID'},
            ]
        },
        Common.Text : MaterialNum.MID,
        Common.ValueListWithFixedValues : true,
    )
} ;
