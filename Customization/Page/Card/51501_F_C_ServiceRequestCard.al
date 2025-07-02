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
                // UpdatePropagation = Both;
            }
            part(InspectionHistory; "Service Request Info SubPage")
            {
                // SubPageLink = "Asset ID" = FIELD("Asset ID");
                ApplicationArea = All;
                SubPageLink = "Service Request ID" = field("Service Request ID");

            }
            part("Maintenance History"; ServiceReqMaintenanceSubPage)
            {
                ApplicationArea = All;
                Caption = 'Maintenance History';
                // SubPageLink = "Work Order ID" = field("Assigned Work Order ID");
                SubPageLink = "Service Request ID" = field("Service Request ID");

            }
            part(Attachments; "FM SR Document SubPage")
            {
                Caption = 'Attachments';
                ApplicationArea = All;
                SubPageLink = "Service Request ID" = FIELD("Service Request ID");
            }
            part("Insurance History"; "Service Request Insurance Card")
            {
                ApplicationArea = All;
                Caption = 'Insurance History';
                SubPageLink = "Policy ID" = field("Asset ID");
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



}