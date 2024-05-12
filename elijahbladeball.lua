local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/wuhaz/UI-Librarys/main/MySploit.lua"))()

local MainUI = UILibrary.Load("Elijah Hub - Blade Ball")

local FirstPage = MainUI.AddPage("Home")

local FirstButton = FirstPage.AddButton("Auto Parry", function()
getgenv().disable = true
wait(.1)
getgenv().disable = false
function getball()
    local ball
    for i, v in pairs(workspace.Balls:GetChildren()) do if v.Anchored == false then ball = v end end
return ball
end

function istargeted()
    return game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Highlight") and true or false
end

function distancefromball()
    local dist
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart and getball() then
        return (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - getball().Position).Magnitude
    end
end

function getping()
    return game.Players.LocalPlayer:GetNetworkPing()*20
end

function getparrydist()
    return math.clamp(getball().Velocity.Magnitude/2.4+getping(),15, 200)
end

function waituntilnottargeted()
local timeout = false
    spawn(function()
wait(.8)
timeout = true
    end)
    repeat wait() until not istargeted() or timeout
end

local circle = Instance.new("Part")
circle.Shape = Enum.PartType.Ball
circle.Material = Enum.Material.SmoothPlastic
circle.Parent = workspace
circle.CanCollide = false
circle.Material = Enum.Material.ForceField
circle.Anchored = true
circle.CastShadow = false

local last = 99999
local spam = false
local alrchecked = false

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    spam = false
end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    spam = false
end)

spawn(function()
while wait() and not getgenv().disable do
    xpcall(function()
        -- if getball() then print(getparrydist()) end
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then circle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame circle.Size = Vector3.new(getparrydist(),getparrydist(),getparrydist()) end
if istargeted() and not alrchecked then
    if tick() - last < .7 and distancefromball() < 70 or distancefromball() < 20  then
        print(distancefromball())
        print(tick() - last)
    spam = true
    print("spam")
    circle.Color = Color3.new(1,0,0)
    alrchecked = true
    else
        alrchecked = true
        print("no spam")
        spam = false
    circle.Color = Color3.new(1,1,1)
    end
    last = tick()
elseif not istargeted() then
    alrchecked = false
end
        if istargeted() == true and getball() ~= nil and distancefromball() < getparrydist() or spam and istargeted() then
            local args = {
        [1] = 0.5,
        [2] = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, Vector3.new(workspace.CurrentCamera.CFrame.p.X,999999999999999999999999999,workspace.CurrentCamera.CFrame.p.Z)),
        [3] = {
            ["HunnayyyxD"] = Vector3.new(1171.807861328125, 226.43194580078125, 85.06675720214844),
            ["Softicey"] = Vector3.new(10073.6025390625, 640.4264526367188, 10.497177124023438),
            ["DonPlayyz_YT"] = Vector3.new(-2097.249755859375, -391.8228759765625, -8.48858642578125),
            ["Caryhco"] = Vector3.new(1336.871337890625, 224.7318115234375, 105.85006713867188),
            ["ii_VaIord"] = Vector3.new(4280.7001953125, 324.5129699707031, 33.27197265625),
            ["wayareyousoga"] = Vector3.new(-650.9739990234375, 24.628662109375, -31.402557373046875),
            ["East_Wave"] = Vector3.new(2366.4990234375, 272.4285888671875, 51.80149841308594),
            ["Idea_Saman100"] = Vector3.new(1856.654052734375, 224.4664306640625, 106.3294677734375),
            ["SteveTheMan042"] = Vector3.new(-4457.2109375, -216.7236328125, -12.2535400390625),
            ["piggy12841"] = Vector3.new(1569.9359130859375, 223.1246337890625, 109.55888366699219),
            ["geeseofthesilly"] = Vector3.new(940.6378173828125, 556.8900146484375, 12.81744384765625),
            ["Mariagurl_16"] = Vector3.new(797.1363525390625, 272.2474060058594, 47.91747283935547)
        },
        [4] = {
            [1] = 893,
            [2] = 618
        }
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ParryAttempt"):FireServer(unpack(args))
    if not spam then waituntilnottargeted() else wait(distancefromball()/250) end
end
end, warn)
end
end)
repeat wait() until getgenv().disable
circle:Destroy()
end)

local FirstButton = FirstPage.AddButton("Auto Parry V2", function()
-- Its Only An Auto Parry
-- Fixed By Riley
local services = setmetatable({}, { __index = function(self, key)
    local service = game:GetService(key)
    self[key] = service
    return service
end })

local Players = services.Players
local Workspace = services.Workspace

local client = Players.LocalPlayer

local ballsFolder = Workspace.Balls

local Util = {}
do
    shared.Util = Util

    function Util.getBalls()
        local realBall, otherBall

        for i = 1, #ballsFolder:GetChildren() do
            local ball = ballsFolder:GetChildren()[i]
            if not ball:IsA("BasePart") then continue end

            local isRealBall = ball:GetAttribute("realBall")
            if isRealBall == nil then continue end

            if isRealBall then
                realBall = ball
            else
                otherBall = ball
            end

            if realBall and otherBall then break end
        end

        return realBall, otherBall
    end

    function Util.isHunting()
        local realBall = Util.getBalls()
        if not realBall then return false end

        local target = realBall:GetAttribute("target")
        if not target then return false end

        return target == client.Name
    end
end

ballsFolder.ChildAdded:Connect(function()
    print('------------------- Ball Spawned -------------------')

    task.wait(1.5)

    local realBall, fakeBall

    for i = 1, #ballsFolder:GetChildren() do
        local ball = ballsFolder:GetChildren()[i]
        if not ball:IsA("BasePart") then continue end

        local currentSpeed = ball.Velocity.Magnitude
        if currentSpeed == 0 then
            realBall = ball
        else
            fakeBall = ball
        end

        if realBall and fakeBall then break end
    end

    if realBall then
        local usedRemote = false
        local lastPosition = realBall.Position
        local lastVelocity = fakeBall.Velocity

        realBall:GetPropertyChangedSignal("Position"):Connect(function()
            if not Util.isHunting() then return end

            local playerPosition = client.Character and client.Character.PrimaryPart and client.Character.PrimaryPart.Position
            if not playerPosition then return end

            local currentSpeed = fakeBall and fakeBall.Velocity.Magnitude or 0

            local predictedPosition = lastPosition + lastVelocity
            local predictedDistance = (predictedPosition - playerPosition).Magnitude

            lastPosition = realBall.Position
            lastVelocity = realBall.Velocity

            local timeToReachPlayer = predictedDistance / (currentSpeed == 0 and 1 or currentSpeed)
            print(timeToReachPlayer)

            if timeToReachPlayer <= 0.3 and not usedRemote then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ParryButtonPress"):Fire()
                task.wait(0.1)
                usedRemote = true
            elseif timeToReachPlayer > 0.4 then
                usedRemote = false
            end
        end)
    end
end)
wait(1)
local NofiticationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Notification/main/NotificationHolder"))()
local Nofitication = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/Notification/main/Notification"))()

local function Notify(Title, Text, Time)
    Nofitication:Notify(
        {Title = Title, Description = Text},
        {OutlineColor = Color3.fromRGB(100, 100, 100),Time = Time or 5, Type = "default"} --[[default, option, image]]
    )
end
Notify("Notification", "Auto Parry Actived!")
end)

local FirstButton = FirstPage.AddButton("Auto Detect V1", function()
loadstring(game:HttpGet(('https://pastebin.com/raw/HPNBFGSf'),true))()
end)

local FirstPage = MainUI.AddPage("Aim & Spam")

local FirstButton = FirstPage.AddButton("Auto Spam V2", function()
loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
end)

local FirstButton = FirstPage.AddButton("Aim Mechanism", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/M%3ABlade%20Ball%20Mechanism",true))()
end)

local FirstPage = MainUI.AddPage("Aim Clash")

local FirstButton = FirstPage.AddButton("Auto Clash", function()
loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
end)

local FirstButton = FirstPage.AddButton("Auto Clash V2", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/datshort1/datmodhub/main/AutoClash"))()
end)
