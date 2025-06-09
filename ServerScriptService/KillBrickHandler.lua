local killBrickFolder = game.Workspace:FindFirstChild("Kill brick")

if not killBrickFolder then
	warn("Kill brick folder not found!")
	return
end

local function NewsVanKB(part)
	if not part:IsA("MeshPart") then return end
	
	part.Touched:Connect(function(hit)
		
		local character = hit.Parent
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = 0
		end
	end)
end

local function applyKillEffect(part)
	if not part:IsA("BasePart") then return end

	part.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = 0
		end
	end)
end


local function makeSpinningKillBrick(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			part.CFrame = part.CFrame * CFrame.Angles(0, math.rad(15), 0)
			wait()
		end
	end)()
end

local function makeVerticalMovingKillBrick(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.6, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.6, 0)
				wait()
			end
		end
	end)()
end

local function makeMovingDice(part)
	if not part:IsA("UnionOperation") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 100 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.7, 0)
				wait()
			end
			for i = 1, 100 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.7, 0)
				wait()
			end
		end
	end)()
end

local function makeHorizontalMovingKillBrick(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.5, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, .5, 0)
				wait()
			end
		end
	end)()
end

local function makeZigZagMovingPart(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			
			for i = 1, 80 do
				local direction = (i % 2 == 0) and 10 or -10
				part.CFrame = part.CFrame * CFrame.new(direction, -0.5, 0) 
				wait(0.02)
			end

			
			for i = 1, 80 do
				local direction = (i % 2 == 0) and 10 or -10
				part.CFrame = part.CFrame * CFrame.new(direction, 0.5, 0) 
				wait(0.02)
			end
		end
	end)()
end

local function makeSlowerHorizontalMovingKillBrick(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 210 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.3, 0)
				wait()
			end
			for i = 1, 210 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.3, 0)
				wait()
			end
		end
	end)()
end

local function makeMovingLaser(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 100 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.8, 0)
				wait()
			end
			for i = 1, 100 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.8, 0)
				wait()
			end
		end
	end)()
end

local function makeMovingLazer(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 190 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.8, 0)
				wait()
			end
			for i = 1, 190 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.8, 0)
				wait()
			end
		end
	end)()
end

local function createMovingLazer(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.8, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.8, 0)
				wait()
			end
		end
	end)()
end

local function createlaser(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 30 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.7, 0)
				wait()
			end
			for i = 1, 30 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.7, 0)
				wait()
			end
		end
	end)()
end 

local function createlaser5(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -0.5, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.5, 0)
				wait()
			end
		end
	end)()
end 

local function createlaser6(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -.9, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, 0.9, 0)
				wait()
			end
		end
	end)()
end 

local function createlaser7(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, -3, 0)
				wait()
			end
			for i = 1, 50 do
				part.CFrame = part.CFrame * CFrame.new(0, 3, 0)
				wait()
			end
		end
	end)()
end 

local function createlaser8(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 30 do
				part.CFrame = part.CFrame * CFrame.fromEulerAnglesXYZ(0, -0.1, 0)
				wait()
			end
		end
	end)()
end

local function createlaser9(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 30 do
				part.CFrame = part.CFrame * CFrame.fromEulerAnglesXYZ(0, 0.080, 0)
				wait()
			end
		end
	end)()
end 

local function createlaser10(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 35 do
				part.CFrame = part.CFrame * CFrame.new(0, -1, 0)
				wait()
			end
			for i = 1, 35 do
				part.CFrame = part.CFrame * CFrame.new(0, 1, 0)
				wait()
			end
		end
	end)()
end
local function createlaser11(part)
	if not part:IsA("BasePart") then return end

	applyKillEffect(part)

	coroutine.wrap(function()
		while true do
			for i = 1, 13 do
				part.CFrame = part.CFrame * CFrame.new(0, -2, 0)
				wait()
			end
			for i = 1, 13 do
				part.CFrame = part.CFrame * CFrame.new(0, 2, 0)
				wait()
			end
		end
	end)()
end 

for _, obj in pairs(killBrickFolder:GetChildren()) do
	if obj:IsA("BasePart") or obj:IsA("MeshPart") then
		if obj.Name == "Spinning kill brick" then
			makeSpinningKillBrick(obj)
		elseif obj.Name == "Horizontal Moving KB" then
			makeHorizontalMovingKillBrick(obj)
		elseif obj.Name == "Slower Horizontal Moving KB" then
			makeSlowerHorizontalMovingKillBrick(obj)
		elseif obj.Name == "Vertical Horizontal Moving KB" then
			makeVerticalMovingKillBrick(obj)
		elseif obj.Name == "NewsVan" then
			NewsVanKB(obj)
		elseif obj.Name == "ZigZagPart" then
			makeZigZagMovingPart(obj)
		elseif obj.Name == "Dice" then
			makeMovingDice(obj)
		elseif obj.Name == "Moving Laser" then
			makeMovingLaser(obj)
		elseif obj.Name == "Moving Laser2" then
			makeMovingLazer(obj)
		elseif obj.Name == "Moving Laser3" then
			createMovingLazer(obj)
		elseif obj.Name == "Moving Laser4" then
			createlaser(obj)
		elseif obj.Name == "Moving Laser5" then
			createlaser5(obj)
		elseif obj.Name == "Moving Laser6" then
			createlaser6(obj)
		elseif obj.Name == "Moving Laser7" then
			createlaser7(obj)
		elseif obj.Name == "Moving Laser8" then
			createlaser8(obj)
		elseif obj.Name == "Moving Laser9" then
			createlaser9(obj)
		elseif obj.Name == "Moving Laser10" then
			createlaser10(obj)
		elseif obj.Name == "Moving Laser11" then
		createlaser11(obj)
		else
			applyKillEffect(obj)
		end
	end
end
