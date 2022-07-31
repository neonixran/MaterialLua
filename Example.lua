local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/neonixran/MaterialLua/master/Module.lua"), "Material Lua")()
local Lib = Library:Load({
    Title = "Getting Started",
    SizeX = 300,
    SizeY = 360
})

local Main = Lib:New({
    Title = "Main"
})

local Settings = Lib:New({
    Title = "Settings"
})

Main:Separator()

Main:Label({
    Text = "Label",
    XAlignment = "Center",
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "This is a Label"
            })
        end
    }
})

Main:Button({
    Text = "Button",
    Callback = function()
        print("Clicked!")
    end,
        Menu = {
        Information = function()
            Lib:Banner({
                Text = "This is a Button"
            })
        end
    }
})

Main:Toggle({
    Text = "Toggle",
    Callback = function(State)
        print(("Toggle State: %s"):format(tostring(State)))
    end,
    Enabled = false,
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "This is a Toggle"
            })
        end
    }
})

Main:Slider({
    Text = "Slider",
    Callback = function(Value)
        print(("Slider Value: %d"):format(Value))
    end,
    Min = 200,
    Max = 400,
    Default = 300,
    Menu = {
        Information = function()
            Lib:Banner({
                Text = "This is a Slider"
            })
        end
    }
})

Main:Dropdown({
    Text = "Dropdown",
    Callback = function(Value)
    	print(("Dropdown Option: %s"):format(Value))
    end,
    Options = {
        "A", 
        "B",
        "C"
    },
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a Dropdown"
            })
    	end
    }
})

Main:ChipSet({
    Callback = function(Selected, State)
    	print(Selected, State)
    end,
    Options = {
    	A = true,
    	B = true,
    	C = false
    },
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a ChipSet"
            })
    	end
    }
})

Main:DataTable({
    Callback = function(Selected, State)
    	print(Selected, State)
    end,
    Options = {
    	A = true,
    	B = true,
    	C = false
    },
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a DataTable"
            })
    	end
    }
})

Main:ColorPicker({
    Text = "ColorPicker",
    Callback = function(Value)
    	print(("Color: %d, %d, %d"):format(Value.R * 255, Value.G * 255, Value.B * 255))
    end,
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a ColorPicker"
            })
    	end
    }
})

Main:Bind({
    Text = "Bind",
    Bind = Enum.KeyCode.P,
    Notify = true,
    Callback = function(Value)
    	print(("Bind: %s"):format(tostring(Value)))
    end,
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a Bind"
            })
    	end
    }
})

Main:TextField({
    Text = "Name",
    Callback = function(Value)
    	print(("TextField: %s"):format(Value))
    end,
    Menu = {
    	Information = function()
            Lib:Banner({
                Text = "This is a TextField"
            })
    	end
    }
})

Settings:GuiSettings()
