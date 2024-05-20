local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/rileybeerblx2/kavo-ui/main/kavo.lua"))()

local Window = Library.CreateLib("Elijah Hub - Puregold World", "BloodTheme")

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Player")

MainSection:NewButton("ESP Player", "ESP", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

MainSection:NewButton("Infinite Jump", "Gives You Inf Jump", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ElijahGamingRBLX/Elijah-Scripts/main/InfJump.lua'))()
end)

MainSection:NewButton("Noclip GUI", "?", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ElijahGamingRBLX/Elijah-Scripts/main/NoclipGUI.lua'))()
end)

local Player = Window:NewTab("Other")
local PlayerSection = Tab:NewSection("Misc")

PlayerSection:NewButton("Infinite Yield", "Infinite Yield Script", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

PlayerSection:NewSlider("Change Walkspeed", "Set Walkspeed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewButton("Reset Walkspeed", "Resets To The Default Walkspeed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)
