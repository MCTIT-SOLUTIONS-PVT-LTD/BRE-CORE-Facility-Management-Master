page 51017 "Service Request Approval List"
{
    PageType = List;
    SourceTable = "FM Service Request Approval";
    ApplicationArea = All;
    Caption = 'Service Request Approval List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Service Request ID"; Rec."Service Request ID") { ApplicationArea = All; }
                field("Contact Name"; Rec."Contact Name") { ApplicationArea = All; }
                field("Phone Number"; Rec."Contact Phone") { ApplicationArea = All; }
                field("Email"; Rec."Contact Email") { ApplicationArea = All; }

            }
        }
    }
}
