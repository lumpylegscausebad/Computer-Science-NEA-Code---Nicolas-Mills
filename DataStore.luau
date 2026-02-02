-- variables
local DataStoreService = game:GetService("DataStoreService")
local UserData = DataStoreService:GetDataStore("UserData")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

game.Players.PlayerAdded:Connect(function(player) -- load data upon joining the game
	local Data = Instance.new("Folder") -- create data folder
	Data.Name = "Data"
	Data.Parent = player
  -- create data values to store
	local Kills = Instance.new("IntValue")
	Kills.Name = "Kills"
	Kills.Parent = Data
	local Deaths = Instance.new("IntValue")
	Deaths.Name = "Deaths"
	Deaths.Parent = Data
	local Wins = Instance.new("IntValue")
	Wins.Name = "Wins"
	Wins.Parent = Data
	local Losses = Instance.new("IntValue")
	Losses.Name = "Losses"
	Losses.Parent = Data
	
	local PersistentValues = Instance.new("Folder") -- create player values folder
	PersistentValues.Name = "PersistentValues"
	PersistentValues.Parent = player
  -- create user values to be used by other algorithms
	local Character = Instance.new("StringValue")
	Character.Name = "Character"
	Character.Parent = PersistentValues
	local Map = Instance.new("StringValue")
	Map.Name = "Map"
	Map.Parent = PersistentValues
	local Gamemode = Instance.new("StringValue")
	Gamemode.Name = "Gamemode"
	Gamemode.Parent = PersistentValues
	local Team = Instance.new("StringValue")
	Team.Name = "Team"
	Team.Parent = PersistentValues
	local Lives = Instance.new("IntValue")
	Lives.Name = "Lives"
	Lives.Parent = PersistentValues

  -- update the data values based on the datastore
    
	local KillData
	local success1 = pcall(function()
		KillData = UserData:GetAsync(player.UserId.."-Kills")
	end)
	if success1 == true then
		Kills.Value = KillData
	end
	local DeathData
	local success2 = pcall(function()
		DeathData = UserData:GetAsync(player.UserId.."-Deaths")
	end)
	if success2 == true then
		Deaths.Value = DeathData
	end
	local WinData
	local success3 = pcall(function()
		WinData = UserData:GetAsync(player.UserId.."-Wins")
	end)
	if success3 == true then
		Wins.Value = WinData
	end
	local LossData
	local success4 = pcall(function()
		LossData = UserData:GetAsync(player.UserId.."-Losses")
	end)
	if success4 == true then
		Losses.Value = LossData
	end
	
	local CharacterData
	local success5 = pcall(function()
		CharacterData = UserData:GetAsync(player.UserId.."-Character")
	end)
end)

game.Players.PlayerRemoving:Connect(function(player) -- update data when a player leaves the game
		UserData:SetAsync(player.UserId.."-Kills",player.Data.Kills.Value)
		UserData:SetAsync(player.UserId.."-Deaths",player.Data.Deaths.Value)
		UserData:SetAsync(player.UserId.."-Wins",player.Data.Wins.Value)
		UserData:SetAsync(player.UserId.."-Losses",player.Data.Losses.Value)
end)
	
ReplicatedStorage.UpdateData.OnServerEvent:Connect(function(player) -- update data whenever fired
		UserData:SetAsync(player.UserId.."-Kills",player.Data.Kills.Value)
		UserData:SetAsync(player.UserId.."-Deaths",player.Data.Deaths.Value)
		UserData:SetAsync(player.UserId.."-Wins",player.Data.Wins.Value)
		UserData:SetAsync(player.UserId.."-Losses",player.Data.Losses.Value)
    -- update the data in the Settings UI
		player.PlayerGui.MainMenuGUI.mainframe.SettingsPopup.Data.Kills.Text.Text = "Kills: "..player.Data.Kills.Value
		player.PlayerGui.MainMenuGUI.mainframe.SettingsPopup.Data.Deaths.Text.Text = "Deaths: "..player.Data.Deaths.Value
		player.PlayerGui.MainMenuGUI.mainframe.SettingsPopup.Data.Wins.Text.Text = "Wins: "..player.Data.Wins.Value
		player.PlayerGui.MainMenuGUI.mainframe.SettingsPopup.Data.Losses.Text.Text = "Losses: "..player.Data.Losses.Value
end)
