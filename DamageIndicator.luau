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
  	end 
  currentHealth = humanoid.Health -- modify the currentHealth to be the new humanoid health after the damage has been dealt 
end) 
