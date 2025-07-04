page 51507 "Service Sub-Type Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Sub-Type Master";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Service type ID"; Rec."Service type ID") { }
                field("Service sub-type ID"; Rec."Service sub-type ID") { }
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