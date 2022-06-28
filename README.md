# MaterialLua
A material design library, designed for use in Roblox.

# Discord
[Balance](https://discord.gg/jzR3vfV)

# Documentation Site
[MLDocs](http://materiallua.gq)

# Full Changelog
```
- UI:
[+] Added :Separator() UI element.
[+] Added :Bind() UI element.
[+] Added :GuiSettings() function.
[+] Added Config (this will save: KeyBind, Theme and Overrides->MainFrame).
    [!] If you change the theme, it will be updated when you run the UI again.
[+] Added blacklisted KeyCodes.
[+] Added :GetLoadedTime(), :GetBlacklist() and :Blacklist_KeyCode() functions.
[*] Changed hide button to destroy button.

- :Load()
    [+] Added RichText and Font parameters.
    [+] Added Config in Overrides->MainFrame.

- :Banner()
    [+] Added RichText, Font and TextColor parameters.
    [+] Added Duration parameter.
    [+] Added Button parameter (You can change the default text of the button).
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont() and :Close() functions.

- :New()
    [+] Added RichText, Font, TextColor and Visible parameters.
    [+] Added :GetTitle(), :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :SetImage() and :GetImage() functions.

- :Separator()
    [+] Added Visible parameter.
    [+] Addded :SetVisible(), :GetVisible() and :Destroy() functions.

- :Label()
    [+] Added XAlignment, RichText, TextColor, Font, Visible, MouseEnter, MouseLeave and Menu parameters.
    [+] Added :SetAlignment(), :GetAlignment(), :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible() and :Destroy() functions.

- :Button()
    [+] Added RichText, Font, TextColor and Visible parameters.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :Click() and :Destroy() functions.

- :Toggle()
    [+] Added RichText, TextColor, Font, Disable and Visible parameters.
        [!] The Disable parameter if set to true will disable all active toggles when the UI is destroyed.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :SetDisable(), :GetDisable(), :StateChanged() and :Destroy() functions.

- :Slider()
    [+] Added RichText, TextColor, Font, Disable and Visible parameters.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :GetValue() and :Destroy() functions.

- :Dropdown()
    [+] Added RichText, TextColor, Font, Default, Hide and Visible parameters.
        [!] The Hide parameter if set to true will hide the menu when an option is selected.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :SetOption(), :GetOption() and :Destroy() functions.

- :ChipSet() and :DataTable()
    [*] Updated the way in which callback works -> Callback(function(Selected, State).
        [!] Each option and state is separate from the others.
    [+] Added Disable and Visible parameters.
    [+] Added :GetOptions(), :SetState(), :GetState(), :SetVisible(), :GetVisible() and :Destroy() functions.

- :ColorPicker()
    [+] Added RichText, TextColor, Font, Default, Hide and Visible parameters.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible() and :Destroy() functions.

- :Bind()
    [+] Added RichText, TextColor, Font, Default, Hide, Notify and Visible parameters.
        [!] The Notify parameter will notify the bind state.
    [+] Added :SetText(), :GetText(), :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :SetState(), :GetState(), :SetNotify(), :GetNotify(), :SetBind(), :GetBind() and :Destroy() functions.

- :TextField()
    [+] Added RichText, TextColor, Font, Default and Visible parameters.
    [+] Added :SetTextColor(), :GetTextColor(), :SetFont(), :GetFont(), :SetVisible(), :GetVisible(), :SetInputType(), :GetInputType() and :Destroy() functions.

- :GuiSettings()
    [+] Added Theme, Options and Rejoin parameters
    [+] Added Hide UI using keys
    [!] The settings will be saved when the Gui is destroyed or the player exits the game.`
```
