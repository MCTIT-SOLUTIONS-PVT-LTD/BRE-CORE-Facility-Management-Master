page 51014 "Service Request Info SubPage"
{
    PageType = ListPart;
    SourceTable = "FM Inspection History";
    ApplicationArea = All;
    Caption = 'Inspection History';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Request ID"; Rec."Service Request ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Inspection ID"; Rec."Inspection ID")
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Caption = 'Inspection ID';
                    ToolTip = 'View the full inspection record';
                }
                field("Asset ID"; Rec."Asset ID")
                {
                    ApplicationArea = All;
                    Caption = 'Asset ID';
                    // TableRelation = "Fixed Asset"."No.";
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                }

                field("Inspector Name"; Rec."Inspector Name")
                {
                    ApplicationArea = All;
                    Caption = 'Inspector Name';
                }

                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }

                field("Inspection Status"; Rec."Inspection Status")
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }

                field("Observation Status"; Rec."Observation Status")
                {
                    ApplicationArea = All;
                    Caption = 'Observation Status';
                    // MultiLine = true;
                }

                field("Reference Document"; Rec."Reference Document")
                {
                    ApplicationArea = All;
                    Caption = 'Reference Document';
                    // MultiLine = true;
                }

            }

            group(NoData)
            {
                ShowCaption = false;
                field(NoInspectionsMsg; NoInspectionsTxt)
                {
                    ApplicationArea = All;
                    Caption = '';
                    Visible = ShowEmptyMessage;
                    Editable = false;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."Service Request ID" = '' then
            Rec.Validate("Service Request ID", xRec."Service Request ID");

        if Rec."Asset ID" = '' then
            Rec.Validate("Asset ID", xRec."Asset ID");
    end;


    trigger OnAfterGetRecord()
    begin
        ShowEmptyMessage := Rec.IsEmpty();
    end;

    trigger OnOpenPage()
    begin
        if AssetIdFilter <> '' then
            Rec.SetRange("Asset ID", AssetIdFilter);
    end;

    var
        AssetIdFilter: Code[20];
        ShowEmptyMessage: Boolean;
        NoInspectionsTxt: Label 'Please select an Asset to view inspection history.', Locked = true;
}