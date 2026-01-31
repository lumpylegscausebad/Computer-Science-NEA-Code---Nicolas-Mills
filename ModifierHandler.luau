-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local changeattack = ReplicatedStorage.ChangeAttack
local changedefence = ReplicatedStorage.ChangeDefence
local changespeed = ReplicatedStorage.ChangeSpeed
local Players = game:GetService("Players")

ReplicatedStorage.ChangeAttack.OnServerEvent:Connect(function(player, amount, duration, team) -- activates when a clients attack should be modified
	local teammates = {} -- store teammates as an array
	for _, v in Players:GetChildren() do -- iterate through every player in the game
		local playerselected = v.Character
		if playerselected:WaitForChild("Values").Team.Value == team then -- check if the players team is the same as the users
			if team == 0 then -- check if the player is in a team based game mode
				player.Character:WaitForChild("Values").Attack.Value = player.Character:WaitForChild("Values").Attack.Value  + amount -- adjust the users modifier
				table.insert(teammates, playerselected) -- add user to teammates array
				break
			end
			else -- for players in team based game modes
				playerselected:WaitForChild("Values").Attack.Value = playerselected:WaitForChild("Values").Attack.Value + amount -- adjust modifier for the teammate
				table.insert(teammates, playerselected) -- add the teammate to the teammates array
		end
	end
	changeattack:FireAllClients() -- adjust the Modifier UI
	task.wait(duration)
	for _, v in teammates do -- iterate  through all teammates
		v:WaitForChild("Values").Attack.Value = v:WaitForChild("Values").Attack.Value - amount -- remove the adjustment
	end
	changeattack:FireAllClients() -- adjust the Modifier UI
end)

ReplicatedStorage.ChangeDefence.OnServerEvent:Connect(function(player, amount, duration, team) -- activates when a clients defence should be modified
	local teammates = {} -- store teammates as an array
	for _, v in Players:GetChildren() do -- iterate through every player in the game
		local playerselected = v.Character
		if playerselected:WaitForChild("Values").Team.Value == team then -- check if the players team is the same as the users
			if team == 0 then -- check if the player is in a team based game mode
				player.Character:WaitForChild("Values").Defence.Value = player.Character:WaitForChild("Values").Defence.Value  + amount -- adjust the users modifier
				table.insert(teammates, playerselected) -- add user to teammates array
				break
			end
			else -- for players in team based game modes
				playerselected:WaitForChild("Values").Defence.Value = playerselected:WaitForChild("Values").Defence.Value + amount -- adjust modifier for the teammate
				table.insert(teammates, playerselected) -- add the teammate to the teammates array
		end
	end
	changedefence:FireAllClients() -- adjust the Modifier UI
	task.wait(duration)
	for _, v in teammates do -- iterate  through all teammates
		v:WaitForChild("Values").Defence.Value = v:WaitForChild("Values").Defence.Value - amount -- remove the adjustment
	end
	changedefence:FireAllClients() -- adjust the Modifier UI
end)

ReplicatedStorage.ChangeSpeed.OnServerEvent:Connect(function(player, amount, duration, team) -- activates when a clients speed should be modified
	local teammates = {} -- store teammates as an array
	for _, v in Players:GetChildren() do -- iterate through every player in the game
		local playerselected = v.Character
		if playerselected:WaitForChild("Values").Team.Value == team then -- check if the players team is the same as the users
			if team == 0 or team == nil then -- check if the player is in a team based game mode
        -- adjust walking and flying speed for the user
				player.Character:WaitForChild("Values").Speed.Value = player.Character:WaitForChild("Values").Speed.Value  + amount
				player.Character:WaitForChild("Humanoid").WalkSpeed = player.Character:WaitForChild("Humanoid").WalkSpeed + amount
				table.insert(teammates, player.Character) -- add user to teammates array
				break
			end
		else -- for players in team based game modes
       -- adjust walking and flying speed for the teammate
			playerselected:WaitForChild("Values").Speed.Value = playerselected:WaitForChild("Values").Speed.Value + amount
			playerselected:WaitForChild("Humanoid").WalkSpeed = playerselected:WaitForChild("Humanoid").WalkSpeed + amount
			table.insert(teammates, playerselected) -- add teammate to teammates array
		end
	end
	changespeed:FireAllClients() -- adjust the Modifier UI
	task.wait(duration)
	for _, v in teammates do -- iterate  through all teammates
    -- remove the adjustment to walking and flying speed
		v:WaitForChild("Values").Speed.Value = v:WaitForChild("Values").Speed.Value - amount
		v:WaitForChild("Humanoid").WalkSpeed = v:WaitForChild("Humanoid").WalkSpeed - amount
	end
	changespeed:FireAllClients() -- adjust the Modifier UI
end)

ReplicatedStorage.ChangeHealth.OnServerEvent:Connect(function(player, amount, team) -- activates when a clients health should be regenerated
	for _, v in Players:GetChildren() do -- iterate through every player in the game
		local playerselected = v.Character
		if playerselected:WaitForChild("Values").Team.Value == team then -- check if the players team is the same as the users
			if team == 0 then -- check if the player is in a team based game mode
				player.Character.Humanoid.Health = player.Character.Humanoid.Health + amount -- grant health to the user
				break
			end
			else -- for players in team based game modes
				playerselected.Humanoid.Health = playerselected.Humanoid.Health  + amount -- grant health to the teammate
		end
	end
end)
