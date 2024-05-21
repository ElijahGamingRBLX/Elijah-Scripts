-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptExecutorGUI"
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5, 0, 0.4, 0)
Frame.Position = UDim2.new(0.25, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.Text = "Script Executor"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.Code
TitleLabel.TextSize = 18
TitleLabel.Parent = Frame

-- Line Number Display
local LineNumberDisplay = Instance.new("TextLabel")
LineNumberDisplay.Size = UDim2.new(0.05, 0, 0.8, 0) -- Adjusted for scrolling
LineNumberDisplay.Position = UDim2.new(0, 0, 0.1, 0)
LineNumberDisplay.BackgroundTransparency = 1 -- Transparent background for scrolling
LineNumberDisplay.TextColor3 = Color3.fromRGB(150, 150, 150)
LineNumberDisplay.Font = Enum.Font.Code
LineNumberDisplay.TextSize = 14
LineNumberDisplay.TextXAlignment = Enum.TextXAlignment.Right
LineNumberDisplay.Parent = Frame

-- Scrolling Frame for Textbox
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(0.95, 0, 0.8, 0) 
ScrollingFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Dynamic canvas size
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.Parent = Frame

-- TextBox for Code Input (inside ScrollingFrame)
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 14
TextBox.PlaceholderText = "Enter Lua script here..."
TextBox.Parent = ScrollingFrame

-- Update Line Numbers and Scrolling Frame Function
local function updateLineNumbersAndScrollingFrame()
    local lineCount = 0
    for _ in TextBox.Text:gmatch("\n") do 
        lineCount += 1
    end

    LineNumberDisplay.Text = table.concat(table.create(lineCount + 1, tostring), "\n")

    -- Adjust canvas size for scrolling
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TextBox.TextBounds.Y)
end

TextBox:GetPropertyChangedSignal("Text"):Connect(updateLineNumbersAndScrollingFrame)
TextBox.FocusLost:Connect(updateLineNumbersAndScrollingFrame) -- Update when losing focus
-- ... (Rest of the code for the Execute button and execution handling remains the same)
