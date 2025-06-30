page 51501 "FM Service Request Card"
{
    PageType = Card;
    SourceTable = "FM Service Request Header";
    ApplicationArea = All;
    Caption = 'Service Request Details';

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Service Request ID"; Rec."Service Request ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = All;
                    // Editable = false;
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                }
            }
            group("Contact Details")
            {
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;

                }
                field(contactPhone; Rec."Contact Phone")
                {
                    ApplicationArea = All;
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = All;
                }

            }

            group("Request Details")
            {
                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = All;
                }
                field("Unit/Flat No."; Rec."Unit/Flat No.")
                {
                    ApplicationArea = All;
                }
                field("Service Category"; Rec."Service Category")
                {
                    ApplicationArea = All;
                }
                field("Service Sub-Type"; Rec."Service Sub-Type")
                {
                    ApplicationArea = All;
                }
                field(problemDescription; Rec."Problem Description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Urgency Level"; Rec."Urgency Level")
                {
                    ApplicationArea = All;
                }
            }

            part("Asset Information "; "Service Request Asset SubPage")
            {
                ApplicationArea = All;
                Caption = 'Asset Information';
                SubPageLink = "Service Request ID" = field("Service Request ID");
                UpdatePropagation = Both;
            }
            part(InspectionHistory; "Service Request Info SubPage")
            {
                SubPageLink = "Asset ID" = FIELD("Asset ID");
                ApplicationArea = All;
            }
            part("Maintenance History"; ServiceReqMaintenanceSubPage)
            {
                ApplicationArea = All;
                Caption = 'Maintenance History';
                SubPageLink = "Work Order ID" = field("Assigned Work Order ID");
            }
            field("Approval Action"; Rec."Approval Action")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    ContactLog: Record "FM Service Request Approval";
                begin
                    case Rec."Approval Action" of

                        Rec."Approval Action"::"Send for Approval":
                            begin
                                Rec."Approval Status" := Rec."Approval Status"::Pending;

                                // Log to Contact Log Table
                                ContactLog.Init();
                                ContactLog."Status" := ContactLog."Status"::Pending;
                                ContactLog."Service Request ID" := Rec."Service Request ID";
                                ContactLog."Contact Name" := Rec."Contact Name";
                                ContactLog."Contact Phone" := Rec."Contact Phone";
                                ContactLog."Contact Email" := Rec."Contact Email";
                                ContactLog.Insert();

                                Message('Approval request sent and logged.');
                            end;

                        Rec."Approval Action"::Approved:
                            begin
                                Rec."Approval Status" := Rec."Approval Status"::Approved;
                                Rec."Approved By" := UserId;
                                Rec."Approved Date" := CurrentDateTime();

                                // Optionally update existing entry or log again
                                Message('Approved successfully.');
                            end;

                        Rec."Approval Action"::Rejected:
                            begin
                                Rec."Approval Status" := Rec."Approval Status"::Rejected;
                                Message('Request rejected.');
                            end;
                    end;

                    Rec.Modify();
                end;
            }

        }
    }

    // var
    //     myInt: Integer;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     if (Rec."Service Category" = '') or (Rec."Service Sub-Type" = '') or (Rec."Urgency Level" = Rec."Urgency Level"::" ") or
    //         (Rec."Contact Name" = '') or (Rec."Contact Phone" = '') or (Rec."Contact Email" = '') then
    //         Error('All mandatory fields must be filled before inserting.');
    //     exit(true);
    // end;


}