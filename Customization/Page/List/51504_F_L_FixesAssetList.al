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
            action("Scan Asset Barcode")
            {
                ApplicationArea = All;
                Caption = 'Scan Asset Barcode';
                Image = BarCode;
                trigger OnAction()
                var
                    ScanDialog: Page "Scan Asset Barcode Dialog";
                begin
                    ScanDialog.RunModal();
                end;
            }
        }
    }

    var
        myInt: Integer;
}