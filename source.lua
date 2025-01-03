-- UI Library Module
local UI = {}

-- Function to create a ScreenGui
function UI.CreateScreenGui(parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = parent
    return screenGui
end

-- Function to create a Frame
function UI.CreateFrame(parent, size, position, bgColor)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = bgColor
    return frame
end

-- Function to create a TextLabel
function UI.CreateTextLabel(parent, text, size, position, textSize, textColor, bgColor)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = size
    label.Position = position
    label.TextSize = textSize
    label.TextColor3 = textColor
    label.BackgroundColor3 = bgColor
    label.TextScaled = true  -- Makes text scale based on label size
    return label
end

-- Function to create a Button
function UI.CreateButton(parent, text, size, position, textSize, textColor, bgColor, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = size
    button.Position = position
    button.TextSize = textSize
    button.TextColor3 = textColor
    button.BackgroundColor3 = bgColor
    button.TextScaled = true  -- Makes text scale based on button size

    -- Handle button click
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return button
end

-- Function to create a Slider (example with integer values)
function UI.CreateSlider(parent, minValue, maxValue, size, position, callback)
    local slider = Instance.new("Frame")
    slider.Parent = parent
    slider.Size = size
    slider.Position = position
    slider.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

    local knob = Instance.new("Frame")
    knob.Parent = slider
    knob.Size = UDim2.new(0, 20, 1, 0)  -- Slider knob size
    knob.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    -- Update knob position on input
    slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouseX = input.Position.X
            local sliderWidth = slider.AbsoluteSize.X
            local newKnobPos = math.clamp(mouseX - slider.Position.X.Offset, 0, sliderWidth)
            knob.Position = UDim2.new(0, newKnobPos, 0, 0)

            -- Calculate and call the callback with the new value
            local newValue = math.floor((newKnobPos / sliderWidth) * (maxValue - minValue) + minValue)
            if callback then
                callback(newValue)
            end
        end
    end)

    return slider
end

return UI
