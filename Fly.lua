local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
    if key == 'f' then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        player.Character.Humanoid.PlatformStand = true
        local flySpeed = 50
        local flying = true

        while flying do
            player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, flySpeed, 0)
            wait(0.1)
        end
    end
end)
