Events.Punch.OnServerEvent:Connect(function(Player)  
	local Character = Player.Character -- gets the players character 
	if Debounces[Player] then -- prevents the animation overlapping 
		return 
	end 
	Debounces[Player] = true -- to stop animation overlapping once one starts 
	local PunchCombo = Player.Values.PunchCombo -- checks for current punch animation number 
	local Animation = script.AnimationCycle[tostring(PunchCombo.Value)] 
	local Animation = Humanoid.Animator:LoadAnimation(Animation) -- gets necessary animation based on PunchCombo 
	Animation:Play() -- plays animation 
	if PunchCombo.Value >= #script.AnimationCycle:GetChildren() then -- iterates to next animation 
		PunchCombo.Value = 1 
	else 
		PunchCombo.Value += 1 
	end 
	task.wait(Animation.Length) -- wait for the animation to end 
	if Debounces[Player] then -- allows new animations to begin 
		Debounces[Player] = nil 
	end 
	Animation:GetMarkerReachedSignal("Hit"):Connect(function() -- function activates when animation reaches a certain point 
		CreateHitbox(Character, Vector3.new(9,9,5), 10) -- creates hitbox 
	end) 
end) 
