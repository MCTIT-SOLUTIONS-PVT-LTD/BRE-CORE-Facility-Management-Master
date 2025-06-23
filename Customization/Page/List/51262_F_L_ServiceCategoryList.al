page 51262 "Service Category List"
{
    PageType = List;
    SourceTable = "Service Category Master";
    ApplicationArea = All;
    Caption = 'Service Category';
    UsageCategory = Lists;
    CardPageId = 51261;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Service Category ID"; Rec."Service Category ID")
                {
                    ApplicationArea = All;
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