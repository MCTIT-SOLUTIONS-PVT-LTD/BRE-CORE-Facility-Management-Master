pageextension 51254 "Fixed_Asset_List" extends "Fixed Asset List"
{
    layout
    {
        modify("Responsible Employee")
        {
            Visible = false;
        }
        modify("FA Class Code")
        {
            Visible = false;
        }
        modify("FA Subclass Code")
        {
            Visible = false;
        }
        modify("FA Location Code")
        {
            Visible = false;
        }
        modify(Acquired)
        {
            Visible = false;
        }
        addbefore(Description)
        {
            field("Asset Name"; Rec."Asset Name")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Asset Type Code"; Rec."Asset Type Code")
            {
                ApplicationArea = All;
            }
            field("Sub-Equipment Name"; Rec."Sub-Equipment Name")
            {
                ApplicationArea = All;
            }
            field("Equipment Name"; Rec."Equipment Name")
            {
                ApplicationArea = All;
            }
            field("OEM Name"; Rec."OEM Name")
            {
                ApplicationArea = All;
            }
            field("Warranty Date"; Rec."Warranty Date")
            {
                ApplicationArea = All;
            }
            field("Purchase Date"; Rec."Purchase Date")
            {
                ApplicationArea = All;
            }
        }
    }
}