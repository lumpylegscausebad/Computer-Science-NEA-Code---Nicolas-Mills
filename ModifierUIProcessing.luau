-- variables
local Players = game:GetService("Players")
local localplayer = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local attackText = script.Parent:FindFirstChild("AttackText")
local defenceText = script.Parent:FindFirstChild("DefenceText")
local speedText = script.Parent:FindFirstChild("SpeedText")

local function roundNumber(number) -- round numbers
	if number <= 0 then
		return 0
	else
		if math.floor(number) ~= number then -- determine if the number should be rounded
			return string.format("%.1f", number) -- round to 1 decimal place
		else
			return math.floor(number)
		end
	end
end

ReplicatedStorage.ChangeAttack.OnClientEvent:Connect(function() -- activate when attack is modified
	local number = localplayer.Character.Values.Attack.Value -- get current modifier value
	attackText.Text = ("Attack: x"..roundNumber(number)) -- update modifier text
end)

ReplicatedStorage.ChangeDefence.OnClientEvent:Connect(function() -- activate when defence is modified
	local number = localplayer.Character.Values.Defence.Value -- get current modifier value
	defenceText.Text = ("Defence: x"..roundNumber(number)) -- update modifier text
end)

ReplicatedStorage.ChangeSpeed.OnClientEvent:Connect(function() -- activate when speed is modified
	local number = localplayer.Character.Values.Speed.Value -- get current modifier value
	speedText.Text = ("Speed: "..roundNumber(number)) -- update modifier text
end)
