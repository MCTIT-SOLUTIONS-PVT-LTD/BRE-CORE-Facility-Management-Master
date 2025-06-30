pageextension 51251 "Facility Dashboard" extends "Business Manager Role Center"
{
    actions
    {
        addfirst(sections)
        {
            group(Action43)
            {
                Caption = 'Facility Management';
                action(OEMMaster)
                {
                    Caption = 'OEM Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "OEM Master List";
                }
                action(EquipmentMaster)
                {
                    Caption = 'Equipment Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Equipment Master List";
                }
                action(SubEquipmentMaster)
                {
                    Caption = 'Sub Equipment Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Sub-Equipment List";
                }
                action(PartsMaster)
                {
                    Caption = 'Parts Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Parts Master List";
                }
                action(AssetMaster)
                {
                    Caption = 'Asset Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "Fixed Asset List";
                }
                action(ServceRequestMaster)
                {
                    Caption = 'Service Request Master';
                    ApplicationArea = Basic, Suite;
                    RunObject = Page "FM Service Request List";
                }

            }
        }
    }
}