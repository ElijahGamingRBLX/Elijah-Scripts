game:GetService("RunService").Stepped:Connect(function()
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Lighting") then
            v.Brightness = 2
        end
    end
end)
