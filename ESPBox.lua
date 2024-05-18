-- ESP Box Players Script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function createESP(player)
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = player.Character.HumanoidRootPart.Size * 1.1
    Box.Adornee = player.Character.HumanoidRootPart
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Parent = player.Character
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    player.Character:FindFirstChildOfClass("
