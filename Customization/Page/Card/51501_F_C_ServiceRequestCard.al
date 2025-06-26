page 51501 "FM Service Request Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "FM Service Request Header";
    Caption = 'Service Request Details';

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Service Request ID"; Rec."Service Request ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Contact Details")
            {
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;

                }
                field(contactPhone; Rec."Contact Phone")
                {
                    ApplicationArea = All;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = All;
                }

            }

            group("Request Details")
            {
                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = All;
                }
                field("Unit/Flat No."; Rec."Unit/Flat No.")
                {
                    ApplicationArea = All;
                }
                field("Service Category"; Rec."Service Category")
                {
                    ApplicationArea = All;
                }
                field("Service Sub-Type"; Rec."Service Sub-Type")
                {
                    ApplicationArea = All;
                }
                field(problemDescription; Rec."Problem Description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Urgency Level"; Rec."Urgency Level")
                {
                    ApplicationArea = All;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if (Rec."Service Category" = '') or (Rec."Service Sub-Type" = '') or (Rec."Urgency Level" = Rec."Urgency Level"::" ") or
            (Rec."Contact Name" = '') or (Rec."Contact Phone" = '') or (Rec."Contact Email" = '') then
            Error('All mandatory fields must be filled before inserting.');
        exit(true);
    end;


}