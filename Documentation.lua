local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/neonixran/MaterialLua/master/Module.lua"), "Material Lua")()

Library:Notification({
    -> Title <string[any]>
    -> Description <string[any]>
    -> Duration <number[inf]> 
})

local Lib = Library:Load({
    -> Title <string[any]>
    -> RichText <bool=false>
    -> Font <EnumItem[any]>
    -> Style <number[1, 2, 3]>
    -> SizeX <number[inf]>
    -> SizeY <number[inf]>
    -> DestroyOtherGUIs <bool=true>
    -> Theme <string["Light", "Dark", "Mocha", "Aqua", "Jester"]
    -> Overrides <table>
    -> Menu <table>
})

Lib:Banner({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Duration <number[inf]>
    -> Button <string[any]>
    -> Options <table>
})

local Main = Lib:New({
    -> Title <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Image <number[AssetID]>
})

Main:Separator({
    Visible = <bool=true>
})

Main:Label({
    -> Text <string[any]>
    -> XAlignment <string["Left", "Center", "Right"]>
    -> RichText 
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> MouseEnter <function(LabelLibrary, Connection)>
    -> MouseLeave <function(LabelLibrary, Connection)>
    -> Menu <table>
})

Main:Button({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Callback <function(ButtonLibrary)>
    -> Menu <table>
})

Main:Toggle({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true> 
    -> Enabled <bool=false>
    -> Disable <bool=true>
    -> Callback <function(State, ToggleLibrary)>
    -> Menu <table>
})

Main:Slider({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Min <number[inf]>
    -> Max <number[inf]>
    -> Precision <number[inf]>
    -> Default <number[inf]>
    -> Callback <function(Value, SliderLibrary)>
    -> Menu <table>
})

Main:Dropdown({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Default <string[Option]>
    -> Hide <bool=true>
    -> Options <table>
    -> Callback <function(Selected)>
    -> Menu <table>
})

Main:ChipSet({
    -> Disable <bool=true>
    -> Visible <bool=true>
    -> Callback <function(Selected, State, ChipSetLibrary)>
    -> Options <table>
})

Main:DataTable({
    -> Disable <bool=true>
    -> Visible <bool=true>
    -> Callback <function(Selected, State, DataTableLibrary)>
    -> Options <table> 
})

Main:ColorPicker({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Default <Color3[any]>
    -> Callback <function(Color, ColorPickerLibrary)>
    -> Menu <table>
})

Main:Bind({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Enabled <bool=false>
    -> Notify <bool=false>
    -> KeyCode <EnumItem[Key]>
    -> Callback <function(State, BindLibrary)>
    -> Menu <table>
})

Main:TextField({
    -> Text <string[any]>
    -> RichText <bool=false>
    -> TextColor <Color3[any]>
    -> Font <EnumItem[any]>
    -> Visible <bool=true>
    -> Default <string[any]>
    -> InputType <string["Number", "Phone", "Default", "PasswordShown", "Username"]
    -> Callback <function(Text, TextFieldLibrary)>
    -> Menu <table>
})

Main:GuiSettings({
    -> Theme <bool=true>
    -> Options <bool=true>
    -> Rejoin <bool= true>
})


-- Custom Functions

<string> Library:GetLoadedTime(<void>)
<table> Library:GetBlacklist(<void>)
<void> Library:Blacklist_KeyCode(<string["Add", "Remove"]>, <Enum/table[KeyCode]>)

<void> Lib:SetTitle(<string[any]>)
<string> Lib:GetTitle(<void>)
<void> Lib:SetTextColor(<Color3>)
<Color3> Lib:GetTextColor(<void>)
<void> Lib:SetFont(<EnumItem>)
<EnumItem> Lib:GetFont(<void>)
<void> Lib:CloseUI(<void>)

<void> Banner:SetText(<string[any]>)
<string> Banner:GetText(<void>)
<void> Banner:SetTextColor(<Color3>)
<Color3> Banner:GetTextColor(<void>)
<void> Banner:SetFont(<EnumItem>)
<EnumItem> Banner:GetFont(<void>)
<void> Banner:Close(<void>)

<void> Main:SetText(<string[any]>)
<string> Main:GetText(<void>)
<void> Main:SetTextColor(<Color3>)
<Color3> Main:GetTextColor(<void>)
<void> Main:SetFont(<EnumItem>)
<EnumItem> Main:GetFont(<void>)
<void> Main:SetVisible(<bool>)
<bool> Main:GetVisible(<void>)
<void> Main:SetImage(<number[AssetID]>)
<number> Main:GetImage(<void>)

<void> Separator:SetVisible(<bool>)
<bool> Separator:GetVisible(<void>)
<void> Separator:Destroy(<void>)

<void> Label:SetText(<string[any]>)
<string> Label:GetText(<void>)
<void> Label:SetAlignment(<string["Left", "Center", "Right"]>)
<string> Label:GetAlignment(<void>)
<void> Label:SetTextColor(<Color3>)
<Color3> Label:GetTextColor(<void>)
<void> Label:SetFont(<EnumItem>)
<EnumItem> Label:GetFont(<void>)
<void> Label:SetVisible(<bool>)
<bool> Label:GetVisible(<void>)
<void> Label:Destroy(<void>)

<void> Button:SetText(<string[any]>)
<string> Button:GetText(<void>)
<void> Button:SetTextColor(<Color3>)
<Color3> Button:GetTextColor(<void>)
<void> Button:SetFont(<EnumItem>)
<EnumItem> Button:GetFont(<void>)
<void> Button:SetVisible(<bool>)
<bool> Button:GetVisible(<void>)
<void> Button:Click(<void)
<void> Button:Destroy(<void>)

<void> Toggle:SetText(<string[any]>)
<string> Toggle:GetText(<void>)
<void> Toggle:SetTextColor(<Color3>)
<Color3> Toggle:GetTextColor(<void>)
<void> Toggle:SetFont(<EnumItem>)
<EnumItem> Toggle:GetFont(<void>)
<void> Toggle:SetVisible(<bool>)
<bool> Toggle:GetVisible(<void>)
<void> Toggle:SetState(<bool>)
<bool> Toggle:GetState(<void>)
<void> Toggle:SetDisable(<bool>)
<bool> Toggle:GetDisable(<void>)
<void> Toggle:StateChanged(<function(Callback)>)
<void> Toggle:Destroy(<void>)

<void> Slider:SetText(<string[any]>)
<string> Slider:GetText(<void>)
<void> Slider:SetTextColor(<Color3>)
<Color3> Slider:GetTextColor(<void>)
<void> Slider:SetFont(<EnumItem>)
<EnumItem> Slider:GetFont(<void>)
<void> Slider:SetVisible(<bool>)
<bool> Slider:GetVisible(<void>)
<void> Slider:SetMin(<number[inf]>)
<number> Slider:GetMin(<void>)
<void> Slider:SetMax(<number[inf]>)
<number> Slider:GetMax(<void>)
<number> Slider:GetValue(<void>)
<void> Slider:Destroy(<void>)

<void> Dropdown:SetText(<string[any]>)
<string> Dropdown:GetText(<void>)
<void> Dropdown:SetTextColor(<Color3>)
<Color3> Dropdown:GetTextColor(<void>)
<void> Dropdown:SetFont(<EnumItem>)
<EnumItem> Dropdown:GetFont(<void>)
<void> Dropdown:SetVisible(<bool>)
<bool> Dropdown:GetVisible(<void>)
<void> Dropdown:SetOptions(<table>)
<table> Dropdown:GetOptions(<void>)
<void> Dropdown:SetOption(<string[any]>)
<string> Dropdown:GetOption(<void>)
<void> Dropdown:Destroy(<void>)

<void> ChipSet:SetOptions(<table>)
<table> ChipSet:GetOptions(<void>)
<void> ChipSet:SetState(<bool>)
<bool> ChipSet:GetState(<void>)
<void> ChipSet:SetVisible(<bool>)
<bool> ChipSet:GetVisible(<void>)
<void> ChipSet:Destroy(<void>)

<void> DataTable:SetOptions(<table>)
<table> DataTable:GetOptions(<void>)
<void> DataTable:SetState(<bool>)
<bool> DataTable:GetState(<void>)
<void> DataTable:SetVisible(<bool>)
<bool> DataTable:GetVisible(<void>)
<void> DataTable:Destroy(<void>)

<void> ColorPicker:SetText(<string[any]>)
<string> ColorPicker:GetText(<void>)
<void> ColorPicker:SetTextColor(<Color3>)
<Color3> ColorPicker:GetTextColor(<void>)
<void> ColorPicker:SetFont(<EnumItem>)
<EnumItem> ColorPicker:GetFont(<void>)
<void> ColorPicker:SetVisible(<bool>)
<bool> ColorPicker:GetVisible(<void>)
<void> ColorPicker:SetColor(<Color3>)
<Color3> ColorPicker:GetColor(<void>)
<void> ColorPicker:Destroy(<void>)

<void> Bind:SetText(<string[any]>)
<string> Bind:GetText(<void>)
<void> Bind:SetTextColor(<Color3>)
<Color3> Bind:GetTextColor(<void>)
<void> Bind:SetFont(<EnumItem>)
<EnumItem> Bind:GetFont(<void>)
<void> Bind:SetVisible(<bool>)
<bool> Bind:GetVisible(<void>)
<void> Bind:SetState(<bool>)
<bool> Bind:GetState(<void>)
<void> Bind:SetNotify(<bool>)
<bool> Bind:GetNotify(<void>)
<void> Bind:SetBind(<string>)
<string> Bind:GetBind(<void>)
<void> Bind:Destroy(<void>)

<void> TextField:SetText(<string[any]>, <string["Title", "Text"]>)
<string> TextField:GetText(<string["Title", "Text"]>)
<void> TextField:SetTextColor(<Color3>)
<Color3> TextField:GetTextColor(<void>)
<void> TextField:SetFont(<EnumItem>)
<EnumItem> TextField:GetFont(<void>)
<void> TextField:SetVisible(<bool>)
<bool> TextField:GetVisible(<void>)
<void> TextField:SetInputType(<string["Default", "Number", "Phone", "PasswordShown"...]>)
<string> TextField:GetInputType(<void>)
