page 51017 "Service Request Approval List"
{
    PageType = List;
    SourceTable = "FM Service Request Approval";
    ApplicationArea = All;
    Caption = 'Service Request Approval List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Service Request ID"; Rec."Service Request ID") { ApplicationArea = All; }
                field("Contact Name"; Rec."Contact Name") { ApplicationArea = All; }
                field("Phone Number"; Rec."Contact Phone") { ApplicationArea = All; }
                field("Email"; Rec."Contact Email") { ApplicationArea = All; }
                field("Requested Date"; Rec."Requested Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //   Visible = IsFinanceManager;


                trigger OnAction()
                var
                    servicerequest: Record "FM Service Request Header";
                    approvalstatus: Enum "Approval Status Enum";
                    sendrequest: Codeunit "Service Request Approval";
                begin
                    if Rec.Status = Rec.Status::Approved then
                        Error('This entry is already approved');

                    if Confirm('Do you want to approve this entry?') then begin
                        // Update entry status
                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify();

                        // Update main record status
                        if servicerequest.Get(Rec."Service Request ID") then begin
                            servicerequest."Approval Action" := servicerequest."Approval Action"::Approved;
                            servicerequest.Modify();
                            sendrequest.Approvalservicerequest(Rec);
                        end;

                        Message('Entry has been approved successfully!');
                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                // Visible = IsFinanceManager;

                trigger OnAction()
                var
                    servicerequest: Record "FM Service Request Header";
                    approvalstatus: Enum "Approval Status Enum";
                    sendrequest: Codeunit "Service Request Approval";
                begin
                    if Rec.Status = Rec.Status::Rejected then
                        Error('This entry is already rejected');

                    if Confirm('Do you want to approve this entry?') then begin
                        // Update entry status
                        Rec.Status := Rec.Status::Rejected;
                        Rec.Modify();

                        // Update Credit Note record
                        if servicerequest.Get(Rec."Service Request ID") then begin
                            servicerequest."Approval Action" := servicerequest."Approval Action"::Rejected;
                            servicerequest.Modify();
                            sendrequest.Rejectservicerequest(Rec);
                        end;
                        Message('Entry has been rejected successfully!');
                    end;
                end;
            }
        }

    }
}
