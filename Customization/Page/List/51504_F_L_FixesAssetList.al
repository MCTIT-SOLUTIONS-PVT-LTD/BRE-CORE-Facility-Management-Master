pageextension 51504 "Fixed Asset List" extends "Fixed Asset List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Creation)
        {
            action("Scan Asset QR-Code")
            {
                ApplicationArea = All;
                Caption = 'Scan Asset QR-Code';
                Image = BarCode;
                trigger OnAction()
                var
                    ScanDialog: Page "Scan Asset QR-Code Dialog";
                begin
                    ScanDialog.RunModal();
                end;
            }
        }
    }

    var
        myInt: Integer;
}