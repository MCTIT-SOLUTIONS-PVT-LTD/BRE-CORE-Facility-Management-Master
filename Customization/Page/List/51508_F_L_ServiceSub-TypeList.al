page 51508 "Service Sub-Type List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Service Sub-Type Master";
    CardPageId = 51507;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Service type ID"; Rec."Service type ID") { }
                field("Service Sub-Type ID"; Rec."Service Sub-Type ID") { }
                field("Service Sub-Type Name"; Rec."Service Sub-Type Name") { }
                field(Description; Rec.Description) { }
                field(Active; Rec.Active) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}