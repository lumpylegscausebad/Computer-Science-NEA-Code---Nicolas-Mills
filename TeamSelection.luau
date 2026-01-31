local ReplicatedStorage = game:GetService("ReplicatedStorage") -- variables 
local BlueTeam = script.Parent  
local TeamMembers = {nil, nil, nil, nil} -- array for all team members 

ReplicatedStorage.ChangeBlueTeam.OnServerEvent:Connect(function(player, character, joining) -- activate when the player joins or leaves the team 
	if joining == true then -- check if player is joining 
		player.PersistentValues.Team.Value = "Blue" -- switch team value 
		if TeamMembers[1] == nil then -- check if the slot is free 
			TeamMembers[1] = player -- fill slot 
		elseif TeamMembers[2] == nil then  
			TeamMembers[2] = player  
		elseif TeamMembers[3] == nil then  
			TeamMembers[3] = player  
		elseif TeamMembers[4] == nil then  
			TeamMembers[4] = player  
		end  
		if script.Parent.PlayerAmount.Value <= 4 then  
			script.Parent.PlayerAmount.Value += 1 -- increment team amount 
		end  
	elseif joining == false then -- check if the player is leaving 
		player.PersistentValues.Team.Value = "" -- reset team value 
		local position = table.find(TeamMembers, player, 1) -- find their position in TeamMembers 
		if position == 1 then 
			BlueTeam.Player1.Text = "-"  
		elseif position == 2 then  
			BlueTeam.Player2.Text = "-"  
		elseif position == 3 then  
			BlueTeam.Player3.Text = "-"  
		elseif position == 4 then  
			BlueTeam.Player4.Text = "-"  
		end  
		if script.Parent.PlayerAmount.Value <= 4 then  
			script.Parent.PlayerAmount.Value -= 1 -- reduce amount of players in team 
		end  
		TeamMembers[position] = nil  
		return  
	end  
-- fill in slots with the players name if free 
	if TeamMembers[1] == player and BlueTeam.Player1.Text == "-" then  
		BlueTeam.Player1.Text = player.Name.." - "..character  
	elseif TeamMembers[2] == player and BlueTeam.Player2.Text == "-" then  
		BlueTeam.Player2.Text = player.Name.." - "..character  
	elseif TeamMembers[3] == player and BlueTeam.Player3.Text == "-" then  
		BlueTeam.Player3.Text = player.Name.." - "..character  
	elseif TeamMembers[4] == player and BlueTeam.Player4.Text == "-" then  
		BlueTeam.Player4.Text = player.Name.." - "..character  
	end  
end)  

ReplicatedStorage.ResetTeams.OnServerEvent:Connect(function() -- reset team function 
	table.clear(TeamMembers) -- clear TeamMembers of all player names 
	script.Parent.PlayerAmount.Value = 0 -- reset player count 
end) 
