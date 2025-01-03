local TweenService = game:GetService("TweenService")

-- Helper functions to create UI elements
local function CreateFrame(parent, size, position, backgroundColor, borderRadius)
	local frame = Instance.new("Frame")
	frame.Size = size
	frame.Position = position
	frame.BackgroundColor3 = backgroundColor
	frame.BorderRadius = UDim.new(0, borderRadius or 0)
	frame.Parent = parent
	return frame
end

local function CreateLabel(parent, text, size, position, textSize, textColor)
	local label = Instance.new("TextLabel")
	label.Size = size
	label.Position = position
	label.Text = text
	label.TextSize = textSize
	label.TextColor3 = textColor
	label.BackgroundTransparency = 1
	label.Parent = parent
	return label
end

local function CreateButton(parent, text, size, position, callback)
	local button = Instance.new("TextButton")
	button.Size = size
	button.Position = position
	button.Text = text
	button.TextSize = 14
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	button.BorderRadius = UDim.new(0, 6)
	button.Parent = parent
	button.MouseButton1Click:Connect(callback)

	-- Animation on Hover
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(68, 68, 68)}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(48, 48, 48)}):Play()
	end)

	return button
end

-- Create the Window with Tabs
local function CreateWindowWithTabs()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = game.Players.LocalPlayer.PlayerGui

	-- Main Window
	local mainWindow = CreateFrame(screenGui, UDim2.new(0, 400, 0, 500), UDim2.new(0.5, -200, 0.5, -250), Color3.fromRGB(40, 40, 40), 12)

	-- Topbar
	local topbar = CreateFrame(mainWindow, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), Color3.fromRGB(50, 50, 50), 8)
	CreateLabel(topbar, "Window with Tabs", UDim2.new(0.8, 0, 1, 0), UDim2.new(0.1, 0, 0, 0), 20, Color3.fromRGB(255, 255, 255))

	-- Tabs Section
	local tabsFrame = CreateFrame(mainWindow, UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 40), Color3.fromRGB(30, 30, 30), 4)

	local tab1Button = CreateButton(tabsFrame, "Tab 1", UDim2.new(0, 100, 1, 0), UDim2.new(0, 0, 0, 0), function()
		tab1Frame.Visible = true
		tab2Frame.Visible = false
	end)

	local tab2Button = CreateButton(tabsFrame, "Tab 2", UDim2.new(0, 100, 1, 0), UDim2.new(0, 100, 0, 0), function()
		tab1Frame.Visible = false
		tab2Frame.Visible = true
	end)

	-- Tab Content
	local tab1Frame = CreateFrame(mainWindow, UDim2.new(1, 0, 0, 400), UDim2.new(0, 0, 0, 80), Color3.fromRGB(60, 60, 60), 6)
	CreateLabel(tab1Frame, "This is the content for Tab 1", UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), 16, Color3.fromRGB(255, 255, 255))

	local tab2Frame = CreateFrame(mainWindow, UDim2.new(1, 0, 0, 400), UDim2.new(0, 0, 0, 80), Color3.fromRGB(60, 60, 60), 6)
	CreateLabel(tab2Frame, "This is the content for Tab 2", UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 0), 16, Color3.fromRGB(255, 255, 255))
	tab2Frame.Visible = false -- Hide Tab 2 content initially

	-- Default: Show Tab 1
	tab1Frame.Visible = true
	tab2Frame.Visible = false

end

-- Call the function to create the window with tabs
CreateWindowWithTabs()
