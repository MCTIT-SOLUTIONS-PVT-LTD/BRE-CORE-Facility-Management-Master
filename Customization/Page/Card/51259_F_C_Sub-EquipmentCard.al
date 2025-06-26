page 51259 "Sub-Equipment Card"
{
    PageType = Card;
    SourceTable = "Sub-Equipment";
    ApplicationArea = All;
    Caption = 'Sub Equipment';
    DataCaptionFields = "Sub-Equipment ID";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Sub Equipment Details';
                field("Sub-Equipment ID"; Rec."Sub-Equipment ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sub-Equipment Name"; Rec."Sub-Equipment Name")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Critical Component"; Rec."Critical Component")
                {
                    ApplicationArea = All;
                }
                field("Maintenance Frequency"; Rec."Maintenance Frequency")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}