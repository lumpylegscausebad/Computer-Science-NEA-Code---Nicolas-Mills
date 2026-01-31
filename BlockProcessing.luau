-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
local tweenblock = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

ReplicatedStorage.Events.Block.OnServerEvent:Connect(function(player) -- activate when a client blocks
  -- adjust variables
	player.Character:WaitForChild("Values").Blocking.Value = true
	player.Character:WaitForChild("Values").CanParry.Value = true
  -- adjust speed
	player.Character:WaitForChild("Values").Speed.Value = player.Character:WaitForChild("Values").Speed.Value - 200
	player.Character.Humanoid.WalkSpeed = player.Character.Humanoid.WalkSpeed - 200
	changespeed:FireAllClients() -- update Modifier UI
  -- detect character
	if player.Character:WaitForChild("Values").Character.Value == "GToilet" or player.Character:WaitForChild("Values").Character.Value == "Juggernaut" or player.Character:WaitForChild("Values").Character.Value == "Overseer" or player.Character:WaitForChild("Values").Character.Value == "Plungerman" then
		player.Character.HumanoidRootPart.ShieldUp:Play()
		local goal = {}
    -- change the size of the shield for characters without arms
		if player.Character:WaitForChild("Values").Character.Value == "GToilet" then
			goal.Size = Vector3.new(75, 130, 50)
			local Shield = player.Character.ShieldBeam
			local tween = tweenService:Create(Shield, tweenblock, goal)
			tween:Play()
		elseif player.Character:WaitForChild("Values").Character.Value == "Overseer" then
			goal.Size = Vector3.new(0.01, 30, 45)
			local Shield = player.Character.ShieldBeam
			local tween = tweenService:Create(Shield, tweenblock, goal)
			tween:Play()
		elseif player.Character:WaitForChild("Values").Character.Value == "Juggernaut" then
			player.Character.LeftArm.ShieldBeam.Transparency = 0
		end
	end
	task.wait(1)
  -- extend the parry window for the astro overseer character
	if player.Character:WaitForChild("Values").Character.Value == "Overseer" then
		task.wait(0.5)
		player.Character:WaitForChild("Values").CanParry.Value = false
	else -- disable parry window for every other character
		player.Character:WaitForChild("Values").CanParry.Value = false
	end
end)

ReplicatedStorage.Events.StopBlocking.OnServerEvent:Connect(function(player) -- activate when a client stops blocking
  -- adjust variables
	player.Character:WaitForChild("Values").Blocking.Value = false
	player.Character:WaitForChild("Values").CanParry.Value = false
	player.Character:WaitForChild("Values").BlockCounter.Value = 0
	if player.Character:WaitForChild("Values").Stunned.Value == false then -- determine if the player was block broken
    -- adjust speed
		player.Character:WaitForChild("Values").Speed.Value = player.Character:WaitForChild("Values").Speed.Value + 200
		player.Character.Humanoid.WalkSpeed = player.Character.Humanoid.WalkSpeed + 200
	end
	changespeed:FireAllClients() -- update Modifier UI
  -- detect character
	if player.Character:WaitForChild("Values").Character.Value == "GToilet" or player.Character:WaitForChild("Values").Character.Value == "Juggernaut" or player.Character:WaitForChild("Values").Character.Value == "Overseer" or player.Character:WaitForChild("Values").Character.Value == "Plungerman" then
		player.Character.HumanoidRootPart.ShieldDown:Play()
		local goal = {}
    -- change the size of the shield for characters without arms
		if player.Character:WaitForChild("Values").Character.Value == "GToilet" then
			goal.Size = Vector3.new(0.01, 0.01, 0.01)
			local Shield = player.Character.ShieldBeam
			local tween = tweenService:Create(Shield, tweenblock, goal)
			tween:Play()
		elseif player.Character:WaitForChild("Values").Character.Value == "Overseer" then
			goal.Size = Vector3.new(0.01, 0.01, 0.01)
			local Shield = player.Character.ShieldBeam
			local tween = tweenService:Create(Shield, tweenblock, goal)
			tween:Play()
		elseif player.Character:WaitForChild("Values").Character.Value == "Juggernaut" then
			player.Character.LeftArm.ShieldBeam.Transparency = 1
		end
	end
end)

ReplicatedStorage.Events.BlockBreak.OnServerEvent:Connect(function(player) -- activate when a player is block broken
  -- adjust variables
	if player.Character:WaitForChild("Values").Stunned.Value == false then
		player.Character:WaitForChild("Values").Stunned.Value = true
		player.Character:WaitForChild("Values").BlockCounter.Value = 0
		player.Character.HumanoidRootPart.BlockBreakSound:Play()
    -- determine character
		if player.Character:WaitForChild("Values").Character.Value == "GToilet" or player.Character:WaitForChild("Values").Character.Value == "Juggernaut" or player.Character:WaitForChild("Values").Character.Value == "Overseer" or player.Character:WaitForChild("Values").Character.Value == "Plungerman" then
		  -- change the size of the shield for characters without arms
      player.Character.HumanoidRootPart.ShieldDown:Play()
			local goal = {}
			goal.Size = Vector3.new(0.01, 0.01, 0.01)
			local Shield = player.Character.ShieldBeam
			local tween = tweenService:Create(Shield, tweenblock, goal)
			tween:Play()
		end
    -- reduce speed
		player.Character:WaitForChild("Values").Speed.Value = player.Character:WaitForChild("Values").Speed.Value - 50
		player.Character.Humanoid.WalkSpeed = player.Character.Humanoid.WalkSpeed - 50
		changespeed:FireAllClients() -- update Modifier UI
		print(player.Character:WaitForChild("Values").Speed.Value)
      -- create indicator
			local damageIndicatorGui = Instance.new("BillboardGui")
			damageIndicatorGui.AlwaysOnTop = true
      -- change size depending on character
			if player.Character:WaitForChild("Values").Character.Value == "Necromancer" or player.Character:WaitForChild("Values").Character.Value == "Plungerman" then
				damageIndicatorGui.Size = UDim2.new(12, 0, 12, 0)
			elseif player.Character:WaitForChild("Values").Character.Value == "Overseer" or player.Character:WaitForChild("Values").Character.Value == "DJToilet" then
				damageIndicatorGui.Size = UDim2.new(30, 0, 30, 0)
			elseif player.Character:WaitForChild("Values").Character.Value == "GToilet" or player.Character:WaitForChild("Values").Character.Value == "UTCM" or player.Character:WaitForChild("Values").Character.Value == "UTSM" or player.Character:WaitForChild("Values").Character.Value == "UTTVM" or player.Character:WaitForChild("Values").Character.Value == "Detainer" or player.Character:WaitForChild("Values").Character.Value == "Juggernaut" then
				damageIndicatorGui.Size = UDim2.new(75, 0, 75, 0)
			end
      -- adjust properties of the UI
			local offsetX = math.random(-10, 10)/10
			local offsetY = math.random(-10, 10)/10
			local offsetZ = math.random(-10, 10)/10
			damageIndicatorGui.StudsOffset = Vector3.new(offsetX, offsetY, offsetZ)
			local damageIndicatorLabel = Instance.new("TextLabel")
			damageIndicatorLabel.ZIndex = 3
			damageIndicatorLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			damageIndicatorLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			damageIndicatorLabel.BackgroundTransparency = 1
			damageIndicatorLabel.Font = Enum.Font.Ubuntu
			damageIndicatorLabel.Size = UDim2.new(1, 0, 0.5, 0)
			damageIndicatorLabel.TextScaled = true
			damageIndicatorLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
			damageIndicatorLabel.TextTransparency = 0
			damageIndicatorLabel.RichText = true
			damageIndicatorLabel.Text = ("<b>".."Block Broken!".."</b>")
			damageIndicatorLabel.Parent = damageIndicatorGui
			damageIndicatorGui.Parent = player.Character.Humanoid.Parent.HumanoidRootPart
			damageIndicatorLabel:TweenSize(UDim2.new(1, 0, 0.5, 0), "InOut", "Quint", 0.5)
			damageIndicatorLabel:TweenPosition(UDim2.new(0.5, 0, -0.2, 0), "InOut", "Quint", 0.5)
			local stroke = Instance.new("UIStroke")
			stroke.Parent = damageIndicatorLabel
			local guiUpTween = tweenService:Create(damageIndicatorGui, tweenInfo, {StudsOffset = damageIndicatorGui.StudsOffset + Vector3.new(0, 2, 0)})
			local textFadeTween = tweenService:Create(damageIndicatorLabel, tweenInfo, {TextTransparency = 1})
			local strokeFadeTween = tweenService:Create(stroke, tweenInfo, {Transparency = 1})
			guiUpTween:Play()
			game:GetService("Debris"):AddItem(damageIndicatorGui, 2) -- remove after 2 seconds
			textFadeTween:Play()
			strokeFadeTween:Play()
		task.wait(3)
    -- reset variables
		player.Character:WaitForChild("Values").Stunned.Value = false
		player.Character:WaitForChild("Values").Speed.Value = player.Character:WaitForChild("Values").Speed.Value + 250
		player.Character.Humanoid.WalkSpeed = player.Character.Humanoid.WalkSpeed + 250
		changespeed:FireAllClients() -- update Modifier UI
	end
end)

ReplicatedStorage.Events.Parry.OnServerEvent:Connect(function(enemy) -- activate when the player is parried
	if enemy.Character:WaitForChild("Values").Stunned.Value == false then -- determine if the player was already stunned
    -- adjust variables
		enemy.Character:WaitForChild("Values").Stunned.Value = true
		enemy.Character.HumanoidRootPart.ParrySound:Play()
    -- reduce speed
		enemy.Character:WaitForChild("Values").Speed.Value = enemy.Character:WaitForChild("Values").Speed.Value - 250
		enemy.Character.Humanoid.WalkSpeed = enemy.Character.Humanoid.WalkSpeed - 250
		changespeed:FireAllClients() -- update Modifier UI
      -- create indicator
			local damageIndicatorGui = Instance.new("BillboardGui")
			damageIndicatorGui.AlwaysOnTop = true
      -- change size depending on character
			if enemy.Character:WaitForChild("Values").Character.Value == "Necromancer" or enemy.Character:WaitForChild("Values").Character.Value == "Plungerman" then
				damageIndicatorGui.Size = UDim2.new(12, 0, 12, 0)
			elseif enemy.Character:WaitForChild("Values").Character.Value == "Overseer" or enemy.Character:WaitForChild("Values").Character.Value == "DJToilet" then
				damageIndicatorGui.Size = UDim2.new(30, 0, 30, 0)
			elseif enemy.Character:WaitForChild("Values").Character.Value == "GToilet" or enemy.Character:WaitForChild("Values").Character.Value == "UTCM" or enemy.Character:WaitForChild("Values").Character.Value == "UTSM" or enemy.Character:WaitForChild("Values").Character.Value == "UTTVM" or enemy.Character:WaitForChild("Values").Character.Value == "Detainer" or enemy.Character:WaitForChild("Values").Character.Value == "Juggernaut" then
				damageIndicatorGui.Size = UDim2.new(75, 0, 75, 0)
			end
      -- adjust properties of the UI
			local offsetX = math.random(-10, 10)/10
			local offsetY = math.random(-10, 10)/10
			local offsetZ = math.random(-10, 10)/10
			damageIndicatorGui.StudsOffset = Vector3.new(offsetX, offsetY, offsetZ)
			local damageIndicatorLabel = Instance.new("TextLabel")
			damageIndicatorLabel.ZIndex = 3
			damageIndicatorLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			damageIndicatorLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			damageIndicatorLabel.BackgroundTransparency = 1
			damageIndicatorLabel.Font = Enum.Font.Ubuntu
			damageIndicatorLabel.Size = UDim2.new(1, 0, 0.5, 0)
			damageIndicatorLabel.TextScaled = true
			damageIndicatorLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
			damageIndicatorLabel.TextTransparency = 0
			damageIndicatorLabel.RichText = true
			damageIndicatorLabel.Text = ("<b>".."Parry!".."</b>")
			damageIndicatorLabel.Parent = damageIndicatorGui
			damageIndicatorGui.Parent = enemy.Character.Humanoid.Parent.HumanoidRootPart
			damageIndicatorLabel:TweenSize(UDim2.new(1, 0, 0.5, 0), "InOut", "Quint", 0.5)
			damageIndicatorLabel:TweenPosition(UDim2.new(0.5, 0, -0.2, 0), "InOut", "Quint", 0.5)
			local stroke = Instance.new("UIStroke")
			stroke.Parent = damageIndicatorLabel
			local guiUpTween = tweenService:Create(damageIndicatorGui, tweenInfo, {StudsOffset = damageIndicatorGui.StudsOffset + Vector3.new(0, 2, 0)})
			local textFadeTween = tweenService:Create(damageIndicatorLabel, tweenInfo, {TextTransparency = 1})
			local strokeFadeTween = tweenService:Create(stroke, tweenInfo, {Transparency = 1})
			guiUpTween:Play()
			game:GetService("Debris"):AddItem(damageIndicatorGui, 2) -- remove after 2 seconds
			textFadeTween:Play()
			strokeFadeTween:Play()
		task.wait(3)
    -- reset variables
		enemy.Character:WaitForChild("Values").Stunned.Value = false
		enemy.Character:WaitForChild("Values").Speed.Value = enemy.Character:WaitForChild("Values").Speed.Value + 250
		enemy.Character.Humanoid.WalkSpeed = enemy.Character.Humanoid.WalkSpeed + 250
		changespeed:FireAllClients() -- update Modifier UI
	end
end)
