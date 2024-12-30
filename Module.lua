-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")

-- Variables
local UI = nil
local Style = nil
local ThisTheme = nil
local Mouse = Players.LocalPlayer:GetMouse()

-- Options
local File = "MaterialSettings"

local Default = {
    Keybind = "RightControl",
    Theme = "Dark",
    Overrides = {
        MainFrame = Color3.fromRGB(25, 25, 25):ToHex()
    }
}

local Loaded, Setting = pcall(function()
    if readfile and writefile and isfile then
        if isfile(("%s.json"):format(File)) then
            return HttpService:JSONDecode(readfile(("%s.json"):format(File)))
        else
            writefile(("%s.json"):format(File), HttpService:JSONEncode(Default))
            return Default
        end
    else
        return Default
    end
end)

if Loaded then
    for i in pairs(Setting) do
        if not Default[i] then
            Setting[i] = nil
        end
    end

    for i,v in pairs(Default) do
        if not Setting[i] then
            Setting[i] = v
        end
    end

    writefile(("%s.json"):format(File), HttpService:JSONEncode(Setting))
end

-- Themes
local Themes = {
	Light = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Minimise = Color3.fromRGB(255, 106, 0),
		MinimiseAccent = Color3.fromRGB(147, 59, 0),
		Maximise = Color3.fromRGB(25, 255, 0),
		MaximiseAccent = Color3.fromRGB(0, 255, 110),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(124, 37, 255),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(124, 37, 255),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(124, 37, 255),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(124, 37, 255),
		Content = Color3.fromRGB(124, 37, 255),
		Button = Color3.fromRGB(124, 37, 255),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(124, 37, 255),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(124, 37, 255),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(124, 37, 255),
		Toggle = Color3.fromRGB(124, 37, 255),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(124, 37, 255),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(124, 37, 255),
		TextField = Color3.fromRGB(124, 37, 255),
		TextFieldAccent = Color3.fromRGB(124, 37, 255),
	},
	Dark = {
		MainFrame = Color3.fromRGB(25, 25, 25),
		Minimise = Color3.fromRGB(255, 106, 0),
		MinimiseAccent = Color3.fromRGB(147, 59, 0),
		Maximise = Color3.fromRGB(25, 255, 0),
		MaximiseAccent = Color3.fromRGB(0,255,110),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(55, 55, 55),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(235, 235, 235),
		TitleBar = Color3.fromRGB(55, 55, 55),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(15, 15, 15),
		Banner = Color3.fromRGB(55, 55, 55),
		BannerAccent = Color3.fromRGB(255, 255, 255),
		Content = Color3.fromRGB(85, 85, 85),
		Button = Color3.fromRGB(85, 85, 85),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(235, 235, 235),
		ChipSetAccent = Color3.fromRGB(85, 85, 85),
		DataTable = Color3.fromRGB(235, 235, 235),
		DataTableAccent = Color3.fromRGB(85, 85, 85),
		Slider = Color3.fromRGB(85, 85, 85),
		SliderAccent = Color3.fromRGB(235, 235, 235),
		Toggle = Color3.fromRGB(205, 205, 205),
		ToggleAccent = Color3.fromRGB(125, 125, 125),
		Dropdown = Color3.fromRGB(85, 85, 85),
		DropdownAccent = Color3.fromRGB(235, 235, 235),
		ColorPicker = Color3.fromRGB(85, 85, 85),
		ColorPickerAccent = Color3.fromRGB(235, 235, 235),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255),
	},
	Mocha = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Minimise = Color3.fromRGB(219, 210, 202),
		MinimiseAccent = Color3.fromRGB(219, 210, 202),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		Maximise = Color3.fromRGB(189, 183, 177),
		MaximiseAccent = Color3.fromRGB(189, 183, 177),
		NavBar = Color3.fromRGB(176, 148, 125),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(176, 148, 125),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(176, 148, 125),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(176, 148, 125),
		Content = Color3.fromRGB(176, 148, 125),
		Button = Color3.fromRGB(176, 148, 125),
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(176, 148, 125),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(176, 148, 125),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(176, 148, 125),
		Toggle = Color3.fromRGB(176, 148, 125),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(176, 148, 125),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(176, 148, 125),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Aqua = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Minimise = Color3.fromRGB(219, 210, 202),
		MinimiseAccent = Color3.fromRGB(219, 210, 202),
		Maximise = Color3.fromRGB(189, 183, 177),
		MaximiseAccent = Color3.fromRGB(189, 183, 177),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(116, 112, 140),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(116, 112, 140),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(116, 112, 140),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(116, 112, 140),
		Content = Color3.fromRGB(116, 112, 140),
		Button = Color3.fromRGB(116, 112, 140),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(116, 112, 140),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(116, 112, 140),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(116, 112, 140),
		Toggle = Color3.fromRGB(116, 112, 140),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(116, 112, 140),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(116, 112, 140),
		TextField = Color3.fromRGB(175, 175, 175),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Jester = {
		MainFrame = Color3.fromRGB(255, 255, 255),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(219, 68, 103),
		NavBarAccent = Color3.fromRGB(255, 255, 255),
		NavBarInvert = Color3.fromRGB(30, 30, 30),
		TitleBar = Color3.fromRGB(219, 68, 103),
		TitleBarAccent = Color3.fromRGB(255, 255, 255),
		Overlay = Color3.fromRGB(219, 68, 103),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(219, 68, 103),
		Content = Color3.fromRGB(219, 68, 103),
		Button = Color3.fromRGB(219, 68, 103),
		ButtonAccent = Color3.fromRGB(255, 255, 255),
		ChipSet = Color3.fromRGB(219, 68, 103),
		ChipSetAccent = Color3.fromRGB(255, 255, 255),
		DataTable = Color3.fromRGB(219, 68, 103),
		DataTableAccent = Color3.fromRGB(255, 255, 255),
		Slider = Color3.fromRGB(255, 255, 255),
		SliderAccent = Color3.fromRGB(219, 68, 103),
		Toggle = Color3.fromRGB(219, 68, 103),
		ToggleAccent = Color3.fromRGB(255, 255, 255),
		Dropdown = Color3.fromRGB(255, 255, 255),
		DropdownAccent = Color3.fromRGB(219, 68, 103),
		ColorPicker = Color3.fromRGB(255, 255, 255),
		ColorPickerAccent = Color3.fromRGB(219, 68, 103),
		TextField = Color3.fromRGB(219, 68, 103),
		TextFieldAccent = Color3.fromRGB(255, 255, 255)
	},
	Elegant = {
		MainFrame = Color3.fromRGB(36, 45, 61),
		Minimise = Color3.fromRGB(92, 92, 92),
		MinimiseAccent = Color3.fromRGB(166, 166, 166),
		Maximise = Color3.fromRGB(217, 217, 217),
		MaximiseAccent = Color3.fromRGB(245, 245, 245),
		Close = Color3.fromRGB(192, 57, 43),
		CloseAccent = Color3.fromRGB(231, 76, 60),
		NavBar = Color3.fromRGB(36, 45, 61),
		NavBarAccent = Color3.fromRGB(245, 245, 245),
		NavBarInvert = Color3.fromRGB(255, 255, 255),
		TitleBar = Color3.fromRGB(36, 45, 61),
		TitleBarAccent = Color3.fromRGB(245, 245, 245),
		Overlay = Color3.fromRGB(127, 127, 127),
		Banner = Color3.fromRGB(255, 255, 255),
		BannerAccent = Color3.fromRGB(36, 45, 61),
		Content = Color3.fromRGB(255, 255, 255),
		Button = Color3.fromRGB(36, 45, 61),
		ButtonAccent = Color3.fromRGB(245, 245, 245),
		ChipSet = Color3.fromRGB(85, 170, 204),
		ChipSetAccent = Color3.fromRGB(125, 75, 20),
		DataTable = Color3.fromRGB(34, 34, 51),
		DataTableAccent = Color3.fromRGB(245, 245, 245),
		Slider = Color3.fromRGB(36, 45, 61),
		SliderAccent = Color3.fromRGB(245, 245, 245),
		Toggle = Color3.fromRGB(51, 102, 153),
		ToggleAccent = Color3.fromRGB(245, 245, 245),
		Dropdown = Color3.fromRGB(36, 45, 61),
		DropdownAccent = Color3.fromRGB(245, 245, 245),
		ColorPicker = Color3.fromRGB(36, 45, 61),
		ColorPickerAccent = Color3.fromRGB(245, 245, 245),
		TextField = Color3.fromRGB(36, 45, 61),
		TextFieldAccent = Color3.fromRGB(36, 45, 61),
	},
	Cute = {
		MainFrame = Color3.fromRGB(255, 138, 147),
		Minimise = Color3.fromRGB(255, 194, 194),
		MinimiseAccent = Color3.fromRGB(249, 237, 205),
		Maximise = Color3.fromRGB(255, 228, 179),
		MaximiseAccent = Color3.fromRGB(255, 204, 213),
		Close = Color3.fromRGB(255, 138, 147),
		CloseAccent = Color3.fromRGB(255, 194, 194),
		NavBar = Color3.fromRGB(249, 237, 205),
		NavBarAccent = Color3.fromRGB(255, 228, 179),
		NavBarInvert = Color3.fromRGB(255, 204, 213),
		TitleBar = Color3.fromRGB(255, 138, 147),
		TitleBarAccent = Color3.fromRGB(255, 194, 194),
		Overlay = Color3.fromRGB(249, 237, 205),
		Banner = Color3.fromRGB(255, 228, 179),
		BannerAccent = Color3.fromRGB(255, 204, 213),
		Content = Color3.fromRGB(255, 138, 147),
		Button = Color3.fromRGB(255, 194, 194),
		ButtonAccent = Color3.fromRGB(249, 237, 205),
		ChipSet = Color3.fromRGB(255, 228, 179),
		ChipSetAccent = Color3.fromRGB(255, 204, 213),
		DataTable = Color3.fromRGB(255, 138, 147),
		DataTableAccent = Color3.fromRGB(255, 194, 194),
		Slider = Color3.fromRGB(249, 237, 205),
		SliderAccent = Color3.fromRGB(255, 228, 179),
		Toggle = Color3.fromRGB(255, 204, 213),
		ToggleAccent = Color3.fromRGB(255, 138, 147),
		Dropdown = Color3.fromRGB(255, 194, 194),
		DropdownAccent = Color3.fromRGB(249, 237, 205),
		ColorPicker = Color3.fromRGB(255, 228, 179),
		ColorPickerAccent = Color3.fromRGB(255, 204, 213),
		TextField = Color3.fromRGB(255, 138, 147),
		TextFieldAccent = Color3.fromRGB(255, 194, 194),
	},
	EtherealGlow = {
		MainFrame = Color3.fromRGB(253, 246, 235),
		Minimise = Color3.fromRGB(33, 33, 48),
		MinimiseAccent = Color3.fromRGB(0, 101, 210),
		Maximise = Color3.fromRGB(86, 215, 249),
		MaximiseAccent = Color3.fromRGB(253, 246, 235),
		Close = Color3.fromRGB(253, 246, 235),
		CloseAccent = Color3.fromRGB(33, 33, 48),
		NavBar = Color3.fromRGB(0, 101, 210),
		NavBarAccent = Color3.fromRGB(86, 215, 249),
		NavBarInvert = Color3.fromRGB(253, 246, 235),
		TitleBar = Color3.fromRGB(33, 33, 48),
		TitleBarAccent = Color3.fromRGB(0, 101, 210),
		Overlay = Color3.fromRGB(253, 246, 235),
		Banner = Color3.fromRGB(86, 215, 249),
		BannerAccent = Color3.fromRGB(0, 101, 210),
		Content = Color3.fromRGB(33, 33, 48),
		Button = Color3.fromRGB(253, 246, 235),
		ButtonAccent = Color3.fromRGB(33, 33, 48),
		ChipSet = Color3.fromRGB(0, 101, 210),
		ChipSetAccent = Color3.fromRGB(86, 215, 249),
		DataTable = Color3.fromRGB(253, 246, 235),
		DataTableAccent = Color3.fromRGB(33, 33, 48),
		Slider = Color3.fromRGB(0, 101, 210),
		SliderAccent = Color3.fromRGB(86, 215, 249),
		Toggle = Color3.fromRGB(253, 246, 235),
		ToggleAccent = Color3.fromRGB(33, 33, 48),
		Dropdown = Color3.fromRGB(0, 101, 210),
		DropdownAccent = Color3.fromRGB(86, 215, 249),
		ColorPicker = Color3.fromRGB(253, 246, 235),
		ColorPickerAccent = Color3.fromRGB(33, 33, 48),
		TextField = Color3.fromRGB(0, 101, 210),
		TextFieldAccent = Color3.fromRGB(86, 215, 249),
	}
}

-- Tables
local Objects = {}
local Styles = {"Normal", "Invert", "Sheets"}

local Types = {
	"RoundFrame",
	"Shadow",
	"Circle",
	"CircleButton",
	"Frame",
	"Label",
	"Button",
	"SmoothButton",
	"Box",
	"ScrollingFrame",
	"Menu",
	"NavBar"
}

local ActualTypes = {
	RoundFrame = "ImageLabel",
	Shadow = "ImageLabel",
	Circle = "ImageLabel",
	CircleButton = "ImageButton",
	Frame = "Frame",
	Label = "TextLabel",
	Button = "TextButton",
	SmoothButton = "ImageButton",
	Box = "TextBox",
	ScrollingFrame = "ScrollingFrame",
	Menu = "ImageButton",
	NavBar = "ImageButton"
}

local Properties = {
	RoundFrame = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 3, 297, 297),
		BorderSizePixel = 0
	},
	SmoothButton = {
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554237731",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 3, 297, 297),
		BorderSizePixel = 0
	},
	Shadow = {
		Name = "Shadow",
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554236805",
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(23, 23, 277, 277),
		Position = UDim2.fromOffset(-15, -15),
		Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
		BorderSizePixel = 0
	},
	Circle = {
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670",
		BorderSizePixel = 0
	},
	CircleButton = {
        AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5554831670",
		BorderSizePixel = 0
	},
	Frame = {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
	},
	Label = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5,0),
		Size = UDim2.fromScale(1,1) - UDim2.fromOffset(5,0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	Button = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5, 0),
		Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	Box = {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(5, 0),
		Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0
	},
	ScrollingFrame = {
		BackgroundTransparency = 1,
		ScrollBarThickness = 3,
		CanvasSize = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1),
		BorderSizePixel = 0
	},
	Menu = {
		Name = "More",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Image = "http://www.roblox.com/asset/?id=5555108481",
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25, 10),
		BorderSizePixel = 0
	},
	NavBar = {
		Name = "SheetToggle",
		Image = "http://www.roblox.com/asset/?id=5576439039",
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(20, 20),
		Position = UDim2.fromOffset(5, 5),
		AutoButtonColor = false,
		BorderSizePixel = 0
	}
}

local NavBar = {
	Normal = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
		NewNavBar.Position = UDim2.fromOffset(5, 35)
		NewNavBar.ImageColor3 = ThisTheme.NavBar
		NewNavBar.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBar
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBarAccent
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBarAccent
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBarAccent
			end)
		end)

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Horizontal
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Left
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Center
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0, 5)
		NavBarPadding.Parent = NavBarContent

		return NewNavBar, NavBarContent
	end,
	Invert = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
		NewNavBar.Position = UDim2.fromOffset(5, 35)
		NewNavBar.ImageColor3 = ThisTheme.NavBarAccent
		NewNavBar.ImageTransparency = 1
		NewNavBar.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBarInvert
		NavBarShadow.ImageTransparency = 1
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		TweenService:Create(NewNavBar, TweenInfo.new(1), {ImageTransparency = 0}):Play()
		TweenService:Create(NavBarShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBar
			end)
		end)

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Horizontal
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Left
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Center
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0, 5)
		NavBarPadding.Parent = NavBarContent

		return NewNavBar, NavBarContent
	end,
	Sheets = function()
		local NewNavBar = Objects:New("Round")
		NewNavBar.ClipsDescendants = true
		NewNavBar.Name = "NavBar"
		NewNavBar.Size = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 30)
		NewNavBar.Position = UDim2.fromOffset(0, 30)
		NewNavBar.ImageColor3 = ThisTheme.NavBarAccent
		NewNavBar.ZIndex = 100

		local NavBarOverlay = Objects:New("SmoothButton")
		NavBarOverlay.Name = "Overlay"
		NavBarOverlay.BackgroundColor3 = ThisTheme.Overlay
		NavBarOverlay.ImageColor3 = ThisTheme.Overlay
		NavBarOverlay.BackgroundTransparency = 1
		NavBarOverlay.ImageTransparency = 1
		NavBarOverlay.Visible = false
		NavBarOverlay.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 30)
		NavBarOverlay.Position = UDim2.fromOffset(0, 30)
		NavBarOverlay.ZIndex = 75

		local NavBarMenu = Objects:New("NavBar")
		NavBarMenu.ZIndex = 100

		local NavBarShadow = Objects:New("Shadow")
		NavBarShadow.ImageColor3 = ThisTheme.NavBar
		NavBarShadow.Parent = NewNavBar
		NavBarShadow.ZIndex = 100

		local Effect1, Effect2, Effect3 = Objects:New("Frame"), Objects:New("Frame"), Objects:New("Frame")

		Effect1.ZIndex = 100
		Effect2.ZIndex = 100
		Effect3.ZIndex = 100

		Effect1.BackgroundTransparency = 0
		Effect2.BackgroundTransparency = 0
		Effect3.BackgroundTransparency = 0

		Effect1.BackgroundColor3 = ThisTheme.NavBarAccent
		Effect2.BackgroundColor3 = ThisTheme.NavBarAccent
		Effect3.BackgroundColor3 = ThisTheme.NavBar

		Effect1.Size = UDim2.fromScale(1,0) + UDim2.fromOffset(0,5)
		Effect2.Size = UDim2.fromScale(0,1) + UDim2.fromOffset(5,0)
		Effect3.Size = UDim2.fromScale(0,1) + UDim2.fromOffset(1,0)

		Effect1.Position = UDim2.fromScale(0,0)
		Effect2.Position = UDim2.fromScale(1,0) - UDim2.fromOffset(5,0)
		Effect3.Position = UDim2.fromScale(1,0)

		Effect1.Parent = NewNavBar
		Effect2.Parent = NewNavBar
		Effect3.Parent = NewNavBar

		local NavBarContent = Objects:New("Frame")
		NavBarContent.Name = "Content"
		NavBarContent.Parent = NewNavBar

		local NavBarList = Objects:New("UIListLayout")
		NavBarList.FillDirection = Enum.FillDirection.Vertical
		NavBarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		NavBarList.VerticalAlignment = Enum.VerticalAlignment.Top
		NavBarList.SortOrder = Enum.SortOrder.LayoutOrder
		NavBarList.Parent = NavBarContent

		local NavBarPadding = Objects:New("UIPadding")
		NavBarPadding.PaddingLeft = UDim.new(0,5)
		NavBarPadding.PaddingRight = UDim.new(0,5)
		NavBarPadding.PaddingTop = UDim.new(0,5)
		NavBarPadding.PaddingBottom = UDim.new(0,5)
		NavBarPadding.Parent = NavBarContent

		NavBarContent.ChildAdded:Connect(function(Child)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {TextTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child, TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				local Children = #NavBarContent:GetChildren() - 2
				TweenService:Create(Child:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(1), {ImageTransparency = (Children > 1) and 0.5 or 0}):Play()
			end)
			pcall(function()
				Child.Size = UDim2.fromScale(1,0) + UDim2.fromOffset(0,30)
			end)
			pcall(function()
				Child:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.TextColor3 = ThisTheme.NavBar
			end)
			pcall(function()
				Child.ImageColor3 = ThisTheme.NavBar
			end)
		end)

		return NewNavBar, NavBarContent, NavBarMenu,  NavBarOverlay
	end
}

-- Functions
local function FindType(String)
	for _, Type in next, Types do
		if Type:sub(1, #String):lower() == String:lower() then
			return Type
		end
	end

	return false
end

local function IsKeyCode(Key)
	local success, Keycode = pcall(function()
		return Enum.KeyCode[Key]
	end)

	if success then
		return true and Keycode
	end

	return false
end

local function CheckType(Object, Type, _Default)
	if typeof(Object) == Type then
		if Type == "EnumItem" then
			for _, v in pairs(Enum[tostring(Object):split(".")[2]]:GetEnumItems()) do
				if v.Name == Object.Name then
					return v
				end
			end
		else
			return Object
		end
	end

	return typeof(_Default) == Type and _Default or nil
end

function Objects:New(Type)
	local Target = FindType(Type)

	if Target then
		local Image = Instance.new(ActualTypes[Target])

		if Properties[Target] then
			for Property, Value in pairs(Properties[Target]) do
				Image[Property] = Value
			end
		end

		return Image
	else
		return Instance.new(Type)
	end
end

local function Position(Pos, Frame)
    Pos = CheckType(Pos, "string", "Center")
    Frame = Frame or nil

    if Frame then
        local X, Y = Frame.Position.X.Offset or 0, Frame.Position.Y.Offset or 0

        local Positions = {
            Left = {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0.005, X, 0.555, Y),
                Hide = UDim2.new(-2, X, 0.555, Y),
            },
            Center = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, X, 0.5, Y),
                Hide = UDim2.new(-2, X, 0.5, Y),
            },
            Right = {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(0.991, X, 0.5, Y),
                Hide = UDim2.new(-2, X, 0.5, Y),
            },
            Bottom = {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, X, 0.967, Y),
                Hide = UDim2.new(-2, X, 0.967, Y),
            },
        }

		return Positions[Pos]
    end
end

local function GetXY(Object)
	local MaX, MaY = Object.AbsoluteSize.X, Object.AbsoluteSize.Y
	local PX, PY = math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, MaX), math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, MaY)

	return PX / MaX, PY / MaY
end

local function CircleAnim(Object, EndColor, StartColor)
	Object = Object or nil

	if Object then
		StartColor = StartColor or Object.ImageColor3
		EndColor = EndColor or nil

		local PosX, PosY = GetXY(Object)

		local Circle = Objects:New("Circle")
		Circle.Size = UDim2.fromScale(0, 0)
		Circle.Position = UDim2.fromScale(PosX, PosY)
		Circle.ImageColor3 = StartColor
		Circle.ZIndex = 200
		Circle.Parent = Object

		local Size = Object.AbsoluteSize.X

		TweenService:Create(Circle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.fromScale(PosX, PosY) - UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, ImageColor3 = EndColor, Size = UDim2.fromOffset(Size, Size)}):Play()
		task.delay(2, Circle.Destroy, Circle)
	end
end

local function CreateChangedEvent()
	local Event = {
		Callbacks = {}
	}

	function Event:Connect(Callback)
		local Connection = {
			Callback = Callback
		}

		table.insert(self.Callbacks, Connection)

		return {
			Disconnect = function()
				for i,v in ipairs(self.Callbacks) do
					if v == Connection then
						table.remove(self.Callbacks, i)
						break
					end
				end
			end
		}
	end

	function Event:Fire(Property, Value)
		for _,Connection in ipairs(self.Callbacks) do
			Connection.Callback(Property, Value)
		end
	end

	return Event
end

local function TryAddMenu(Object, Menu, Return)
	Return.Object = Object

	local Total = 0

	for _,v in pairs(Menu) do
		if typeof(v) == "function" then
			Total = Total + 1
		end
	end

	if Total > 0 then
		local MenuToggle = false

		local MenuButton = Objects:New("Menu")
		MenuButton.ImageTransparency = 1
		MenuButton.Parent = Object

		TweenService:Create(MenuButton, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

		local Size = Total * 30 + Total + 1 * 2

		local MenuBuild = Objects:New("Round")
		MenuBuild.Name = "Menu"
		MenuBuild.ImageColor3 = ThisTheme.ButtonAccent
		MenuBuild.Size = UDim2.fromOffset(120, 0)
		MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
		MenuBuild.ZIndex = 100
		MenuBuild.ClipsDescendants = true
		MenuBuild.Parent = UI

		MenuButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			MenuBuild.Position = UDim2.fromOffset(MenuButton.AbsolutePosition.X, MenuButton.AbsolutePosition.Y) - UDim2.fromOffset(125, 5)
		end)

		local MenuContent = Objects:New("Frame")
		MenuContent.Name = "Content"
		MenuContent.Parent = MenuBuild

		local MenuList = Objects:New("UIListLayout")
		MenuList.Padding = UDim.new(0, 2)
		MenuList.Parent = MenuContent

		local MenuPadding = Objects:New("UIPadding")
		MenuPadding.PaddingTop = UDim.new(0, 2)
		MenuPadding.PaddingRight = UDim.new(0, 2)
		MenuPadding.PaddingLeft = UDim.new(0, 2)
		MenuPadding.PaddingBottom = UDim.new(0, 2)
		MenuPadding.Parent = MenuContent

		MenuButton.MouseButton1Down:Connect(function()
			MenuToggle = not MenuToggle
			TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = MenuToggle and UDim2.fromOffset(120, Size) or UDim2.fromOffset(120, 0)}):Play()
		end)

		if Style == 3 then
			local MainFrame = UI:FindFirstChild("MainFrame") or UI:WaitForChild("MainFrame", 10)

			if MainFrame then
				UI.MainFrame.Overlay:GetPropertyChangedSignal("Visible"):Connect(function()
					if UI.MainFrame.Overlay.Visible then
						TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = UDim2.fromOffset(120, 0)}):Play()
					end
				end)
			end
		end

		local Menu_Data = {}

		local _OptionValue = nil

		for Option, Value in pairs(Menu) do
			if typeof(Value) == "function" then
				local MenuOption = Objects:New("SmoothButton")
				MenuOption.Name = "MenuOption"
				MenuOption.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				MenuOption.ImageColor3 = ThisTheme.Button
				MenuOption.ImageTransparency = 1
				MenuOption.ZIndex = 150
				MenuOption.Parent = MenuContent

				local OptionShadow = Objects:New("Shadow")
				OptionShadow.ImageColor3 = ThisTheme.Button
				OptionShadow.ImageTransparency = 1
				OptionShadow.Parent = MenuOption

				local OptionValue = Objects:New("Label")
				OptionValue.Name = "Value"
				OptionValue.Position = UDim2.fromScale(0, 0)
				OptionValue.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0)
				OptionValue.Text = Option
				OptionValue.TextColor3 = ThisTheme.Button
				OptionValue.Font = Enum.Font.Gotham
				OptionValue.TextSize = 11
				OptionValue.ZIndex = 150
				OptionValue.TextXAlignment = Enum.TextXAlignment.Right
				OptionValue.Parent = MenuOption

				_OptionValue = OptionValue

				MenuOption.MouseButton1Down:Connect(function()
					Value(Return, Menu_Data)
					MenuToggle = false
					TweenService:Create(MenuBuild, TweenInfo.new(0.15), {Size = UDim2.fromOffset(120, 0)}):Play()
				end)

				MenuOption.MouseEnter:Connect(function()
					TweenService:Create(MenuOption, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
					TweenService:Create(OptionShadow, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
				end)

				MenuOption.MouseLeave:Connect(function()
					TweenService:Create(MenuOption, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
					TweenService:Create(OptionShadow, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
				end)
			end
		end

		return true, MenuButton, setmetatable(Menu_Data, {
			__newindex = function(t, k, v)
				if k == "Text" then
					_OptionValue.Text = CheckType(v, "string", _OptionValue.Text)
				end
			end,
			__index = function(t, k)
				if k == "Text" then
					return _OptionValue.Text
				end
			end
		})
	end

	return false
end

local function CreateNewButton(Button_Opt, Parent)
	Button_Opt = CheckType(Button_Opt, "table", {})

	Button_Opt.Text = CheckType(Button_Opt.Text, "string", "Button")
	Button_Opt.TextColor = CheckType(Button_Opt.TextColor, "Color3", ThisTheme.ButtonAccent)
	Button_Opt.RichText = CheckType(Button_Opt.RichText, "boolean", false)
	Button_Opt.Font = CheckType(Button_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
	Button_Opt.Visible = CheckType(Button_Opt.Visible, "boolean", true)
	Button_Opt.ReadOnly = CheckType(Button_Opt.ReadOnly, "boolean", false)
	Button_Opt.Callback = CheckType(Button_Opt.Callback, "function", function() end)

	Button_Opt.Menu = CheckType(Button_Opt.Menu, "table", {})

	local Button_Data = {}
	local ChangedEvent = CreateChangedEvent()

	local Button = Objects:New("SmoothButton")
	Button.Name = "Button"
	Button.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
	Button.ImageColor3 = ThisTheme.Button
	Button.Visible = Button_Opt.Visible
	Button.ImageTransparency = 1
	Button.Parent = Parent

	local ButtonShadow = Objects:New("Shadow")
	ButtonShadow.ImageColor3 = ThisTheme.Button
	ButtonShadow.ImageTransparency = 1
	ButtonShadow.Parent = Button

	local ButtonLabel = Objects:New("Label")
	ButtonLabel.Text = Button_Opt.Text
	ButtonLabel.TextColor3 = Button_Opt.TextColor
	ButtonLabel.Font = Button_Opt.Font
	ButtonLabel.TextSize = 14
    ButtonLabel.RichText = Button_Opt.RichText
	ButtonLabel.ClipsDescendants = true
	ButtonLabel.TextTransparency = 1
	ButtonLabel.Parent = Button

	TweenService:Create(Button, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
	TweenService:Create(ButtonShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
	TweenService:Create(ButtonLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

	Button.MouseButton1Down:Connect(function()
		if not Button_Opt.ReadOnly then
			CircleAnim(ButtonLabel, ThisTheme.ButtonAccent, ThisTheme.Button)

			Button_Opt.Callback(Button_Data)

			ChangedEvent:Fire("Click", true)
		end
	end)

	local Funcs = {
		__newindex = function(t, k, v)
			if k == "Text" then
				Button_Opt.Text = CheckType(v, "string", Button_Opt.Text)

				if #Button_Opt.Text > 0 then
					ButtonLabel.Text = Button_Opt.Text

					ChangedEvent:Fire(k, Button_Opt.Text)
				end
			elseif k == "TextColor" then
				Button_Opt.TextColor = CheckType(v, "Color3", Button_Opt.TextColor)

				ButtonLabel.TextColor3 = Button_Opt.TextColor

				ChangedEvent:Fire(k, Button_Opt.TextColor)
			elseif k == "RichText" then
				Button_Opt.RichText = CheckType(v, "boolean", Button_Opt.RichText)

				ButtonLabel.RichText = Button_Opt.RichText

				ChangedEvent:Fire(k, Button_Opt.RichText)
			elseif k == "Font" then
				Button_Opt.Font = CheckType(v, "EnumItem", Button_Opt.Font)
				ButtonLabel.Font = Button_Opt.Font

				ChangedEvent:Fire(k, Button_Opt.Font)
			elseif k == "Visible" then
				Button_Opt.Visible = CheckType(v, "boolean", Button_Opt.Visible)

				Button.Visible = Button_Opt.Visible

				ChangedEvent:Fire(k, Button_Opt.Visible)
			elseif k == "ReadOnly" then
				Button_Opt.ReadOnly = CheckType(v, "boolean", Button_Opt.ReadOnly)

				ChangedEvent:Fire(k, Button_Opt.ReadOnly)
			end
		end,
		__index = function(t, k)
			if k == "Text" then
				return ButtonLabel.ContentText
			elseif k == "TextColor" then
				return Button_Opt.TextColor
			elseif k == "RichText" then
				return Button_Opt.RichText
			elseif k == "Font" then
				return Button_Opt.Font
			elseif k == "Visible" then
				return Button_Opt.Visible
			elseif k == "ReadOnly" then
				return Button_Opt.ReadOnly
			elseif k == "Changed" then
				return ChangedEvent
			elseif k == "Click" then
				return function()
					if not Button_Opt.ReadOnly then
						Button_Opt.Callback(Button_Data)

						ChangedEvent:Fire("Click", true)
					end
				end
			elseif k == "Destroy" then
				return function()
					Button:Destroy()
				end
			end
		end,
		__call = function(Func, ...)
			Func(Func, ...)
		end,
	}

	TryAddMenu(Button, Button_Opt.Menu, setmetatable({}, Funcs))

	return Button, ButtonLabel, Funcs
end

-- Library
local Material = {}
Material.Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/neonixran/MaterialLua/master/Notification.lua"), "Material Lua [Notification]")(Setting.Theme).Notify

function Material:Load(Load_Opt)
	Load_Opt = CheckType(Load_Opt, "table", {})

	Style = math.clamp(CheckType(Load_Opt.Style, "number", 3), 1, 3)
	Load_Opt.Title = CheckType(Load_Opt.Title, "string", "Material Lua")
	Load_Opt.RichText = CheckType(Load_Opt.RichText, "boolean", false)
	Load_Opt.Font = CheckType(Load_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
	Load_Opt.SizeX = CheckType(Load_Opt.SizeX, "number", 255)
	Load_Opt.SizeY = CheckType(Load_Opt.SizeY, "number", 350)
	Load_Opt.Position = CheckType(Load_Opt.Position, "string", "Center")
	Load_Opt.Theme = CheckType(Load_Opt.Theme, "string", Setting.Theme)
	Load_Opt.Minimize = CheckType(Load_Opt.Minimize, "boolean", false)
	Load_Opt.Overrides = CheckType(Load_Opt.Overrides, "table", Setting.Overrides)

	Load_Opt.UI = CheckType(Load_Opt.UI, "table", {})
	Load_Opt.UI.CheckName = CheckType(Load_Opt.UI.CheckName, "boolean", false)
	Load_Opt.UI.DestroyOthers = CheckType(Load_Opt.UI.DestroyOthers, "boolean", true)

	Load_Opt.Menu = CheckType(Load_Opt.Menu, "table", {})

	local Open = true

	Setting.Theme = Load_Opt.Theme
	local Theme = Setting.Theme

	Theme = Themes[Theme]
	ThisTheme = Theme

	for KeyOverride, ValueOverride in pairs(Load_Opt.Overrides) do
		ThisTheme[KeyOverride] = tostring(ValueOverride):match("^%x%x%x%x%x%x$") and Color3.fromHex(ValueOverride) or CheckType(ValueOverride, "Color3", ThisTheme[KeyOverride])
	end

	Load_Opt.TextColor = CheckType(Load_Opt.TextColor, "Color3", ThisTheme.TitleBarAccent)

	pcall(function()
		if Load_Opt.UI.CheckName and OldInstance.Name == Load_Opt.Title or Load_Opt.UI.DestroyOthers then
			OldInstance:Destroy()
		end
	end)

	local NewInstance = Objects:New("ScreenGui")
	NewInstance.Name = Load_Opt.Title

	if gethui then
		NewInstance.Parent = gethui()
	elseif not is_sirhurt_closure and (syn and syn.protect_gui) then
		syn.protect_gui(NewInstance)
		NewInstance.Parent = CoreGui
	else
		NewInstance.Parent = CoreGui
	end

	getgenv().OldInstance = NewInstance

	UI = NewInstance

	local MainFrame = Objects:New("Round")
	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Position(Load_Opt.Position, MainFrame).AnchorPoint
	MainFrame.Position = Position(Load_Opt.Position, MainFrame).Position
	MainFrame.Size = UDim2.fromOffset(0, Load_Opt.SizeY)
	MainFrame.ImageColor3 = ThisTheme.MainFrame
	MainFrame.Parent = NewInstance

	TweenService:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.fromOffset(Load_Opt.SizeX, Load_Opt.SizeY)}):Play()

	task.wait(1)

	local MainShadow = Objects:New("Shadow")
	MainShadow.ImageColor3 = ThisTheme.MainFrame
	MainShadow.Parent = MainFrame

	local TitleBar = Objects:New("SmoothButton")
	TitleBar.Name = "TitleBar"
	TitleBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
	TitleBar.ImageColor3 = ThisTheme.TitleBar
	TitleBar.ImageTransparency = 1
	TitleBar.Parent = MainFrame

	local ExtraBar = Objects:New("Frame")
	ExtraBar.Name = "Hidden"
	ExtraBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 5)
	ExtraBar.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 5)
	ExtraBar.BackgroundColor3 = ThisTheme.TitleBar
	ExtraBar.Parent = TitleBar

	local TitleShadow = Objects:New("Shadow")
	TitleShadow.ImageColor3 = ThisTheme.TitleBar
	TitleShadow.ImageTransparency = 1
	TitleShadow.Parent = TitleBar

	local TitleText = Objects:New("Button")
	TitleText.Name = "Title"
	TitleText.Text = Load_Opt.Title
	TitleText.RichText = Load_Opt.RichText
	TitleText.TextColor3 = Load_Opt.TextColor
	TitleText.TextTransparency = 1
	TitleText.Font = Load_Opt.Font
	TitleText.Parent = TitleBar

	TitleText.MouseButton1Down:Connect(function()
		local Mx, My = Mouse.X, Mouse.Y
		local MouseMove, MouseKill

		MouseMove = Mouse.Move:Connect(function()
			local nMx, nMy = Mouse.X, Mouse.Y
			local Dx, Dy = nMx - Mx, nMy - My

			MainFrame.Position = MainFrame.Position + UDim2.fromOffset(Dx, Dy)
			Mx, My = nMx, nMy
		end)

		MouseKill = UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				MouseMove:Disconnect()
				MouseKill:Disconnect()
			end
		end)
	end)

	local CloseButton = Objects:New("SmoothButton")
	CloseButton.Size = UDim2.fromOffset(20, 20)
	CloseButton.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-25, 5)
	CloseButton.ImageColor3 = Load_Opt.Minimize and ThisTheme.Minimise or ThisTheme.Close
	CloseButton.ImageTransparency = 1
	CloseButton.Parent = TitleBar

	local CloseShadow = Objects:New("Shadow")
	CloseShadow.ImageColor3 = Load_Opt.Minimize and ThisTheme.MinimiseAccent or ThisTheme.CloseAccent
	CloseShadow.ImageTransparency = 1
	CloseShadow.Parent = CloseButton

	CloseButton.MouseButton1Down:Connect(function()
		if not Load_Opt.Minimize then
			TweenService:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.fromOffset(Load_Opt.SizeX, 0)}):Play()
			MainFrame.ClipsDescendants = true
			task.wait(1)
			NewInstance:Destroy()
		else
			Open = not Open

			TweenService:Create(MainShadow, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
			TweenService:Create(MainFrame, TweenInfo.new(0.15), {Size = Open and UDim2.fromOffset(Load_Opt.SizeX, Load_Opt.SizeY) or UDim2.fromOffset(Load_Opt.SizeX, 30)}):Play()
			TweenService:Create(CloseButton, TweenInfo.new(0.15), {ImageColor3 = Open and Theme.Minimise or Theme.Maximise}):Play()
			TweenService:Create(CloseShadow, TweenInfo.new(0.15), {ImageColor3 = Open and Theme.MinimiseAccent or Theme.MaximiseAccent}):Play()

			if Open then
				task.wait(0.15)
				MainFrame.ClipsDescendants = false
				TweenService:Create(MainShadow, TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
			else
				MainFrame.ClipsDescendants = true
			end
		end
	end)

	local Content = Objects:New("Round")
	Content.Name = "Content"
	Content.ImageColor3 = ThisTheme.Content
	Content.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 75)
	Content.Position = UDim2.fromOffset(5, 70)
	Content.ImageTransparency = 1
	Content.Parent = MainFrame

	local NavigationBar, NavigationBarContent, NavBarMenu, NavBarOverlay = NavBar[Styles[Style]]()
	NavigationBar.Parent = MainFrame

	TweenService:Create(TitleBar, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(ExtraBar, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
	TweenService:Create(TitleShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(TitleText, TweenInfo.new(1), {TextTransparency = 0}):Play()
	TweenService:Create(CloseButton, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(CloseShadow, TweenInfo.new(1), {ImageTransparency = 0}):Play()
	TweenService:Create(Content, TweenInfo.new(1), {ImageTransparency = 0.8}):Play()

	task.wait(1)

	if NavBarMenu then
		TweenService:Create(TitleText, TweenInfo.new(0.5), {Size = TitleText.Size - UDim2.fromOffset(25, 0), Position = TitleText.Position + UDim2.fromOffset(25, 0)}):Play()
		TweenService:Create(Content, TweenInfo.new(0.5), {Size = Content.Size + UDim2.fromOffset(0, 35), Position = Content.Position - UDim2.fromOffset(0, 35)}):Play()

		NavBarMenu.ImageTransparency = 1
		NavBarMenu.Parent = TitleBar

		TweenService:Create(NavBarMenu, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

		NavBarOverlay.Parent = MainFrame

		local MenuToggle = false

		NavBarMenu.MouseButton1Down:Connect(function()
			MenuToggle = not MenuToggle

			TweenService:Create(NavigationBar, TweenInfo.new(0.15), {Size = (MenuToggle and UDim2.fromScale(0.5, 1) or UDim2.fromScale(0, 1)) - UDim2.fromOffset(0, 30)}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {ImageTransparency = (MenuToggle and 0.5) or 1}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {BackgroundTransparency = (MenuToggle and 0.5) or 1}):Play()
			TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {Visible = (MenuToggle and true) or false}):Play()
			TweenService:Create(NavigationBar, TweenInfo.new(0.15), {ClipsDescendants = (MenuToggle and false) or true}):Play()
		end)
	end

	local TabCount = 0
	local TabLibrary = {}

	local PageTrack = {}
	local ButtonTrack = {}

	function TabLibrary:Banner(Banner_Opt)
		Banner_Opt.Text = CheckType(Banner_Opt.Text, "string", "Banner")
		Banner_Opt.RichText = CheckType(Banner_Opt.RichText, "boolean", false)
		Banner_Opt.TextColor = CheckType(Banner_Opt.TextColor, "Color3", ThisTheme.BannerAccent)
		Banner_Opt.Font = CheckType(Banner_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
		Banner_Opt.Duration = CheckType(Banner_Opt.Duration, "number", 0)
		Banner_Opt.Options = CheckType(Banner_Opt.Options, "table", {})

		Banner_Opt.Button = CheckType(Banner_Opt.Button, "table", {})
		Banner_Opt.Button.Text = CheckType(Banner_Opt.Button.Text, "string", "Close")
		Banner_Opt.Button.Callback = CheckType(Banner_Opt.Button.Callback, "function", function() end)

		local Banner_Data = {}

		local ExistingBanner, ExistingBannerOverlay = MainFrame:FindFirstChild("BannerOverlay"), MainFrame:FindFirstChild("Banner")

		if ExistingBanner then
			ExistingBanner:Destroy()
		end

		if ExistingBannerOverlay then
			ExistingBannerOverlay:Destroy()
		end

		local BannerOverlay = Objects:New("SmoothButton")
		BannerOverlay.Name = "BannerOverlay"
		BannerOverlay.BackgroundColor3 = ThisTheme.BannerAccent
		BannerOverlay.ImageColor3 = ThisTheme.BannerAccent
		BannerOverlay.ImageTransparency = 1
		BannerOverlay.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 30)
		BannerOverlay.Position = UDim2.fromOffset(0, 30)
		BannerOverlay.ZIndex = 75
		BannerOverlay.Visible = false
		BannerOverlay.Parent = MainFrame

		local Banner_TextSize = TextService:GetTextSize(Banner_Opt.Text, 12, Banner_Opt.Font, Vector2.new(0, 0)).X
        local Lines = math.ceil((Banner_TextSize) / (MainFrame.AbsoluteSize.X - 10))

		local Banner = Objects:New("Round")
		Banner.Name = "Banner"
		Banner.ImageTransparency = 1
		Banner.ImageColor3 = ThisTheme.Banner
		Banner.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, (Lines * 20) + 40)
		Banner.Position = UDim2.fromScale(0, 1) + UDim2.fromOffset(5, (-Lines * 20) - 45)
		Banner.ZIndex = 80
		Banner.Parent = MainFrame

		local BannerLabel = Objects:New("Label")
		BannerLabel.Name = "Value"
		BannerLabel.Text = Banner_Opt.Text
        BannerLabel.RichText = Banner_Opt.RichText
		BannerLabel.TextColor3 = Banner_Opt.TextColor
		BannerLabel.TextSize = 12
		BannerLabel.Font = Banner_Opt.Font
		BannerLabel.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, (Lines * 20) + 5)
		BannerLabel.TextWrapped = true
		BannerLabel.Position = UDim2.fromOffset(5, 0)
		BannerLabel.TextTransparency = 1
		BannerLabel.ZIndex = 80
		BannerLabel.Parent = Banner

        TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
		TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
		TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {Visible = true}):Play()
		TweenService:Create(Banner, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
		TweenService:Create(BannerLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

        local BannerContainer = Objects:New("Frame")
		BannerContainer.Name = "Options"
		BannerContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0)
		BannerContainer.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(-5, 35)
		BannerContainer.ZIndex = 80
		BannerContainer.ClipsDescendants = true
		BannerContainer.Parent = Banner

		local BannerList = Objects:New("UIListLayout")
		BannerList.FillDirection = Enum.FillDirection.Horizontal
		BannerList.HorizontalAlignment = Enum.HorizontalAlignment.Right
		BannerList.SortOrder = Enum.SortOrder.LayoutOrder
		BannerList.Padding = UDim.new(0, 5)
		BannerList.Parent = BannerContainer

		if Banner_Opt.Duration ~= 0 then
			task.delay(Banner_Opt.Duration, function()
				Banner_Data:Close()
			end)
		else
			Banner_Opt.Options[Banner_Opt.Button.Text] = function()
				Banner_Data:Close()
				Banner_Opt.Button.Callback(Banner_Data)
			end

			for Option, Callback in pairs(Banner_Opt.Options) do
				if typeof(Callback) == "function" then
					local Option_TextSize = TextService:GetTextSize(Option, 12, Enum.Font.GothamBold, Vector2.new(0, 0)).X

					local OptionItem = Objects:New("SmoothButton")
					OptionItem.ImageColor3 = ThisTheme.BannerAccent
					OptionItem.ImageTransparency = 0.9
					OptionItem.Size = UDim2.fromOffset(Option_TextSize + 10, 30)
					OptionItem.ZIndex = 80
					OptionItem.ClipsDescendants = true
					OptionItem.Parent = BannerContainer

					local OptionLabel = Objects:New("Label")
					OptionLabel.Text = Option
					OptionLabel.TextSize = 12
					OptionLabel.TextColor3 = ThisTheme.BannerAccent
					OptionLabel.Font = Enum.Font.GothamBold
					OptionLabel.Size = UDim2.fromScale(1, 1)
					OptionLabel.Position = UDim2.fromScale(0, 0)
					OptionLabel.TextXAlignment = Enum.TextXAlignment.Center
					OptionLabel.ZIndex = 80
					OptionLabel.Parent = OptionItem

					OptionItem.MouseButton1Down:Connect(function()
						CircleAnim(OptionItem, ThisTheme.Banner)
						Callback(Banner_Data)
					end)
				end
			end
		end

		TweenService:Create(BannerContainer, TweenInfo.new(0.5), {Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)}):Play()

		function Banner_Data:Close()
			TweenService:Create(BannerContainer, TweenInfo.new(0.5), {Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 0)}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
			TweenService:Create(BannerOverlay, TweenInfo.new(0.5), {Visible = false}):Play()
			TweenService:Create(Banner, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
			TweenService:Create(BannerLabel, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
		end

		return setmetatable(Banner_Data, {
			__newindex = function(t, k, v)
				if k == "Text" then
					Banner_Opt.Text = CheckType(v, "string", Banner_Opt.Text)

					BannerLabel.Text = Banner_Opt.Text
				elseif k == "TextColor" then
					Banner_Opt.TextColor = CheckType(v, "Color3", BannerLabel.TextColor3)

					BannerLabel.TextColor3 = Banner_Opt.TextColor
				elseif k == "Font" then
					Banner_Opt.Font = CheckType(v, "EnumItem", Banner_Opt.Font)

					BannerLabel.Font = Banner_Opt.Font
				elseif k == "RichText" then
					Banner_Opt.RichText = CheckType(v, "boolean", Banner_Opt.RichText)

					BannerLabel.RichText = Banner_Opt.RichText
				end
			end,
			__index = function(t, k)
				if k == "Text" then
					return Banner_Opt.Text
				elseif k == "TextColor" then
					return Banner_Opt.TextColor
				elseif k == "Font" then
					return Banner_Opt.Font
				elseif k == "RichText" then
					return Banner_Opt.RichText
				end
			end
		})
	end

	function TabLibrary:New(Tab_Opt)
		Tab_Opt = CheckType(Tab_Opt, "table", {})

		Tab_Opt.Title = CheckType(Tab_Opt.Title, "string", "Tab")
		Tab_Opt.TextColor = CheckType(Tab_Opt.TextColor, "Color3", Color3.fromRGB(255, 255, 255))
		Tab_Opt.RichText = CheckType(Tab_Opt.RichText, "boolean", false)
		Tab_Opt.Font = CheckType(Tab_Opt.Font, "EnumItem", Enum.Font.GothamBold)
		Tab_Opt.Visible = CheckType(Tab_Opt.Visible, "boolean", true)
		Tab_Opt.Image = CheckType(Tab_Opt.Image, "number", 0)
		Tab_Opt.ReadOnly = CheckType(Tab_Opt.ReadOnly, "boolean", false)

		local Button, NewImage
		local Tab_TextSize  = TextService:GetTextSize(Tab_Opt.Title, 12, Tab_Opt.Font, Vector2.new(0, 0)).X

		if Tab_Opt.Image ~= 0 then
			Button = Objects:New("Button")
            Button.Name = Tab_Opt.Title
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.TextSize = 12
            Button.Font = Tab_Opt.Font
            Button.Text = Tab_Opt.Title
			Button.TextColor3 = Tab_Opt.TextColor
			Button.Visible = Tab_Opt.Visible
            Button.RichText = Tab_Opt.RichText
            Button.Size = UDim2.fromScale(0, 1) + UDim2.fromOffset(0, (Tab_TextSize + 35))
            Button.ZIndex = 200
            Button.TextTransparency = 1

			NewImage = Objects:New(Button and "Round" or "SmoothButton")
            NewImage.Name = Tab_Opt.Image
            NewImage.BackgroundTransparency = 1
            NewImage.Size = UDim2.fromOffset(20, 20)
            NewImage.ScaleType = Enum.ScaleType.Stretch
            NewImage.Image = RunService:IsStudio() and "http://www.roblox.com/asset/?id=5472131383" or game:GetObjects(("rbxassetid://%s"):format(Tab_Opt.Image))[1].Texture
            NewImage.ZIndex = 200
            NewImage.ImageTransparency = 1

			if Button then
				NewImage.Position = UDim2.fromScale(0, 0.5) - UDim2.fromOffset(0, 10)
                NewImage.Parent = Button
			else
				Button = NewImage
			end
		else
			Button = Objects:New("Button")
            Button.Name = Tab_Opt.Title
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.TextSize = 12
            Button.Font = Tab_Opt.Font
            Button.Text = Tab_Opt.Title
			Button.TextColor3 = Tab_Opt.TextColor
			Button.Visible = Tab_Opt.Visible
            Button.RichText = Tab_Opt.RichText
            Button.Size = UDim2.fromScale(0, 1) + UDim2.fromOffset((Tab_TextSize + 10), 0)
            Button.ZIndex = 200
            Button.TextTransparency = 1
		end

		Button.Parent = NavigationBarContent

		local PageContentFrame = Objects:New("Scroll")
		PageContentFrame.Name = Tab_Opt.Title or Tab_Opt.Image
		PageContentFrame.Visible = (TabCount == 0)
		PageContentFrame.ZIndex = 50
		PageContentFrame.BackgroundTransparency = 1
		PageContentFrame.BorderSizePixel = 0
		PageContentFrame.ScrollBarThickness = 3
		PageContentFrame.ScrollBarImageTransparency = 0.2
		PageContentFrame.ScrollBarImageColor3 = ThisTheme.NavBarInvert
		PageContentFrame.Parent = Content

		table.insert(ButtonTrack, Button)
		table.insert(PageTrack, PageContentFrame)

		Button.MouseButton1Down:Connect(function()	
			for _,Track in pairs(ButtonTrack) do
				if not Track == Button then
					TweenService:Create(Track, TweenInfo.new(0.15), {TextTransparency = 0.5}):Play()

					pcall(function()
						TweenService:Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), {ImageTransparency = 0.5}):Play()
					end)
				else
						TweenService:Create(Track, TweenInfo.new(0.15), {TextTransparency = 0}):Play()

					pcall(function()
						TweenService:Create(Track:FindFirstChildWhichIsA("ImageLabel"), TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
					end)
				end
			end

			for _,Track in pairs(PageTrack) do
				Track.Visible = Track == PageContentFrame
			end

			if Style == 3 then
				NavigationBar.ClipsDescendants = true
				TweenService:Create(NavigationBar, TweenInfo.new(0.15), {Size = (UDim2.fromScale(0, 1)) - UDim2.fromOffset(0, 30)}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				TweenService:Create(NavBarOverlay, TweenInfo.new(0.15), {Visible = false}):Play()
			end
		end)

		local PagePadding = Objects:New("UIPadding")
		PagePadding.PaddingLeft = UDim.new(0, 5)
		PagePadding.PaddingRight = UDim.new(0, 5)
		PagePadding.PaddingTop = UDim.new(0, 5)
		PagePadding.PaddingBottom = UDim.new(0, 5)
		PagePadding.Parent = PageContentFrame

		local PageList = Objects:New("UIListLayout")
		PageList.SortOrder = Enum.SortOrder.LayoutOrder
		PageList.Padding = UDim.new(0, 5)
		PageList.Parent = PageContentFrame

		PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			PageContentFrame.CanvasSize = UDim2.fromOffset(0, PageList.AbsoluteContentSize.Y + 10)
		end)

        TabCount += 1

		local Tab_Data = {}

		function Tab_Data:Separator(Separator_Opt)
			Separator_Opt = CheckType(Separator_Opt, "table", {})

			Separator_Opt.Visible = CheckType(Separator_Opt.Visible, "boolean", true)

			local SeparatorContainer = Objects:New("Round")
			SeparatorContainer.Name = "Separator"
			SeparatorContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 3)
			SeparatorContainer.ImageColor3 = ThisTheme.Button
			SeparatorContainer.Visible = Separator_Opt.Visible
			SeparatorContainer.Parent = PageContentFrame

			local Separator_Data = {}

			return setmetatable(Separator_Data, {
				__newindex = function(t, k, v)
					if k == "Visible" then
						Separator_Opt.Visible = CheckType(v, "boolean", Separator_Opt.Visible)

						SeparatorContainer.Visible = Separator_Opt.Visible
					end
				end,
				__index = function(t, k)
					if k == "Visible" then
						return Separator_Opt.Visible
					elseif k == "Destroy" then
						return function()
							SeparatorContainer:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					return Func(Func, ...)
				end
			})
		end

		function Tab_Data:Label(Label_Opt)
			Label_Opt = CheckType(Label_Opt, "table", {})

			Label_Opt.Text = CheckType(Label_Opt.Text, "string", "Label")
			Label_Opt.TextColor = CheckType(Label_Opt.TextColor, "Color3", ThisTheme.ChipSet)
			Label_Opt.TextXAlignment = CheckType(table.find({"Left", "Center"}, Label_Opt.TextXAlignment) and Label_Opt.TextXAlignment, "string", "Left")
			Label_Opt.RichText = CheckType(Label_Opt.RichText, "boolean", false)
			Label_Opt.Font = CheckType(Label_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			Label_Opt.Visible = CheckType(Label_Opt.Visible, "boolean", true)

			Label_Opt.Menu = CheckType(Label_Opt.Menu, "table", {})

			Label_Opt.MouseEnter = CheckType(Label_Opt.MouseEnter, "function", nil)
			Label_Opt.MouseLeave = CheckType(Label_Opt.MouseLeave, "function", nil)

			local Label_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local LabelContainer = Objects:New("Round")
			LabelContainer.Name = "Label"
			LabelContainer.Visible = Label_Opt.Visible
			LabelContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
			LabelContainer.ImageColor3 = ThisTheme.MainFrame
			LabelContainer.Parent = PageContentFrame

			local LabelContent = Objects:New("Label")
			LabelContent.TextColor3 = Label_Opt.TextColor
			LabelContent.Text = Label_Opt.Text
            LabelContent.RichText = Label_Opt.RichText
			LabelContent.TextSize = 12
			LabelContent.Font = Label_Opt.Font
			LabelContent.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-5, 0)
			LabelContent.Position = UDim2.fromOffset(5, 0)
			LabelContent.TextWrapped = true
			LabelContent.TextXAlignment = Enum.TextXAlignment[Label_Opt.TextXAlignment]
			LabelContent.TextYAlignment = Enum.TextYAlignment.Center
            LabelContent.Parent = LabelContainer

			if Label_Opt.MouseEnter then
				local Connection
				Connection = LabelContent.MouseEnter:Connect(function()
					Label_Opt.MouseEnter(Label_Data, Connection)
				end)
			end

			if Label_Opt.MouseLeave then
				local Connection
				Connection = LabelContent.MouseLeave:Connect(function()
					Label_Opt.MouseLeave(Label_Data, Connection)
				end)
			end

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						Label_Opt.Text = CheckType(v, "string", Label_Opt.Text)

						if #Label_Opt.Text > 0 then
							LabelContent.Text = Label_Opt.Text

							ChangedEvent:Fire(k, Label_Opt.Text)
						end
					elseif k == "TextColor" then
						Label_Opt.TextColor = CheckType(v, "Color3", Label_Opt.TextColor)

						LabelContent.TextColor3 = Label_Opt.TextColor

						ChangedEvent:Fire(k, Label_Opt.TextColor)
					elseif k == "TextXAlignment" then
						Label_Opt.TextXAlignment = CheckType(table.find({"Left", "Center"}, v) and v, "string", Label_Opt.TextXAlignment)

						LabelContent.TextXAlignment = Label_Opt.TextXAlignment

						ChangedEvent:Fire(k, Label_Opt.TextXAlignment)
					elseif k == "RichText" then
						Label_Opt.RichText = CheckType(v, "boolean", Label_Opt.RichText)

						LabelContent.RichText = Label_Opt.RichText

						ChangedEvent:Fire(k, Label_Opt.RichText)
					elseif k == "Font" then
						Label_Opt.Font = CheckType(v, "EnumItem", Label_Opt.Font)

						LabelContent.Font = Label_Opt.Font

						ChangedEvent:Fire(k, Label_Opt.Font)
					elseif k == "Visible" then
						Label_Opt.Visible = CheckType(v, "boolean", Label_Opt.Visible)

						LabelContainer.Visible = Label_Opt.Visible

						ChangedEvent:Fire(k, Label_Opt.Visible)
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return LabelContent.ContentText
					elseif k == "TextColor" then
						return Label_Opt.TextColor
					elseif k == "TextXAlignment" then
						return Label_Opt.TextXAlignment
					elseif k == "RichText" then
						return Label_Opt.RichText
					elseif k == "Font" then
						return Label_Opt.Font
					elseif k == "Visible" then
						return Label_Opt.Visible
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							LabelContainer:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					return Func(Func, ...)
				end
			}

			TryAddMenu(LabelContainer, Label_Opt.Menu, setmetatable({}, Funcs))

			return setmetatable(Label_Data, Funcs)
		end

		function Tab_Data:Button(Button_Opt)
			local NewButton, ButtonLabel, Funcs = CreateNewButton(Button_Opt, PageContentFrame)

			local Button_Data = {}

			return setmetatable(Button_Data, Funcs)
		end

		function Tab_Data:Toggle(Toggle_Opt)
			Toggle_Opt = CheckType(Toggle_Opt, "table", {})

			Toggle_Opt.Text = CheckType(Toggle_Opt.Text, "string", "Toggle")
			Toggle_Opt.TextColor = CheckType(Toggle_Opt.TextColor, "Color3", ThisTheme.Toggle)
			Toggle_Opt.RichText = CheckType(Toggle_Opt.RichText, "boolean", false)
			Toggle_Opt.Font = CheckType(Toggle_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			Toggle_Opt.Visible = CheckType(Toggle_Opt.Visible, "boolean", true)
			Toggle_Opt.ReadOnly = CheckType(Toggle_Opt.ReadOnly, "boolean", false)

			Toggle_Opt.Enabled = CheckType(Toggle_Opt.Enabled, "boolean", false)
			Toggle_Opt.Disable = CheckType(Toggle_Opt.Disable, "boolean", true)
			Toggle_Opt.Callback = CheckType(Toggle_Opt.Callback, "function", function() end)

			Toggle_Opt.Menu = CheckType(Toggle_Opt.Menu, "table", {})

			local Toggle_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local Toggle = Objects:New("SmoothButton")
			Toggle.Name = "Toggle"
			Toggle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			Toggle.ImageColor3 = ThisTheme.Toggle
			Toggle.ImageTransparency = 1
			Toggle.Visible = Toggle_Opt.Visible
			Toggle.Parent = PageContentFrame

			local ToggleTracker = Objects:New("Round")
			ToggleTracker.Name = "Tracker"
			ToggleTracker.Image = "rbxassetid://3570695787"
			ToggleTracker.SliceCenter = Rect.new(100, 100, 100, 100)
			ToggleTracker.SliceScale = 1
			ToggleTracker.Size = UDim2.fromOffset(26, 12)
			ToggleTracker.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(41, 6)
			ToggleTracker.ImageColor3 = ThisTheme.Toggle
			ToggleTracker.ImageTransparency = 1
			ToggleTracker.Parent = Toggle

			local Dot = Objects:New("Circle")
			Dot.Name = "Dot"
			Dot.Size = UDim2.fromOffset(16, 16)
			Dot.Position = UDim2.fromScale(0, 0.5) - UDim2.fromOffset(8, 8)
			Dot.ImageColor3 = ThisTheme.ToggleAccent
			Dot.ImageTransparency = 1
			Dot.Parent = ToggleTracker

			local DotShadow = Objects:New("Round")
			DotShadow.Name = "Shadow"
			DotShadow.Image = "http://www.roblox.com/asset/?id=5554831957"
			DotShadow.ScaleType = Enum.ScaleType.Stretch
			DotShadow.Size = UDim2.fromOffset(31, 31)
			DotShadow.Position = UDim2.fromOffset(-8, -8)
			DotShadow.ImageColor3 = ThisTheme.Toggle
			DotShadow.ImageTransparency = 1
			DotShadow.Parent = Dot

            local ToggleLabel = Objects:New("Label")
			ToggleLabel.Font = Toggle_Opt.Font
			ToggleLabel.TextSize = 14
			ToggleLabel.Text = Toggle_Opt.Text
            ToggleLabel.RichText = Toggle_Opt.RichText
			ToggleLabel.TextColor3 = Toggle_Opt.TextColor
			ToggleLabel.TextTransparency = 1
			ToggleLabel.ClipsDescendants = true
			ToggleLabel.Parent = Toggle

			TweenService:Create(Toggle, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(ToggleTracker, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(Dot, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(DotShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ToggleLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

			TweenService:Create(Dot, TweenInfo.new(0.15), {Position = (Toggle_Opt.Enabled and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = Toggle_Opt.Enabled and ThisTheme.Toggle or ThisTheme.ToggleAccent}):Play()

			Toggle.MouseButton1Down:Connect(function()
				if not Toggle_Opt.ReadOnly then
					Toggle_Opt.Enabled = not Toggle_Opt.Enabled

					TweenService:Create(Dot, TweenInfo.new(0.15), {Position = (Toggle_Opt.Enabled and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = Toggle_Opt.Enabled and ThisTheme.Toggle or ThisTheme.ToggleAccent}):Play()
					CircleAnim(ToggleLabel, ThisTheme.ToggleAccent, ThisTheme.Toggle)

					Toggle_Opt.Callback(Toggle_Opt.Enabled, Toggle_Data)

					ChangedEvent:Fire("State", Toggle_Opt.Enabled)
				end
			end)

			local Connection
			Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
				if not NewInstance.Parent then
					if Toggle_Opt.Disable then
						if Toggle_Opt.Enabled then
							Toggle_Opt.Enabled = false
							Toggle_Opt.Callback(Toggle_Opt.Enabled, Toggle_Data)

							Connection:Disconnect()
						end
					else
						Connection:Disconnect()
					end
				end
			end)

			if Toggle_Opt.Enabled and not Toggle_Opt.ReadOnly then
				Toggle_Opt.Callback(Toggle_Opt.Enabled, Toggle_Data)

				ChangedEvent:Fire("State", Toggle_Opt.Enabled)
			end

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						Toggle_Opt.Text = CheckType(v, "string", Toggle_Opt.Text)

						if #Toggle_Opt.Text > 0 then
							ToggleLabel.Text = Toggle_Opt.Text

							ChangedEvent:Fire(k, Toggle_Opt.Text)
						end
					elseif k == "TextColor" then
						Toggle_Opt.TextColor = CheckType(v, "Color3", Toggle_Opt.TextColor)

						ToggleLabel.TextColor3 = Toggle_Opt.TextColor

						ChangedEvent:Fire(k, Toggle_Opt.TextColor)
					elseif k == "RichText" then
						Toggle_Opt.RichText = CheckType(v, "boolean", Toggle_Opt.RichText)

						ToggleLabel.RichText = Toggle_Opt.RichText

						ChangedEvent:Fire(k, Toggle_Opt.RichText)
					elseif k == "Font" then
						Toggle_Opt.Font = CheckType(v, "EnumItem", Toggle_Opt.Font)

						ToggleLabel.Font = Toggle_Opt.Font

						ChangedEvent:Fire(k, Toggle_Opt.Font)
					elseif k == "Visible" then
						Toggle_Opt.Visible = CheckType(v, "boolean", Toggle_Opt.Visible)

						Toggle.Visible = Toggle_Opt.Visible

						ChangedEvent:Fire(k, Toggle_Opt.Visible)
					elseif k == "ReadOnly" then
						Toggle_Opt.ReadOnly = CheckType(v, "boolean", Toggle_Opt.ReadOnly)

						ChangedEvent:Fire(k, Toggle_Opt.ReadOnly)
					elseif k == "State" then
						if not Toggle_Opt.ReadOnly then
							local NewState = CheckType(v, "boolean", Toggle_Opt.Enabled)

							if NewState ~= Toggle_Opt.Enabled then
								Toggle_Opt.Enabled = NewState

								TweenService:Create(Dot, TweenInfo.new(0.15), {Position = (Toggle_Opt.Enabled and UDim2.fromScale(1, 0.5) or UDim2.fromScale(0, 0.5)) - UDim2.fromOffset(8, 8), ImageColor3 = Toggle_Opt.Enabled and ThisTheme.Toggle or ThisTheme.ToggleAccent}):Play()
								Toggle_Opt.Callback(Toggle_Opt.Enabled, Toggle_Data)

								ChangedEvent:Fire(k, Toggle_Opt.Enabled)
							end
						end
					elseif k == "Disable" then
						Toggle_Opt.Disable = CheckType(v, "boolean", Toggle_Opt.Disable)

						ChangedEvent:Fire(k, Toggle_Opt.Disable)
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return ToggleLabel.ContentText
					elseif k == "TextColor" then
						return Toggle_Opt.TextColor
					elseif k == "RichText" then
						return Toggle_Opt.RichText
					elseif k == "Font" then
						return Toggle_Opt.Font
					elseif k == "Visible" then
						return Toggle_Opt.Visible
					elseif k == "ReadOnly" then
						return Toggle_Opt.ReadOnly
					elseif k == "State" then
						return Toggle_Opt.Enabled
					elseif k == "Disable" then
						return Toggle_Opt.Disable
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							Toggle:Destroy()

							if Toggle_Opt.Enabled then
								Toggle_Opt.Enabled = false

								Toggle_Opt.Callback(Toggle_Opt.Enabled, Toggle_Data)
							end
						end
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuButton = TryAddMenu(Toggle, Toggle_Opt.Menu, setmetatable({}, Funcs))

			if MenuAdded then
				ToggleTracker.Position -= UDim2.fromOffset(15, 0)
				MenuButton.ImageColor3 = ThisTheme.Toggle
			end

			return setmetatable(Toggle_Data, Funcs)
		end

		function Tab_Data:Slider(Slider_Opt)
			Slider_Opt = CheckType(Slider_Opt, "table", {})

			Slider_Opt.Text = CheckType(Slider_Opt.Text, "string", "Slider")
			Slider_Opt.TextColor = CheckType(Slider_Opt.TextColor, "Color3", ThisTheme.SliderAccent)
			Slider_Opt.RichText = CheckType(Slider_Opt.RichText, "boolean", false)
			Slider_Opt.Font = CheckType(Slider_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			Slider_Opt.Visible = CheckType(Slider_Opt.Visible, "boolean", true)
			Slider_Opt.ReadOnly = CheckType(Slider_Opt.ReadOnly, "boolean", false)

			Slider_Opt.Min = CheckType(Slider_Opt.Min, "number", 0)
			Slider_Opt.Max = CheckType(Slider_Opt.Max, "number", 100)
			Slider_Opt.Default = math.clamp(CheckType(Slider_Opt.Default, "number", 50), Slider_Opt.Min, Slider_Opt.Max)
			Slider_Opt.Precision = CheckType(Slider_Opt.Precision, "number", 0)
			Slider_Opt.Callback = CheckType(Slider_Opt.Callback, "function", function() end)

			Slider_Opt.Menu = CheckType(Slider_Opt.Menu, "table", {})

			local Slider_Data = {}
			local ChangedEvent = CreateChangedEvent()

			if Slider_Opt.Min > Slider_Opt.Max then
				local Before = Slider_Opt.Min
				Slider_Opt.Min, Slider_Opt.Max = Slider_Opt.Max, Before
			end

			local DefaultScale = Slider_Opt.ReadOnly and 0 or (Slider_Opt.Default - Slider_Opt.Min) / (Slider_Opt.Max - Slider_Opt.Min)

			local Slider = Objects:New("Round")
            Slider.Name = "Slider"
            Slider.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 35)
            Slider.ImageColor3 = ThisTheme.Slider
            Slider.ImageTransparency = 1
			Slider.Visible = Slider_Opt.Visible
            Slider.Parent = PageContentFrame

            local SliderShadow = Objects:New("Shadow")
            SliderShadow.ImageColor3 = ThisTheme.Slider
            SliderShadow.ImageTransparency = 1
            SliderShadow.Parent = Slider

            local SliderTitle = Objects:New("Label")
            SliderTitle.TextColor3 = Slider_Opt.TextColor
            SliderTitle.Text = Slider_Opt.Text
            SliderTitle.TextSize = 14
            SliderTitle.RichText = Slider_Opt.RichText
            SliderTitle.Font = Slider_Opt.Font
            SliderTitle.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
            SliderTitle.TextTransparency = 1
            SliderTitle.Parent = Slider

            local SliderValue = Objects:New("Label")
            SliderValue.Text = Slider_Opt.ReadOnly and "0" or tostring(Slider_Opt.Default)
            SliderValue.TextColor3 = Slider_Opt.TextColor
            SliderValue.TextTransparency = 1
            SliderValue.TextSize = 14
            SliderValue.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-5, 25)
            SliderValue.Position = UDim2.fromScale(0, 0)
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right
            SliderValue.Font = Slider_Opt.Font
            SliderValue.Parent = Slider

            local SliderTracker = Objects:New("Frame")
            SliderTracker.BackgroundColor3 = ThisTheme.SliderAccent
            SliderTracker.BackgroundTransparency = 1
            SliderTracker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-20, 3)
            SliderTracker.Position = UDim2.fromScale(0, 1) + UDim2.fromOffset(10, -10)
            SliderTracker.Parent = Slider

            local SliderFill = SliderTracker:Clone()
            SliderFill.BackgroundTransparency = 1
            SliderFill.Position = UDim2.fromScale(0, 0)
            SliderFill.Size = UDim2.fromScale(DefaultScale, 1)
            SliderFill.Parent = SliderTracker

			local MinSize, MaxSize = 10, 36

			local SizeFromScale = (Slider_Opt.Min + (MaxSize - MinSize)) * DefaultScale
            SizeFromScale = SizeFromScale - SizeFromScale % 2

			local SliderDot = Objects:New("CircleButton")
            SliderDot.Size = UDim2.fromOffset(10, 10)
            SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)
            SliderDot.ImageColor3 = ThisTheme.SliderAccent
            SliderDot.ImageTransparency = 1
            SliderDot.ZIndex = 50
            SliderDot.Parent = SliderTracker

			local SliderFadedDot = Objects:New("Circle")
            SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
            SliderFadedDot.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
            SliderFadedDot.ImageColor3 = ThisTheme.SliderAccent
            SliderFadedDot.ImageTransparency = 1
            SliderFadedDot.ZIndex = 50
            SliderFadedDot.Parent = SliderDot

            TweenService:Create(Slider, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
            TweenService:Create(SliderShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
            TweenService:Create(SliderTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            TweenService:Create(SliderValue, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
            TweenService:Create(SliderTracker, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
            TweenService:Create(SliderFill, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
            TweenService:Create(SliderDot, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

			SliderDot.MouseButton1Down:Connect(function()
				if not Slider_Opt.ReadOnly then
					TweenService:Create(SliderFadedDot, TweenInfo.new(0.15), {ImageTransparency = 0.8}):Play()
					
					local MouseMove, MouseKill

					MouseMove = Mouse.Move:Connect(function()
						local Px = GetXY(SliderTracker)
						SizeFromScale = (Slider_Opt.Min + (MaxSize - MinSize)) * Px
						
						local Power = 10 ^ Slider_Opt.Precision
						local Value = math.floor((Slider_Opt.Min + ((Slider_Opt.Max - Slider_Opt.Min) * Px)) * Power) / Power

						SizeFromScale = SizeFromScale - (SizeFromScale % 2)
						TweenService:Create(SliderDot, TweenInfo.new(0.15), {Position = UDim2.fromScale(Px, 0.5) - UDim2.fromOffset(5, 5)}):Play()
						TweenService:Create(SliderFill, TweenInfo.new(0.15), {Size = UDim2.fromScale(Px, 1)}):Play()

						SliderFadedDot.Size = UDim2.fromOffset(SizeFromScale, SizeFromScale)
						SliderFadedDot.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)
						SliderValue.Text = tostring(Value)

						Slider_Opt.Callback(Value, Slider_Data)

						ChangedEvent:Fire("Value", Value)
					end)

					MouseKill = UserInputService.InputEnded:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType.Touch then
							TweenService:Create(SliderFadedDot, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
							MouseMove:Disconnect()
							MouseKill:Disconnect()
						end
					end)
				end
			end)

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						Slider_Opt.Text = CheckType(v, "string", Slider_Opt.Text)

						SliderTitle.Text = Slider_Opt.Text

						ChangedEvent:Fire(k, Slider_Opt.Text)
					elseif k == "TextColor" then
						Slider_Opt.TextColor = CheckType(v, "Color3", Slider_Opt.TextColor)

						SliderTitle.TextColor3 = Slider_Opt.TextColor
						SliderValue.TextColor3 = Slider_Opt.TextColor

						ChangedEvent:Fire(k, Slider_Opt.TextColor)
					elseif k == "RichText" then
						Slider_Opt.RichText = CheckType(v, "boolean", Slider_Opt.RichText)

						SliderTitle.RichText = Slider_Opt.RichText

						ChangedEvent:Fire(k, Slider_Opt.RichText)
					elseif k == "Font" then
						Slider_Opt.Font = CheckType(v, "EnumItem", Slider_Opt.Font)

						SliderTitle.Font = Slider_Opt.Font
						SliderValue.Font = Slider_Opt.Font

						ChangedEvent:Fire(k, Slider_Opt.Font)
					elseif k == "Visible" then
						Slider_Opt.Visible = CheckType(v, "boolean", Slider_Opt.Visible)
						
						Slider.Visible = Slider_Opt.Visible

						ChangedEvent:Fire(k, Slider_Opt.Visible)
					elseif k == "ReadOnly" then
						Slider_Opt.ReadOnly = CheckType(Slider_Opt.ReadOnly, "boolean", Slider_Opt.ReadOnly)
					elseif k == "Min" then
						Slider_Opt.Min = CheckType(v, "number", Slider_Opt.Min)

						SliderDefault = math.clamp(Slider_Opt.Default, Slider_Opt.Min, Slider_Opt.Max) or math.clamp(50, Slider_Opt.Min, Slider_Opt.Max)
						DefaultScale =  (Slider_Opt.Default - Slider_Opt.Min) / (Slider_Opt.Max - Slider_Opt.Min)

						SizeFromScale = SizeFromScale - (SizeFromScale % 2)
						SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)

						ChangedEvent:Fire(k, Slider_Opt.Min)
					elseif k == "Max" then
						Slider_Opt.Max = CheckType(v, "number", Slider_Opt.Max)

						SliderDefault = math.clamp(Slider_Opt.Default, Slider_Opt.Min, Slider_Opt.Max) or math.clamp(50, Slider_Opt.Min, Slider_Opt.Max)
						DefaultScale =  (Slider_Opt.Default - Slider_Opt.Min) / (Slider_Opt.Max - Slider_Opt.Min)

						SizeFromScale = SizeFromScale - (SizeFromScale % 2)
						SliderDot.Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(SizeFromScale / 2, SizeFromScale / 2)

						ChangedEvent:Fire(k, Slider_Opt.Max)
					elseif k == "Value" then
						if not Slider_Opt.ReadOnly then
							v = math.clamp(CheckType(v, "number", tonumber(SliderValue)), Slider_Opt.Min, Slider_Opt.Max)

							DefaultScale = (v - Slider_Opt.Min) / (Slider_Opt.Max - Slider_Opt.Min)
							TweenService:Create(SliderDot, TweenInfo.new(0.15), {Position = UDim2.fromScale(DefaultScale, 0.5) - UDim2.fromOffset(5, 5)}):Play()
							TweenService:Create(SliderFill, TweenInfo.new(0.15), {Size = UDim2.fromScale(DefaultScale, 1)}):Play()

							SliderValue.Text = tostring(v)
							Slider_Opt.Callback(v, Slider_Data)

							ChangedEvent:Fire(k, v)
						end
					end
				end,
				__index = function(t, k, v)
					if k == "Text" then
						return SliderTitle.ContentText
					elseif k == "TextColor" then
						return Slider_Opt.TextColor
					elseif k == "RichText" then
						return Slider_Opt.RichText
					elseif k == "Font" then
						return Slider_Opt.Font
					elseif k == "Visible" then
						return Slider_Opt.Visible
					elseif k == "ReadOnly" then
						return Slider_Opt.ReadOnly
					elseif k == "Min" then
						return Slider_Opt.Min
					elseif k == "Max" then
						return Slider_Opt.Max
					elseif k == "Value" then
						return tonumber(SliderValue.Text)
					elseif k == "Destroy" then
						return function()
							Slider:Destroy()
						end
					elseif k == "Changed" then
						return ChangedEvent
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuButton = TryAddMenu(Slider, Slider_Opt.Menu, setmetatable({}, Funcs))

			if MenuAdded then
				SliderValue.Position = SliderValue.Position - UDim2.fromOffset(25, 0)
                SliderTracker.Size = SliderTracker.Size - UDim2.fromOffset(20, 0)
                MenuButton.ImageColor3 = ThisTheme.SliderAccent
			end

			return setmetatable(Slider_Data, Funcs)
		end

		function Tab_Data:Dropdown(Dropdown_Opt)
			Dropdown_Opt = CheckType(Dropdown_Opt, "table", {})

			Dropdown_Opt.Text = CheckType(Dropdown_Opt.Text, "string", "Dropdown")
			Dropdown_Opt.TextColor = CheckType(Dropdown_Opt.TextColor, "Color3", ThisTheme.DropdownAccent)
			Dropdown_Opt.TextXAlignment = CheckType(table.find({"Left", "Right"}, Dropdown_Opt.TextXAlignment), "string", "Left")
			Dropdown_Opt.RichText = CheckType(Dropdown_Opt.RichText, "boolean", false)
			Dropdown_Opt.Font = CheckType(Dropdown_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			Dropdown_Opt.Visible = CheckType(Dropdown_Opt.Visible, "boolean", true)
			Dropdown_Opt.ReadOnly = CheckType(Dropdown_Opt.ReadOnly, "boolean", false)

			Dropdown_Opt.Hide = CheckType(Dropdown_Opt.Hide, "boolean", true)
			Dropdown_Opt.Options = CheckType(Dropdown_Opt.Options, "table", {})
			Dropdown_Opt.Default = CheckType(table.find(Dropdown_Opt.Options, Dropdown_Opt.Default), "string", "")
			Dropdown_Opt.Search = CheckType(Dropdown_Opt.Search, "boolean", false)
			Dropdown_Opt.Callback = CheckType(Dropdown_Opt.Callback, "function", function() end)

			Dropdown_Opt.Menu = CheckType(Dropdown_Opt.Menu, "table", {})

			local Dropdown_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local Dropdown = Objects:New("Frame")
			Dropdown.Name = "Dropdown"
			Dropdown.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			Dropdown.Visible = Dropdown_Opt.Visible
			Dropdown.Parent = PageContentFrame

			local DropdownBar = Objects:New("Round")
			DropdownBar.Name = "TitleBar"
			DropdownBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			DropdownBar.ImageColor3 = ThisTheme.Dropdown
			DropdownBar.ImageTransparency = 1
			DropdownBar.Parent = Dropdown

            local DropdownTitle = Objects:New("Button")
			DropdownTitle.Name = "Title"
			DropdownTitle.Font = Dropdown_Opt.Font
			DropdownTitle.TextXAlignment = Dropdown_Opt.TextXAlignment
			DropdownTitle.Text = ("%s: %s"):format(Dropdown_Opt.Text, Dropdown_Opt.Default)
			DropdownTitle.TextColor3 = Dropdown_Opt.TextColor
			DropdownTitle.TextTransparency = 1
			DropdownTitle.TextSize = 14
			DropdownTitle.Parent = DropdownBar

			local DropdownToggle = Objects:New("Round")
			DropdownToggle.Name = "Container"
			DropdownToggle.Size = UDim2.fromOffset(24, 24)
			DropdownToggle.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(27, 12)
			DropdownToggle.ImageColor3 = ThisTheme.DropdownAccent
			DropdownToggle.ImageTransparency = 0.8
			DropdownToggle.Parent = DropdownBar

            local DropdownButton = Objects:New("Round")
			DropdownButton.Name = "Drop"
			DropdownButton.Image = "http://www.roblox.com/asset/?id=5574299686"
			DropdownButton.ScaleType = Enum.ScaleType.Stretch
			DropdownButton.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
			DropdownButton.Position = UDim2.fromOffset(2, 2)
			DropdownButton.ImageColor3 = ThisTheme.DropdownAccent
			DropdownButton.ImageTransparency = 1
			DropdownButton.Parent = DropdownToggle

			TweenService:Create(DropdownBar, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(DropdownTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(DropdownToggle, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(DropdownButton, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

            local DropdownContent = Objects:New("Frame")
			DropdownContent.Name = "Content"
			DropdownContent.Size = UDim2.fromScale(1, 0)
			DropdownContent.Position = UDim2.fromOffset(0, 35)
			DropdownContent.ClipsDescendants = true
			DropdownContent.Parent = Dropdown

			local DropToggle = false
			local NumberOfOptions = #Dropdown_Opt.Options + (Dropdown_Opt.Search and 1 or 0)
			local DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))

			local DropdownList = Objects:New("UIListLayout")
			DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
			DropdownList.Padding = UDim.new(0, 5)
			DropdownList.Parent = DropdownContent

            DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if DropToggle then
					DropdownContent.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DropdownList.AbsoluteContentSize.Y)
					DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DropdownList.AbsoluteContentSize.Y)
				end
			end)

			local Search = Objects:New("Round")
			Search.Name = "SearchBar"
			Search.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
			Search.ImageColor3 = ThisTheme.TextField
			Search.ImageTransparency = 0.8
			Search.Visible = Dropdown_Opt.Search
			Search.Parent = DropdownContent

			local SearchInput = Objects:New("Box")
			SearchInput.Name = "Value"
			SearchInput.PlaceholderText = "Search..."
			SearchInput.PlaceholderColor3 = ThisTheme.TextFieldAccent
			SearchInput.TextColor3 = ThisTheme.TextFieldAccent
			SearchInput.Text = ""
			SearchInput.Font = Enum.Font.GothamSemibold
			SearchInput.TextSize = 14
			SearchInput.TextTransparency = 0.5
			SearchInput.TextTruncate = Enum.TextTruncate.AtEnd
			SearchInput.Parent = Search

			SearchInput.Focused:Connect(function()
				TweenService:Create(Search, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
				TweenService:Create(SearchInput, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			end)

			SearchInput.FocusLost:Connect(function()
				TweenService:Create(Search, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
				TweenService:Create(SearchInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()
			end)

			SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
				for _, v in ipairs(DropdownContent:GetDescendants()) do
					if v.Name == "Button" then
						if SearchInput.Text ~= "" then
							if v.TextLabel.Text:lower():find(SearchInput:lower()) then
								v.Visible = true
							else
								v.Visible = false
							end
						else
							v.Visible = true
						end
					end
				end
			end)

			for _,v in ipairs(Dropdown_Opt.Options) do
				local NewButton = CreateNewButton({
					Text = v
				}, DropdownContent)

				NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
				NewButton.MouseButton1Down:Connect(function()
					if not Dropdown_Opt.ReadOnly then
						if NewButton.ImageTransparency == 0 then
							DropdownTitle.Text = ("%s: %s"):format(Dropdown_Opt.Text, v)
							SearchInput.Text = ""

							if Dropdown_Opt.Hide then
								TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = 0}):Play()
								TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = UDim2.fromScale(1, 0)}):Play()
								TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
							end

							Dropdown_Opt.Callback(v, Dropdown_Data)

							ChangedEvent:Fire("Option", v)
						end
					end
				end)
			end

			DropdownTitle.MouseButton1Down:Connect(function()
				if not Dropdown_Opt.ReadOnly then
					DropToggle = not DropToggle

					TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = DropToggle and 135 or 0}):Play()
					TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = DropToggle and DropdownSize or UDim2.fromScale(1, 0)}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = DropToggle and (DropdownSize + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
				else
					TabLibrary:Banner({
						Text = "This is read-only!",
						Duration = 3
					})
				end
			end)

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						Dropdown_Opt.Text = CheckType(v, "string", Dropdown_Opt.Text)

						if #Dropdown_Opt.Text > 0 then
							DropdownTitle.Text = DropdownTitle.Text:gsub(DropdownTitle:match("^(.-):"), Dropdown_Opt.Text)

							ChangedEvent:Fire(k, Dropdown_Opt.Text)
						end
					elseif k == "TextColor" then
						Dropdown_Opt.TextColor = CheckType(v, "Color3", Dropdown_Opt.TextColor)

						DropdownTitle.TextColor3 = Dropdown_Opt.TextColor

						ChangedEvent:Fire(k, Dropdown_Opt.TextColor)
					elseif k == "TextXAlignment" then
						Dropdown_Opt.TextXAlignment = CheckType(table.find({"Left", "Right"}, v), "string", Dropdown_Opt.TextXAlignment)
					elseif k == "RichText" then
						Dropdown_Opt.RichText = CheckType(v, "boolean", Dropdown_Opt.RichText)

						DropdownTitle.RichText = Dropdown_Opt.RichText

						ChangedEvent:Fire(k, Dropdown_Opt.RichText)
					elseif k == "Font" then
						Dropdown_Opt.Font = CheckType(v, "EnumItem", Dropdown_Opt.Font)

						DropdownTitle.Font = Dropdown_Opt.Font

						ChangedEvent:Fire(k, Dropdown_Opt.Font)
					elseif k == "Visible" then
						Dropdown_Opt.Visible = CheckType(v, "boolean", Dropdown_Opt.Visible)

						Dropdown.Visible = Dropdown_Opt.Visible

						ChangedEvent:Fire(k, Dropdown_Opt.Visible)
					elseif k == "ReadOnly" then
						Dropdown_Opt.ReadOnly = CheckType(v, "boolean", Dropdown_Opt.ReadOnly)
					elseif k == "Hide" then
						Dropdown_Opt.Hide = CheckType(v, "boolean", Dropdown_Opt.Hide)

						ChangedEvent:Fire(k, Dropdown_Opt.Hide)
					elseif k == "Options" then
						if not Dropdown_Opt.ReadOnly then
							Dropdown_Opt.Options = CheckType(v, "table", Dropdown_Opt.Options)
							NumberOfOptions = #Dropdown_Opt.Options + (Dropdown_Opt.Search and 1 or 0)
							DropdownSize = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (NumberOfOptions * 20) + ((NumberOfOptions - 1) * 5))

							if DropdownContent then
								DropdownContent:Destroy()
							end

							TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = DropToggle and (DropdownSize + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()

							DropdownContent = Objects:New("Frame")
							DropdownContent.Name = "Content"
							DropdownContent.Size = (DropToggle and DropdownSize) or UDim2.fromScale(1, 0)
							DropdownContent.Position = UDim2.fromOffset(0, 35)
							DropdownContent.ClipsDescendants = true
							DropdownContent.Parent = Dropdown

							DropdownList = Objects:New("UIListLayout")
							DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
							DropdownList.Padding = UDim.new(0, 5)
							DropdownList.Parent = DropdownContent

							Search = Objects:New("Round")
							Search.Name = "SearchBar"
							Search.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
							Search.ImageColor3 = ThisTheme.TextField
							Search.ImageTransparency = 0.8
							Search.Visible = Dropdown_Opt.Search
							Search.Parent = DropdownContent

							SearchInput = Objects:New("Box")
							SearchInput.Name = "Value"
							SearchInput.PlaceholderText = "Search..."
							SearchInput.PlaceholderColor3 = ThisTheme.TextFieldAccent
							SearchInput.TextColor3 = ThisTheme.TextFieldAccent
							SearchInput.Text = ""
							SearchInput.Font = Enum.Font.GothamSemibold
							SearchInput.TextSize = 14
							SearchInput.TextTransparency = 0.5
							SearchInput.TextTruncate = Enum.TextTruncate.AtEnd
							SearchInput.Parent = Search

							SearchInput.Focused:Connect(function()
								TweenService:Create(Search, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
								TweenService:Create(SearchInput, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
							end)

							SearchInput.FocusLost:Connect(function()
								TweenService:Create(Search, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
								TweenService:Create(SearchInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()
							end)

							SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
								for _, v in ipairs(DropdownContent:GetDescendants()) do
									if v.Name == "Button" then
										if SearchInput.Text ~= "" then
											if v.TextLabel.Text:lower():find(SearchInput:lower()) then
												v.Visible = true
											else
												v.Visible = false
											end
										else
											v.Visible = true
										end
									end
								end
							end)

							for _,v in pairs(Dropdown_Opt.Options) do
								local NewButton = CreateNewButton({
									Text = v
								}, DropdownContent)

								NewButton.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 20)
								NewButton.MouseButton1Down:Connect(function()
									if NewButton.ImageTransparency == 0 then
										DropdownTitle.Text = ("%s: %s"):format(Dropdown_Opt.Text, v)
										SearchInput.Text = ""

										if Dropdown_Opt.Hide then
											TweenService:Create(DropdownButton, TweenInfo.new(0.15), {Rotation = 0}):Play()
											TweenService:Create(DropdownContent, TweenInfo.new(0.15), {Size = UDim2.fromScale(1, 0)}):Play()
											TweenService:Create(Dropdown, TweenInfo.new(0.15), {Size = (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
										end

										Dropdown_Opt.Callback(v, Dropdown_Data)

										ChangedEvent:Fire("Option", v)
									end
								end)
							end
						end
					elseif k == "Option" then
						v = CheckType(v, "string", DropdownTitle.Text:match(":%s*(%a+)"))

						if not Dropdown_Opt.ReadOnly then
							if #v > 0 and table.find(Dropdown_Opt.Options, v) or v == "" then
								DropdownTitle.Text = DropdownTitle.Text:gsub(DropdownTitle.Text:match(":%s*(%a+)"), v)

								if v ~= "" then
									Dropdown_Opt.Callback(v)
								end

								ChangedEvent:Fire(k, v)
							end
						end
					elseif k == "Search" then
						Dropdown_Opt.Search = CheckType(v, "boolean", Dropdown_Opt.Search)

						ChangedEvent:Fire(k, Dropdown_Opt.Search)	
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return DropdownTitle.ContentText
					elseif k == "TextColor" then
						return Dropdown_Opt.TextColor
					elseif k == "RichText" then
						return Dropdown_Opt.RichText
					elseif k == "Font" then
						return Dropdown_Opt.Font
					elseif k == "Visible" then
						return Dropdown_Opt.Visible
					elseif k == "ReadOnly" then
						return Dropdown_Opt.ReadOnly	
					elseif k == "Hide" then
						return Dropdown_Opt.Hide
					elseif k == "Options" then
						return Dropdown_Opt.Options
					elseif k == "Option" then
						return DropdownTitle.Text:match(":%s*(%a+)")
					elseif k == "Search" then
						return Dropdown_Opt.Search
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							Dropdown:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuButton = TryAddMenu(DropdownBar, Dropdown_Opt.Menu, setmetatable({}, Funcs))
			
			if MenuAdded then
				DropdownToggle.Position = DropdownToggle.Position - UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.DropdownAccent
			end

			return setmetatable(Dropdown_Data, Funcs)
		end

		function Tab_Data:ChipSet(ChipSet_Opt)
			ChipSet_Opt = CheckType(ChipSet_Opt, "table", {})

			ChipSet_Opt.Disable = CheckType(ChipSet_Opt.Disable, "boolean", true)
			ChipSet_Opt.Visible = CheckType(ChipSet_Opt.Visible, "boolean", true)
			ChipSet_Opt.ReadOnly = CheckType(ChipSet_Opt.ReadOnly, "boolean", false)

			ChipSet_Opt.Options = CheckType(ChipSet_Opt.Options, "table", {})
			ChipSet_Opt.Callback = CheckType(ChipSet_Opt.Callback, "function", function() end)

			local ChipSet_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local Keys = {}
			local TotalOptions = 0

			for i,v in pairs(ChipSet_Opt.Options) do
				TotalOptions = TotalOptions + 1
				table.insert(Keys, i)
			end

			table.sort(Keys)

			local ChipSet = Objects:New("Round")
			ChipSet.Name = "ChipSet"
			ChipSet.ImageColor3 = ThisTheme.ChipSet
			ChipSet.ImageTransparency = 1
			ChipSet.Visible = ChipSet_Opt.Visible
			ChipSet.Parent = PageContentFrame

			if TotalOptions > 0 then
				local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

				ChipSet.Size = Size

				local ChipList = Objects:New("UIListLayout")
				ChipList.SortOrder = Enum.SortOrder.LayoutOrder
				ChipList.Padding = UDim.new(0, 5)
				ChipList.Parent = ChipSet

				local ChipPadding = Objects:New("UIPadding")
				ChipPadding.PaddingBottom = UDim.new(0, 5)
				ChipPadding.PaddingTop = UDim.new(0, 5)
				ChipPadding.PaddingRight= UDim.new(0, 5)
				ChipPadding.PaddingLeft = UDim.new(0, 5)
				ChipPadding.Parent = ChipSet

				local Build = {}

				for Key, Value in pairs(Keys) do
					if typeof(ChipSet_Opt.Options[Value]) == "table" then
						Build[Value] = ChipSet_Opt.Options[Value].Enabled
					else
						Build[Value] = ChipSet_Opt.Options[Value]
					end
				end

				TweenService:Create(ChipSet, TweenInfo.new(0.5), {ImageTransparency = 0.9}):Play()

				for _, Value in pairs(Keys) do
					local ChipItem = Objects:New("SmoothButton")
					ChipItem.Name = "ChipItem"
					ChipItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
					ChipItem.ImageColor3 = (Build[Value] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
					ChipItem.ImageTransparency = 1
					ChipItem.Parent = ChipSet
					ChipItem:SetAttribute("Key", Value)

					local ChipShadow = Objects:New("Shadow")
					ChipShadow.Name = "Shadow"
					ChipShadow.ImageColor3 = (Build[Value] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
					ChipShadow.ImageTransparency = 1
					ChipShadow.Parent = ChipItem

					local Tick = Objects:New("Round")
					Tick.Name = "Tick"
					Tick.ScaleType = Enum.ScaleType.Stretch
					Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
					Tick.ImageColor3 = ThisTheme.ChipSetAccent
					Tick.ImageTransparency = 1
					Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 10)
					Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
					Tick.Position = UDim2.fromOffset(5, 5)
					Tick.Parent = ChipItem

					local ChipLabel = Objects:New("Label")
					ChipLabel.Name = "ChipLabel"
					ChipLabel.Size = (Build[Value] and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))
					ChipLabel.Position = (Build[Value] and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0)
					ChipLabel.Text = Value
					ChipLabel.Font = Enum.Font.Gotham
					ChipLabel.TextSize = 12
					ChipLabel.TextColor3 = (Build[Value] and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet
					ChipLabel.TextTransparency = 1
					ChipLabel.Parent = ChipItem

					TweenService:Create(ChipItem, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
					TweenService:Create(ChipShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
					TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = (Build[Value] and 0) or 1}):Play()
					TweenService:Create(ChipLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

					local ChipMenu

					if typeof(ChipSet_Opt.Options[Value]) == "table" then
						ChipSet_Opt.Options[Value].Menu = CheckType(ChipSet_Opt.Options[Value].Menu, "table", {})

						local MenuAdded, MenuButton = TryAddMenu(ChipItem, ChipSet_Opt.Options[Value].Menu, {})

						MenuButton.ImageColor3 = Build[Value] and ThisTheme.ChipSetAccent or ThisTheme.ChipSet

						ChipMenu = MenuButton
					end

					ChipItem.MouseButton1Down:Connect(function()
						if not ChipSet_Opt.ReadOnly then
							Build[Value] = not Build[Value]
							local Enabled = Build[Value]

							TweenService:Create(ChipItem, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(ChipShadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
							TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
							TweenService:Create(ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()
						
							if ChipMenu then
								TweenService:Create(ChipMenu, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet}):Play()
							end

							ChipSet_Opt.Callback(Value, Enabled, ChipSet_Data)

							ChangedEvent:Fire("State", {Index = Value, State = Enabled})
						end
					end)

					local Connection
					Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
						if not NewInstance.Parent then
							if ChipSet_Opt.Disable then
								if Build[Value] then
									Build[Value] = false

									ChipSet_Opt.Callback(Value, Build[Value], ChipSet_Data)

									Connection:Disconnect()
								end
							else
								Connection:Disconnect()
							end
						end
					end)

					return setmetatable(ChipSet_Data, {
						__newindex = function(t, k, v)
							if k == "Options" then
								ChipSet_Opt.Options = CheckType(v, "table", ChipSet_Opt.Options)

								Keys = {}
								TotalOptions = 0
								
								for i in pairs(ChipSet_Opt.Options) do
									TotalOptions = TotalOptions + 1
									table.insert(Keys, i)
								end

								table.sort(Keys)

								if ChipSet then
									ChipSet:Destroy()
								end

								Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

								ChipSet = Objects:New("Round")
								ChipSet.Name = "ChipSet"
								ChipSet.ImageColor3 = ThisTheme.ChipSet
								ChipSet.ImageTransparency = 1
								ChipSet.Size = Size
								ChipSet.Visible = ChipSet_Visible
								ChipSet.Parent = PageContentFrame

								TweenService:Create(ChipSet, TweenInfo.new(0.15), {Size = Size}):Play()

								ChipList = Objects:New("UIListLayout")
								ChipList.SortOrder = Enum.SortOrder.LayoutOrder
								ChipList.Padding = UDim.new(0, 5)
								ChipList.Parent = ChipSet

								ChipPadding = Objects:New("UIPadding")
								ChipPadding.PaddingBottom = UDim.new(0, 5)
								ChipPadding.PaddingTop = UDim.new(0, 5)
								ChipPadding.PaddingRight= UDim.new(0, 5)
								ChipPadding.PaddingLeft = UDim.new(0, 5)
								ChipPadding.Parent = ChipSet

								Build = {}

								for _,Value in pairs(Keys) do
									if typeof(ChipSet_Opt.Options[Value]) == "table" then
										Build[Value] = ChipSet_Opt.Options[Value].Enabled
									else
										Build[Value] = ChipSet_Opt.Options[Value]
									end
								end

								for _,Value in pairs(Keys) do
									local ChipItem = Objects:New("SmoothButton")
									ChipItem.Name = "ChipItem"
									ChipItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
									ChipItem.ImageColor3 = (Build[Value] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
									ChipItem.ImageTransparency = 1
									ChipItem.Parent = ChipSet
									ChipItem:SetAttribute("Key", Value)

									local ChipShadow = Objects:New("Shadow")
									ChipShadow.Name = "Shadow"
									ChipShadow.ImageColor3 = (Build[Value] and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent
									ChipShadow.ImageTransparency = 1
									ChipShadow.Parent = ChipItem

									local Tick = Objects:New("Round")
									Tick.Name = "Tick"
									Tick.ScaleType = Enum.ScaleType.Stretch
									Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
									Tick.ImageColor3 = ThisTheme.ChipSetAccent
									Tick.ImageTransparency = 1
									Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(10, 10)
									Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
									Tick.Position = UDim2.fromOffset(5, 5)
									Tick.Parent = ChipItem

									local ChipLabel = Objects:New("Label")
									ChipLabel.Name = "ChipLabel"
									ChipLabel.Size = (Build[Value] and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))
									ChipLabel.Position = (Build[Value] and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0)
									ChipLabel.Text = Value
									ChipLabel.Font = Enum.Font.Gotham
									ChipLabel.TextSize = 12
									ChipLabel.TextColor3 = (Build[Value] and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet
									ChipLabel.TextTransparency = 1
									ChipLabel.Parent = ChipItem

									TweenService:Create(ChipItem, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
									TweenService:Create(ChipShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
									TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = (Build[Key] and 0) or 1}):Play()
									TweenService:Create(ChipLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
								end

								TweenService:Create(ChipSet, TweenInfo.new(0.5), {ImageTransparency = 0.9}):Play()

								local ChipMenu

								if typeof(ChipSet_Opt.Options[Value]) == "table" then
									local Menu = ChipSet_Opt.Options[Value].Menu or {}
									local MenuAdded, MenuButton = TryAddMenu(ChipItem, Menu, {})

									MenuButton.ImageColor3 = Build[Value] and ThisTheme.ChipSetAccent or ThisTheme.ChipSet

									ChipMenu = MenuButton
								end

								ChipItem.MouseButton1Down:Connect(function()
									if not ChipSet_Opt.ReadOnly then
										Build[Value] = not Build[Value]
										local Enabled = Build[Value]

										TweenService:Create(ChipItem, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
										TweenService:Create(ChipShadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
										TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
										TweenService:Create(ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()

										if ChipMenu then
											TweenService:Create(ChipMenu, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet}):Play()
										end

										ChipSet_Opt.Options.Callback(Value, Enabled, ChipSet_Data)

										ChangedEvent:Fire("State", {Index = Value, State = Enabled})
									end
								end)
							elseif k == "Visible" then
								ChipSet_Opt.Visible = CheckType(v, "boolean", ChipSet_Opt.Visible)

								ChipSet.Visible = ChipSet_Opt.Visible

								ChangedEvent:Fire(k, ChipSet_Opt.Visible)
							elseif k == "ReadOnly" then
								ChipSet_Opt.ReadOnly = CheckType(v, "boolean", ChipSet_Opt.ReadOnly)

								ChangedEvent:Fire(k, ChipSet_Opt.ReadOnly)
							end
						end,
						__index = function(t, k)
							if k == "Options" then
								return ChipSet_Opt.Options
							elseif k == "State" then
								return {
									Set = function(Func, Index, State)
										for _,v in pairs(ChipSet:GetChildren()) do
											if v:GetAttribute("Key") == Index then
												Build[Index] = State

												local Enabled = Build[Index]

												TweenService:Create(v, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
												TweenService:Create(v.Shadow, TweenInfo.new(0.15), {ImageColor3 = (Enabled and ThisTheme.ChipSet) or ThisTheme.ChipSetAccent}):Play()
												TweenService:Create(v.Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 1}):Play()
												TweenService:Create(v.ChipLabel, TweenInfo.new(0.15), {TextColor3 = (Enabled and ThisTheme.ChipSetAccent) or ThisTheme.ChipSet, Position = (Enabled and UDim2.fromOffset(30, 0)) or UDim2.fromOffset(5, 0), Size = (Enabled and (UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0))) or (UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0))}):Play()

												ChipSet_Opt.Callback(Index, Enabled, ChipSet_Data)

												ChangedEvent:Fire("State", {Index = Index, State = Enabled})
											end

											break
										end
									end,
									Get = function(Func, Index)
										return Build[Index]
									end
								}
							elseif k == "Visible" then
								return ChipSet_Opt.Visible
							elseif k == "ReadOnly" then
								return ChipSet_Opt.ReadOnly
							elseif k == "Changed" then
								return ChangedEvent
							elseif k == "Destroy" then
								return function()
									ChipSet:Destroy()
								end
							end
						end,
						__call = function(Func, ...)
							Func(Func, ...)
						end
					})
				end
			end
		end

		function Tab_Data:DataTable(DataTable_Opt)
			DataTable_Opt = CheckType(DataTable_Opt, "table", {})

			DataTable_Opt.Text = CheckType(DataTable_Opt.Text, "string", "DataTable")
			DataTable_Opt.TextColor = CheckType(DataTable_Opt.TextColor, "Color3", ThisTheme.DataTable)
			DataTable_Opt.TextXAlignment = CheckType(table.find({"Right", "Left"}, DataTable_Opt.TextXAlignment) and DataTable_Opt.TextXAlignment, "string", "Left")
			DataTable_Opt.Font = CheckType(DataTable_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			DataTable_Opt.Visible = CheckType(DataTable_Opt.Visible, "boolean", true)
			DataTable_Opt.ReadOnly = CheckType(DataTable_Opt.ReadOnly, "boolean", false)

			DataTable_Opt.Options = CheckType(DataTable_Opt.Options, "table", {})
			DataTable_Opt.Disable = CheckType(DataTable_Opt.Disable, "boolean", true)
			DataTable_Opt.Callback = CheckType(DataTable_Opt.Callback, "function", function() end)

			local DataTable_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local Keys = {}
			local TotalOptions = 0

			for i in pairs(DataTable_Opt.Options) do
				TotalOptions = TotalOptions + 1
				table.insert(Keys, i)
			end

			table.sort(Keys)

			local Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

			local DataTable = Objects:New("Frame")
			DataTable.Name = "DataTable"
			DataTable.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			DataTable.Visible = DataTable_Opt.Visible
			DataTable.Parent = PageContentFrame

			local DataShadow = Objects:New("Shadow")
			DataShadow.ImageColor3 = ThisTheme.DataTable
			DataShadow.ImageTransparency = 1
			DataShadow.Parent = DataTable

			local DataTableBar = Objects:New("Round")
			DataTableBar.Name = "TitleBar"
			DataTableBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			DataTableBar.ImageColor3 = ThisTheme.DataTableAccent
			DataTableBar.ImageTransparency = 1
			DataTableBar.Parent = DataTable

			local DataTableTitle = Objects:New("Button")
			DataTableTitle.Name = "Title"
			DataTableTitle.Font = DataTable_Opt.Font
			DataTableTitle.TextXAlignment = Enum.TextXAlignment[DataTable_Opt.TextXAlignment]
			DataTableTitle.Text = DataTable_Opt.Text
			DataTableTitle.TextColor3 = DataTable_Opt.TextColor
			DataTableTitle.TextTransparency = 1
			DataTableTitle.TextSize = 14
			DataTableTitle.Parent = DataTableBar

			local DataTableToggle = Objects:New("Round")
			DataTableToggle.Name = "Container"
			DataTableToggle.Size = UDim2.fromOffset(24, 24)
			DataTableToggle.Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(27, 12)
			DataTableToggle.ImageColor3 = ThisTheme.DataTable
			DataTableToggle.ImageTransparency = 0.8
			DataTableToggle.Parent = DataTableBar

			local DataTableButton = Objects:New("Round")
			DataTableButton.Name = "Drop"
			DataTableButton.Image = "http://www.roblox.com/asset/?id=5574299686"
			DataTableButton.ScaleType = Enum.ScaleType.Stretch
			DataTableButton.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
			DataTableButton.Position = UDim2.fromOffset(2, 2)
			DataTableButton.ImageColor3 = ThisTheme.DataTable
			DataTableButton.ImageTransparency = 1
			DataTableButton.Parent = DataTableToggle

			TweenService:Create(DataTableBar, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(DataTableTitle, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(DataTableToggle, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(DataTableButton, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

			local DataTableContent = Objects:New("Frame")
			DataTableContent.Name = "Content"
			DataTableContent.Size = UDim2.fromScale(1, 0)
			DataTableContent.Position = UDim2.fromOffset(0, 35)
			DataTableContent.ClipsDescendants = true
			DataTableContent.Parent = DataTable

			local DataTableList = Objects:New("UIListLayout")
			DataTableList.SortOrder = Enum.SortOrder.LayoutOrder
			DataTableList.Padding = UDim.new(0, 5)
			DataTableList.Parent = DataTableContent

			local DataPadding = Objects:New("UIPadding")
			DataPadding.PaddingBottom = UDim.new(0, 5)
			DataPadding.PaddingTop = UDim.new(0, 5)
			DataPadding.PaddingRight= UDim.new(0, 5)
			DataPadding.PaddingLeft = UDim.new(0, 5)
			DataPadding.Parent = DataTableContent

			local DropToggle = false

			DataTableList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if DropToggle then
					DataTableContent.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DataTableList.AbsoluteContentSize.Y)
					Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, DataTableList.AbsoluteContentSize.Y)
				end
			end)

			DataTableTitle.MouseButton1Down:Connect(function()
				if not DataTable_Opt.ReadOnly then
					DropToggle = not DropToggle

					TweenService:Create(DataTableButton, TweenInfo.new(0.15), {Rotation = DropToggle and 135 or 0}):Play()
					TweenService:Create(DataTableContent, TweenInfo.new(0.15), {Size = DropToggle and Size or UDim2.fromScale(1, 0)}):Play()
					TweenService:Create(DataTable, TweenInfo.new(0.15), {Size = DropToggle and (Size + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
				end
			end)

			local Build = {}

			for _,Value in pairs(Keys) do
				if typeof(DataTable_Opt.Options[Value]) == "table" then
					Build[Value] = DataTable_Opt.Options[Value].Enabled
				else
					Build[Value] = DataTable_Opt.Options[Value]
				end
			end

			TweenService:Create(DataTable, TweenInfo.new(0.5), {BackgroundTransparency = 0.9}):Play()
			TweenService:Create(DataShadow, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()

			for _,Value in ipairs(Keys) do
				local DataItem = Objects:New("SmoothButton")
				DataItem.Name = "DataItem"
				DataItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
				DataItem.ImageColor3 = (Build[Value] and ThisTheme.DataTable) or ThisTheme.DataTableAccent
				DataItem.ImageTransparency = 1
				DataItem.Parent = DataTableContent
				DataItem:SetAttribute("Key", Value)

				local DataTracker = Objects:New("Round")
				DataTracker.Name = "Tracker"
				DataTracker.Size = UDim2.fromOffset(24, 24)
				DataTracker.Position = UDim2.fromScale(0, 0.5) + UDim2.fromOffset(3, -12)
				DataTracker.ImageColor3 = ThisTheme.DataTable
				DataTracker.ImageTransparency = 1
				DataTracker.Parent = DataItem

				local Tick = Objects:New("Round")
				Tick.Name = "Tick"
				Tick.ScaleType = Enum.ScaleType.Stretch
				Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
				Tick.ImageColor3 = ThisTheme.DataTableAccent
				Tick.ImageTransparency = 1
				Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
				Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
				Tick.Position = UDim2.fromOffset(2, 2)
				Tick.Parent = DataTracker

				local DataLabel = Objects:New("Label")
				DataLabel.Name = "Value"
				DataLabel.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0)
				DataLabel.Position = UDim2.fromOffset(30, 0) or UDim2.fromOffset(5, 0)
				DataLabel.Text = Value
				DataLabel.Font = Enum.Font.Gotham
				DataLabel.TextSize = 14
				DataLabel.TextColor3 = ThisTheme.DataTable
				DataLabel.TextTransparency = 1
				DataLabel.Parent = DataItem

				TweenService:Create(DataItem, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0.8 or 0}):Play()
				TweenService:Create(DataTracker, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0 or 0.8}):Play()
				TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0 or 0.7}):Play()
				TweenService:Create(DataLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

				local DataTableMenu

				if typeof(DataTable_Opt.Options[Value]) == "table" then
					local Menu = typeof(DataTable_Opt.Options[Value].Menu) == "table" and DataTable_Options[Value].Menu or {}

					local MenuAdded, MenuButton = TryAddMenu(DataItem, Menu, {})

					if MenuAdded then
						MenuButton.ImageColor3 = ThisTheme.DataTable
					end

					DataTableMenu = MenuButton
				end

				DataItem.MouseButton1Down:Connect(function()
					Build[Value] = not Build[Value]
					local Enabled = Build[Value]

					TweenService:Create(DataItem, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0.8) or 0, ImageColor3 = (Enabled and ThisTheme.DataTable) or ThisTheme.DataTableAccent}):Play()
					TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.7}):Play()
					TweenService:Create(DataTracker, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.8}):Play()

					DataTable_Opt.Callback(Value, Enabled, DataTable_Data)

					ChangedEvent:Fire("State", {Index = Value, State = Enabled})
				end)

				local Connection
				Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
					if not NewInstance.Parent then
						if DataTable_Opt.Disable then
							if Build[Value] then
								Build[Value] = false

								DataTable_Opt.Callback(Value, Build[Value], DataTableLibrary)

								ChangedEvent:Fire("State", {Index = Value, State = false})

								Connection:Disconnect()
							end
						else
							Connection:Disconnect()
						end
					end
				end)
			end

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						DataTable_Opt.Text = CheckType(v, "string", DataTable_Opt.Text)

						if #DataTable_Opt.Text > 0 then
							DataTableTitle.Text = DataTable_Opt.Text

							ChangedEvent:Fire(k, DataTable_Opt.Text)
						end
					elseif k == "TextColor" then
						DataTable_Opt.TextColor = CheckType(v, "Color3", DataTable_Opt.TextColor)

						DataTableTitle.TextColor3 = DataTable_Opt.TextColor

						ChangedEvent:Fire(k, DataTable_Opt.TextColor)
					elseif k == "TextXAlignment" then
						DataTable_Opt.TextXAlignment = CheckType(table.find({"Right", "Left"}, v) and v, "string", DataTable_Opt.TextXAlignment)

						DataTableTitle.TextXAlignment = Enum.TextXAlignment[DataTable_Opt.TextXAlignment]

						ChangedEvent:Fire(k, DataTable_Opt.TextXAlignment)
					elseif k == "Font" then
						DataTable_Opt.Font = CheckType(v, "EnumItem", DataTable_Opt.Font)

						DataTableTitle.Font = DataTable_Opt.Font

						ChangedEvent:Fire(k, DataTable_Opt.Font)
					elseif k == "Visible" then
						DataTable_Opt.Visible = CheckType(v, "boolean", DataTable_Opt.Visible)

						DataTable.Visible = DataTable_Opt.Visible

						ChangedEvent:Fire(k, DataTable_Opt.Visible)
					elseif k == "ReadOnly" then
						DataTable_Opt.ReadOnly = CheckType(v, "boolean", DataTable_Opt.ReadOnly)

						ChangedEvent:Fire(k, DataTable_Opt.ReadOnly)
					elseif k == "Options" then
						DataTable_Opt.Options = CheckType(v, "table", DataTable_Opt.Options)

						Keys = {}
						TotalOptions = 0

						for i in pairs(DataTable_Opt.Options) do
							TotalOptions = TotalOptions + 1
							table.insert(Keys, i)
						end

						table.sort(Keys)

						Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, (TotalOptions * 30) + ((TotalOptions + 1) * 5))

						TweenService:Create(DataTable, TweenInfo.new(0.15), {Size = DropToggle and (Size + UDim2.fromOffset(0, 35)) or (UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30))}):Play()
						
						DataTableContent = Objects:New("Frame")
						DataTableContent.Name = "Content"
						DataTableContent.Size = UDim2.fromScale(1, 0)
						DataTableContent.Position = UDim2.fromOffset(0, 35)
						DataTableContent.ClipsDescendants = true
						DataTableContent.Parent = DataTable

						DataTableList = Objects:New("UIListLayout")
						DataTableList.SortOrder = Enum.SortOrder.LayoutOrder
						DataTableList.Padding = UDim.new(0, 5)
						DataTableList.Parent = DataTableContent

						DataPadding = Objects:New("UIPadding")
						DataPadding.PaddingBottom = UDim.new(0, 5)
						DataPadding.PaddingTop = UDim.new(0, 5)
						DataPadding.PaddingRight= UDim.new(0, 5)
						DataPadding.PaddingLeft = UDim.new(0, 5)
						DataPadding.Parent = DataTableContent

						Build = {}

						for _,Value in pairs(Keys) do
							if typeof(DataTable_Opt.Options[Value]) == "table" then
								Build[Value] = DataTable_Opt.Options[Value].Enabled
							else
								Build[Value] = DataTable_Opt.Options[Value]
							end
						end

						for _,Value in ipairs(Keys) do
							local DataItem = Objects:New("SmoothButton")
							DataItem.Name = "DataItem"
							DataItem.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
							DataItem.ImageColor3 = (Build[Value] and ThisTheme.DataTable) or ThisTheme.DataTableAccent
							DataItem.ImageTransparency = 1
							DataItem.Parent = DataTableContent
							DataItem:SetAttribute("Key", Value)

							local DataTracker = Objects:New("Round")
							DataTracker.Name = "Tracker"
							DataTracker.Size = UDim2.fromOffset(24, 24)
							DataTracker.Position = UDim2.fromScale(0, 0.5) + UDim2.fromOffset(3, -12)
							DataTracker.ImageColor3 = ThisTheme.DataTable
							DataTracker.ImageTransparency = 1
							DataTracker.Parent = DataItem

							local Tick = Objects:New("Round")
							Tick.Name = "Tick"
							Tick.ScaleType = Enum.ScaleType.Stretch
							Tick.Image = "http://www.roblox.com/asset/?id=5554953789"
							Tick.ImageColor3 = ThisTheme.DataTableAccent
							Tick.ImageTransparency = 1
							Tick.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(4, 4)
							Tick.SizeConstraint = Enum.SizeConstraint.RelativeYY
							Tick.Position = UDim2.fromOffset(2, 2)
							Tick.Parent = DataTracker

							local DataLabel = Objects:New("Label")
							DataLabel.Name = "Value"
							DataLabel.Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(30, 0)
							DataLabel.Position = UDim2.fromOffset(30, 0) or UDim2.fromOffset(5, 0)
							DataLabel.Text = Value
							DataLabel.Font = Enum.Font.Gotham
							DataLabel.TextSize = 14
							DataLabel.TextColor3 = ThisTheme.DataTable
							DataLabel.TextTransparency = 1
							DataLabel.Parent = DataItem

							TweenService:Create(DataItem, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0.8 or 0}):Play()
							TweenService:Create(DataTracker, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0 or 0.8}):Play()
							TweenService:Create(Tick, TweenInfo.new(0.5), {ImageTransparency = Build[Value] and 0 or 0.7}):Play()
							TweenService:Create(DataLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

							local DataTableMenu

							if typeof(DataTable_Opt.Options[Value]) == "table" then
								local Menu = typeof(DataTable_Opt.Options[Value].Menu) == "table" and DataTable_Options[Value].Menu or {}

								local MenuAdded, MenuButton = TryAddMenu(DataItem, Menu, {})

								if MenuAdded then
									MenuButton.ImageColor3 = ThisTheme.DataTable
								end

								DataTableMenu = MenuButton
							end

							DataItem.MouseButton1Down:Connect(function()
								Build[Value] = not Build[Value]
								local Enabled = Build[Value]

								TweenService:Create(DataItem, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0.8) or 0, ImageColor3 = (Enabled and ThisTheme.DataTable) or ThisTheme.DataTableAccent}):Play()
								TweenService:Create(Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.7}):Play()
								TweenService:Create(DataTracker, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.8}):Play()

								DataTable_Opt.Callback(Value, Build[Value], DataTable_Data)

								ChangedEvent:Fire("State", {Index = Value, State = Enabled})
							end)

							local Connection
							Connection = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
								if not NewInstance.Parent then
									if DataTable_Opt.Disable then
										if Build[Value] then
											Build[Value] = false

											DataTable_Opt.Callback(Value, Build[Value], DataTableLibrary)

											ChangedEvent:Fire("State", {Index = Value, State = false})

											DataTable_Connection:Disconnect()
										end
									else
										DataTable_Connection:Disconnect()
									end
								end
							end)
						end
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return DataTable_Opt.Text
					elseif k == "TextColor" then
						return DataTable_Opt.TextColor
					elseif k == "TextXAlignment" then
						return DataTable_Opt.TextXAlignment
					elseif k == "Font" then
						return DataTable_Opt.Font
					elseif k == "Visible" then
						return DataTable_Opt.Visible
					elseif k == "ReadOnly" then
						return DataTable_Opt.ReadOnly
					elseif k == "State" then
						return {
							Set = function(Index, State)
								for _,v in pairs(DataTableContent:GetChildren()) do
									if v:GetAttribute("Key") == Index then
										Build[Index] = State
										local Enabled = Build[Index]

										TweenService:Create(v, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0.8) or 0, ImageColor3 = (Enabled and ThisTheme.DataTable) or ThisTheme.DataTableAccent}):Play()
										TweenService:Create(v.Tracker.Tick, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.7}):Play()
										TweenService:Create(v.Tracker, TweenInfo.new(0.15), {ImageTransparency = (Enabled and 0) or 0.8}):Play()

										DataTable_Opt.Callback(Index, Enabled, DataTable_Data)

										ChangedEvent:Fire("State", {Index = Index, State = Enabled})
									end
								end
							end,
							Get = function(Index)
								return Build[Index]
							end
						}
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							DataTable:Destroy()
						end
					end
				end,
				_call = function(Func, ...)
					Func(Func, ...)
				end
			}

			return setmetatable(DataTable_Data, Funcs)
		end

		function Tab_Data:ColorPicker(ColorPicker_Opt)
			ColorPicker_Opt = CheckType(ColorPicker_Opt, "table", {})

			ColorPicker_Opt.Text = CheckType(ColorPicker_Opt.Text, "string", "ColorPicker")
			ColorPicker_Opt.TextColor = CheckType(ColorPicker_Opt.TextColor, "Color3", ThisTheme.ColorPickerAccent)
			ColorPicker_Opt.RichText = CheckType(ColorPicker_Opt.RichText, "boolean", false)
			ColorPicker_Opt.Font = CheckType(ColorPicker_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			ColorPicker_Opt.Visible = CheckType(ColorPicker_Opt.Visible, "boolean", true)
			ColorPicker_Opt.ReadOnly = CheckType(ColorPicker_Opt.ReadOnly, "boolean", false)

			ColorPicker_Opt.Default = CheckType(ColorPicker_Opt.Default, "Color3", Color3.fromRGB(255, 255, 255))
			ColorPicker_Opt.Callback = CheckType(ColorPicker_Opt.Callback, "function", function() end)

			ColorPicker_Opt.Menu = CheckType(ColorPicker_Opt.Menu, "table", {})

			local PickerToggle = false
			local ColorPicker_Data = {}
			local ChangedEvent = CreateChangedEvent()

			local H, S, V = Objects:New("NumberValue"), Objects:New("NumberValue"), Objects:New("NumberValue")
			H.Value, S.Value, V.Value = Color3.toHSV(ColorPicker_Opt.Default)

			local ColorPicker = Objects:New("SmoothButton")
			ColorPicker.Name = "ColorPicker"
			ColorPicker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 40)
			ColorPicker.ImageColor3 = ThisTheme.ColorPicker
			ColorPicker.ImageTransparency = 1
			ColorPicker.ClipsDescendants = true
			ColorPicker.Visible = ColorPicker_Opt.Visible
			ColorPicker.Parent = PageContentFrame

			ColorPicker.MouseButton1Down:Connect(function()
				if not ColorPicker_Opt.ReadOnly then
					PickerToggle = not PickerToggle
					TweenService:Create(ColorPicker, TweenInfo.new(0.15), {Size = UDim2.fromScale(1, 0) + ((PickerToggle and UDim2.fromOffset(0, 115)) or UDim2.fromOffset(0, 40))}):Play()
				end
			end)

			local ColorBar = Objects:New("Round")
			ColorBar.Name = "TitleBar"
			ColorBar.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-10, 30)
			ColorBar.Position = UDim2.fromOffset(5, 5)
			ColorBar.ImageColor3 = ThisTheme.ColorPickerAccent
			ColorBar.ImageTransparency = 1
			ColorBar.Parent = ColorPicker

			local ColorShadow = Objects:New("Shadow")
			ColorShadow.ImageColor3 = ThisTheme.ColorPickerAccent
			ColorShadow.ImageTransparency = 1
			ColorShadow.Parent = ColorBar

			local ColorLabel = Objects:New("Label")
			ColorLabel.Name = "Title"
			ColorLabel.Font = ColorPicker_Opt.Font
			ColorLabel.TextColor3 = ColorPicker_Opt.TextColor
			ColorLabel.TextSize = 14
			ColorLabel.RichText = ColorPicker_Opt.RichText
			ColorLabel.Text = ColorPicker_Opt.Text
			ColorLabel.TextTransparency = 1
			ColorLabel.Parent = ColorBar

			local ColorTracker = Objects:New("Round")
			ColorTracker.Name = "Tracker"
			ColorTracker.Size = UDim2.fromOffset(50, 20)
			ColorTracker.Position = UDim2.fromScale(1, 0) + UDim2.fromOffset(-55, 5)
			ColorTracker.ImageColor3 = ColorPicker_Opt.Default
			ColorTracker.ImageTransparency = 1
			ColorTracker.Parent = ColorBar

			local TrackerShadow = Objects:New("Shadow")
			TrackerShadow.ImageColor3 = ColorTracker.ImageColor3
			TrackerShadow.ImageTransparency = 1
			TrackerShadow.Parent = ColorTracker

			ColorTracker:GetPropertyChangedSignal("ImageColor3"):Connect(function()
				TrackerShadow.ImageColor3 = ColorTracker.ImageColor3
			end)

			local Hue = Objects:New("Round")
			Hue.Name = "Container"
			Hue.Position = UDim2.fromOffset(5, 40)
			Hue.Size = UDim2.fromOffset(25, 20)
			Hue.ImageColor3 = ThisTheme.ColorPickerAccent
			Hue.ImageTransparency = 0.8
			Hue.Parent = ColorPicker

			local Saturation = Hue:Clone()
			Saturation.Position = Saturation.Position + UDim2.fromOffset(0, 25)
			Saturation.Parent = ColorPicker

			local Value = Saturation:Clone()
			Value.Position = Value.Position + UDim2.fromOffset(0, 25)
			Value.Parent = ColorPicker

			local HueLabel = Objects:New("Label")
			HueLabel.Name = "Label"
			HueLabel.TextXAlignment = Enum.TextXAlignment.Center
			HueLabel.Position = UDim2.fromScale(0, 0)
			HueLabel.Size = UDim2.fromScale(1, 1)
			HueLabel.Text = "H"
			HueLabel.TextColor3 = ThisTheme.ColorPickerAccent
			HueLabel.TextSize = 12
			HueLabel.Font = Enum.Font.GothamBold
			HueLabel.TextTransparency = 1
			HueLabel.Parent = Hue

			local SaturationLabel = HueLabel:Clone()
			SaturationLabel.Text = "S"
			SaturationLabel.Parent = Saturation

			local ValueLabel = HueLabel:Clone()
			ValueLabel.Text = "V"
			ValueLabel.Parent = Value

			local function CSK(Time, Color)
				return ColorSequenceKeypoint.new(Time, Color)
			end

			local RainbowGradient = Objects:New("UIGradient")
			RainbowGradient.Color = ColorSequence.new({
				CSK(0, Color3.fromRGB(255, 0, 0)),
				CSK(0.157, Color3.fromRGB(255, 0, 255)),
				CSK(0.323, Color3.fromRGB(0, 0, 255)),
				CSK(0.488, Color3.fromRGB(0, 255, 255)),
				CSK(0.66, Color3.fromRGB(0, 255, 0)),
				CSK(0.817, Color3.fromRGB(255, 255, 0)),
				CSK(1, Color3.fromRGB(255, 0, 0))
			})

			local BlackWhiteGradient = Objects:New("UIGradient")
			BlackWhiteGradient.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(0, 0, 0))

			local SaturationGradient = Objects:New("UIGradient")
			SaturationGradient.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.new(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

			local HueTracker = Objects:New("SmoothButton")
			HueTracker.Name = "Tracker"
			HueTracker.ImageColor3 = Color3.fromRGB(255, 255, 255)
			HueTracker.ImageTransparency = 1
			HueTracker.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(-40, 20)
			HueTracker.Position = UDim2.fromOffset(35, 40)
			HueTracker.Parent = ColorPicker

			local SaturationTracker = HueTracker:Clone()
			SaturationTracker.Position += UDim2.fromOffset(0, 25)
			SaturationTracker.Parent = ColorPicker

			local ValueTracker = SaturationTracker:Clone()
			ValueTracker.Position += UDim2.fromOffset(0, 25)
			ValueTracker.Parent = ColorPicker

			local HueShadow = Objects:New("Shadow")
			HueShadow.ImageColor3 = Color3.fromRGB(255, 255, 255)
			HueShadow.ImageTransparency = 1
			HueShadow.Parent = HueTracker

			local SaturationShadow = HueShadow:Clone()
			SaturationShadow.Parent = SaturationTracker

			local ValueShadow = HueShadow:Clone()
			ValueShadow.Parent = ValueTracker

			local HueGrad = RainbowGradient:Clone()
			HueGrad.Parent = HueTracker

			local HueShadowGrad = RainbowGradient:Clone()
			HueShadowGrad.Parent = HueShadow

			local ValueGrad = BlackWhiteGradient:Clone()
			ValueGrad.Parent = ValueTracker

			local ValueShadowGrad = BlackWhiteGradient:Clone()
			ValueShadowGrad.Parent = ValueShadow

			local SaturationGrad = SaturationGradient:Clone()
			SaturationGrad.Parent = SaturationTracker

			local SaturationShadowGrad = SaturationGradient:Clone()
			SaturationShadowGrad.Parent = SaturationShadow

			TweenService:Create(ColorPicker, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ColorBar, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(ColorShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(ColorLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(HueLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(SaturationLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(ValueLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(ColorTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(TrackerShadow, TweenInfo.new(0.5), {ImageTransparency = 0.2}):Play()
			TweenService:Create(HueTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(ValueTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(SaturationTracker, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(HueShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(SaturationShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
			TweenService:Create(ValueShadow, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()

			H:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value, S.Value, V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new( Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				if not ColorPicker_Opt.ReadOnly then
					ColorPicker_Opt.Callback(Color3.fromHSV(H.Value, S.Value, V.Value), ColorPicker_Data)

					ChangedEvent:Fire("Color", Color3.fromHSV(H.Value, S.Value, V.Value))
				end
			end)

			S:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value, S.Value, V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				if not ColorPicker_Opt.ReadOnly then
					ColorPicker_Opt.Callback(Color3.fromHSV(H.Value, S.Value, V.Value), ColorPicker_Data)

					ChangedEvent:Fire("Color", Color3.fromHSV(H.Value, S.Value, V.Value))
				end
			end)

			V:GetPropertyChangedSignal("Value"):Connect(function()
				ColorTracker.ImageColor3 = Color3.fromHSV(H.Value,S.Value,V.Value)

				SaturationGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))
				SaturationShadowGrad.Color = ColorSequence.new(Color3.fromHSV(H.Value, 1, V.Value), Color3.fromRGB(0, 0, 0):Lerp(Color3.fromRGB(255, 255, 255), V.Value))

				if not ColorPicker_Opt.ReadOnly then
					ColorPicker_Opt.Callback(Color3.fromHSV(H.Value, S.Value, V.Value), ColorPicker_Data)

					ChangedEvent:Fire("Color", Color3.fromHSV(H.Value, S.Value, V.Value))
				end
			end)

			HueTracker.MouseButton1Down:Connect(function()
				H.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					H.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			ValueTracker.MouseButton1Down:Connect(function()
				V.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					V.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			SaturationTracker.MouseButton1Down:Connect(function()
				S.Value = 1 - GetXY(HueTracker)

				local MouseMove, MouseKill

				MouseMove = Mouse.Move:Connect(function()
					S.Value = 1 - GetXY(HueTracker)
				end)

				MouseKill = UserInputService.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						MouseMove:Disconnect()
						MouseKill:Disconnect()
					end
				end)
			end)

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						ColorPicker_Opt.Text = CheckType(v, "string", ColorPicker_Opt.Text)

						if #ColorPicker_Opt.Text > 0 then
							ColorLabel.Text = ColorPicker_Opt.Text

							ChangedEvent:Fire(k, ColorPicker_Opt.Text)
						end
					elseif k == "TextColor" then
						ColorPicker_Opt.TextColor = CheckType(v, "Color3", ColorPicker_Opt.TextColor)

						ColorLabel.TextColor3 = ColorPicker_Opt.TextColor

						ChangedEvent:Fire(k, ColorPicker_Opt.TextColor)
					elseif k == "RichText" then
						ColorPicker_Opt.RichText = CheckType(v, "boolean", ColorPicker_Opt.RichText)

						ColorLabel.RichText = ColorPicker_Opt.RichText

						ChangedEvent:Fire(k, ColorPicker_Opt.RichText)
					elseif k == "Font" then
						ColorPicker_Opt.Font = CheckType(v, "EnumItem", ColorPicker_Opt.Font)

						ColorLabel.Font = ColorPicker_Opt.Font

						ChangedEvent:Fire(k, ColorPicker_Opt.Font)
					elseif k == "Visible" then
						ColorPicker_Opt.Visible = CheckType(v, "boolean", ColorPicker_Opt.Visible)

						ColorPicker.Visible = ColorPicker_Opt.Visible

						ChangedEvent:Fire(k, ColorPicker_Opt.Visible)
					elseif k == "ReadOnly" then
						ColorPicker_Opt.ReadOnly = CheckType(v, "boolean", ColorPicker_Opt.ReadOnly)

						ChangedEvent:Fire(k, ColorPicker_Opt.ReadOnly)
					elseif k == "Color" then
						if not ColorPicker_Opt.ReadOnly then
							v = CheckType(v, "Color3", Color3.fromHSV(H.Value, S.Value, V.Value))

							H.Value, S.Value, V.Value = Color3.toHSV(v)

							ChangedEvent:Fire(k, Color3.toHSV(v))
						end
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return ColorPicker_Opt.Text
					elseif k == "TextColor" then
						return ColorPicker_Opt.TextColor
					elseif k == "RichText" then
						return ColorPicker_Opt.RichText
					elseif k == "Font" then
						return ColorPicker_Opt.Font
					elseif k == "Visible" then
						return ColorPicker_Opt.Visible
					elseif k == "ReadOnly" then
						return ColorPicker_Opt.ReadOnly
					elseif k == "Color" then
						return ColorTracker.ImageColor3
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							ColorPicker:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuButton = TryAddMenu(ColorLabel, ColorPicker_Opt.Menu, setmetatable({}, Funcs))

			if MenuAdded then
				ColorTracker.Position -= UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.ColorPickerAccent
			end

			return setmetatable(ColorPicker_Data, Funcs)
		end

		function Tab_Data:Bind(Bind_Opt)
			Bind_Opt = CheckType(Bind_Opt, "table", {})

			Bind_Opt.Text = CheckType(Bind_Opt.Text, "string", "Bind")
			Bind_Opt.TextColor = CheckType(Bind_Opt.TextColor, "Color3", ThisTheme.ButtonAccent)
			Bind_Opt.RichText = CheckType(Bind_Opt.RichText, "boolean", false)
			Bind_Opt.Font = CheckType(Bind_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			Bind_Opt.Visible = CheckType(Bind_Opt.Visible, "boolean", true)
			Bind_Opt.ReadOnly = CheckType(Bind_Opt.ReadOnly, "boolean", false)

			Bind_Opt.Enabled = CheckType(Bind_Opt.Enabled, "boolean", false)
			Bind_Opt.Notify = CheckType(Bind_Opt.Notify, "boolean", false)
			Bind_Opt.Bind = CheckType(Bind_Opt.Bind, "EnumItem", Enum.KeyCode.G)
			Bind_Opt.Callback = CheckType(Bind_Opt.Callback, "function", function() end)

			Bind_Opt.Menu = CheckType(Bind_Opt.Menu, "table", {})

			local Blacklist = {
				Enum.KeyCode.A,
				Enum.KeyCode.W,
				Enum.KeyCode.D,
				Enum.KeyCode.S,
				Enum.KeyCode.Space,
				Enum.KeyCode.Escape,
				Enum.KeyCode.F9,
				Enum.KeyCode.Backquote,
				Enum.KeyCode.Tab,
				Enum.KeyCode.Backspace,
				Enum.KeyCode.CapsLock,
				Enum.KeyCode.Insert,
				Enum.KeyCode.Up,
				Enum.KeyCode.Down,
				Enum.KeyCode.Left,
				Enum.KeyCode.Right,
				Enum.KeyCode.F12,
				Enum.KeyCode.Print
			}

			local Shortkeys = {
				RightControl = "RightCtrl",
				LeftControl = "LeftCtrl",
				LeftShift = "LShift",
				RightShift = "RShift",
				MouseButton1 = "Mouse1",
				MouseButton2 = "Mouse2"
			}

			local Bind_Data = {}
			local KeyCode =  Bind_Opt.Bind.Name
			local ChangedEvent = CreateChangedEvent()

			local BindContainer = Objects:New("SmoothButton")
			BindContainer.Name = "Bind"
			BindContainer.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			BindContainer.ImageColor3 = ThisTheme.Button
			BindContainer.ClipsDescendants = true
			BindContainer.ImageTransparency = 1
			BindContainer.Visible = Bind_Opt.Visible
			BindContainer.Parent = PageContentFrame

			local BindShadow = Objects:New("Shadow")
			BindShadow.ImageColor3 = ThisTheme.ButtonAccent
			BindShadow.ImageTransparency = 1
			BindShadow.Parent = BindContainer

			local BindLabel = Objects:New("Label")
			BindLabel.Name = "Title"
			BindLabel.Font = Bind_Opt.Font
			BindLabel.TextColor3 = Bind_Opt.TextColor
			BindLabel.TextSize = 14
			BindLabel.Text = Bind_Opt.Text
            BindLabel.RichText = Bind_Opt.RichText
			BindLabel.TextTransparency = 1
			BindLabel.Parent = BindContainer

			local BindButton = Objects:New("Label")
			BindButton.Name = "BindButton"
			BindButton.Font = Enum.Font.GothamSemibold
			BindButton.Text = Shortkeys[KeyCode] or KeyCode
			BindButton.Size = UDim2.new(0.332, -5, 1, 0)
			BindButton.Position = UDim2.fromScale(0.649, 0)
			BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindButton.TextSize = 12
			BindButton.TextTruncate = Enum.TextTruncate.AtEnd
			BindButton.TextXAlignment = Enum.TextXAlignment.Right
			BindButton.TextYAlignment = Enum.TextYAlignment.Center
			BindButton.Parent = BindContainer

			TweenService:Create(BindContainer, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(BindShadow, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
			TweenService:Create(BindLabel, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			TweenService:Create(BindButton, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

			BindContainer.MouseButton1Click:Connect(function()
				if not Bind_Opt.ReadOnly then
					BindButton.Text = "···"

					local Input, GameProcessed = UserInputService.InputBegan:Wait()

					if Input.KeyCode.Name == "Unknown" then
						KeyCode = nil
						BindButton.Text = "None"
					elseif table.find(Blacklist, Input.KeyCode) then
						KeyCode = Bind_Opt.Bind.Name
						BindButton.Text = Bind_Opt.Bind.Name
						Material.Notification({
							Description = ("[%s] is a blacklisted key, please use another one."):format(Input.KeyCode.Name),
							Duration = 2
						})
					else
						KeyCode = Input.KeyCode.Name
						BindButton.Text = Shortkeys[Input.KeyCode.Name] or Input.KeyCode.Name

						ChangedEvent:Fire("Bind", KeyCode)
					end
				end
			end)

			local Connection
			Connection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
				if Input.KeyCode.Name == KeyCode and not GameProcessed then
					if NewInstance.Parent then
						if not Bind_Opt.ReadOnly then
							Bind_Opt.Enabled = not Bind_Opt.Enabled

							if Bind_Opt.Notify then
								Material.Notification({
									Title = ("%s - [%s]"):format(BindLabel.Text, Bind_Opt.Enabled and "Enabled" or "Disabled"),
									Duration = 2
								})
							end

							Bind_Opt.Callback(Bind_Opt.Enabled, BindLibrary)

							ChangedEvent:Fire("State", Bind_Opt.Enabled)
						end
					else
						Connection:Disconnect()
					end
				end
			end)

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Text" then
						Bind_Opt.Text = CheckType(v, "string", Bind_Opt.Text)

						if #Bind_Opt.Text > 0 then
							BindLabel.Text = Bind_Opt.Text

							ChangedEvent:Fire(k, Bind_Opt.Text)
						end
					elseif k == "TextColor" then
						Bind_Opt.TextColor = CheckType(v, "Color3", Bind_Opt.TextColor)
						
						BindLabel.TextColor3 = Bind_Opt.TextColor

						ChangedEvent:Fire(k, Bind_Opt.TextColor)
					elseif k == "RichText" then
						Bind_Opt.RichText = CheckType(v, "boolean", Bind_Opt.RichText)
						
						BindLabel.RichText = Bind_Opt.RichText

						ChangedEvent:Fire(k, Bind_Opt.RichText)
					elseif k == "Font" then
						Bind_Opt.Font = CheckType(v, "EnumItem", Bind_Opt.Font)
						
						BindLabel.Font = Bind_Opt.Font

						ChangedEvent:Fire(k, Bind_Opt.Font)
					elseif k == "Visible" then
						Bind_Opt.Visible = CheckType(v, "boolean", Bind_Opt.Visible)

						BindContainer.Visible = Bind_Opt.Visible

						ChangedEvent:Fire(k, Bind_Opt.Visible)
					elseif k == "ReadOnly" then
						Bind_Opt.ReadOnly = CheckType(v, "boolean", Bind_Opt.ReadOnly)

						ChangedEvent:Fire(k, Bind_Opt.ReadOnly)
					elseif k == "State" then
						Bind_Opt.Enabled = CheckType(v, "boolean", Bind_Opt.Enabled)

						if Bind_Opt.Notify then
							Material.Notification({
								Title = ("%s - [%s]"):format(BindLabel.Text, Bind_Opt.Enabled and "Enabled" or "Disabled"),
								Duration = 2
							})
						end

						Bind_Opt.Callback(Bind_Opt.Enabled, Bind_Data)

						ChangedEvent:Fire(k, Bind_Opt.Enabled)
					elseif k == "Notify" then
						Bind_Opt.Notify = CheckType(v, "boolean", Bind_Opt.Notify)

						ChangedEvent:Fire(k, Bind_Opt.Notify)
					elseif k == "Bind" then
						KeyCode = CheckType(v, "EnumItem", Enum.KeyCode[KeyCode]).Name

						if IsKeyCode(KeyCode) and not Bind_Opt.ReadOnly then
							BindButton.Text = Shortkeys[KeyCode] or KeyCode

							ChangedEvent:Fire(k, KeyCode)
						end
					end
				end,
				__index = function(t, k)
					if k == "Text" then
						return BindLabel.ContentText
					elseif k == "TextColor" then
						return Bind_Opt.TextColor
					elseif k == "RichText" then
						return Bind_Opt.RichText
					elseif k == "Font" then
						return Bind_Opt.Font
					elseif k == "Visible" then
						return Bind_Opt.Visible
					elseif k == "ReadOnly" then
						return Bind_Opt.ReadOnly
					elseif k == "State" then
						return Bind_Opt.Enabled			
					elseif k == "Notify" then
						return Bind_Opt.Notify
					elseif k == "Bind" then
						return Enum.KeyCode[KeyCode]
					elseif k == "Changed" then
						return ChangedEvent
					elseif k == "Destroy" then
						return function()
							BindContainer:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuButton = TryAddMenu(BindContainer, Bind_Opt.Menu, setmetatable({}, Funcs))

			if MenuAdded then
				BindButton.Position -= UDim2.fromOffset(25, 0)
				MenuButton.ImageColor3 = ThisTheme.ColorPickerAccent
			end

			return setmetatable(Bind_Data, Funcs)
		end

		function Tab_Data:TextField(TextField_Opt)
			TextField_Opt = CheckType(TextField_Opt, "table", {})

			TextField_Opt.Title = CheckType(TextField_Opt.Text, "string", "TextField")
			TextField_Opt.TextColor = CheckType(TextField_Opt.TextColor, "table", {})
			TextField_Opt.TextColor.Title = CheckType(TextField_Opt.TextColor.Title, "Color3", ThisTheme.TextFieldAccent)
			TextField_Opt.TextColor.Text = CheckType(TextField_Opt.TextColor.Text, "Color3", ThisTheme.TextFieldAccent)
			TextField_Opt.Font = CheckType(TextField_Opt.Font, "EnumItem", Enum.Font.GothamSemibold)
			TextField_Opt.Visible = CheckType(TextField_Opt.Visible, "boolean", true)
			TextField_Opt.ReadOnly = CheckType(TextField_Opt.ReadOnly, "boolean", false)

			TextField_Opt.Default = CheckType(TextField_Opt.Default, "string", "")
			TextField_Opt.Type = CheckType(table.find({"string", "number"}, TextField_Opt.Type), "string", "string")
			TextField_Opt.Clear = CheckType(TextField_Opt.Clear, "boolean", true)
			TextField_Opt.Callback = CheckType(TextField_Opt.Callback, "function", function() end)

			TextField_Opt.Menu = CheckType(TextField_Opt.Menu, "table", {})

			local TextField_Data = {}

			local ChangedEvent = CreateChangedEvent()

			local TextField = Objects:New("Round")
			TextField.Name = "TextField"
			TextField.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 30)
			TextField.ImageColor3 = ThisTheme.TextField
			TextField.ImageTransparency = 1
			TextField.Visible = TextField_Opt.Visible
			TextField.Parent = PageContentFrame

			local TextEffect = Objects:New("Frame")
			TextEffect.Name = "Effect"
			TextEffect.BackgroundTransparency = 1
			TextEffect.BackgroundColor3 = ThisTheme.TextField
			TextEffect.Size = UDim2.fromScale(1, 0) + UDim2.fromOffset(0, 2)
			TextEffect.Position = UDim2.fromScale(0, 1) - UDim2.fromOffset(0, 2)
			TextEffect.Parent = TextField

			local TextShadow = Objects:New("Shadow")
			TextShadow.ImageColor3 = ThisTheme.TextField
			TextShadow.ImageTransparency = 1
			TextShadow.Parent = TextField

			local TextInput = Objects:New("Box")
			TextInput.Name = "Value"
			TextInput.PlaceholderText = TextField_Opt.Text
			TextInput.PlaceholderColor3 = TextField_Opt.TextColor.Title
			TextInput.TextColor3 = TextField_Opt.TextColor.Text
			TextInput.Text = TextField_Opt.Default
			TextInput.Font = TextField_Opt.Font
			TextInput.TextSize = 14
			TextInput.TextTransparency = 1
			TextInput.TextTruncate = Enum.TextTruncate.AtEnd
			TextInput.Parent = TextField

			TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
			TweenService:Create(TextEffect, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
			TweenService:Create(TextShadow, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
			TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()

			TextInput:GetPropertyChangedSignal("Text"):Connect(function()
				if TextField_Opt.Type == "number" and not tonumber(TextInput.Text) and TextInput.Text:sub(1, #TextInput.Text) ~= "-" then
					TextInput.Text = ""
				end
			end)

			TextInput.Focused:Connect(function()
				TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.7}):Play()
				TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
			end)

			TextInput.FocusLost:Connect(function(EnterPressed)
				if EnterPressed then
					TweenService:Create(TextField, TweenInfo.new(0.5), {ImageTransparency = 0.8}):Play()
					TweenService:Create(TextInput, TweenInfo.new(0.5), {TextTransparency = 0.5}):Play()

					if TextInput.Text ~= "" and not TextField_Opt.ReadOnly then
						if TextField_Opt.Type == "number" then
							TextField_Opt.Callback(tonumber(TextInput.Text), TextField_Data)
						elseif TextField_Opt.Type == "string" then
							TextField_Opt.Callback(TextInput.Text, TextField_Data)
						end

						ChangedEvent:Fire("Text", TextInput.Text)

						if TextField_Opt.Clear then
							TextInput.Text = ""
						end
					end
				end
			end)

			local Funcs = {
				__newindex = function(t, k, v)
					if k == "Title" then
						v = CheckType(v, "string", TextInput.PlaceholderText)

						if #v > 0 then
							TextInput.PlaceholderText = v

							ChangedEvent:Fire(k, TextInput.PlaceholderText)
						end
					elseif k == "Text" then
						TextField_Opt.Text = CheckType(v, TextField_Opt.Type, TextField_Opt.Text)

						if #TextField_Opt.Text > 0 and not TextField_Opt.ReadOnly then
							if TextField_Opt.Type == "string" then
								TextInput.Text = TextField_Opt.Text

								TextField_Opt.Callback(TextInput.Text, TextField_Data)
							elseif TextField_Opt.Type == "number" then
								TextInput.Text = TextField_Opt.Text

								TextField_Opt.Callback(TextInput.Text, TextField_Data)
							end

							if TextField_Opt.Clear then
								TextInput.Text = ""
							end

							ChangedEvent:Fire(k, TextField_Opt.Text)
						end
					elseif k == "TextColor" then
						TextField_Opt.TextColor = CheckType(v, "table", TextField_Opt.TextColor)
						TextField_Opt.TextColor.Title = CheckType(TextField_Opt.TextColor.Title, "Color3", TextField_Opt.TextColor.Title)
						TextField_Opt.TextColor.Text = CheckType(TextField_Opt.TextColor.Text, "Color3", TextField_Opt.TextColor.Text)

						TextInput.TextColor3 = TextField_Opt.TextColor.Text
						TextInput.PlaceholderColor3 = TextField_Opt.TextColor.Title

						ChangedEvent:Fire(k, {Title = TextField_Opt.TextColor.Title, Text = TextField_Opt.TextColor.Text})
					elseif k == "Font" then
						TextField_Opt.Font = CheckType(v, "EnumItem", TextField_Opt.Font)

						TextInput.Font = TextField_Opt.Font

						ChangedEvent:Fire("Font", TextField_Opt.Font)
					elseif k == "Visible" then
						TextField_Opt.Visible = CheckType(v, "boolean", TextField_Opt.Visible)

						TextField.Visible = TextField_Opt.Visible

						ChangedEvent:Fire("Visible", TextField_Opt.Visible)
					elseif k == "ReadOnly" then
						TextField_Opt.ReadOnly = CheckType(v, "boolean", TextField_Opt.ReadOnly)

						ChangedEvent:Fire("ReadOnly", TextField_Opt.ReadOnly)
					elseif k == "Type" then
						TextField_Opt.Type = CheckType(table.find({"string", "number"}, v), "string", TextField_Opt.Type)

						ChangedEvent:Fire("Type", TextField_Opt.Type)
					elseif k == "Clear" then
						TextField_Opt.Clear = CheckType(v, "boolean", TextField_Opt.Clear)

						ChangedEvent:Fire("Clear", TextField_Opt.Clear)
					end
				end,
				__index = function(t, k)
					if k == "Title" then
						return TextInput.PlaceholderText
					elseif k == "Text" then
						return TextField_Opt.Text
					elseif k == "TextColor" then
						return TextField_Opt.TextColor
					elseif k == "Font" then
						return TextField_Opt.Font
					elseif k == "Visible" then
						return TextField_Opt.Visible
					elseif k == "ReadOnly" then
						return TextField_Opt.ReadOnly
					elseif k == "Type" then
						return TextField_Opt.Type
					elseif k == "Clear" then
						return TextField_Opt.Clear				
					elseif k == "Players" then
						return function(Input)
							Input = CheckType(Input, "string", nil)

							if Input then
								local Found = {}
								local Method = Input:lower()

								if Method == "me" then
									table.insert(Found, Players.LocalPlayer.Name)
								elseif Method == "random" then
									table.insert(Found, Players:GetPlayers()[math.random(1, #Players:GetPlayers())])
								end

								for _,v in pairs(Players:GetPlayers()) do
									if Method == "others" then
										if v ~= Players.LocalPlayer then
											table.insert(Found, v)
										end
									elseif Method == "all" then
										table.insert(Found, v)
									elseif Method == "nonfriends" then
										if not v:GetFriendStatus(Players.LocalPlayer) == Enum.FriendStatus.NotFriend and v ~= Players.LocalPlayer then
											table.insert(Found, v)
										end
									elseif Method == "friends" then
										if v:GetFriendStatus(Players.LocalPlayer) == Enum.FriendStatus.NotFriend then
											table.insert(Found, v)
										end
									elseif Method == "enemies" then
										if v.Team ~= Players.LocalPlayer.Team then
											table.insert(Found, v)
										end
									elseif Method == "allies" then
										if v.Team == Players.LocalPlayer.Team then
											table.insert(Found, v)
										end
									else
										if v.Name:lower():sub(1, #Input) == Input:lower() or v.DisplayName:lower():sub(1, #Input) == Input:lower() then
											table.insert(Found, v)
										end
									end
								end

								if table.maxn(Found) > 0 then
									return Found
								end

								return nil
							end
						end
					elseif k == "Changed" then
						return Chan
					elseif k == "Destroy" then
						return function()
							return TextField:Destroy()
						end
					end
				end,
				__call = function(Func, ...)
					Func(Func, ...)
				end
			}

			local MenuAdded, MenuBar = TryAddMenu(TextField, TextField_Opt.Menu, setmetatable({}, Funcs))

			if MenuAdded then
				MenuBar.ImageColor3 = ThisTheme.TextFieldAccent
			end

			return setmetatable(TextField_Data, Funcs)
		end

		function Tab_Data:Settings(Settings_Opt)
			Settings_Opt = CheckType(Settings_Opt, "table", {})

			Settings_Opt.Rejoin = CheckType(Settings_Opt.Rejoin, "boolean", false)
			Settings_Opt.Options = CheckType(Settings_Opt.Options, "boolean", false)


			local ToggleUI, Theme

			if not Load_Opt.Minimize then
				ToggleUI = self:Bind({
					Text = "Toggle UI",
					Bind = IsKeyCode(Setting.Keybind),
					Callback = function(State)
						TweenService:Create(MainFrame, TweenInfo.new(1, Enum.EasingStyle.Linear), {Position = State and Position(Load_Position, MainFrame).Hide or Position(Load_Position, MainFrame).Position}):Play()
					end
				})
			else
				self:Button({
					Text = "Destroy UI",
					Callback = function()
						TweenService:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.fromOffset(Load_SizeX, 0)}):Play()
						MainFrame.ClipsDescendants = true
						task.wait(1)
						NewInstance:Destroy()
					end
				})
			end

			if Settings_Opt.Rejoin then
				self:Separator()

				self:Button({
					Text = "Rejoin",
					Callback = function()
						if RobloxReplicatedStorage.GetServerType:InvokeServer() == "StandardServer" then
                            if table.maxn(Players:GetPlayers()) <= 1 then
                                Players.LocalPlayer:Kick("\nRejoining...")
                                TeleportService:Teleport(game.PlaceId)
                            else
                                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
                            end
                        else
                            TabLibrary:Banner({
                                Title = ("Can't rejoin, your current server type is %s"):format(RobloxReplicatedStorage.GetServerType:InvokeServer()),
                                Duration = 5
                            })
                        end
					end
				})
			end

			if Settings_Opt.Options then
				self:ChipSet({
					Callback = function(Selected, State)
						if Selected == "Performace Stats" then
							UserSettings().GameSettings.PerformanceStatsVisible = State
						elseif Selected == "Micro Profiler" then
							UserSettings().GameSettings.OnScreenProfilerEnabled = State
						elseif Selected == "Console" then
							StarterGui:SetCore("DevConsoleVisible", State)
						end
					end,
					Options = {
						["Console"] = false,
						["Micro Profiler"] = false,
						["Performace Stats"] = false
					}
				})
			end

			Load_Opt.Menu["Restore Settings"] = function()
				TabLibrary:Banner({
					Text = "Do you want to restore your settings?",
					Button = "Cancel",
					Options = {
						Restore = function()
							Setting = Default

							writefile(("%s.json"):format(File), HttpService:JSONEncode(Setting))

							if ToggleUI then
								ToggleUI.Bind = IsKeyCode(Setting.Keybind)
							end

							if Theme then
								Theme.Option = Setting.Theme
							end

							Self.Text = "Configuration restored!"
							task.wait(0.15)
							Self:Close()
						end
					}
				})
			end

			local MenuAdded, MenuButton = TryAddMenu(TitleBar, Load_Opt.Menu, {})

			if MenuAdded then
				MenuButton.Position = MenuButton.Position - UDim2.fromOffset(31, 0)
			end

			local Connection1
			Connection1 = Players.LocalPlayer.Destroying:Connect(function()
				if ToggleUI then
					Setting.Keybind = ToggleUI.Bind.Name
				end

				if Theme then
					Setting.Theme = Theme.Option
				end

				writefile(("%s.json"):format(File), HttpService:JSONEncode(Setting))

				Connection1:Disconnect()
			end)

			local Connection2
			Connection2 = NewInstance:GetPropertyChangedSignal("Parent"):Connect(function()
				if not NewInstance.Parent then
					if ToggleUI then
						Setting.Keybind = ToggleUI.Bind.Name
					end

					if Theme then
						Setting.Theme = Theme.Option
					end

					writefile(("%s.json"):format(File), HttpService:JSONEncode(Setting))

					Connection2:Disconnect()
				end
			end)
		end

		return setmetatable(Tab_Data, {
			__newindex = function(t, k, v)
				if k == "Title" then
					Tab_Opt.Title = CheckType(v, "string", Tab_Opt.Title)

					Button.Text = Tab_Opt.Title
				elseif k == "TextColor" then
					Tab_Opt.TextColor = CheckType(v, "Color3", Tab_Opt.TextColor)

					Button.TextColor3 = Tab_Opt.TextColor
				elseif k == "RichText" then
					Tab_Opt.RichText = CheckType(v, "boolean", Tab_Opt.RichText)

					Button.RichText = Tab_Opt.RichText
				elseif k == "Font" then
					Tab_Opt.Font = CheckType(v, "EnumItem", Tab_Opt.Font)

					Button.Font = Tab_Opt.Font
				elseif k == "Visible" then
					Tab_Opt.Visible = CheckType(v, "boolean", Tab_Opt.Visible)

					Button.Visible = Tab_Opt.Visible
				elseif k == "Image" then
					Tab_Opt.Image = CheckType(v, "number", Tab_Opt.Image)

					NewImage.Image = RunService:IsStudio() and "http://www.roblox.com/asset/?id=5472131383" or game:GetObjects(("rbxassetid://%s"):format(Tab_Opt.Image))[1].Texture
				end
			end,
			__index = function(t, k)
				if k == "Title" then
					return Tab_Opt.Title
				elseif k == "TextColor" then
					return Tab_Opt.TextColor
				elseif k == "RichText" then
					return Tab_Opt.RichText
				elseif k == "Font" then
					return Tab_Opt.Font
				elseif k == "Visible" then
					return Tab_Opt.Visible
				elseif k == "Image" then
					return Tab_Opt.Image
				end
			end
		})
	end

	return TabLibrary
end

return Material
