-- variables 
local humanoid = script.Parent.Parent.Parent.Parent.Parent.Parent.Humanoid
local healthBar = script.Parent 
local healthText = script.Parent.Parent.Parent.Parent.HealthText 
local tweenService = game:GetService("TweenService") 
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
 
local function roundNumber(number) -- round numbers 
	if math.floor(number) ~= number then -- check if the number is integer or float 
		return string.format("%.1f", number) 
	else 
		return math.floor(number) 
	end 
end 
 
local function updateHealthBar() -- refreshes the health bars size in the Player Information UI
	local health = math.max(0, humanoid.Health) - current health 
	local maxHealth = humanoid.MaxHealth -- max health 
	local targetSize = UDim2.new(health / maxHealth, 0, 1, 0) -- what the size of the bar should be 
	local tween = tweenService:Create(healthBar, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}) -- animate the health bar 
	tween:Play() -- play animation 
	if healthText then 
		healthText.Text = (roundNumber(health).."/"..maxHealth.." HP") -- update the health text to an up-to-date and rounded version 
	end 
end 

humanoid.HealthChanged:Connect(updateHealthBar) -- calls this function whenever the players health is changed 
