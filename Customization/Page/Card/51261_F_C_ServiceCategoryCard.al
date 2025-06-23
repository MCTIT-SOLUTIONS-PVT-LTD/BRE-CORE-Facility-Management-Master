page 51261 "Service Category Card"
{
    PageType = Card;
    SourceTable = "Service Category Master";
    ApplicationArea = All;
    Caption = 'Service Category';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Service Category Details';
                field("Service Category ID"; Rec."Service Category ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Service Category Name"; Rec."Service Category Name")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("SLA Days"; Rec."SLA Days")
                {
                    ApplicationArea = All;
                }
                field("Priority Level"; Rec."Priority Level")
                {
                    ApplicationArea = All;
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = All;
                }
                field("Default Price"; Rec."Default Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}