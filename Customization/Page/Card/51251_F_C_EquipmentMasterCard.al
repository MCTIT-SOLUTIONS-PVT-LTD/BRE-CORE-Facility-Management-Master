page 51251 "Equipment Master Card"
{
    PageType = Card;
    SourceTable = "Equipment Master";
    ApplicationArea = All;
    Caption = 'Equipment Master';
    DataCaptionFields = "Equipment ID";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Equipment Details';
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = All;
                }

            }
            group("OEM Details")
            {

                field("OEM ID"; Rec."OEM ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ShowMandatory = true;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("OEM Name"; Rec."OEM Name")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Editable = false;
                }
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Editable = false;
                }
                field("Unit of Measurement"; Rec."Unit of Measurement")
                {
                    ApplicationArea = All;
                    Lookup = true;
                }
                field("Default Warranty Period"; Rec."Default Warranty Period")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}