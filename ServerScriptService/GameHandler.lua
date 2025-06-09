local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BadgeService = game:GetService("BadgeService")
local Workspace = game:GetService("Workspace")

local updateLivesEvent = ReplicatedStorage:WaitForChild("UpdateLives")
local gameOverEvent = ReplicatedStorage:WaitForChild("GameOver")
local flashLivesEvent = ReplicatedStorage:WaitForChild("FlashLives")
local overrideSoundEvent = ReplicatedStorage:WaitForChild("OverrideSound")
local elevatorpart = workspace:WaitForChild("TeleportElevatorpart")

local BadgeID = 3583454071920874
local spawnLocation = Workspace:WaitForChild("SpawnLocation")


elevatorpart.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)

	if elevatorpart.Touched then
		local position = CFrame.new(7766.527, 477.309, -1832.988)
		character.HumanoidRootPart.CFrame = position
	end
end)


local function handleGameOver(player, lives)
	gameOverEvent:FireClient(player)

	local checkpointData = ServerStorage:FindFirstChild("CheckpointData")
	if checkpointData then
		local userIdString = tostring(player.UserId)
		local checkpointValue = checkpointData:FindFirstChild(userIdString)
		if checkpointValue then
			checkpointValue.Value = nil
		end
	end

	player.CharacterAdded:Wait()

	lives.Value = 35
	player:SetAttribute("Lives", 35)
	updateLivesEvent:FireClient(player, lives.Value)

	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	if spawnLocation then
		humanoidRootPart.CFrame = spawnLocation.CFrame + Vector3.new(0, 5, 0)
	end
end

local function handleEndCheckpoint(player, lives)
	BadgeService:AwardBadge(player.UserId, BadgeID)
	handleGameOver(player, lives)
end

local function handleSoundOverride(player, lives)
	if lives.Value <= 1 then
		overrideSoundEvent:FireClient(player, true)
	else
		overrideSoundEvent:FireClient(player, false)
	end
end

Players.PlayerAdded:Connect(function(player)
	local lives = Instance.new("IntValue")
	lives.Name = "Lives"
	lives.Value = 35
	lives.Parent = player
	player:SetAttribute("Lives", lives.Value)

	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.Died:Connect(function()
			lives.Value = lives.Value - 1
			updateLivesEvent:FireClient(player, lives.Value)

			if lives.Value == 1 then
				flashLivesEvent:FireClient(player)
			end

			if lives.Value <= 0 then
				handleGameOver(player, lives)
			end

			handleSoundOverride(player, lives)
		end)
	end)

	local checkpointEnd = Workspace:FindFirstChild("CheckpointEnd")
	if checkpointEnd then
		checkpointEnd.Touched:Connect(function(hit)
			local character = hit.Parent
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid and Players:GetPlayerFromCharacter(character) == player then
				handleEndCheckpoint(player, lives)
			end
		end)
	end
end)
