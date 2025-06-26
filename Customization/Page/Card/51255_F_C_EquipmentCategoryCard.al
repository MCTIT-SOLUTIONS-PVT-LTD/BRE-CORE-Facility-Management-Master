page 51255 "Equipment Category Card"
{
    PageType = Card;
    SourceTable = "Equipment Category";
    ApplicationArea = All;
    Caption = 'Equipment Category';
    DataCaptionFields = "ID";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Equipment Category Details';
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}