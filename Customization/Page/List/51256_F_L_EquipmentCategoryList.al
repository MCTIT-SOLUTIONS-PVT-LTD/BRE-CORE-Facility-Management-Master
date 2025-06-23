page 51256 "Equipment Category List"
{
    PageType = List;
    SourceTable = "Equipment Category";
    ApplicationArea = All;
    Caption = 'Equipment Category';
    UsageCategory = Lists;
    CardPageId = 51255;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = All;
                }

                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}