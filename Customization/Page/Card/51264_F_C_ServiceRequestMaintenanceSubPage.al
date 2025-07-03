page 51264 "ServiceReqMaintenanceSubPage"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "FM Work Order Header";
    Caption = 'Maintenance History';

    layout
    {
        area(Content)
        {
            repeater(MaintenanceHistory)
            {
                field("Service Request ID"; Rec."Service Request ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Work Order ID"; Rec."Work Order ID")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order ID';
                }
                field("Asset ID"; Rec."Asset ID")
                {
                    ApplicationArea = All;
                    Caption = 'Asset ID';
                }

                field("Work Order Type"; Rec."Work Order Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }

                field("Work Order Status"; Rec."Work Order Status")
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }

                field("Work Order Date"; Rec."Work Order Date")
                {
                    ApplicationArea = All;
                    Caption = 'Order Date';
                }

                field("Service Category Code"; Rec."Service Category Code")
                {
                    ApplicationArea = All;
                    Caption = 'Service Category';
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor';
                }

                field("Actual Completion Date"; Rec."Actual Completion Date")
                {
                    ApplicationArea = All;
                    Caption = 'Completed On';
                }

                field("Labor Hours"; Rec."Labor Hours")
                {
                    ApplicationArea = All;
                    Caption = 'Labor Hours';
                }

                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    Caption = 'Total Cost';
                }

                field("Technician Remarks"; Rec."Technician Remarks")
                {
                    ApplicationArea = All;
                    Caption = 'Remarks';
                }
                field("Attachment Link"; Rec."Attachment Link")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment Link';
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."Service Request ID" = '' then
            Rec.Validate("Service Request ID", xRec."Service Request ID");

        if Rec."Asset ID" = '' then
            Rec.Validate("Asset ID", xRec."Asset ID");
    end;
}