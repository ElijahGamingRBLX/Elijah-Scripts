
local player = game.Players.LocalPlayer

local function giveInfiniteAmmo()
    for _, weapon in pairs(player.Backpack:GetChildren()) do
        if weapon:IsA("Tool") then
            local ammo = Instance.new("IntValue")
            ammo.Name = "Ammo"
            ammo.Value = math.huge
            ammo.Parent = weapon
        end
    end
end

giveInfiniteAmmo()
