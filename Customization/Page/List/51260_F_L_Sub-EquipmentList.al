page 51260 "Sub-Equipment List"
{
    PageType = List;
    SourceTable = "Sub-Equipment";
    ApplicationArea = All;
    Caption = 'Sub Equipment';
    UsageCategory = Lists;
    CardPageId = 51259;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Sub-Equipment ID"; Rec."Sub-Equipment ID")
                {
                    ApplicationArea = All;
                }

                field("Sub-Equipment Name"; Rec."Sub-Equipment Name")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
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