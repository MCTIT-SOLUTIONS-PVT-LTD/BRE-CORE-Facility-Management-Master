page 51505 "FM Service Type List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Service Type Master List';
    SourceTable = "Service Type Master";
    CardPageId = 51506;

    layout
    {
        area(Content)
        {
            repeater(Group)
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