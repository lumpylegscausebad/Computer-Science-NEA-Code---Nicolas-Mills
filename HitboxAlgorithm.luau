-- variables
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Character = script.Parent.Parent
local AbilityDamage = script.Parent.AbilityDamage
local BlockBreak = RS.Events.BlockBreak
local Parry = RS.Events.Parry
local Stun = RS.Events.Stun

function CreateHitbox(Character, HitboxSize, Damage) -- create hitbox part
	local Player = Players:GetPlayerFromCharacter(Character)
	local Hitbox = Instance.new("Part")
	  -- set properities of hitbox
	Hitbox.Transparency = 0.5
	Hitbox.BrickColor = BrickColor.Red()
	Hitbox.CanCollide = false
	Hitbox.Anchored = false
	Hitbox.Size = HitboxSize
	Hitbox.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,-50,-100)
 	 -- connect hitbox to the character
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = Character.Torso
	weld.Part1 = Hitbox
	weld.Enabled = true
	weld.Parent = Hitbox
	Hitbox.Parent = workspace
	Hitbox.CollisionGroup = "Hitbox"
	Hitbox.Massless = true
	local PartsInHitbox = workspace:GetPartsInPart(Hitbox) -- get all parts within the hitbox
	local Debounces = {} -- array to store players affected
	for count = 0, 100, 1 do -- reoccurring hitbox
		task.wait(0.01)
			for _,v in PartsInHitbox do -- iterate through every part in the hitbox
			local Humanoid = v.Parent:FindFirstChild("Humanoid") or v.Parent.Parent:FindFirstChild("Humanoid") -- determine if the part is a player
			if Humanoid and Humanoid.Parent ~= Character and not Debounces[Humanoid] and Humanoid.Health > 0 then -- determine if the player is valid by being alive and not affected
				Debounces[Humanoid] = true -- adds player to the Debounces array 
				if Humanoid.Parent.Values.Invincible.Value == false then -- determine if the player is invincible
					if Humanoid.Parent.Name ~= Character then
						if Humanoid.Parent.Values.Blocking.Value == false then -- determine if the player is blocking
							local Attack = script.Parent.Parent:WaitForChild("Values").Attack.Value
							local Defence = Humanoid.Parent:WaitForChild("Values").Defense.Value
							Humanoid.Health = math.max(0, Humanoid.Health - ((Damage * Attack) / Defence)) -- calculate damage
							local user = Character
							if user.Values.UltimateCounter.Value < 100 then
								user.Values.UltimateCounter.Value += 1 -- increment UltimateCounter if count is below 100
							end
							if Humanoid.Health == 0 then -- determine if the player died
               					 -- adjust data
								Players:GetPlayerFromCharacter(Character).Data.Kills.Value += 1
								Players:GetPlayerFromCharacter(Humanoid.Parent).Data.Deaths.Value += 1
								RS.UpdateData:FireClient(Players:GetPlayerFromCharacter(Character))
							end
							Hitbox.BrickColor = BrickColor.Green()
							Stun:FireClient(Players:GetPlayerFromCharacter(Humanoid.Parent), 3) -- apply stun if necessary
							count = 100 -- end the loop
						elseif Humanoid.Parent.Values.CanParry.Value == false then -- determine if the player should be block broken
              				-- block break the player
							BlockBreak:FireClient(Players:GetPlayerFromCharacter(Humanoid.Parent))
							Humanoid.Parent.Values.BlockCounter.Value = 0
							Hitbox.BrickColor = BrickColor.Yellow()
						elseif Humanoid.Parent.Values.CanParry.Value == true then -- determine if the player could parry
             				 -- parry the user
							Parry:FireClient(Player)
							Hitbox.BrickColor = BrickColor.Yellow()
						end
					end
				end
			end
		end
	end

	task.delay(0.3, function()
		if Hitbox then -- detect if the hitbox still exists
			Hitbox:Destroy() -- remove hitbox
		end
	end)
end

RS.Events.Character.AbilityUsed.OnServerEvent:Connect(function(player) -- activate from the Ability Activation algorithm
  -- determine if the user is the intended player
  local user = Players:GetPlayerFromCharacter(script.Parent.Parent)
  if player == user then
  	CreateHitbox(Character, Vector3.new(150,150,150), AbilityDamage) -- fire hitbox function with size and damage
  	end
  end)
