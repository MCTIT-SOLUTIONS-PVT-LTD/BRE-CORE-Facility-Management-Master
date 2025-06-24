page 52001 "Vendor Profile Card"
{
    PageType = Card;
    SourceTable = "Facility Vendor Profiles";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Identification")
            {
                Caption = 'Vendor Identification Details';

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Type"; Rec."Vendor type")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Type';
                }

                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = All;
                }
            }

            group("Address & Contact")
            {
                Caption = 'Address & Contact';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;
                    }
                    field("Address 3"; Rec."Address 3")
                    {
                        ApplicationArea = All;
                        Caption = 'Address 3';
                    }
                    field("P.O.Box"; Rec."P.O.Box")
                    {
                        ApplicationArea = All;
                        Caption = 'P.O.Box';
                    }

                    field(Country; Rec.Country)
                    {
                        ApplicationArea = All;
                    }
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field(MobilePhoneNo; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mobile Phone No.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = All;
                }
                field("Our Account No."; Rec."Our Account No.")
                {
                    ApplicationArea = All;
                }
                group(Contact)
                {
                    Caption = 'Contact';
                    field("Primary Contact Code"; Rec."Primary Contact Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Primary Contact Code';
                    }
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';

                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                }
                field("Price Calculation Method"; Rec."Price Calculation Method")
                {
                    ApplicationArea = All;
                }
                field("Price Including VAT"; Rec."Price Including VAT")
                {
                    ApplicationArea = All;
                }

            }
            group(Payments)
            {
                Caption = 'Payments';

                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {
                    ApplicationArea = All;
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = All;
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = All;
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                    ApplicationArea = All;
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = All;
                }
            }
            group(Receiving)
            {
                Caption = 'Receiving';
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = All;
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    ApplicationArea = All;
                }
            }
            field("Over-Receipt Code"; Rec."Over-Receipt Code")
            {
                ApplicationArea = All;
            }
            field("Receive E-Document To"; Rec."Receive E-Document To")
            {
                ApplicationArea = All;
            }
            //////////////////////////////////////////////////////////////// FACILITY FIELDS///////////////////////////////////////////////////////////
            group("Vendor Statutory registration and license Details")
            {
                group("Trade License")
                {
                    field("TradeLicense IssuingAuthority"; Rec."TradeLicense IssuingAuthority")
                    {
                        ApplicationArea = All;
                        Caption = 'Trade License Issuing Authority';
                    }
                    field("Trade License Number"; Rec."Trade License Number")
                    {
                        ApplicationArea = All;
                        Caption = 'Trade License Number';
                    }
                    field("Trade License Issue Date"; Rec."Trade License Issue Date")
                    {
                        ApplicationArea = All;
                        Caption = 'Trade License Issue Date';
                    }
                    field("Trade License Expiry Date"; Rec."Trade License Expiry Date")
                    {
                        ApplicationArea = All;
                        Caption = 'Trade License Expiry Date';
                    }
                }

                group(" ")
                {
                    field("VAT Registration Number"; Rec."VAT Registration Number")
                    {
                        ApplicationArea = All;
                        Caption = 'VAT Registration Number';
                    }
                    field("Corporate Tax Registration"; Rec."Corporate Tax Registration")
                    {
                        ApplicationArea = All;
                        Caption = 'Corporate Tax Registration';
                    }
                }

                group("Establishment Details")
                {
                    field("EC Number"; Rec."EC Number")
                    {
                        ApplicationArea = All;
                        Caption = 'EC Number';
                    }
                    field("Issuing Authority"; Rec."Issuing Authority")
                    {
                        ApplicationArea = All;
                        Caption = 'Issuing Authority';
                    }
                    field("Issue Date"; Rec."Issue Date")
                    {
                        ApplicationArea = All;
                        Caption = 'Issue Date';
                    }
                    field("Expiry Date"; Rec."Expiry Date")
                    {
                        ApplicationArea = All;
                        Caption = 'Expiry Date';
                    }
                }
            }
            group("Primary Contact")
            {

                field("Profile ID"; Rec."Profile ID")
                {
                    ApplicationArea = All;
                    Caption = 'Profile ID';
                }
                field("Profile Name"; Rec."Profile Name")
                {
                    ApplicationArea = All;
                    Caption = 'Profile Name';
                }
                field("Designation"; Rec."Designation")
                {
                    ApplicationArea = All;
                    Caption = 'Designation';
                }
                field("Profile Mobile No."; Rec."Profile Mobile No.")
                {
                    ApplicationArea = All;
                    Caption = 'Mobile No.';
                }
                field("Profile Nationality"; Rec."Profile Nationality")
                {
                    ApplicationArea = All;
                    Caption = 'Nationality';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address';
                }

            }

            group("Owners/Partners/Authorised Signatory Details")
            {
                field("Owners Name"; Rec."Owners Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Owners Designation"; Rec."Owners Designation")
                {
                    ApplicationArea = All;
                    Caption = 'Designation';
                }
                field("Emirates ID"; Rec."Emirates ID")
                {
                    ApplicationArea = All;
                    Caption = 'Emirates ID';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = All;
                    Caption = 'Passport Number';
                }

            }

            group("Bank Details")
            {
                Caption = 'Bank Details';
                // Visible = IsFacilityVendor;
                field("Bank Account No."; Rec."Bank Account No.") { ApplicationArea = All; }
                field("Account Name"; Rec."Account Name") { ApplicationArea = All; }
                field("Bank Name"; Rec."Bank Name") { ApplicationArea = All; }
                field("Bank Branch"; Rec."Bank Branch") { ApplicationArea = All; }
                field("IBAN"; Rec."IBAN") { ApplicationArea = All; }
                field("SWIFT Code"; Rec."SWIFT Code") { ApplicationArea = All; }
                field("Bank Info Verified"; Rec."Bank Info Verified") { ApplicationArea = All; }
                field("Verification Date"; Rec."Verification Date") { ApplicationArea = All; }

                field("IBAN Certificate"; Rec."IBAN Certificate")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        azureBlobUploader: Codeunit "Azure AD Blob Storage";
                        fileName: Text;
                        uploadResult: Text;
                        folderName: Text;
                    begin
                        folderName := 'IBANCertificates';
                        fileName := azureBlobUploader.ValidateDocument(uploadResult, folderName);
                        if fileName <> '' then begin
                            // Rec."Upload Document" := fileName;
                            Rec."IBAN Certificate" := uploadResult;
                            Rec.Modify();
                            Message('File uploaded successfully: %1', fileName);
                        end;
                    end;
                }

            }

            ///////////////////////////////////////////////////////// FACILITY FIELDS//////////////////////////////////////////////////////////     

        }
    }
}





