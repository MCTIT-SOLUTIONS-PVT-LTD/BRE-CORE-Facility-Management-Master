page 51251 "Equipment Master Card"
{
    PageType = Card;
    SourceTable = "Equipment Master";
    ApplicationArea = All;
    Caption = 'Equipment Master';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Equipment Details';
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Equipment Description"; Rec."Equipment Description")
                {
                    ApplicationArea = All;
                }
                field("Sub Equipment"; Rec."Sub Equipment")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        SubEquipment: Record "Sub-Equipment";
                        SubEquipmentList: Page "Sub-Equipment List";
                    begin
                        // Set the lookup page to show dropdown style
                        SubEquipmentList.LookupMode(true);
                        SubEquipmentList.SetRecord(SubEquipment);

                        // If current value exists, position on that record
                        if Rec."Equipment Category" <> '' then begin
                            SubEquipment.SetRange("Sub-Equipment Name", Rec."Sub Equipment");
                            if SubEquipment.FindFirst() then
                                SubEquipmentList.SetRecord(SubEquipment);
                        end;

                        if SubEquipmentList.RunModal() = Action::LookupOK then begin
                            SubEquipmentList.GetRecord(SubEquipment);
                            Text := SubEquipment."Sub-Equipment Name";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
            }
            group("OEM Details")
            {

                field("OEM ID"; Rec."OEM ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ShowMandatory = true;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("OEM Name"; Rec."OEM Name")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Editable = false;
                }
                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Editable = false;
                }
                field("Unit of Measurement"; Rec."Unit of Measurement")
                {
                    ApplicationArea = All;
                    Lookup = true;
                }
                field("Default Warranty Period"; Rec."Default Warranty Period")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}