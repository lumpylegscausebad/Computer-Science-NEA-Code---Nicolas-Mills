-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local BlueTeam = script.Parent.Parent.BlueTeam 
local RedTeam = script.Parent.Parent.RedTeam 
local Start = ReplicatedStorage.MatchStart 
local CountingDown = false 
local Players = game:GetService("Players") 

local TeamPlayers = {} -- table for players in teams 
 
local function countdown() -- function to display countdown and start match 
	CountingDown = true 
	for count = 30, 0, -1 do 
		script.Parent.Text = "Match starts in: "..count.."s" -- change time 
		task.wait(1) 
	end 
	script.Parent.Text = "Match is starting!" 
	for _, v in Players:GetChildren() do 
		if v.PersistentValues.Team.Value ~= "" then -- for all players, check if they are in a team - if so, add to table and to match 
			v.PlayerGui.TimerGUI.Enabled = true 
			table.insert(TeamPlayers, v) 
			local map = nil 
			local AlphaHillsVotes = ReplicatedStorage.AlphaHillsVotes.Value 
			local AlaskaVotes = ReplicatedStorage.AlaskaVotes.Value 
			local KyotoVotes = ReplicatedStorage.KyotoVotes.Value 
			if AlphaHillsVotes > AlaskaVotes and AlphaHillsVotes > KyotoVotes then 
				map = "AlphaHills" 
			elseif AlaskaVotes > AlphaHillsVotes and AlaskaVotes > KyotoVotes then 
				map = "Alaska" 
			elseif KyotoVotes > AlphaHillsVotes and KyotoVotes > AlaskaVotes then 
				map = "Kyoto" 
			elseif AlphaHillsVotes == AlaskaVotes then 
				local random = math.random(1, 2) 
				if random == 1 then 
					map = "AlphaHills" 
				else 
					map = "Alaska" 
				end 
				map = "Kyoto" 
			elseif AlphaHillsVotes == KyotoVotes then 
				local random = math.random(1, 2) 
				if random == 1 then 
					map = "AlphaHills" 
				else 
					map = "Kyoto" 
				end 
			elseif AlaskaVotes == KyotoVotes then 
				local random = math.random(1, 2) 
				if random == 1 then 
					map = "Alaska" 
				else 
					map = "Kyoto" 
				end 
			elseif AlphaHillsVotes == AlaskaVotes and AlaskaVotes == KyotoVotes then 
				local random = math.random(1, 3) 
				if random == 1 then 
					map = "Alaska" 
				elseif random == 2 then 
					map = "Kyoto" 
				else 
					map = "AlphaHills" 
				end 
			end 
			if v.PersistentValues.Team.Value == "Red" then 
				if map == "AlphaHills" then 
					v.TeamColor = BrickColor.new("Terra Cotta") 
				elseif map == "Alaska" then 
					v.TeamColor = BrickColor.new("Tawny") 
				elseif map == "Kyoto" then 
					v.TeamColor = BrickColor.new("Burgundy") 
				end 
			elseif v.PersistentValues.Team.Value == "Blue" then 
				if map == "AlphaHills" then 
					v.TeamColor = BrickColor.new("Cyan") 
				elseif map == "Alaska" then 
					v.TeamColor = BrickColor.new("Pastel Blue") 
				elseif map == "Kyoto" then 
					v.TeamColor = BrickColor.new("Light blue") 
				end 
			end 
			Start:FireClient(v) 
			v.PersistentValues.Lives.Value = 3 
		end 
	end 
	ReplicatedStorage.Timer.Value = true 
	task.wait(5) 
	script.Parent.Text = "A match is ongoing..." 
	ReplicatedStorage.AlphaHillsVotes.Value = 0 
	ReplicatedStorage.AlaskaVotes.Value = 0 
	ReplicatedStorage.KyotoVotes.Value = 0 
	table.clear(TeamPlayers) 
end 

-- detect changes in blue and red teams to trigger countdowns 

ReplicatedStorage.ChangeBlueTeam.OnServerEvent:Connect(function(player, unused, character, joining) 
	if joining == true then 
		task.wait(0.05) 
		if BlueTeam.PlayerAmount.Value >= 2 and RedTeam.PlayerAmount.Value >= 1 or BlueTeam.PlayerAmount.Value >= 1 and RedTeam.PlayerAmount.Value >= 2 then -- check if at least 3 players 
			if CountingDown == false then -- check if countdown is not already happening 
				countdown() 
			end 
		end 
	end 
end) 

ReplicatedStorage.ChangeRedTeam.OnServerEvent:Connect(function(player, unused, character, joining) 
	if joining == true then 
		task.wait(0.05) 
		if BlueTeam.PlayerAmount.Value >= 2 and RedTeam.PlayerAmount.Value >= 1 or BlueTeam.PlayerAmount.Value >= 1 and RedTeam.PlayerAmount.Value >= 2 then -- check if at least 3 players 
			if CountingDown == false then -- check if countdown is not already happening 
				countdown() 
			end 
		end 
	end
end) 

ReplicatedStorage.MatchEnd.OnServerEvent:Connect(function() -- trigger when match has ended 
	CountingDown = false 
	script.Parent.Text = "Waiting for 3 players" 
	table.clear(TeamPlayers) -- reset table of match players 
end) 
