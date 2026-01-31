-- variables 
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait() 
local speed1 = player.Character 
local cam = workspace.CurrentCamera 
local uis = game:GetService("UserInputService") 
-- getting animations 
local idleAnim = char:WaitForChild("Humanoid"):LoadAnimation(script:WaitForChild("Necromancer_Idle")) 
local forwardAnim = char:WaitForChild("Humanoid"):LoadAnimation(script:WaitForChild("Necromancer_MoveForward")) 
local leftanim = char:WaitForChild("Humanoid"):LoadAnimation(script:WaitForChild("Necromancer_MoveForward")) 
local backAnim = char:WaitForChild("Humanoid"):LoadAnimation(script:WaitForChild("Necromancer_MoveForward")) 
local rightAnim = char:WaitForChild("Humanoid"):LoadAnimation(script:WaitForChild("Necromancer_MoveForward")) 
 
-- variables for directional keys 
local wPressed = false 
local sPressed = false 
local aPressed = false 
local dPressed = false 
local waPressed = false 
local wdPressed = false 
local saPressed = false 
local sdPressed = false 

local flying = false -- variable to determine whether the player is currently flying 
 
uis.InputBegan:Connect(function(key, chat) -- detect any input made by the player 
	if chat then return end -- ignore inputs made in chat 
		if key.KeyCode == Enum.KeyCode.Space then -- check the key pressed was the spacebar 
			if flying then -- check if the player is flying 
				flying = false -- disables flight 
				char.Animate.Disabled = false 
				idleAnim:Stop() 
				forwardAnim:Stop() 
			else 
				flying = true -- enable flight
				char.Animate.Disabled = true 
				idleAnim:Play() 
				local bv = Instance.new("BodyVelocity", char.PrimaryPart) 				-- create new body velocity to simulate physics 
				bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge) 
				bv.Velocity = Vector3.new(0,0,0) -- stop the body velocity from moving the player automatically 
				bv.Name = "FlightForce" 
				repeat wait(0.1) until flying == false -- waits until flying is false to destroy the body velocity 
					bv:Destroy() 
				end 
			end 
			-- changing flight variables based on directional keys pressed 
			if key.KeyCode == Enum.KeyCode.W then 
				wPressed = true 
			elseif key.KeyCode == Enum.KeyCode.S then 
				sPressed = true 
			elseif key.KeyCode == Enum.KeyCode.A then 
				aPressed = true 
			elseif key.KeyCode == Enum.KeyCode.D then 
				dPressed = true 
			end 
		end) 

uis.InputBegan:Connect(function(input, gameProcessedEvent, chat) -- detect inputs for diagonal inputs 
	if chat then return end 
		if flying then 
			-- detect what two specific keys were pressed in unison to set the correct directional variable 
			if (input.KeyCode == Enum.KeyCode.W and uis:IsKeyDown(Enum.KeyCode.A)) or (input.KeyCode == Enum.KeyCode.A and uis:IsKeyDown(Enum.KeyCode.W)) then 
				waPressed = true 
			elseif (input.KeyCode == Enum.KeyCode.W and uis:IsKeyDown(Enum.KeyCode.D)) or (input.KeyCode == Enum.KeyCode.D and uis:IsKeyDown(Enum.KeyCode.W)) then 
				wdPressed = true 
			elseif (input.KeyCode == Enum.KeyCode.S and uis:IsKeyDown(Enum.KeyCode.A)) or (input.KeyCode == Enum.KeyCode.A and uis:IsKeyDown(Enum.KeyCode.S)) then 
				saPressed = true 
			elseif (input.KeyCode == Enum.KeyCode.S and uis:IsKeyDown(Enum.KeyCode.D)) or (input.KeyCode == Enum.KeyCode.D and uis:IsKeyDown(Enum.KeyCode.S)) then 
				sdPressed = true 
			end 
		end 
	end) 

uis.InputEnded:Connect(function(key) -- detect when the input ends and reset directional keys variables 
	if key.KeyCode == Enum.KeyCode.W then 
		wPressed = false 
	elseif key.KeyCode == Enum.KeyCode.S then 
		sPressed = false 
	elseif key.KeyCode == Enum.KeyCode.A then 
			aPressed = false 
	elseif key.KeyCode == Enum.KeyCode.D then 
		dPressed = false 
	end 
end) 

uis.InputEnded:Connect(function(input, gameProcessedEvent) -- detect when the one of the inputs ends for one of the keys involved in diagonal movement	 
	if (input.KeyCode == Enum.KeyCode.W and uis:IsKeyDown(Enum.KeyCode.A)) or (input.KeyCode == Enum.KeyCode.A and uis:IsKeyDown(Enum.KeyCode.W)) then 
		waPressed = false
	elseif (input.KeyCode == Enum.KeyCode.W and uis:IsKeyDown(Enum.KeyCode.D)) or (input.KeyCode == Enum.KeyCode.D and uis:IsKeyDown(Enum.KeyCode.W)) then 
		wdPressed = false 
	elseif (input.KeyCode == Enum.KeyCode.S and uis:IsKeyDown(Enum.KeyCode.A)) or (input.KeyCode == Enum.KeyCode.A and uis:IsKeyDown(Enum.KeyCode.S)) then 
		saPressed = false 
	elseif (input.KeyCode == Enum.KeyCode.S and uis:IsKeyDown(Enum.KeyCode.D)) or (input.KeyCode == Enum.KeyCode.D and uis:IsKeyDown(Enum.KeyCode.S)) then 
		sdPressed = false 
	end 
end) 

while task.wait() do -- continuously apply 
  if flying then -- only continue if flying 
    char.PrimaryPart:FindFirstChild("FlightForce").Velocity = Vector3.new(0,0,0) -- set to no velocity as the default 
    forwardAnim:Stop() 
    backAnim:Stop() 
    leftanim:Stop()
    rightAnim:Stop() 

-- apply certain velocity directions and vectors based on the directional keys pressed, including diagonals 

if wPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * 100 
	forwardAnim:Play() 
end 

if sPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * -100 
	backAnim:Play() 
end 

if aPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * -100 
	leftanim:Play() 
end 

if dPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * 100 
	rightAnim:Play() 
end 

if waPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * 100 + cam.CFrame.RightVector * -100 
	forwardAnim:Play() 
end	 

if wdPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * 100 + cam.CFrame.RightVector * 100 
	forwardAnim:Play() 
end	 

if saPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * -100 + cam.CFrame.RightVector * -100 
	forwardAnim:Play() 
end 

	if sdPressed then 
	char.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * -100 + cam.CFrame.RightVector * 100 
	forwardAnim:Play() 
end	 
else 
	task.wait(0.01) -- move the character smoothly every 0.01 seconds 
end 
end 
