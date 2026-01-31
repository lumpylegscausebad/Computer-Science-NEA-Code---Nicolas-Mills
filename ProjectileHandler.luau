-- variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

ReplicatedStorage.Events.Character.ProjectileUsed.OnServerEvent:Connect(function(player, direction, mouseaim, projectile, speed) -- activate when a projectile ability is used
	local Root = player.Character.Core.default -- get the centre of the player
	local bignum = math.huge
	local Orb = projectile:Clone() -- clone the projectile needed
	Orb.Script.Value.Value = player.Name -- prevent the projectile affecting the user
	Orb.CFrame = CFrame.new((Root.CFrame * CFrame.new(0, 0, 0)).Position, mouseaim) -- position the projectile within the player
	Orb.Parent = workspace
	-- create physics forces
	local BodyVelocity = Instance.new("BodyVelocity", Orb)
	BodyVelocity.MaxForce = Vector3.new(bignum, bignum, bignum)
	BodyVelocity.Velocity = CFrame.new(Root.Position, mouseaim).LookVector * speed -- set the projectile in motion based on mouse direction and speed

	task.wait(10)
	if Orb then -- check if the projectile exists
		Orb:Destroy() -- remove projectile
	end
end)
