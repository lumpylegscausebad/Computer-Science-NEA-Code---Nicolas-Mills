-- variables
local blockcooldown = false
local blocking = false
local IsAttacking = false

UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent) -- when the block keybind begins, the block continues 
	if Input.KeyCode == Enum.KeyCode.F then -- check if the block key was pressed 
		if IsAttacking == false and blockcooldown == false and blocking == false then -- validate if a block can occur 
            -- change variables and fire to server 
			IsAttacking = true 
			IsAttackingEvent:FireServer() 
			blockcooldown = true -- prevent rapid blocking 
			blocking = true 
			blockingevent:FireServer() 
			BlockAnimation:Play() 
	end 
	end 
end) 

UserInputService.InputEnded:Connect(function(Input, GameProcessedEvent) -- stops blocking after the keybind is let go 
	if Input.KeyCode == Enum.KeyCode.F then -- check if the block key was let go 
		if blocking == true then -- validates that the player is blocking 
            -- change variables and fire to server 
			IsAttacking = false 
			blocking = false 
			stopblockingevent:FireServer() 
			BlockAnimation:Stop() 
			StoppedAttackingEvent:FireServer() 
			task.wait(1) 
			blockcooldown = false -- allow the player to block after 1 second 
		end 
	end 
end) 
