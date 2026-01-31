-- variables
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Events = ReplicatedStorage:WaitForChild("Events")
local ServerScriptService = game:GetService("ServerScriptService")
local Character = script.Parent
local Player = Players.LocalPlayer
local PlayerGUI = Player:WaitForChild("PlayerGui")
local NecromancerGUI = PlayerGUI:WaitForChild("NecromancerGUI")
local Attacks = NecromancerGUI.Attacks
local Middle = NecromancerGUI.Middle
local ConjuredSlash = script:WaitForChild("ConjuredSlash")
local LifeDrain = script:WaitForChild("LifeDrain")
local RevenantHurl = script:WaitForChild("RevenantHurl")
local FromTheGrave = script:WaitForChild("FromTheGrave")
local Whiplash = script:WaitForChild("Whiplash")
local Hypersensitivity = script:WaitForChild("Hypersensitivity")
local SpectreForm = script:WaitForChild("SpectreForm")
local Ultimate = script.Ultimate
local SharedModules = ReplicatedStorage:WaitForChild("SharedModules")
local Configurations = SharedModules.Configurations
local CharacterConfigurations = require(Configurations.CharacterConfigurations)
local EquippedCharacterName = nil
local info1 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
-- cooldowns
local IsAttacking = Player.Character.Values.IsAttacking.Value
local ZOnCooldown = false
local XOnCooldown = false
local COnCooldown = false
local VOnCooldown = false
local ROnCooldown = false
local TOnCooldown = false
local YOnCooldown = false
IsAttacking = false
UltimateActive = false
BlockWasBroken = false
-- events
local IsAttackingEvent = ReplicatedStorage.Events.BeganAttacking
local StoppedAttackingEvent = ReplicatedStorage.Events.StoppedAttacking
local Zevent = ReplicatedStorage.Events.Necromancer.ConjuredSlashUsed
local Xevent = ReplicatedStorage.Events.Necromancer.LifeDrainUsed
local Yevent = ReplicatedStorage.Events.Necromancer.SpectreFormUsed
local Tevent = ReplicatedStorage.Events.Necromancer.HypersensitivityUsed
local Cevent1 = ReplicatedStorage.Events.Necromancer.RevenantHurlUsed
local Cevent2 = ReplicatedStorage.Events.Necromancer.RevenantHurlRelease
local Vevent1 = ReplicatedStorage.Events.Necromancer.WhiplashUsed
local Revent = ReplicatedStorage.Events.Necromancer.HallowedTotemUsed
local Gevent = ReplicatedStorage.Events.Necromancer.UltimateUsed
local clickcooldown = false
local mouse = Player:GetMouse()
local clickevent = ReplicatedStorage.Events.Click
-- block variables
local blockcooldown = false
local blocking = Character.Values.Blocking
blocking = false
local blockingevent = ReplicatedStorage.Events.Block
local stopblockingevent = ReplicatedStorage.Events.StopBlocking
local Humanoid = Character.Humanoid
local BlockAnimation = Humanoid.Animator:LoadAnimation(script.SpecialAnimations.Block)
-- modifiers
local attackevent = ReplicatedStorage.ChangeAttack
local defenseevent = ReplicatedStorage.ChangeDefense
local speedevent = ReplicatedStorage.ChangeSpeed
local healthevent = ReplicatedStorage.ChangeHealth
local BlockBreak = ReplicatedStorage.Events.BlockBreak
local Parry = ReplicatedStorage.Events.Parry
local Stun = ReplicatedStorage.Events.Stun
local Blocked = ReplicatedStorage.Events.BlockedAttack
local Taunt = ReplicatedStorage.Events.Taunt
local JuggernautPassive = ReplicatedStorage.Events.Juggernaut.JuggernautPassive

-- MAIN ABILITY SECTION

UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent) -- connects when the player inputs a key
	if Input.KeyCode == Enum.KeyCode.Z then -- checks if the key is z
		if IsAttacking == false and ZOnCooldown == false and script.Parent.Values.Stunned.Value == false then -- checks if the player isnt currently attacking and that this specific move is not on cooldown
			IsAttacking = true
			IsAttackingEvent:FireServer() -- sends to the server that this player is attacking - needs to be fired as a remote event to update the attribute
			ZOnCooldown = true
			print(Player, "(Necromancer) used Conjured Slash!")
			local ZAnimation = Player.Character.Humanoid.Animator:LoadAnimation(script.SpecialAnimations.ConjuredSlashAnimation) -- the correct animation is loaded
			ZAnimation:Play()
			Character["Right Arm"].Scythe.Particlepart.DarkAura.Enabled = true
			ZAnimation:GetMarkerReachedSignal("Hit"):Connect(function() -- when the animation reaches the signal 'hit', the hitbox event is fired to the server
				Zevent:FireServer()
			end)
			-- animating the ability buttons based on the cooldown of the move
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			Character["Right Arm"].Scythe.Particlepart.DarkAura.Enabled = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,30)
			task.wait(0.5)
			IsAttacking = false
			StoppedAttackingEvent:FireServer() -- updates to the server again that the attack is no longer happening
			task.wait(29.5)
			ZOnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.ConjuredSlash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
    
	-- the above comments are repeated for the other abilities
    
	if Input.KeyCode == Enum.KeyCode.X then
		if IsAttacking == false and XOnCooldown == false and script.Parent.Values.Stunned.Value == false then
			IsAttacking = true
			IsAttackingEvent:FireServer()
			XOnCooldown = true
			print(Player, "(Necromancer) used Life Drain!")
			local XAnimation = Player.Character.Humanoid.Animator:LoadAnimation(script.SpecialAnimations.LifeDrainAnimation)
			XAnimation:Play()
			XAnimation:GetMarkerReachedSignal("Hit"):Connect(function()
				Xevent:FireServer()
			end)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,25)
			task.wait(3)
			IsAttacking = false
			StoppedAttackingEvent:FireServer()
			task.wait(22)
			XOnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.LifeDrain.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.C then
		if IsAttacking == false and COnCooldown == false and script.Parent.Values.Stunned.Value == false then
			IsAttacking = true
			IsAttackingEvent:FireServer()
			COnCooldown = true
			Cevent1:FireServer()
			print(Player, "(Necromancer) used Revenant Hurl!")
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,40)
			task.wait(2)
			IsAttacking = false
			StoppedAttackingEvent:FireServer()
			task.wait(38)
			COnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.RevenantHurl.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.V then
		if IsAttacking == false and VOnCooldown == false and script.Parent.Values.Stunned.Value == false then
			IsAttacking = true
			IsAttackingEvent:FireServer()
			VOnCooldown = true
			Vevent1:FireServer()
			print(Player, "(Necromancer) used Whiplash!")
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,40)
			task.wait(2)
			IsAttacking = false
			StoppedAttackingEvent:FireServer()
			task.wait(38)
			VOnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Whiplash.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.R then
		if IsAttacking == false and ROnCooldown == false and script.Parent.Values.Stunned.Value == false then
			local team = Player.Character:WaitForChild("Values").Team.Value
			IsAttacking = true
			IsAttackingEvent:FireServer()
			ROnCooldown = true
			print(Player, "(Necromancer) used Hallowed Totem!")
			Revent:FireServer(Player)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,90)
			task.wait(2)
			IsAttacking = false
			StoppedAttackingEvent:FireServer()
			task.wait(88)
			ROnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.T then
		if TOnCooldown == false and script.Parent.Values.Stunned.Value == false and script.Parent.Values.Taunted.Value == false then
			TOnCooldown = true
			print(Player, "(Necromancer) used Hypersensitivity!")
			Tevent:FireServer()
			speedevent:FireServer(600, 5)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,30)
			task.wait(29.6)
			TOnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.Y then
		if YOnCooldown == false and script.Parent.Values.Stunned.Value == false and script.Parent.Values.Taunted.Value == false then
			YOnCooldown = true
			print(Player, "(Necromancer) used Spectre Form!")
			Yevent:FireServer()
			Character.Torso.SpectreAura.Enabled = true
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			task.wait(0.2)
			Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(-0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,0)
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame:TweenPosition(UDim2.new(0.5,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,90)
			task.wait(14.6)
			Character.Torso.SpectreAura.Enabled = false
			task.wait(73.4)
			YOnCooldown = false
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(0, 255, 17)}):Play()
			task.wait(0.2)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
		else
			return
		end
	end
	if Input.KeyCode == Enum.KeyCode.G then
		if script.Parent.Values.UltimateCounter.Value >= 50 and script.Parent.Values.Stunned.Value == false and UltimateActive == false then
			UltimateActive = true
			print(Player, "(Necromancer) used Ultimate: Soul Driven Scythe!")
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Middle.Ultimate.CanvasGroup.Frame, info1, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			Player.PlayerGui.NecromancerGUI.Middle.Ultimate.CanvasGroup.Frame:TweenSize(UDim2.new(0,0,1,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Linear,5)
			Gevent:FireServer(Player)
			local GAnimation = Player.Character.Humanoid.Animator:LoadAnimation(script.SpecialAnimations.UltimateAnimation)
			GAnimation:Play()
			task.wait(5.5)
			TweenService:Create(Player.PlayerGui.NecromancerGUI.Middle.Ultimate.CanvasGroup.Frame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
			UltimateActive = false
		else
			return
		end
	end
end)

mouse.Button1Down:Connect(function() -- handles mouse1 attacks (clicks)
	if IsAttacking == false and clickcooldown == false and script.Parent.Values.Stunned.Value == false then
		IsAttacking = true
		IsAttackingEvent:FireServer()
		clickcooldown = true
		clickevent:FireServer()
		task.wait(1)
		StoppedAttackingEvent:FireServer()
		IsAttacking = false
		clickcooldown = false
	end
end)

UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent) -- when the block keybind begins, the block continues
	if Input.KeyCode == Enum.KeyCode.F then
		if IsAttacking == false and blockcooldown == false and blocking == false and script.Parent.Values.Stunned.Value == false then
			IsAttacking = true
			IsAttackingEvent:FireServer()
			blockcooldown = true
			blocking = true
			blockingevent:FireServer()
			BlockAnimation:Play()
			BlockWasBroken = false
		end
	end
end)

UserInputService.InputEnded:Connect(function(Input, GameProcessedEvent)	-- stops blocking after the keybind is let go
	if Input.KeyCode == Enum.KeyCode.F then
		if blocking == true and BlockWasBroken == false then
			IsAttacking = false
			blocking = false
			stopblockingevent:FireServer()
			BlockAnimation:Stop()
			StoppedAttackingEvent:FireServer()
			task.wait(1)
			blockcooldown = false
		end
	end
end)

ReplicatedStorage.Events.BlockBreak.OnClientEvent:Connect(function(player) -- send block breaks to the server
	BlockBreak:FireServer()
	BlockAnimation:Stop()
	StoppedAttackingEvent:FireServer()
	BlockWasBroken = true
	blocking = false
	IsAttacking = false
	blockcooldown = false
end)

ReplicatedStorage.Events.Parry.OnClientEvent:Connect(function(enemy) -- send parries to the server
	Parry:FireServer(enemy)
end)

ReplicatedStorage.Events.Stun.OnClientEvent:Connect(function(enemy, duration) -- send stuns to the server
	Stun:FireServer(enemy, duration)
end)

ReplicatedStorage.Events.BlockedAttack.OnClientEvent:Connect(function(enemy) -- send blocked attacks to the server
	Blocked:FireServer(enemy)
end)

ReplicatedStorage.Events.Taunt.OnClientEvent:Connect(function(player, character) -- process taunts
	Taunt:FireServer(player, character)
	-- modify non-attacking abilities to be unusable and appear differently temporarily
	Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.AttackName.Text = "[TAUNTED]"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.AttackName.Text = "[TAUNTED]"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.AttackName.Text = "[TAUNTED]"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	task.wait(30)
	-- undo the modifications
	Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.AttackName.Text = "Hypersensitivity"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.Hypersensitivity.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(38, 255, 0)}):Play()
	Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.AttackName.Text = "Spectre Form"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.SpectreForm.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(38, 255, 0)}):Play()
	Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.AttackName.Text = "Hallowed Totem"
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.CanvasGroup.DebounceFrame, info1, {BackgroundColor3 = Color3.fromRGB(35, 150, 0)}):Play()
	TweenService:Create(Player.PlayerGui.NecromancerGUI.Attacks.FromTheGrave.AttackKeybind, info1, {TextColor3 = Color3.fromRGB(38, 255, 0)}):Play()
end)

ReplicatedStorage.Events.UTTVM.DeathScreenHit.OnClientEvent:Connect(function(player) -- process titan tv man's ultimate's screen effect
	game:GetService("Lighting").UTTVMBlur.Enabled = true
	task.wait(10)
	game:GetService("Lighting").UTTVMBlur.Enabled = false
end)

ReplicatedStorage.UpdateData.OnClientEvent:Connect(function(player) -- update data
	ReplicatedStorage.UpdateData:FireServer()
end)

script.Parent.Values.UltimateCounter:GetPropertyChangedSignal("Value"):Connect(function() -- detect increments to the ultimate counter
	if UltimateActive == false then -- determine if the ultimate is disabled
		local CurrentUltimate = math.max(0, Player.Character.Values.UltimateCounter.Value) -- get current ultimate value
		local MaxUltimate = 50
	    -- adjust size of the Ultimate UI bar
		local targetSize = UDim2.new((CurrentUltimate / MaxUltimate) * 2, 0, 1, 0)
		local tween = game:GetService("TweenService"):Create(Player.PlayerGui.NecromancerGUI.Middle.Ultimate.CanvasGroup.Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize})
		tween:Play()
	end
end)

JuggernautPassive:FireServer() -- trigger the astro juggernaut's passive upon joining the match

-- all the ability guis are copied from this scripts children into the players playergui
ConjuredSlash:Clone()
ConjuredSlash.Parent = Attacks
FromTheGrave:Clone()
FromTheGrave.Parent = Attacks
LifeDrain:Clone()
LifeDrain.Parent = Attacks
RevenantHurl:Clone()
RevenantHurl.Parent = Attacks
Hypersensitivity:Clone()
Hypersensitivity.Parent = Attacks
SpectreForm:Clone()
SpectreForm.Parent = Attacks
Whiplash:Clone()
Whiplash.Parent = Attacks
Ultimate:Clone()
Ultimate.Parent = Middle
