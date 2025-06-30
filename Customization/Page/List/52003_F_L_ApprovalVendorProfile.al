page 52003 "Approval Vendor Profile List"
{
    PageType = List;
    SourceTable = "Approval Vendor Profile";
    ApplicationArea = All;
    Caption = 'Approval Vendor Profile List';
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        vendorprofile: Record "Facility Vendor Profiles";
                    begin
                        vendorprofile.SetRange("Vendor ID", Rec."Vendor ID");
                        if vendorprofile.FindSet() then
                            PAGE.RunModal(PAGE::"VendorProfile", vendorprofile)
                        else
                            Message('No Vendor Profile found using FindFirst either.');
                    end;
                }
                field("Profile ID"; Rec."Profile ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = All;
                }
                field("Country"; Rec."Country")
                {
                    ApplicationArea = All;
                }
                field("Emirate"; Rec."Emirate")
                {
                    ApplicationArea = All;
                }
                field("Community"; Rec."Community")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
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
                    VendorProfile: Record "Facility Vendor Profiles";
                    approvalstatus: Enum "Approval Status Enum";
                    approvalrequest: Codeunit "Approval Vendor Profile";
                begin
                    if Rec.Status = Rec.Status::Approved then
                        Error('This entry is already approved');

                    if Confirm('Do you want to approve this entry?') then begin
                        // Update entry status
                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify();

                        // Update main record status
                        if VendorProfile.Get(Rec."Profile ID") then begin
                            VendorProfile.Status := approvalstatus::Approved;
                            VendorProfile.Modify();
                            approvalrequest.Approvalrequest(Rec);
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
                    VendorProfile: Record "Facility Vendor Profiles";
                    approvalstatus: Enum "Approval Status Enum";
                    approvalrequest: Codeunit "Approval Vendor Profile";
                begin
                    if Rec.Status = Rec.Status::Rejected then
                        Error('This entry is already rejected');

                    if Confirm('Do you want to approve this entry?') then begin
                        // Update entry status
                        Rec.Status := Rec.Status::Rejected;
                        Rec.Modify();

                        // Update Credit Note record
                        if VendorProfile.Get(Rec."Profile ID") then begin
                            VendorProfile.Status := approvalstatus::Rejected;
                            VendorProfile.Modify();
                            approvalrequest.Rejectrequest(Rec);
                        end;
                        Message('Entry has been rejected successfully!');
                    end;
                end;
            }
        }

    }

}
