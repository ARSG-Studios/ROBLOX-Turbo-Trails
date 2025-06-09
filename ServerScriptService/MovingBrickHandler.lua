local WS = game:GetService("Workspace")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")
local players = game:GetService("Players")

local movingbricksfolder = WS:FindFirstChild("Moving Bricks")
if not movingbricksfolder then
	warn("Moving Bricks Folder not found!")
	return
end

local function makeMovingPart(part)
	if not part:IsA("BasePart") then return end

	local playersOnPart = {}
	local lastPosition = part.Position

	part.Touched:Connect(function(hit)
		local character = hit.Parent
		local player = players:GetPlayerFromCharacter(character)
		if player and character:FindFirstChild("HumanoidRootPart") then
			playersOnPart[player] = character.HumanoidRootPart
		end
	end)

	part.TouchEnded:Connect(function(hit)
		local character = hit.Parent
		local player = players:GetPlayerFromCharacter(character)
		if player then
			playersOnPart[player] = nil
		end
	end)

	rs.Heartbeat:Connect(function()
		local movement = part.Position - lastPosition
		for _, rootPart in pairs(playersOnPart) do
			rootPart.CFrame = rootPart.CFrame + movement
		end
		lastPosition = part.Position
	end)

	local function movePart(targetPosition, duration)
		local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local tween = ts:Create(part, tweenInfo, {Position = targetPosition})
		tween:Play()
		tween.Completed:Wait()
	end

	coroutine.wrap(function()
		while true do
			movePart(part.Position + Vector3.new(0, 0, -180), 8)
			movePart(part.Position + Vector3.new(0, 0, 180), 8)
		end
	end)()
end

for _, obj in pairs(movingbricksfolder:GetChildren()) do
	if obj:IsA("BasePart") or obj:IsA("MeshPart") then
		if obj.Name == "Moving Brick" then
			makeMovingPart(obj)
		end
	end
end
