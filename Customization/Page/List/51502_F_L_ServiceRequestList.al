page 51502 "FM Service Request List"
{
    PageType = List;
    SourceTable = "FM Service Request Header";
    ApplicationArea = All;
    Caption = 'Service Requests';
    UsageCategory = Lists;
    CardPageId = 51501;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Service Request ID"; Rec."Service Request ID") { }
                field("Request Status"; Rec."Request Status") { }
                field("Requested Date"; Rec."Requested Date") { }
                field("Property Code"; Rec."Property Code") { }
                field("Unit/Flat No."; Rec."Unit/Flat No.") { }
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