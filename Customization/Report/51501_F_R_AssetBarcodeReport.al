report 51501 "Asset Barcode Report"
{
    ApplicationArea = All;
    Caption = 'Asset Barcode Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = 'AssetBarcodeReportLayout.docx';

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            DataItemTableView = sorting("No.");
            column(Asset_No; "No.")
            {
            }
            column(Asset_Description; "Description")
            {
            }
            column(Barcode_ID; "Barcode ID")
            {
            }
            column(Barcode_Image; EncodedText)
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
                BarcodeString := "Barcode ID";
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
