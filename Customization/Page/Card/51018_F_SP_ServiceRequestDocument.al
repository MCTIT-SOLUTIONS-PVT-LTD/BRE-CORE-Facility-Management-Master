page 51018 "FM SR Document SubPage"
{
    PageType = ListPart;
    SourceTable = "FM Service Request Documents";
    Caption = 'Attachments';
    ApplicationArea = All;

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

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("File Name"; rec."File Name") { ApplicationArea = All; }

                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = All;

                }
                field("Upload Document"; rec."Upload Document")
                {
                    ApplicationArea = All;
                    Caption = 'Upload Document';
                    Editable = false;

                    trigger OnDrillDown()
                    var
                        azureBlobUploader: Codeunit "Azure AD Blob Storage";
                        fileName: Text;
                        folderName: Text;
                        uploadResult: Text;
                    begin
                        folderName := 'ConstructionContracts';
                        fileName := azureBlobUploader.ValidateDocument(uploadResult, folderName);
                        if fileName <> '' then begin
                            Rec."Upload Document" := fileName;
                            Rec."View" := uploadResult;
                            Rec.Modify();
                            Message('File uploaded successfully: %1', fileName);
                        end;
                    end;
                }

                field("View"; rec."View")
                {
                    ApplicationArea = All;
                    Caption = 'View & Download';
                    Editable = false;
                    trigger OnDrillDown()
                    begin
                        // Check if the file URL is not empty
                        if Rec."Document URL" = '' then
                            Error('No document is available to view.')
                        else
                            Hyperlink(Rec."Document URL");
                    end;
                }
                field("Description"; rec.Description) { ApplicationArea = All; }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        DocRec: Record "FM Service Request Documents";
        MaxLineNo: Integer;
    begin
        if Rec."Service Request ID" <> '' then begin
            DocRec.SetRange("Service Request ID", Rec."Service Request ID");
            if DocRec.FindLast() then
                MaxLineNo := DocRec."Entry No.";
            Rec."Entry No." := MaxLineNo + 1;
        end;
    end;
}
