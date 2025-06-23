page 51258 "Parts Master List"
{
    PageType = List;
    SourceTable = "Parts Master";
    ApplicationArea = All;
    Caption = 'Parts Master';
    UsageCategory = Lists;
    CardPageId = 51257;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Part ID"; Rec."Part ID")
                {
                    ApplicationArea = All;
                }

                field("Part Name"; Rec."Part Name")
                {
                    ApplicationArea = All;
                }

                field("Part Type"; Rec."Part Type")
                {
                    ApplicationArea = All;
                }

                field("Parts Group"; Rec."Parts Group")
                {
                    ApplicationArea = All;
                }

                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = All;
                }

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

                field("Store Description"; Rec."Store Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}