page 51252 "Equipment Master List"
{
    PageType = List;
    SourceTable = "Equipment Master";
    ApplicationArea = All;
    Caption = 'Equipment Master';
    UsageCategory = Lists;
    CardPageId = 51251;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = All;
                }
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = All;
                }
                field("OEM Name"; Rec."OEM Name")
                {
                    ApplicationArea = All;
                }
                field("Default Warranty Period"; Rec."Default Warranty Period")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}