Events.Punch.OnServerEvent:Connect(function(Player)  
	local Character = Player.Character -- gets the players character 
	if ClickAttackDebounces[Player] then -- prevents the animation overlapping 
		return 
	end 
	ClickAttackDebounces[Player] = true -- to stop animation overlapping once one starts 
	local PunchCombo = Player.Values.PunchCombo -- checks for current punch animation number 
	local Animation = script.PunchAnimationCycle[tostring(PunchCombo.Value)] 
	local LoadedPunchAnimation = Humanoid.Animator:LoadAnimation(Animation) -- gets necessary animation based on PunchCombo 
	LoadedPunchAnimation:Play() -- plays animation 
	if PunchCombo.Value >= #script.PunchAnimationCycle:GetChildren() then -- iterates to next animation 
		PunchCombo.Value = 1 
	else 
		PunchCombo.Value += 1 
	end 
	task.wait(LoadedPunchAnimation.Length) -- wait for the animation to end 
	if ClickAttackDebounces[Player] then -- allows new animations to begin 
		ClickAttackDebounces[Player] = nil 
	end 
end) 
