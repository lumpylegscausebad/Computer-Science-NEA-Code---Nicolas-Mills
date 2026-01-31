-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local changedefence = ReplicatedStorage.ChangeDefence

ReplicatedStorage.Events.Overseer.UltimateUsed.OnServerEvent:Connect(function(player) -- activate upon ultimate being used 
	player.Character:WaitForChild("Values").UltimateCounter.Value = 0 -- reset ultimate counter 
	game.Workspace.MothershipIncoming.Playing = true 
	task.wait(2)
	game.Workspace.MothershipIncoming.Playing = false 
	game.Workspace.MothershipIncoming.TimePosition = 0 
	local Mothership = ReplicatedStorage.Mothership:Clone() -- clone asset 
-- move the clone to the coordinates of the user 
	local CharacterCFrameX = player.Character.PrimaryPart.CFrame.X 
	local CharacterCFrameZ = player.Character.PrimaryPart.CFrame.Z 
	Mothership:PivotTo(CFrame.new(CharacterCFrameX, 1100, CharacterCFrameZ)) 
	Mothership.Parent = workspace 
	Mothership.OShell.AstroWarp:Play() 
	Mothership.Rotors.Primary.Charge:Play() 
	game:GetService("Debris"):AddItem(Mothership, 16) -- remove asset after 16 seconds 
	task.wait(8) 
	Mothership.Rotors.Primary.Idle:Play() 
	Mothership.Rotors.Primary.Explosion:Play() 
	Mothership.Rotors.Primary.Laser.Transparency = 0.5 
-- activate hitbox scripts 
	Mothership.Rotors.Bottom.ExplosionSphere.Script.Enabled = true 
	Mothership.Rotors.Primary.Laser.KillScript.Enabled = true 
end) 

ReplicatedStorage.Events.UTTVM.DisassembleUsed.OnServerEvent:Connect(function(player) -- active upon disassemble being used
	local TV = nil
  -- get asset based on skin
	if player.Character:WaitForChild("Values").Skin.Value == 1 then
		TV = ReplicatedStorage.TVSentry:Clone()
	elseif player.Character:WaitForChild("Values").Skin.Value == 2 then
		TV = ReplicatedStorage.TVSentry_Devesto:Clone()
	end
  -- move the clone to the coordinates of the user
	local CharacterCFrameX = player.Character.PrimaryPart.CFrame.X
	local CharacterCFrameY = player.Character.PrimaryPart.CFrame.Y
	local CharacterCFrameZ = player.Character.PrimaryPart.CFrame.Z
	TV:PivotTo(CFrame.new(CharacterCFrameX, CharacterCFrameY, CharacterCFrameZ))
	TV.Parent = workspace
	local team = player.Character:WaitForChild("Values").Team.Value -- get the users team
	if team ~= 0 then
		TV.Main.Team.Value = team
	end
	TV.Main.Owner.Value = tostring(player.Character.Name)
	task.wait(0.1)
  -- disable clone collision
	TV["Left Arm"].CanCollide = false
	TV["Right Arm"].CanCollide = false
	TV.Torso.CanCollide = false
	TV["Right Leg"].CanCollide = false
	TV["Left Leg"].CanCollide = false
end)

ReplicatedStorage.Events.Necromancer.HallowedTotemUsed.OnServerEvent:Connect(function(player, team) -- activate when hallowed totem is used
	local Totem = nil
  -- get asset based on skin
	if player.Character:WaitForChild("Values").Skin.Value == 1 then
		Totem = ReplicatedStorage.NecromancerTotem:Clone()
	else
		Totem = ReplicatedStorage.NecromancerTotem_Noli:Clone()
	end
  -- move the clone to the coordinates of the user
	local CharacterCFrameX = player.Character.PrimaryPart.CFrame.X
	local CharacterCFrameY = player.Character.PrimaryPart.CFrame.Y
	local CharacterCFrameZ = player.Character.PrimaryPart.CFrame.Z
	Totem:PivotTo(CFrame.new(CharacterCFrameX, CharacterCFrameY, CharacterCFrameZ))
	Totem.Parent = workspace
	
	local teammates = {} -- store all teammates
	for _, v in Players:GetChildren() do -- iterate through each player in the game
		local playerselected = v.Character
		if playerselected:WaitForChild("Values").Team.Value == team then -- get the users team
			if team == 0 then -- determine if the user is playing on a team based game mode
				player.Character:WaitForChild("Values").Defence.Value = player.Character:WaitForChild("Values").Defence.Value  + 1.5 -- adjust defence
				table.insert(teammates, playerselected) -- add user to teammates
				break
			end
		else -- if the user is playing a team based game mode
			playerselected:WaitForChild("Values").Defence.Value = playerselected:WaitForChild("Values").Defence.Value + 1.5 -- adjust defence
			table.insert(teammates, playerselected) -- add the teammate to the teammates array
		end
	end
	changedefence:FireAllClients() -- update Modifier UI
	repeat task.wait(0.5) until Totem.Humanoid.Health == 0 -- wait until the summon has been destroyed
	for _, v in teammates do -- iterate through each teammate
		v:WaitForChild("Values").Defence.Value = v:WaitForChild("Values").Defence.Value - 1.5 -- remove defence
	end
	changedefence:FireAllClients() -- update Modifier UI
end)
