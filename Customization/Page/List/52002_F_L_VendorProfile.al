page 52002 "Facility Vendor Profile List"
{
    PageType = List;
    SourceTable = "Facility Vendor Profiles";
    ApplicationArea = All;
    Caption = 'Facility Vendor Profiles List';
    UsageCategory = Lists;
    CardPageId = 52001;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
