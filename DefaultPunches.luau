local ReplicatedStorage = game:GetService("ReplicatedStorage")

ReplicatedStorage.Events.Punch.OnServerEvent:Connect(function(Player)  
	local Character = Player.Character -- gets the players character  
	Debounces[Player] = true -- to stop animation overlapping once one starts 
	local Combo = Player.Values.Combo -- checks for current punch animation number 
	local Animation = script.AnimationCycle[tostring(Combo.Value)] 
	local Animation = Humanoid.Animator:LoadAnimation(Animation) -- gets necessary animation based on Combo 
	Animation:Play() -- plays animation 
	if Combo.Value == 1 then -- go to next animation
		Combo.Value = 2
	else 
		Combo.Value = 1
	end 
	task.wait(Animation.Length) -- wait for the animation to end 
	if Debounces[Player] then -- allows new animations to begin 
		Debounces[Player] = nil 
	end 
	Animation:GetMarkerReachedSignal("Hit"):Connect(function() -- function activates when animation reaches a certain point 
		CreateHitbox(Character, Vector3.new(9,9,5), 10) -- creates hitbox 
	end) 
end) 
