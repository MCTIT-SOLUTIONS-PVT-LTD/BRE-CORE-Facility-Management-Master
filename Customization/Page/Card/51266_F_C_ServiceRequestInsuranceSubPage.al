page 51266 "Service Request Insurance Card"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Service Request Insurance";
    Caption = 'Insurance History';

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
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = All;
                }
                field("Asset ID"; Rec."Asset ID")
                {
                    ApplicationArea = All;
                }

                field("Name of Insurer"; Rec."Name of Insurer")
                {
                    ApplicationArea = All;
                }

                field("Insurance Policy No."; Rec."Insurance Policy No.")
                {
                    ApplicationArea = All;
                }

                field("Insurance Start Date"; Rec."Insurance Start Date")
                {
                    ApplicationArea = All;
                }

                field("Insurance End Date"; Rec."Insurance End Date")
                {
                    ApplicationArea = All;
                }

                field("Insured Value"; Rec."Insured Value")
                {
                    ApplicationArea = All;
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