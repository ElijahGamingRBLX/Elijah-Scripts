local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Elijah Hub - Arsenal", HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText = Elijah Hub, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "Elijah Hub - Arsenal",
	Content = "Elijah Hub Has Been Loaded Welcome "..Player.Name.."!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Welcome To Elijah Hub - Arsenal","Enjoy Using The Script! (More Features Soon)")

Tab:AddButton({
	Name = "Join Discord",
	Callback = function()
      		https://discord.gg/34swrQV3hb
  	end    
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Player"
})

SettingsInfinite = false;
Tab:AddButton({
	Name = "Infinite Ammo",
	Callback = function(K)
      SettingsInfinite = K;
game:GetService("RunService").Stepped:connect(function()
pcall(function()
if SettingsInfinite then
	 game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value=999;
	 game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value=999
	  end 
	  end)
	  end)		
  	end
})

Tab:AddButton({
	Name = "Rapid Fire",
	Callback = function()
      		local as=game.ReplicatedStorage;
	  for ar, O in pairs(as.Weapons:GetDescendants())
	  do
		   if O.Name=="Auto"
		   then O.Value = true 
		   end;
		   if O.Name == "RecoilControl" then
			    O.Value = 0 
				end;
				if O.Name == "MaxSpread" then
					 O.Value = 0
					  end;
					 if O.Name == "ReloadTime" then 
						 O.Value = 0 
						 end;
						 if O.Name == "FireRate"
						 then O.Value = 0.05
						  end;
						  if O.Name == "Crit"
						  then 
							  O.Value = 20
							   end 
							   end 
  	end    
})

Tab:AddButton({
	Name = "Hitbox",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/RrTbsWa4",true))()
  	end    
})

Tab:AddButton({
	Name = "Invisible Hitbox",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/KpQhjvRQ",true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


local Section = Tab:AddSection({
	Name = "Other Stuff"
})

Tab:AddToggle({
	Name = "Silent Aim",
	Default = false,
	Callback = function(O)
		 SAToggle = O;
 local R = workspace.CurrentCamera;
 local S = game.Players;
 local T = S.LocalPlayer;
 local U = T:GetMouse()function ClosestPlayer()
 local V, W = N;
 for X, Y in pairs(S.GetPlayers(S)) do 
	 if Y==T then
	 end;
	 if Y.Team==T then end;
	 if not Y.Character then end;
	 local Z = Y.Character.FindFirstChild(Y.Character,""..bodypart)
	 if not Z then 
	 end;
	 local _,a0 = R.WorldToScreenPoint(R,Z.Position)
	 if not a0 then
	  end;
	  local a1,a2 = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2), Vector2.new(_.X,_.Y)
	  local a3 = (a2-a1).Magnitude;if a3<V then
		   V=a3;W=Y
		    end 
	  end;
	  return W 
	  end;
	  local a4 = getrawmetatable(game)
	  local a5 = a4.__namecall;
	  local a6 = a4.__index;setreadonly(a4,false)a4.__namecall=newcclosure(function(self,...)
	  local a7,a8 = {...}, getnamecallmethod()
	  if a8=="FindPartOnRayWithIgnoreList" and not checkcaller()and 
	  SAToggle then 
		  local a9 = ClosestPlayer()
		  if a9 and a9.Character and a9.Character.FindFirstChild(a9.Character,bodypart) 
		  then 
			  a7[1] = Ray.new(R.CFrame.Position, (a9.Character[bodypart].Position-R.CFrame.Position).Unit*1000)
			  return a5(self, unpack(a7))
			  end
			   end;
			   return a5(self,...)
			   end)
			   a4.__index = newcclosure(function(self,aa)
			   if aa=="Clips" then 
				   return workspace.Map
				    end;
					return a6(self,aa)
					end)
					setreadonly(a4,true)
	end    
})

Tab:AddTextbox({
	Name = "Change Walkspeed",
	Default = "",
	TextDisappear = true,
	Callback = function(I)
		while true do wait()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=I
 end
	end	  
})
