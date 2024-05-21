local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local UsernameTextBox = Instance.new("TextBox")
local FlingButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.Size = UDim2.new(0, 300, 0, 150)

TitleLabel.Parent = Frame
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.Text = "FE Fling GUI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18

UsernameTextBox.Parent = Frame
UsernameTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
UsernameTextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
UsernameTextBox.Size = UDim2.new(0.8, 0, 0, 30)
UsernameTextBox.Font = Enum.Font.SourceSans
UsernameTextBox.PlaceholderText = "Enter Username"
UsernameTextBox.Text = ""
UsernameTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameTextBox.TextSize = 14

FlingButton.Parent = Frame
FlingButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
FlingButton.Position = UDim2.new(0.35, 0, 0.7, 0)
FlingButton.Size = UDim2.new(0.3, 0, 0, 30)
FlingButton.Font = Enum.Font.SourceSans
FlingButton.Text = "Fling"
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.TextSize = 16

-- Fling Function
FlingButton.MouseButton1Click:Connect(function()
    local targetPlayer = game.Players:FindFirstChild(UsernameTextBox.Text)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local localPlayer = game.Players.LocalPlayer
        local targetRoot = targetPlayer.Character.HumanoidRootPart
        local localRoot = localPlayer.Character.HumanoidRootPart
        
        local flingForce = (targetRoot.Position - localRoot.Position).Unit * 500 + Vector3.new(0, 100, 0)
        targetRoot.Velocity = flingForce
    else
        warn("Player not found or doesn't have a character or HumanoidRootPart.")
    end
end)
