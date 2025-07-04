page 51506 "FM Service Type Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Service Type Master";
    Caption = 'Service Type Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Service Type ID"; Rec."Service Type ID") { }
                field("Service Type Name"; Rec."Service Type Name") { }
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