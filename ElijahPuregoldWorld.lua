local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Elijah Hub - Puregold World", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Elijah Hub - Puregold World",
	Content = "Elijah Hub Has Been Loaded Welcome "..Player.Name.."!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Speed (50)!",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50 
  	end    
})

Tab:AddButton({
	Name = "Noclip GUI",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/ElijahGamingRBLX/Elijah-Scripts/main/InfJump.lua'))()	
  	end    
})

Tab:AddButton({
	Name = "Inf Jump",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/ElijahGamingRBLX/Elijah-Scripts/main/InfJump.lua'))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "Other",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Infinity Yield",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})
