page 51010 "Service Request Asset SubPage"
{
    PageType = ListPart;
    SourceTable = "Service Request Line";
    SourceTableView = SORTING("No.");
    ApplicationArea = All;
    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Request ID"; Rec."Service Request ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Asset ID';

                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Asset Name';
                }

                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = All;
                    Caption = 'Facility/Property';
                }
                field("Unit No."; Rec."Unit No.")
                {
                    ApplicationArea = All;
                    Caption = 'Unit/Flat';
                }
                field("Location Description"; Rec."Location Description")
                {
                    ApplicationArea = All;
                }
                field("Warranty Start Date"; Rec."Warranty Start Date")
                {
                    ApplicationArea = All;
                }
                field("Warranty End Date"; Rec."Warranty End Date")
                {
                    ApplicationArea = All;
                }
                field("Under AMC"; Rec."Under AMC")
                {
                    ApplicationArea = All;
                }
                field("AMC Vendor"; Rec."AMC Vendor")
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
                field("Barcode ID"; Rec."Barcode ID")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Rec.SetRecFilter();
    // end;
}
