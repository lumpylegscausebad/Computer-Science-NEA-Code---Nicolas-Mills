Events.Block.OnServerEvent:Connect(function(Player, Value) -- detect when a block has started 
	local Character = Player.Character 
	if ClickAttackDebounces[Player] then -- dont allow blocks while the player is attacking 
		return 
	end 
	if not Value then 
		local LoadedAnimations = Humanoid.Animator:GetPlayingAnimationTracks() 
		for _, v in LoadedAnimations do -- finds the block animation 
			if v.Name == "Block" then 
				v:Stop() 
			end 
		end 
		if Character.Values.Blocking.Value == True then -- ends the block and reverts the blocking variables value 
			Blocking.Value = False 
		end 
	else 
		local BlockAnimation = Humanoid.Animator:LoadAnimation(script.Animations.Block) 
		BlockAnimation:Play() -- plays the block animation 
		local Blocking = Character.Values.Blocking -- adjust the blocking variable in Player Values 
		Blocking.Value = True 
	end 
end) 
