# MaterialLua
A material design library, designed for use in Roblox.

# Discord
[Balance](https://discord.gg/jzR3vfV)

# Documentation Site
[Material Docs](https://archemit.gitbook.io/material-lua/)

# Full Changelog [08/07/2022]
```
- Library:
[+] Added :Separator(...) and :Bind(...) UI Elements.
[+] Added :GetLoaded() and :GuiSettings(...) functions.
[+] Added Save config (this will save: KeyBind, Theme and Overrides -> MainFrame).
    [!] If you change the theme, it will be updated when you run the UI again.
[+] Added blacklisted KeyCodes.
[*] Changed Hide UI button to Destroy UI button.
[!] Changed "." to ":" (Example: .Load to :Load)


- UI elements (This is not available for UI all elements):
[+] Added RichText, TextColor, Font, XAlignment and Visible parameters.
[+] Added :SetAlignment(...), :GetAlignment(), :SetTextColor(...), :GetTextColor(), :SetFont(...), :GetFont(), :SetVisible(...), :GetVisible() and :Destroy() functions.


- :Load()
[+] Added Config in Overrides->MainFrame.
[+] Added Position parameter.
[+] Added UI parameter.
    [+] Added CheckName.
    [+] Added DestroyOthers.


- :Banner()
[+] Added Duration parameter.
[+] Added Button parameter. (You can change the default text of the button)
[+] Added :Close() function.


- :New()
[+] Added :GetTitle(), :SetImage(...) and :GetImage() functions.


- :Label()
[+] Added XAlignment, MouseEnter, MouseLeave and Menu parameters.
[+] Added :SetAlignment(...) and :GetAlignment()


- :Button()
[+] Added :Click() function.


- :Toggle()
[+] Added Disable parameter.
    [!] The Disable parameter if set to true will disable all active toggles when the UI is destroyed.
[+] Added :SetDisable(...), :GetDisable() and :StateChanged() functions.


- :Slider()
[+] Added Precision parameter.
[*] Changed Def parameter to Default.
[+] Added :GetValue() function.


- :Dropdown()
[+] Added Default and Hide parameters.
    [!] The Hide parameter if set to true will hide the menu when an option is selected.
[+] Added :SetOption(...) and :GetOption() functions.


- :ChipSet() and :DataTable()
[*] Updated the way in which callback works -> Callback(function(Selected, State).
    [!] Each option and state is separate from the others.
[+] Added Disable parameter.
[+] Added :SetState(...) and :GetState() functions.


- :ColorPicker()
[+] Added Default and Hide parameters.


- :Bind()
[+] Added Default, Hide and Notify parameters.
    [!] The Notify parameter will notify the bind state.
[+] Added :SetState(...), :GetState(), :SetNotify(...), :GetNotify(), :SetBind(...) and :GetBind() functions.


- TextField()
[+] Added Default parameter.
[+] Added :SetInputType(...) and :GetInputType() functions.


- :GuiSettings()
[+] Added Theme, Options and Rejoin parameters.
    [!] The Options parameter includes: Dev Console, Micro Profiler and Performace Stats.
[+] Added Hide UI using keys.
[!] The settings will be saved when the Gui is destroyed or the player exits the game.
```
