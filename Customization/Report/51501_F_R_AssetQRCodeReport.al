report 51501 "Asset QR-Code Report"
{
    ApplicationArea = All;
    Caption = 'Asset QR-Code Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = 'AssetQR-CodeReportLayout.docx';

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            RequestFilterFields = "No.";
            column(Asset_No; "No.")
            {
            }
            column(Asset_Description; "Description")
            {
            }
            column(QR_Code_ID; "QR-Code ID")
            {
            }
            column(QR_Code_Image; EncodedText)
            {
            }

            trigger OnAfterGetRecord()
            var
                BarcodeString: Text;
                Description: Text;
                BarcodeSymbology: Enum "Barcode Symbology 2D";
                BarcodeFontProvider: Interface "Barcode Font Provider 2D";
            begin
                BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarcodeSymbology := Enum::"Barcode Symbology 2D"::"QR-Code";
                BarcodeString := "QR-Code ID";
                Description := FixedAsset.Description;
                EncodedText := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(AssetFillter; AssetFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Asset No.';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        AssetFilter: Code[20];
        EncodedText: Text;
}
