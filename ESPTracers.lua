-- ESP Tracers Players Script

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function createTracer(player)
    local tracer = Instance.new("BillboardGui")
    tracer.Enabled = true
    tracer.AlwaysOnTop = true
    tracer.Size = UDim2.new(0, 100, 0, 20)
    tracer.Parent = player.Character.Head

    local tracerLabel = Instance.new("TextLabel")
    tracerLabel.Text = player.Name
    tracerLabel.TextColor3 = Color3.new(1, 1, 1)
    tracerLabel.TextSize = 14
    tracerLabel.Parent = tracer
end

Players.PlayerAdded:Connect(function(player)
    createTracer(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    createTracer(player
