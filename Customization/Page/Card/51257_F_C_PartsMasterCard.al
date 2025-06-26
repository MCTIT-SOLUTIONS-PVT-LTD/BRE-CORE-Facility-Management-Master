page 51257 "Parts Master Card"
{
    PageType = Card;
    SourceTable = "Parts Master";
    ApplicationArea = All;
    Caption = 'Parts Master';
    DataCaptionFields = "Part ID";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Parts Details';
                field("Part ID"; Rec."Part ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Part Name"; Rec."Part Name")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Part Type"; Rec."Part Type")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Part Description"; Rec."Part Description")
                {
                    ApplicationArea = All;
                }
            }
            group(Classification)
            {
                Caption = 'Classification & Equipment';
                field("Parts Group"; Rec."Parts Group")
                {
                    ApplicationArea = All;
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = All;
                }
                field("Store Description"; Rec."Store Description")
                {
                    ApplicationArea = All;
                }
            }
            group(Pricing)
            {
                Caption = 'Pricing & Inventory';
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = All;
                }
                field("Opening Quantity"; Rec."Opening Quantity")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}