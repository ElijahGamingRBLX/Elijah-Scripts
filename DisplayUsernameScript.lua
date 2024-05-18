-- Script for displaying usernames above players in Roblox

-- Create a function to loop through all players in the game
function displayUsernames()
    for _, player in ipairs(game.Players:GetPlayers()) do
        -- Create a BillboardGui for each player
        local billboard = Instance.new("BillboardGui")
        billboard.Parent = player.Character.Head
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)

        -- Create a TextLabel to display the player's username
        local usernameLabel = Instance.new("TextLabel")
        usernameLabel.Parent = billboard
        usernameLabel.Text = player.Name
        usernameLabel.TextColor3 = Color3.new(1, 1,
