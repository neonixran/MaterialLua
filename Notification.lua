-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")

-- Variables
local Container
local Notification
local Player = Players.LocalPlayer

-- Create UI
if not CoreGui:FindFirstChild("Notification") then
    Notification = Instance.new("ScreenGui")
    Notification.Name = "Notification"
    Notification.Parent = RunService:IsStudio() and Player.PlayerGui or CoreGui
else
    Notification = CoreGui.Notification
end

if not Notification:FindFirstChild("Container") then
    Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Position = UDim2.new(0, 20, 0.5, -20)
    Container.Size = UDim2.new(0, 300, 0.5, 0)
    Container.BackgroundTransparency = 1
    Container.Parent = Notification
else
    Container = Notification.Container
end

-- UI Variables
local Padding = 10
local CachedObjects = {}
local DescriptionPadding = 10
local InstructionObjects = {}

local TweenTime = 1
local TweenStyle = Enum.EasingStyle.Sine
local TweenDirection = Enum.EasingDirection.Out

local LastTick = tick()

local TitleSettings = {
	Font = Enum.Font.GothamSemibold,
	Size = 14
}

local DescriptionSettings = {
	Font = Enum.Font.Gotham,
	Size = 14
}

local PropertyTweenOut = {
	Text = "TextTransparency",
	Fram = "BackgroundTransparency",
	Imag = "ImageTransparency"
}

local MaxWidth = (Container.AbsoluteSize.X - Padding - DescriptionPadding)

-- Functions
local function Image(ImageId, Button)
	local NewImage = Instance.new(("Image%s"):format(Button and "Button" or "Label"))
	NewImage.Image = ImageId
	NewImage.BackgroundTransparency = 1
	return NewImage
end

function SetColor(Theme)
	if Theme == "Dark" then
		return Color3.fromRGB(25, 25, 25)
	elseif Theme == "Light" then
		return Color3.fromRGB(124, 37, 255)
	elseif Theme == "Mocha" then
		return Color3.fromRGB(176, 148, 125)
	elseif Theme == "Aqua" then
		return Color3.fromRGB(116, 112, 140)
	elseif Theme == "Jester" then
		return Color3.fromRGB(219, 68, 103)
    else
        return Color3.fromRGB(25, 25, 25)
	end
end

local Color = SetColor(...)

local function Round2px()
	local NewImage = Image("http://www.roblox.com/asset/?id=5761488251")
	NewImage.ScaleType = Enum.ScaleType.Slice
	NewImage.SliceCenter = Rect.new(2, 2, 298, 298)
	NewImage.ImageColor3 = Color
	return NewImage
end

local function Shadow2px()
	local NewImage = Image("http://www.roblox.com/asset/?id=5761498316")
	NewImage.ScaleType = Enum.ScaleType.Slice
	NewImage.SliceCenter = Rect.new(17, 17, 283, 283)
	NewImage.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30)
	NewImage.Position = -UDim2.fromOffset(15, 15)
	NewImage.ImageColor3 = Color
	return NewImage
end

local function CalculateBounds(TableOfObjects)
	local TableOfObjects = typeof(TableOfObjects) == "table" and TableOfObjects or {}
    local X, Y = 0, 0

	for _, Object in next, TableOfObjects do
		X += Object.AbsoluteSize.X
		Y += Object.AbsoluteSize.Y
	end
	return {X = X, Y = Y, x = X, y = Y};
end

local function SetLabel(Text, Font, Size, Button)
	local Label = Instance.new(("Text%s"):format(Button and "Button" or "Label"))

	Label.Text = Text
	Label.Font = Font
	Label.TextSize = Size
	Label.BackgroundTransparency = 1
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.RichText = true
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)
	return Label
end

local function TitleLabel(Text)
	return SetLabel(Text, TitleSettings.Font, TitleSettings.Size);
end

local function DescriptionLabel(Text)
	return SetLabel(Text, DescriptionSettings.Font, DescriptionSettings.Size);
end

local function FadeProperty(Object)
	local Prop = PropertyTweenOut[string.sub(Object.ClassName, 1, 4)]
	TweenService:Create(Object, TweenInfo.new(0.25, TweenStyle, TweenDirection), {[Prop] = 1;}):Play()
end

local function SearchTableFor(Table, For)
	for _, v in next, Table do
		if v == For then
			return true
		end
	end

	return false
end

local function FindIndexByDependency(Table, Dependency)
	for Index, Object in next, Table do
		if (typeof(Object) == "table") then
			local Found = SearchTableFor(Object, Dependency)

            if Found then
				return Index
			end
		else
			if Object == Dependency then
				return Index
			end
		end
	end
end

local function ResetObjects()
	for _, Object in next, InstructionObjects do
		Object[2] = 0
		Object[3] = false
	end
end

local function FadeOutAfter(Object, Seconds)
	task.wait(Seconds)
	FadeProperty(Object)
	for _, SubObj in next, Object:GetDescendants() do
		FadeProperty(SubObj)
	end
	task.wait(0.25)
	table.remove(InstructionObjects, FindIndexByDependency(InstructionObjects, Object))
	ResetObjects()
    Object:Destroy()
end

RunService:BindToRenderStep("UpdateList", 0, function()
    local DeltaTime = tick() - LastTick
	local PreviousObjects = {}

	for CurObj, Object in next, InstructionObjects do
		local Label, Delta, Done = Object[1], Object[2], Object[3]

		if not Done then
			if Delta < TweenTime then
				Object[2] = math.clamp(Delta + DeltaTime, 0, 1)
				Delta = Object[2]
			else
				Object[3] = true
			end
		end

		local NewValue = TweenService:GetValue(Delta, TweenStyle, TweenDirection)
		local CurrentPos = Label.Position
		local PreviousBounds = CalculateBounds(PreviousObjects)
		local TargetPos = UDim2.new(0, 0, 0, PreviousBounds.Y + (Padding * #PreviousObjects))
		Label.Position = CurrentPos:Lerp(TargetPos, NewValue)
		table.insert(PreviousObjects, Label)
	end

	CachedObjects = PreviousObjects
	LastTick = tick()
end)

-- Send Notification --
return {
    Notify = function(Settings)
        Settings = typeof(Settings) == "table" and Settings or {}

        local Title = typeof(Settings.Title) == "string" and Settings.Title or nil
        local Description = typeof(Settings.Description) == "string" and Settings.Description or nil
        local Duration = typeof(Settings.Duration) == "number" and Settings.Duration or 5

        if Title or Description then
            local Y = Title and 26 or 0

            if Description then
                local TextSize = TextService:GetTextSize(Description, DescriptionSettings.Size, DescriptionSettings.Font, Vector2.new(0, 0))

                for i = 1, math.ceil(TextSize.X / MaxWidth) do
					Y += TextSize.Y
				end

				Y += 8
            end

            local NewLabel = Round2px()
			NewLabel.Name = "Notification"
			NewLabel.Size = UDim2.new(1, 0, 0, Y)
			NewLabel.Position = UDim2.new(-1, 20, 0, CalculateBounds(CachedObjects).Y + (Padding * #CachedObjects))

            if Title then
                local NewTitle = TitleLabel(Title)
				NewTitle.Name = "Title"
				NewTitle.Size = UDim2.new(1, -10, 0, 26)
				NewTitle.Position = UDim2.fromOffset(10, 0)
				NewTitle.Parent = NewLabel
            end

            if Description then
                local NewDescription = DescriptionLabel(Description)
				NewDescription.TextWrapped = true
				NewDescription.Name = "Description"
				NewDescription.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(-DescriptionPadding, Title and -26 or 0)
				NewDescription.Position = UDim2.fromOffset(10, Title and 26 or 0)
				NewDescription.TextYAlignment = Enum.TextYAlignment[Title and "Top" or "Center"]
				NewDescription.Parent = NewLabel
            end

            Shadow2px().Parent = NewLabel
            NewLabel.Parent = Container
			table.insert(InstructionObjects, {NewLabel, 0, false})
			task.defer(FadeOutAfter, NewLabel, Duration)
        end
    end
}
