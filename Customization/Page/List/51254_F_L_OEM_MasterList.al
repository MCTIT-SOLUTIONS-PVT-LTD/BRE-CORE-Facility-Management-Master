page 51254 "OEM Master List"
{
    PageType = List;
    SourceTable = "OEM Master";
    ApplicationArea = All;
    Caption = 'OEM Master';
    UsageCategory = Lists;
    CardPageId = 51253;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("OEM ID"; Rec."OEM ID")
                {
                    ApplicationArea = All;
                }
                field("OEM Name"; Rec."OEM Name")
                {
                    ApplicationArea = All;
                }
                field("OEM Description"; Rec."OEM Description")
                {
                    ApplicationArea = All;
                }
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = All;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}