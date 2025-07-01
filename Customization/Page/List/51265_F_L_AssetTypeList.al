page 51265 "Asset Type List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Asset Type";
    Caption = 'Asset Types';

    layout
    {
        area(Content)
        {
            repeater(AssetTypes)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}