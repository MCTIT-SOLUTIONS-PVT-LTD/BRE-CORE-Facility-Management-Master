pageextension 51503 "Display QR-Code Image" extends "Fixed Asset Picture"
{
    // DataCaptionExpression = Rec."No.";
    layout
    {
        // Add changes to page layout here
        addafter(Image)
        {
            field("QR-Code Image"; Rec."QR-Code Image")
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Displays the QR-Code image for this asset.';
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