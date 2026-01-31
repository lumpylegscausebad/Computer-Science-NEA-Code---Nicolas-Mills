local ReplicatedStorage = game:GetService("ReplicatedStorage") 

script.Parent.MouseButton1Click:Connect(function() -- activate when clicked 
  -- reset player values 
	local v = script.Parent.Parent.Parent.Parent 
	v:WaitForChild("PersistentValues").Lives.Value = 0 
	v.TeamColor = BrickColor.new("Institutional white") 
	v:WaitForChild("PersistentValues").Character.Value = "" 
	v:WaitForChild("PersistentValues").Map.Value = "" 
	v:WaitForChild("PersistentValues").Gamemode.Value = "" 
	v:WaitForChild("PersistentValues").Team.Value = "" 
	v.Character.Humanoid.Health = 0 
	ReplicatedStorage.MatchEnd:FireClient(v) -- end the players match 
end) 
