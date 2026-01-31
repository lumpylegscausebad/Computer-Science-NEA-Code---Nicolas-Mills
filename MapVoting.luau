-- variables
local selected = script.Parent
local Map = script.Parent.Parent.Parent.MapSelected.Map 
local Players = game:GetService("Players") 
local ReplicatedStorage = game:GetService("ReplicatedStorage") 

selected.MouseButton1Click:Connect(function() -- detect when map image is clicked 
	local AllPlayers = Players:GetChildren() -- get all current players 
  -- adjusting vote values
	if script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.PersistentValues.Map.Value == "" then
		ReplicatedStorage.AlphaHillsVotes.Value += 1 
	elseif script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.PersistentValues.Map.Value == "Alaska" then 
		ReplicatedStorage.AlphaHillsVotes.Value += 1 
		ReplicatedStorage.AlaskaVotes.Value -= 1 
	elseif script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.PersistentValues.Map.Value == "Kyoto" then 
		ReplicatedStorage.AlphaHillsVotes.Value += 1 
		ReplicatedStorage.KyotoVotes.Value -= 1 
	end 
	script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.PersistentValues.Map.Value = "AlphaHills" 
	Map.Image = selected.Image -- display selected map image 
	for _, v in AllPlayers do -- applying value changes on all players screens 
		local selected2 = v.PlayerGui.MainMenuGUI.mainframe.SquadsTeamPopup.Maps["0_AlphaHills"] 
    -- adjusting vote text to reflect the updated vote count
		selected2.Parent["0_AlphaHills"].TextLabel.Text = tostring(ReplicatedStorage.AlphaHillsVotes.Value) 
		selected2.Parent["1_Alaska"].TextLabel.Text = tostring(ReplicatedStorage.AlaskaVotes.Value) 
		selected2.Parent["2_Kyoto"].TextLabel.Text = tostring(ReplicatedStorage.KyotoVotes.Value) 
	end 
end) 
