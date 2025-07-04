page 51503 "Scan Asset QR-Code Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Scan Asset QR-Code';

    layout
    {
        area(Content)
        {
            group(ScanGroup)
            {
                field("Scan QR-Code"; myInt)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Barcode;
                    ToolTip = 'Scan or enter the asset QR-Code or Asset ID.';
                    trigger OnValidate()
                    var
                        Asset: Record "Fixed Asset";
                    begin
                        if Asset.Get(myInt) then
                            PAGE.Run(PAGE::"Fixed Asset Card", Asset)
                        else
                            Error('Asset with this QR-Code ID was not found.');
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