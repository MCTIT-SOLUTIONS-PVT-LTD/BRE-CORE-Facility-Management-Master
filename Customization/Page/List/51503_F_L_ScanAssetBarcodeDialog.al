page 51503 "Scan Asset Barcode Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Scan Asset Barcode';

    layout
    {
        area(Content)
        {
            group(ScanGroup)
            {
                field("Scan Barcode"; myInt)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Barcode;
                    ToolTip = 'Scan or enter the asset barcode or Asset ID.';
                    trigger OnValidate()
                    var
                        Asset: Record "Fixed Asset";
                    begin
                        if Asset.Get(myInt) then
                            PAGE.Run(PAGE::"Fixed Asset Card", Asset)
                        else
                            Error('Asset with this Barcode ID was not found.');
                    end;
                }
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
        myInt: Text;
}