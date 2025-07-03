pageextension 51503 "Display Barcode Image" extends "Fixed Asset Picture"
{
    // DataCaptionExpression = Rec."No.";
    layout
    {
        // Add changes to page layout here
        addafter(Image)
        {
            field("Barcode Image"; Rec."Barcode Image")
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Displays the barcode image for this asset.';
                Editable = false;
                Visible = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}