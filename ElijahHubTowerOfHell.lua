local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({IntroText = Elijah Hub, Name = "Elijah Hub - Tower Of Hell", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Elijah Hub - Tower Of Hell",
	Content = "Elijah Hub Has Loaded Welcome "..Player.Name.."!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Player"
})

Tab:AddButton({
	Name = "Bypass Anti Cheat",
	Callback = function()
    local reg = getreg()
 
    for i, Function in next, reg do
        if type(Function) == 'function' then
            local info = getinfo(Function)
 
            if info.name == 'kick' then
                if (hookfunction(info.func, function(...)end)) then
                    print'succesfully hooked kick'
                else
                    print'failed to hook kick'
                end
            end
        end
    end
    local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts
 
    local script1 = playerscripts.LocalScript
    local script2 = playerscripts.LocalScript2
 
    local script1signal = script1.Changed
    local script2signal = script2.Changed
 
    for i, connection in next, getconnections(script1signal) do
        connection:Disable()
    end
    for i, connection in next, getconnections(script2signal) do
        connection:Disable()
    end
 
    script1:Destroy()
    script2:Destroy()  		
  	end
})
      
Tab:AddButton({
	Name = "Teleport To Finish",
	Callback = function()
      		local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame
 
    local player = game.Players.LocalPlayer.Character
    player.HumanoidRootPart.CFrame = endzone
  	end    
})
      
Tab:AddButton({
	Name = "Get All Items",
	Callback = function()
      		for _,e in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if e:IsA("Tool") then
        e:Destroy()
        end
        end
        wait() 
        for _,v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
        if v:IsA("Tool") then
        local CloneThings = v:Clone()
        wait()
        CloneThings.Parent = game.Players.LocalPlayer.Backpack
 
        end
        end
  	end    
})

Tab:AddButton({
	Name = "Remove Killpart",
	Callback = function()
      		for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
        if v:IsA("BoolValue") and v.Name == "kills" then
            v.Parent:Destroy()
        end
    end
  	end
})
      
local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
      
local Section = Tab:AddSection({
	Name = "Admin And Other Stuff"
})

Tab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

Tab:AddButton({
	Name = "Auto Lag",
	Callback = function()
      		loadstring(game:HttpGet('https://pastebin.com/raw/eVHmQQvQ'))()
  	end    
})

Tab:AddButton({
	Name = "Anti AFK",
	Callback = function()
      		local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
       vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       wait(1)
       vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
  	end    
})
