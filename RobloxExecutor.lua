-- Create a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptExecutorGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5, 0, 0.4, 0)  -- Adjust size as needed
Frame.Position = UDim2.new(0.25, 0, 0.3, 0) -- Adjust position as needed
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Parent = ScreenGui

-- Create a Textbox
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -20, 0.8, 0) -- Make it fill most of the frame
TextBox.Position = UDim2.new(0.05, 0, 0.05, 0) -- Position with padding
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.TextWrapped = true
TextBox.PlaceholderText = "Enter Lua script here..."
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.Parent = Frame

-- Create a Button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Size = UDim2.new(0.9, 0, 0.15, 0)
ExecuteButton.Position = UDim2.new(0.05, 0, 0.85, 0)
ExecuteButton.Text = "Execute"
ExecuteButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
ExecuteButton.Parent = Frame

-- Function to handle the execution
ExecuteButton.MouseButton1Click:Connect(function()
    local success, errorMessage = pcall(function()
        loadstring(TextBox.Text)() -- Execute the script
    end)

    if not success then
        warn("Error executing script: " .. errorMessage)
    end
end)
