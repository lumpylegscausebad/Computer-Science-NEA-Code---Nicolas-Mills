local tweenService = game:GetService("TweenService") -- defining animations 
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut) 

local function roundNumber(number) -- rounds the damage to 1 decimal place 
	if math.floor(number) ~= number then -- checks whether the damage is an integer or a float 
		return string.format("%.1f", number) 
	else 
		return math.floor(number) -- return original damage if not a float 
	end 
end 

  local humanoid = game.Workspace.Rig.Humanoid 
  local currentHealth = humanoid.Health 
  humanoid.HealthChanged:Connect(function(health) -- activates upon the humanoids health value being adjusted 
  if health < currentHealth and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then -- validates to ensure the health was reduced, not increased and to ensure the enemy is not dead 
	-- plungerman passive to increase speed
	local increasespeed = false
		if script.Parent.Values.Speed.Value <= 1000 then
			increasespeed = true
			script.Parent.Values.Speed.Value = script.Parent.Values.Speed.Value + 150
			humanoid.WalkSpeed = humanoid.WalkSpeed + 150
		end
		changespeed:FireAllClients() -- update Modifier UI
	  	local healthLost = currentHealth - health 
	  	local damageIndicatorGui = Instance.new("BillboardGui") -- creation of the UI 
	    -- defining the properties of the UI 
	  	damageIndicatorGui.AlwaysOnTop = true 
	  	damageIndicatorGui.Size = UDim2.new(3, 0, 3, 0) 
	  	local offsetX = math.random(-10, 10)/10 
	  	local offsetY = math.random(-10, 10)/10 
	  	local offsetZ = math.random(-10, 10)/10 
	  	damageIndicatorGui.StudsOffset = Vector3.new(offsetX, offsetY, offsetZ) 
	  	local damageIndicatorLabel = Instance.new("TextLabel") 
	  	damageIndicatorLabel.AnchorPoint = Vector2.new(0.5, 0.5) 
	  	damageIndicatorLabel.Position = UDim2.new(0.5, 0, 0.5, 0) 
	  	damageIndicatorLabel.BackgroundTransparency = 1 
	  	damageIndicatorLabel.Font = Enum.Font.Ubuntu 
	  	damageIndicatorLabel.Size = UDim2.new(1, 0, 0.5, 0) 
	  	damageIndicatorLabel.TextScaled = true 
	  	damageIndicatorLabel.TextColor3 = Color3.fromRGB(255, 0, 0) 
	  	damageIndicatorLabel.TextTransparency = 0 
	  	damageIndicatorLabel.RichText = true 
	  	local roundeddamage = roundNumber(healthLost) -- round the damage 
	  	damageIndicatorLabel.Text = ("<b>"..roundeddamage.."</b>") -- display the rounded damage 
	  	damageIndicatorLabel.Parent = damageIndicatorGui 
	  	damageIndicatorGui.Parent = humanoid.Parent.HumanoidRootPart 
	  	damageIndicatorLabel:TweenSize(UDim2.new(1, 0, 0.5, 0), "InOut", "Quint", 0.5) -- animate the UI based on the definitions at the beginning of the script 
	  	damageIndicatorLabel:TweenPosition(UDim2.new(0.5, 0, -0.2, 0), "InOut", "Quint", 0.5) 
	  	local stroke = Instance.new("UIStroke") 
	  	stroke.Parent = damageIndicatorLabel 
	  	local guiUpTween = tweenService:Create(damageIndicatorGui, tweenInfo, {StudsOffset = damageIndicatorGui.StudsOffset + Vector3.new(0, 2, 0)}) 
	  	local textFadeTween = tweenService:Create(damageIndicatorLabel, tweenInfo, {TextTransparency = 1}) 
	  	local strokeFadeTween = tweenService:Create(stroke, tweenInfo, {Transparency = 1}) 
	  	guiUpTween:Play() -- moves the UI up 
	  	game:GetService("Debris"):AddItem(damageIndicatorGui, 1) -- removes the UI after 1 second has passed to prevent memory leaks and clutter 
	  	textFadeTween:Play() 
	  	strokeFadeTween:Play() 
		local Sounds = {1, 0.8, 0.9, 1.1} -- randomise sound speed
			-- play damage sound depending on the amount of damage dealt
			if healthLost >= 400 then
				if script.Parent.HumanoidRootPart.Explosion1.Playing == false then
					script.Parent.HumanoidRootPart.Explosion1.PlaybackSpeed = Sounds[math.random(1,#Sounds)]
					script.Parent.HumanoidRootPart.Explosion1:Play()
				end
			elseif healthLost >= 200 then
				if script.Parent.HumanoidRootPart.Explosion4.Playing == false then
					script.Parent.HumanoidRootPart.Explosion4.PlaybackSpeed = Sounds[math.random(1,#Sounds)]
					script.Parent.HumanoidRootPart.Explosion4:Play()
				end
			elseif healthLost >= 100 then
				if script.Parent.HumanoidRootPart.Explosion2.Playing == false then
					script.Parent.HumanoidRootPart.Explosion2.PlaybackSpeed = Sounds[math.random(1,#Sounds)]
					script.Parent.HumanoidRootPart.Explosion2:Play()
				end
			elseif healthLost >= 0.1 then
				if script.Parent.HumanoidRootPart.Explosion3.Playing == false then
					script.Parent.HumanoidRootPart.Explosion3.PlaybackSpeed = Sounds[math.random(1,#Sounds)]
					script.Parent.HumanoidRootPart.Explosion3:Play()
				end
			end
			local Players = game:GetService("Players")
			local player = Players:GetPlayerFromCharacter(script.Parent)
			if humanoid.Health == 0 and player:WaitForChild("PersistentValues").Lives.Value > 0 then -- determine if the player has died
				player.PersistentValues.Lives.Value -= 1 -- remove a life
				if player:WaitForChild("PersistentValues").Lives.Value == 0 then -- determine if the player has lost all of their lives
					-- reset player values to default
					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					player.TeamColor = BrickColor.new("Institutional white")
					player:WaitForChild("PersistentValues").Character.Value = ""
					player:WaitForChild("PersistentValues").Map.Value = ""
					player:WaitForChild("PersistentValues").Gamemode.Value = ""
					player:WaitForChild("PersistentValues").Team.Value = ""
					task.wait(2)
					ReplicatedStorage.MatchEnd:FireClient(Players:GetPlayerFromCharacter(script.Parent)) -- send player back to the Main Menu
				end
			end
		end
		-- plungerman passive to decrease speed
		task.wait(3)
		if increasespeed == true then
			script.Parent.Values.Speed.Value = script.Parent.Values.Speed.Value - 150
			humanoid.WalkSpeed = humanoid.WalkSpeed - 150
			changespeed:FireAllClients() -- update Modifier UI
		end
  currentHealth = humanoid.Health -- modify the currentHealth to be the new humanoid health after the damage has been dealt 
end) 
