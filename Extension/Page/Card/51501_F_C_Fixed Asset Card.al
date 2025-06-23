pageextension 51501 "Fixed Asset Card" extends "Fixed Asset Card"
{
    layout
    {
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
                field(Emirate; Rec.Emirate) { ApplicationArea = All; }
                field(Community; Rec.Community) { ApplicationArea = All; }
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
                field("Barcode ID"; Rec."Barcode ID") { ApplicationArea = All; }
                field("Barcode Type"; Rec."Barcode Type")
                {
                    ApplicationArea = All;

                }
                field("Barcode Generated?"; Rec."Barcode Generated?") { ApplicationArea = All; Editable = false; }

                field("Barcode Image"; Rec."Barcode Image")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
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
        }
    }

    var
        myInt: Integer;
}