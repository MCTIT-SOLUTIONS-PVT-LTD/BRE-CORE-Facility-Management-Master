page 51253 "OEM Master Card"
{
    PageType = Card;
    SourceTable = "OEM Master";
    ApplicationArea = All;
    Caption = 'OEM Master';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'OEM Details';

                field("OEM ID"; Rec."OEM ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("OEM Name"; Rec."OEM Name")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                }

                field("OEM Description"; Rec."OEM Description")
                {
                    ApplicationArea = All;
                }

                field("Equipment Category"; Rec."Equipment Category")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                    // Lookup properties to enable adding new records
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        EquipmentCategory: Record "Equipment Category";
                        EquipmentCategoryList: Page "Equipment Category List";
                    begin
                        // Set the lookup page to show dropdown style
                        EquipmentCategoryList.LookupMode(true);
                        EquipmentCategoryList.SetRecord(EquipmentCategory);

                        // If current value exists, position on that record
                        if Rec."Equipment Category" <> '' then begin
                            EquipmentCategory.SetRange("Equipment Type", Rec."Equipment Category");
                            if EquipmentCategory.FindFirst() then
                                EquipmentCategoryList.SetRecord(EquipmentCategory);
                        end;

                        if EquipmentCategoryList.RunModal() = Action::LookupOK then begin
                            EquipmentCategoryList.GetRecord(EquipmentCategory);
                            Text := EquipmentCategory."Equipment Type";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
            }
            group("Contact Details")
            {
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;
                }

                field(Website; Rec.Website)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}