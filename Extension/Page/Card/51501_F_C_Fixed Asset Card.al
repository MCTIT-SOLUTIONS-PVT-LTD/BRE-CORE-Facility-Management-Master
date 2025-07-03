pageextension 51501 "Fixed Asset Card" extends "Fixed Asset Card"
{
    layout
    {
        // modify("No.")
        // {
        //     Visible = true;
        // }
        modify("Depreciation Book")
        {
            Visible = false;
        }
        modify("Electronic Document")
        {
            Visible = false;
        }
        modify("Responsible Employee")
        {
            Visible = false;
        }
        modify("FA Class Code")
        {
            Visible = false;
        }
        modify("FA Subclass Code")
        {
            Visible = false;
        }
        modify("FA Location Code")
        {
            Visible = false;
        }
        modify("Budgeted Asset")
        {
            Visible = false;
        }
        modify("Serial No.")
        {
            Visible = false;
        }
        modify("Main Asset/Component")
        {
            Visible = false;
        }
        modify("Component of Main Asset")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify(Inactive)
        {
            Visible = false;
        }
        modify(Blocked)
        {
            Visible = false;
        }
        modify(Acquired)
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Maintenance Vendor No.")
        {
            Visible = false;
        }
        addbefore(Description)
        {
            // field("Asset ID"; Rec."Asset ID")
            // {
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            field("Asset Name"; Rec."Asset Name")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Asset Type Code"; Rec."Asset Type Code")
            {
                ApplicationArea = All;
                trigger OnLookup(var Text: Text): Boolean
                var
                    AssetType: Record "Asset Type";
                    AssetTypeList: Page "Asset Type List";
                begin
                    AssetTypeList.LookupMode(true);
                    if AssetTypeList.RunModal() = Action::LookupOK then begin
                        AssetTypeList.GetRecord(AssetType);
                        Rec."Asset Type Code" := AssetType.Code;
                        CurrPage.Update();
                    end;
                end;
            }
            // field("Asset Type Description"; Rec."Asset Type Description")
            // {
            //     ApplicationArea = All;
            // }
            field("Sub-Equipment ID"; Rec."Sub-Equipment ID")
            {
                ApplicationArea = All;
                Lookup = true;
            }
            field("Sub-Equipment Name"; Rec."Sub-Equipment Name")
            {
                ApplicationArea = All;
                Lookup = true;
                Editable = false;
            }
            field("Equipment Id"; Rec."Equipment Id")
            {
                ApplicationArea = All;
                Lookup = true;
                Editable = false;
            }
            field("Equipment Name"; Rec."Equipment Name")
            {
                ApplicationArea = All;
                Lookup = true;
                Editable = false;
            }
            field("OEM Id"; Rec."OEM Id")
            {
                ApplicationArea = All;
                Lookup = true;
            }
            field("OEM Name"; Rec."OEM Name")
            {
                ApplicationArea = All;
                Lookup = true;
                Editable = false;
            }
            field("Owned By"; Rec."Owned By")
            {
                ApplicationArea = All;
            }
            field("Additional Note"; Rec."Additional Note")
            {
                ApplicationArea = All;
                MultiLine = true;
            }
            // field("Upload Image"; Rec."Upload Image")
            // {
            //     ApplicationArea = All;
            // }
        }
        // Add changes to page layout here
        addlast(Content)
        {
            group("Location & Contact Info")
            {
                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        PropertyRec: record "Property Registration";
                        unitRec: record Item;
                    begin
                        if Rec."Property Code" <> '' then begin
                            //Fetch details from property master and unit tables
                            PropertyRec.SetRange("Property ID", Rec."Property Code");
                            if PropertyRec.FindSet() then begin
                                //Assume propertyRec includes location details.
                                Rec.Emirate := PropertyRec.Emirate;
                                Rec.Community := PropertyRec.Community;

                                //Assume there's a relationship between property and unit.
                                // unitRec.SetRange("Property ID", Rec."Property Code");
                                // if unitRec.FindSet() then begin
                                //     Rec."Unit No." := unitRec.UnitID;

                                // end;
                            end;


                        end;
                    end;
                }
                field("Unit No."; Rec."Unit No.") { ApplicationArea = All; }
                field("Location Description"; Rec."Location Description") { ApplicationArea = All; }
                field(Emirate; Rec.Emirate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Community; Rec.Community)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Contact Name"; Rec."Contact Name") { ApplicationArea = All; }
                field("Contact Email"; Rec."Contact Email") { ApplicationArea = All; }
                field("Contact No."; Rec."Contact No.") { ApplicationArea = All; }
            }
        }
        addafter(Insured)
        {
            // Warranty Info
            field("Purchase Date"; Rec."Purchase Date") { ApplicationArea = All; }
            field("Warranty Start Date"; Rec."Warranty Start Date") { ApplicationArea = All; }
            field("Warranty End Date"; Rec."Warranty End Date") { ApplicationArea = All; }

            // AMC Info
            field("Under AMC"; Rec."Under AMC") { ApplicationArea = All; }
            field("AMC Start Date"; Rec."AMC Start Date") { ApplicationArea = All; }
            field("AMC End Date"; Rec."AMC End Date")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if Rec."AMC End Date" < Rec."AMC Start Date" then
                        Error('AMC End Date cannot be earlier than AMC Start Date.');
                end;
            }
            field("AMC Vendor"; Rec."AMC Vendor") { ApplicationArea = All; }

            // Insurance Info
            field("Insurance Provider"; Rec."Insurance Provider") { ApplicationArea = All; }
            field("Insurance Policy No."; Rec."Insurance Policy No.") { ApplicationArea = All; }
            field("Insurance Start Date"; Rec."Insurance Start Date") { ApplicationArea = All; }
            field("Insurance End Date"; Rec."Insurance End Date")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if Rec."Insurance End Date" < Rec."Insurance Start Date" then
                        Error('Insurance End Date cannot be earlier than Insurance Start Date.');
                end;
            }
            field("Insured Value"; Rec."Insured Value") { ApplicationArea = All; }

            // Maintenance Plan
            field("Maintenance Frequency"; Rec."Maintenance Frequency") { ApplicationArea = All; }
            field("Maintenance Notes"; Rec."Maintenance Notes") { ApplicationArea = All; }
            field("Previous Service Date"; Rec."Previous Service Date") { ApplicationArea = All; }
            // field("Next Service Date"; Rec."Next Service Date") { ApplicationArea = All; }
        }

        addlast(content)
        {
            group("Barcode Information")
            {
                field("Barcode ID"; Rec."Barcode ID")
                {
                    ApplicationArea = All;
                    // trigger OnValidate()
                    // var
                    //     Asset: Record "Fixed Asset";
                    // begin
                    //     if Asset.Get(Rec."Barcode ID") then
                    //         PAGE.Run(PAGE::"Fixed Asset Card", Asset)
                    //     else
                    //         Error('Asset with this Barcode ID was not found.');
                    // end;
                }
                field("Barcode Type"; Rec."Barcode Type")
                {
                    ApplicationArea = All;
                    Visible = false;

                }
                field("Barcode Generated?"; Rec."Barcode Generated?") { ApplicationArea = All; Editable = false; }

                field("Barcode Image"; Rec."Barcode Image")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Displays the barcode image for this asset.';
                }
            }

        }
    }

    actions
    {

        // Add changes to page actions here
        addlast(processing)
        {
            action("Generate Barcode")
            {
                ApplicationArea = All;
                Caption = 'Generate Barcode';
                Image = BarCode;
                trigger OnAction()
                var
                    BarcodeGen: Codeunit "Barcode Generator";
                begin
                    BarcodeGen.GenerateBarcodeID(Rec);
                    Rec.Modify(true);
                end;
            }
            action(PrintBarcode)
            {
                Caption = 'Print Barcode';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Report.RunModal(51501, true, false, Rec);
                end;
            }
            action("Display Barcode")
            {
                ApplicationArea = All;
                Caption = 'Display Barcode';
                Image = BarCode;
                ToolTip = 'Display barcode for the fixed asset.';
                trigger OnAction()
                var
                    BarcodeString: Text;
                    Description: Text;
                    BarcodeSymbology: Enum "Barcode Symbology 2D";
                    BarcodeImageProvider: Interface "Barcode Image Provider 2D";
                    EncodedText: Text;
                    tempBlob: Codeunit "Temp Blob";
                begin

                    BarcodeImageProvider := Enum::"Barcode Image Provider 2D"::Dynamics2D;
                    BarcodeSymbology := Enum::"Barcode Symbology 2D"::"QR-Code";
                    BarcodeString := Rec."No.";
                    Description := Rec.Description;

                    tempBlob := BarcodeImageProvider.EncodeImage(BarcodeString, BarcodeSymbology);
                    Rec."Barcode Image".ImportStream(tempBlob.CreateInStream(), '');
                    Message('Displaying barcode');
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}