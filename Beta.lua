getgenv().Skibidi = {

	["Chat"] = {

		"ORG On Top"

	},

	["Misc"] = {

		["Click Delay"] = 0.15,

		["Enable Lock Bounty"] = false,

		["Lock Bounty"] = {

			0,

			300000000

		},

		["Lock Camera"] = false,

		["Enable Cam Farm"] = false,

		["White Screen"] = false,

		["FPS Boost"] = false,

		["Tween"] = true,

		["Random & Store Fruit"] = false

	}

}

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then

	if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then

		if getgenv().Setting["TeamMode"] == "Marines" then

			for v23, v24 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Marines"].Frame.TextButton.Activated)) do

				for v25, v26 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do

					v26:Fire()

				end

				v24.Function()

			end

		else

			for v27, v28 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container["Pirates"].Frame.TextButton.Activated)) do

				for v29, v30 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do

					v30:Fire()

				end

				v28.Function()

			end

		end

	end

end

getgenv().AutoRejoin = true

spawn(function()

	while wait() do

		if getgenv().AutoRejoin then

			getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(

                    function(v31)

				if v31.Name == "ErrorPrompt" and v31:FindFirstChild("MessageArea") and v31.MessageArea:FindFirstChild("ErrorFrame") then

					game:GetService("TeleportService"):Teleport(game.PlaceId)

				end

			end)

		end

	end

end)

repeat

	task.wait()

until game:IsLoaded()

repeat

	task.wait()

until game.Players

repeat

	task.wait()

until game.Players.LocalPlayer

repeat

	task.wait()

until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

repeat

	task.wait()

until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");





local v0 = game.Players

local v1 = v0.LocalPlayer



if getgenv().Skibidi.Misc["Random & Store Fruit"] then

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")

	for v32, v33 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do

		if v33:IsA("Tool") and string.find(v33.Name, "Fruit") then

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v33:GetAttribute("OriginalName"), v33)

		end

	end

	for v34, v35 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do

		if v35:IsA("Tool") and string.find(v35.Name, "Fruit") then

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v35:GetAttribute("OriginalName"), v35)

		end

	end

end



if getgenv().Skibidi.Misc["Enable Lock Bounty"] and not (v1.leaderstats["Bounty/Honor"].Value > tonumber(getgenv().Skibidi.Misc["Lock Bounty"][1])) or not (v1.leaderstats["Bounty/Honor"].Value < tonumber(getgenv().Skibidi.Misc["Lock Bounty"][2])) then

	v1:Kick("Lock Bounty")

end



local v2 = game:GetService("Workspace")



v1_ = {}

for v36, v37 in pairs(v2.NPCs:GetChildren()) do

	if string.find(string.lower(v37.Name), "home point") then

		table.insert(v1_, v37:GetModelCFrame())

	end

end

for v38, v39 in pairs(getnilinstances()) do

	if string.find(string.lower(v39.Name), "home point") then

		table.insert(v1_, v39:GetModelCFrame())

	end

end

local v3 = game.PlaceId

if v3 == 2753915549 then

	v2_ = true

	v3_ = {

		Vector3.new(- 7894.6201171875, 5545.49169921875, - 380.246346191406),

		Vector3.new(- 4607.82275390625, 872.5422973632812, - 1667.556884765625),

		Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),

		Vector3.new(3876.280517578125, 35.10614013671875, - 1939.3201904296875)

	}

elseif v3 == 4442272183 then

	v4_ = true

	v3_ = {

		Vector3.new(- 288.46246337890625, 306.130615234375, 597.9988403320312),

		Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),

		Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),

		Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422)

	}

elseif v3 == 7449423635 then

	v5_ = true

	v3_ = {

		Vector3.new(- 5058.77490234519, 314.5155029297924, - 3155.88330079218),

		Vector3.new(5756.83740234375, 610.4240112304688, - 253.9253692627321),

		Vector3.new(- 12463.8740234375, 374.9144592287017, - 7523.77392579431),

		Vector3.new(28282.5704095, 14896.8505859375, 105.1042709351036),

		Vector3.new(- 11993.580079045, 334.7812805176547, - 8844.1826173214),

		Vector3.new(5314.58204105, 25.419387817383522, - 125.94227600143541)

	}

end

function v6_(v40)

	local v41 = v40.Position

	local v42, v43 = Vector3.new(0, 0, 0), math.huge

	for v44, v45 in pairs(v3_) do

		if (v45 - v41).Magnitude < v43 and v42 ~= v45 then

			v42, v43 = v45, (v45 - v41).Magnitude

		end

	end

	return v42

end 

function v7_(v46)

	if v1.Character:FindFirstChild("PartTele") then

		v1.Character.PartTele.CFrame = CFrame.new(v1.Character.PartTele.CFrame.X, 1000, v1.Character.PartTele.CFrame.Z)

		task.wait(0.5)

		if v8_() then

			return

		end

		v1.Character.PartTele.CFrame = v46

		task.wait(0.5)

		v1.Character.PrimaryPart.CFrame = v46

		v1.Character:WaitForChild("Humanoid"):ChangeState(15)

		task.wait(1)

		repeat

			task.wait(1.5)

		until v1.Character:FindFirstChild("Humanoid") and v1.Character.Humanoid.Health <= 0

		repeat

			task.wait()

			if v1.Character:FindFirstChild("PartTele") then

				v1.Character.PartTele.CFrame = v46

			end

			if v1.Character:FindFirstChild("PrimaryPart") then

				v1.Character.PrimaryPart.CFrame = v46

			end

		until v1.Character:FindFirstChild("Humanoid") and v1.Character.Humanoid.Health > 0

	end

end

function v9_(v47)

	v47 = Vector3.new(v47.X, v47.Y, v47.Z)

	local v48, v49 = nil, math.huge

	for v50, v51 in pairs(v1_) do

		if (v51.p - v47).Magnitude < v49 then

			v48 = v51

			v49 = (v51.p - v47).Magnitude

		end

	end

	return v48

end

function v10_(v52)

	game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack({

		"requestEntrance",

		v52

	}))

	if v1.Character:FindFirstChild("PartTele") then

		v1.Character.PartTele.CFrame = v11_(v1).CFrame

	end

	task.wait(0.01)

end

function v11_(v53)

	if not v53 then

		return

	end

	return v53.Character:WaitForChild("HumanoidRootPart", 9) 

end 

function v12_(v54, v55)

	if not v55 then

		v55 = v1.Character.PrimaryPart.CFrame

	end

	return (Vector3.new(v54.X, 0, v54.Z) - Vector3.new(v55.X, 0, v55.Z)).Magnitude 

end 

function v8_()

	return v1.PlayerGui.Main.InCombat.Visible and v1.PlayerGui.Main.InCombat.Text and (string.find(string.lower(v1.PlayerGui.Main.InCombat.Text), "risk"))

end 

local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local block = Instance.new("Part", workspace)

block.Size = Vector3.new(1, 1, 1)

block.Name = "player platform ............."

block.Anchored = true

block.CanCollide = false

block.CanTouch = false

block.Transparency = 1



local blockfind = workspace:FindFirstChild(block.Name)

if blockfind and blockfind ~= block then

	blockfind:Destroy()

end

getgenv().Tween = true

task.spawn(function()

	repeat

		task.wait(0)

	until Player.Character and Player.Character.PrimaryPart

	block.CFrame = Player.Character.PrimaryPart.CFrame

	while task.wait(0) do

		pcall(function()

			if getgenv().Tween then

				if block and block.Parent == workspace then

					local plrPP = Player.Character and Player.Character.PrimaryPart

					if plrPP and (plrPP.Position - block.Position).Magnitude <= 200 then

						plrPP.CFrame = block.CFrame

					else

						block.CFrame = plrPP.CFrame

					end

				end

				local plrChar = Player.Character

				if plrChar then

					for _, part in pairs(plrChar:GetChildren()) do

						if part:IsA("BasePart") then

							part.CanCollide = false

						end

					end

					if plrChar:FindFirstChild("Stun") and plrChar.Stun.Value ~= 0 then

						plrChar.Stun.Value = 0

					end

					if plrChar:FindFirstChild("Busy") and plrChar.Busy.Value then

						plrChar.Busy.Value = false

					end

				end

			else

				local plrChar = Player.Character

				if plrChar then

					for _, part in pairs(plrChar:GetChildren()) do

						if part:IsA("BasePart") then

							part.CanCollide = true

						end

					end

				end

			end

		end)

	end

end)



function v13_(v56)

	if not v56 then

		return

	end

	v1.Character:WaitForChild("HumanoidRootPart", 9)

	v1.Character:WaitForChild("Head", 9)

	if not v1.Character.HumanoidRootPart:FindFirstChild("Hold") then

		local v57 = Instance.new("BodyVelocity", v1.Character.HumanoidRootPart)

		v57.Name = "Hold"

		v57.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

		v57.Velocity = Vector3.new(0, 0, 0)

	end

	TeleportPos = v56.p

	local plrPP = Player.Character and Player.Character.PrimaryPart

	if not plrPP then

		return

	end

	local Distance = (plrPP.Position - v56.p).Magnitude

	if not v1.Character:FindFirstChild("PartTele") then

		local v58 = Instance.new("Part", v1.Character)

		v58.Size = Vector3.new(10, 1, 10)

		v58.Name = "PartTele"

		v58.Anchored = true

		v58.Transparency = 1

		v58.CanCollide = false

		v58.CFrame = v11_(v1).CFrame

		v58:GetPropertyChangedSignal("CFrame"):Connect(function()

			task.wait(0.01)

			v11_(v1).CFrame = v58.CFrame

		end)

	end

	v14_ = v6_(v56)

	v15_ = v9_(v56)

	v16_ = v11_(v1).CFrame

	v17_ = v12_(v16_, v56)

	if v12_(v14_, v56) < v12_(v56) and v12_(v14_) > 500 then

		return v10_(v14_)

	end

	if not v8_() and v12_(v56) - v12_(v15_, v56) > 1000 and v12_(v15_) > 1000 then

		return v7_(v15_)

	end

	if v1.Character:FindFirstChild("Humanoid") and v1.Character.Humanoid:FindFirstChild("Sit") and v1.Character.Humanoid.Sit == true then

		v1.Character.Humanoid.Sit = false

	end

	if v17_ <= 150 then

		block.CFrame = v56

	else

		v18_ = game:GetService("TweenService"):Create(block, TweenInfo.new(v17_ / 350, Enum.EasingStyle.Linear), {

			CFrame = v56

		})

		v18_:Play()

	end

end

--// Equip

function v19_(v59)

	local v60 = game.Players.LocalPlayer

	local v61 = v60.Character or v60.CharacterAdded:Wait()

	for v62, v63 in pairs(v60.Backpack:GetChildren()) do

		if tostring(v63.ToolTip) == "" then

			v63.Parent = v61

		end

		if v63:IsA("Tool") and v63.ToolTip == v59 then

			local v64 = v61:FindFirstChildOfClass("Humanoid")

			if v64 and not v64:IsDescendantOf(v63) then

				if not game.Players.LocalPlayer.Character:FindFirstChild(v63.Name) then

					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v63)

					return v63

				end

			end

		end

	end 

end

--// Attack

v20_ = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

v21_ = debug.getupvalues(v20_)[2]

spawn(function()

	game:GetService("RunService").RenderStepped:Connect(function()

		if typeof(v21_) == "table" then

			pcall(function()

				local v65 = v22_

				if v65 and getgenv().Skibidi.Misc["Lock Camera"] then

					local v66 = v65.Character

					if v66 then

						game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, v66.HumanoidRootPart.Position)

					end

				end

				v21_.activeController.hitboxMagnitude = 60

				v21_.activeController.active = false

				v21_.activeController.timeToNextBlock = 0

				v21_.activeController.focusStart = 1655503339.0980349

				v21_.activeController.increment = 1

				v21_.activeController.blocking = false

				v21_.activeController.attacking = false

				v21_.activeController.humanoid.AutoRotate = true

			end)

		end

	end)

end)

function v23_()

	local v67 = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))

	local v68 = v67[2]

	local v69 = v68.activeController

	local v70 = v69.blades[1]

	if not v70 then

		return v70

	end

	while v70 ~= nil and v70.Parent ~= game.Players.LocalPlayer.Character do

		v70 = v70.Parent

	end

	return v70

end

function v24_()

	local v71 = debug.getupvalues(require(v1.PlayerScripts.CombatFramework))

	local v72 = v71[2]

	local v73 = v72.activeController

	for v74 = 1, 1 do

		if v73 ~= nil then

			local v75 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(

            v1.Character, {

				v1.Character.HumanoidRootPart

			}, 60)

			local v76 = {}

			local v77 = {}

			for v78, v79 in pairs(v75) do

				if v79.Parent:FindFirstChild("HumanoidRootPart") and not v77[v79.Parent] then

					table.insert(v76, v79.Parent.HumanoidRootPart)

					v77[v79.Parent] = true

				end

			end

			v75 = v76

			if # v75 > 0 then

				local v80 = debug.getupvalue(v73.attack, 5)

				local v81 = debug.getupvalue(v73.attack, 6)

				local v82 = debug.getupvalue(v73.attack, 4)

				local v83 = debug.getupvalue(v73.attack, 7)

				local v84 = (v80 * 798405 + v82 * 727595) % v81

				local v85 = v82 * 798405

				(function()

					v84 = (v84 * v81 + v85) % 1099511627776

					v80 = math.floor(v84 / v81)

					v82 = v84 - v80 * v81

				end)()

				v83 = v83 + 1

				debug.setupvalue(v73.attack, 5, v80)

				debug.setupvalue(v73.attack, 6, v81)

				debug.setupvalue(v73.attack, 4, v82)

				debug.setupvalue(v73.attack, 7, v83)

				pcall(function()

					for v86, v87 in pairs(v73.animator.anims.basic) do

						v87:Play()

					end

				end)

				if v1.Character:FindFirstChildOfClass("Tool") and v73.blades and v73.blades[1] then

					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(v23_()))

					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(v84 / 1099511627776 * 16777215), v83)

					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", v75, v74, "")

				end

			end

		end

	end

end

--// Use Skill

function v25_(v88, v89)

	pcall(function()

		game:GetService("VirtualInputManager"):SendKeyEvent(true, v88, false, game.Players.LocalPlayer.Character.HumanoidRootPart)

		task.wait(v89)

		game:GetService("VirtualInputManager"):SendKeyEvent(false, v88, false, game.Players.LocalPlayer.Character.HumanoidRootPart)

	end)

end

function v26_()

	game:GetService("VirtualUser"):CaptureController()

	game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1))

end

local v5 = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))

local v6 = getupvalues(v5)[2]

local v7 = Instance.new("Animation")

local function v8()

	local v90 = v6.activeController

	local v91 = v90.blades[1]

	if not v91 then

		return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name

	end

	pcall(

        function()

		while v91.Parent ~= game.Players.LocalPlayer.Character do

			v91 = v91.Parent

		end

	end)

	if not v91 then

		return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name

	end

	return v91

end

local function v9()

	if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then

		return nil

	end

	local v92 = v6.activeController

	v92.hitboxMagnitude = 600

	if v92 and v92.equipped then

		for v93 = 1, 1 do

			local v94 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character, {

				game.Players.LocalPlayer.Character.HumanoidRootPart

			}, 120)

			if # v94 > 0 then

				local v95 = debug.getupvalue(v92.attack, 5)

				local v96 = debug.getupvalue(v92.attack, 6)

				local v97 = debug.getupvalue(v92.attack, 4)

				local v98 = debug.getupvalue(v92.attack, 7)

				local v99 = (v95 * 798405 + v97 * 727595) % v96

				local v100 = v97 * 798405

				(function()

					v99 = (v99 * v96 + v100) % 1099511627776

					v95 = math.floor(v99 / v96)

					v97 = v99 - v95 * v96

				end)()

				v98 = v98 + 1

				debug.setupvalue(v92.attack, 5, v95)

				debug.setupvalue(v92.attack, 6, v96)

				debug.setupvalue(v92.attack, 4, v97)

				debug.setupvalue(v92.attack, 7, v98)

				if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and v92.blades and v92.blades[1] then

					v7.AnimationId = v92.anims.basic[2]

					v92.humanoid:LoadAnimation(v7):Play(1, 1)

					game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(v99 / 1099511627776 * 16777215), v98)

					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(v8()))

					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", v94, 2, "")

				end

			end

		end

	end

end



v27_ = 0  

v28_ = tick()

spawn(function()

	local v101 = getrawmetatable(game)

	local v102 = v101.__namecall

	setreadonly(v101, false)

	v101.__namecall = newcclosure(function(v103, ...)

		local v104 = getnamecallmethod()

		local v105 = {

			...

		}

		if v104 == 'FireServer' and v103.Name == "RigControllerEvent" and v105[1] == "hit" then

			v27_ = v27_ + 1

			v28_ = tick()

		end

		return v102(v103, unpack(v105))

	end)

end)



local function v10()

	pcall(function()

		v9()

	end)

end



local function v11()

	if v27_ <= 70 then

		v10()

		v27_ = v27_ + 1

	elseif v27_ >= 70 then

		v10()

		task.wait(.5)

	end

end

task.spawn(function()

	while task.wait(0.5) do

		v11()

	end 

end)

function v29_(v106)

	local v107 = game.Players.LocalPlayer.PlayerGui.Main.Skills

	local v108 = {}

	for v109, v110 in pairs(v1.Character:GetChildren()) do

		if v110:IsA("Tool") then

			table.insert(v108, v110)

		end

	end

	for v111, v112 in pairs(v1.Backpack:GetChildren()) do

		if v112:IsA("Tool") then

			table.insert(v108, v112)

		end

	end

	for v113, v114 in pairs(v108) do 

		if v114.ToolTip and v106.Inventory[v114.ToolTip] and v106.Inventory[v114.ToolTip].Enable then

            -- warn(1)

			for v115, v116 in pairs(v106.Inventory[v114.ToolTip]) do

				if v115 ~= "Enable" and v116.Enable then

					if v107:FindFirstChild(v114.Name) and v107[v114.Name]:FindFirstChild(v115) then

						local v117 = v107[v114.Name][v115]

						if v117.Cooldown.AbsoluteSize.X <= 0 then

							return {

								v115,

								v116,

								v114.ToolTip

							}

						end

					else

						v19_(v114.ToolTip)

					end

				end

			end

		end

	end

	return false

end

--// Fps Boost

if getgenv().Skibidi.Misc["FPS Boost"] then

	for v118, v119 in pairs(game:GetService("Workspace"):GetDescendants()) do

		pcall(function()

			if v119.Transparency and v119.Parent ~= game.Players.LocalPlayer.Character then

				v119.Transparency = 1

			end

		end)

	end

end

--// Aim

v30_ = true

spawn(function()

	local v120 = getrawmetatable(game)

	local v121 = v120.__namecall

	setreadonly(v120, false)

	v120.__namecall = newcclosure(function(...)

		local v122 = getnamecallmethod()

		local v123 = {

			...

		}

		if tostring(v122) == "FireServer" then

			if tostring(v123[1]) == "RemoteEvent" then

				if tostring(v123[2]) ~= "true" and tostring(v123[2]) ~= "false" then

					if v30_ and v31_ ~= nil then

						v123[2] = v31_.Position

						return v121(unpack(v123))

					end

				end

			end

		end

		return v121(...)

	end)

end)

--// Main Target

function v32_(v124)

if not v8_() then

	local v125 = game.PlaceId;

	local v126 = {}

	local v127 = ""

	local v128 = os.date("!*t").hour;

	local v129 = false;

	local function v130()

		local v132;

		if v127 == "" then

			v132 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v125 .. "/servers/Public?sortOrder=Asc&limit=100"))

		else

			v132 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v125 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. v127))

		end;

		local v133 = ""

		if v132.nextPageCursor and v132.nextPageCursor ~= "null" and v132.nextPageCursor ~= nil then

			v127 = v132.nextPageCursor

		end;

		local v134 = 0;

		for v135, v136 in pairs(v132.data) do

			local v137 = true;

			v133 = tostring(v136.id)

			if tonumber(v136.maxPlayers) > tonumber(v136.playing) then

				for v138, v139 in pairs(v126) do

					if v134 ~= 0 then

						if v133 == tostring(v139) then

							v137 = false

						end

					else

						if tonumber(v128) ~= tonumber(v139) then

							local v140 = pcall(function()

								v126 = {}

								table.insert(v126, v128)

							end)

						end

					end;

					v134 = v134 + 1

				end;

				if v137 == true then

					table.insert(v126, v133)

					wait(0.1)

					pcall(function()

						wait(0.1)

						game:GetService("TeleportService"):TeleportToPlaceInstance(v125, v133, game.Players.LocalPlayer)

					end)

					wait(4)

				end

			end

		end

	end;

	local function v131()

		while wait(.5) do

			pcall(function()

				v130()

				if v127 ~= "" then

					v130()

				end

			end)

		end

	end;

	v131()

	end

end

v33_ = {} 

table.insert(v33_, v1)

function v34_()

	v35_ = {}

	for v141, v142 in pairs(game.Players:GetPlayers()) do

		if v142 and v142.Team and v142.Character and v142.Character:FindFirstChild("Head") and string.find(string.lower(tostring(v142.Team)), "es") and (tostring(v1.Team) == "Pirates" or tostring(v142.Team) == "Pirates") and v1.Data.Level.Value - v142.Data.Level.Value < 300 and v12_(v9_(v142.Character.HumanoidRootPart.CFrame), v142.Character.HumanoidRootPart.CFrame) < 3500 and not ({["Portal-Portal"] = true,["Leopard-Leopard"] = true,["Buddha-Buddha"] = true,["Kitsune-Kitsune"] = true})[tostring(v142.Data.DevilFruit.Value)] and not table.find(v33_, v142) and not table.find(v35_, v142) and ((getgenv().Setting["Skip Player V4"] and not (v142.Backpack:FindFirstChild("Awakening") or v142.Character:FindFirstChild("Awakening"))) or not getgenv().Setting["Skip Player V4"]) then

			table.insert(v35_, v142)

		end

	end

	return v35_

end

function v36_()

	v37_ = math.huge

	v38_ = nil

	for v143, v144 in pairs(v34_()) do

		if v144 and v144.Parent and v144.Character and v144.Character:FindFirstChild("HumanoidRootPart") then

			if v1 and v1.Parent and v1.Character and v1.Character:FindFirstChild("HumanoidRootPart") then

				if v12_(v144.Character.HumanoidRootPart.CFrame, v1.Character.HumanoidRootPart.CFrame) < v37_ then

					v38_ = v144

					v37_ = v12_(v144.Character.HumanoidRootPart.CFrame, v1.Character.HumanoidRootPart.CFrame)

				end

			end

		end

	end

	if v38_ ~= nil then

		table.insert(v33_, v38_)

		v22_ = v38_

	else

		v39_ = true

		v32_()

	end

end

function v40_(v145)

	for v146 = 1, 5, 1 do

		local v147 = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island" .. v146)

		if v147 and v11_(v145, v147:GetModelCFrame()) < 3000 then

			return true

		end

	end

	return false

end 

v41_ = {}

function v42_(v148)

	for v149, v150 in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do

		if v150 and v150.Text and string.find(string.lower(v150.Text), v148) and not table.find(v41_, v150) then

			table.insert(v41_, v150)

			return true

		end

	end

	return false

end

v43_ = 0

function v44_()

	if not v22_ then

		return v36_()

	end

	if not v22_.Parent then

		return v36_()

	end

	if not v22_.Character then

		return v36_()

	end

	if v22_.Character.Humanoid.Health <= 0 then

		return v36_()

	end

	if (v42_("died") or v42_("tử trận") or v42_("safe") or v42_("an toàn")) and v22_:DistanceFromCharacter(v1.Character:WaitForChild("Head", 9).Position) <= 15 then

		return v36_()

	end

	if v40_(v22_) then

		return v36_()

	end

	if v1.PlayerGui.Main.BottomHUDList.SafeZone.Visible and v22_:DistanceFromCharacter(v1.Character:WaitForChild("Head", 9).Position) <= 15 then

		return v36_()

	end

	if v22_:DistanceFromCharacter(v1.Character:WaitForChild("Head").Position) < 300 then

		if os.time() - v43_ > 100 then

			if not v8_() then

				return v36_()

			end

		end

	else

		v43_ = os.time()

	end

	return true

end

v45_ = getgenv().Skibidi.Misc["Enable Cam Farm"]

if v45_ == false then

	game.Players.LocalPlayer.CameraMinZoomDistance = 127

	game.Players.LocalPlayer.CameraMaxZoomDistance = 127

	game.Players.LocalPlayer.CameraMaxZoomDistance = 127

	game.Players.LocalPlayer.CameraMinZoomDistance = 0

else

	v45_ = true

	game.Players.LocalPlayer.CameraMinZoomDistance = 0

	game.Players.LocalPlayer.CameraMaxZoomDistance = 0

	game.Players.LocalPlayer.CameraMaxZoomDistance = 127

	game.Players.LocalPlayer.CameraMinZoomDistance = 0

end



local v12 = "RinXHubAutoBounty"

local v13 = v12 .. "/Config.json"

function v46_()

	local v151 = game:GetService("HttpService")

	local v152 = v151:JSONEncode(_G)

	if true then

		if isfolder(v12) then

			if isfile(v13) then

				writefile(v13, v152)

			else

				writefile(v13, v152)

			end

		else

			makefolder(v12)

		end

	end

end

function v47_()

	local v153 = game:GetService("HttpService")

	if isfolder(v12) then

		if isfile(v13) then

			_G = v153:JSONDecode(readfile(v13))

		end

	end

end

getgenv().Total = 0

getgenv().Time = 0

v47_()

v48_ = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].value

v49_ = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].value - v48_

v50_ = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].value - v48_

v51_ = tick() - getgenv().Time

v52_ = getgenv().Total 

v53_ = getgenv().Total

function v54_(v154)

	local v155 = tick() - v154

	local v156 = math.floor(v155 / 3600)

	local v157 = math.floor((v155 % 3600) / 60)

	local v158 = math.floor(v155 % 60)

	getgenv().Time = v155

	local v159 = string.format("%dh:%dm:%ds", v156, v157, v158)

	return v159

end

v55_ = tick()

function v54_(v160)

	local v161 = tick() - v160

	local v162 = math.floor(v161 / 3600)

	local v163 = math.floor((v161 % 3600) / 60)

	local v164 = math.floor(v161 % 60)

	local v165 = string.format("%dh:%dm:%ds", v162, v163, v164)

	return v165

end

spawn(function()

	while task.wait() do

		if v44_() then

			if v22_:DistanceFromCharacter(v11_(v1).Position) <= 30 then

				local v166 = v29_(getgenv().Setting)

				if v166 then

					v19_(v166[3])

					v25_(v166[1], v166[2]["Holding Time"])

				end

			end

		end

	end

end)

local v14 = 15

local v15 = 0

function v56_(v167)

	v15 = v15 + 20

	return v167 + Vector3.new(math.sin(math.rad(v15)) * v14, 20, math.cos(math.rad(v15)) * v14)

end

function v57_()

	for v168, v169 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do

		if v169:IsA("LocalScript") then

			if v169.Name == "General" or v169.Name == "Shiftlock" or v169.Name == "FallDamage" or v169.Name == "4444" or v169.Name == "CamBob" or v169.Name == "JumpCD" or v169.Name == "Looking" or v169.Name == "Run" then

				v169:Destroy()

			end

		end

	end

	for v170, v171 in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do

		if v171:IsA("LocalScript") then

			if v171.Name == "RobloxMotor6DBugFix" or v171.Name == "Clans" or v171.Name == "Codes" or v171.Name == "CustomForceField" or v171.Name == "MenuBloodSp" or v171.Name == "PlayerList" then

				v171:Destroy()

			end

		end

	end

end

v57_()

spawn(function()

	while task.wait() do

		if v39_ then

			v13_(CFrame.new(0, 9000, 0))

		else

			if v22_ and v22_.Character and v22_.Character:FindFirstChild("Humanoid") and v22_.Character.Humanoid.Health > 4 then

				if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then

					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")

				end

				if (not (game.Players.LocalPlayer.Character:FindFirstChild("HasBuso"))) then

					local v172 = game.ReplicatedStorage

					v172.Remotes.CommF_:InvokeServer("Buso")

				end

				if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then

					v58_ = true

				else

					game:service("VirtualUser"):CaptureController()

					game:service("VirtualUser"):SetKeyDown("0x65")

					game:service("VirtualUser"):SetKeyUp("0x65")

				end

				if tonumber(v1.Character.Humanoid.Health) > 0 and (tonumber(v1.Character.Humanoid.Health) < getgenv().Setting["Safe Health"][1] or (v59_ and tonumber(v1.Character.Humanoid.Health) < getgenv().Setting["Safe Health"][2])) then

					v59_ = true

					v13_(v11_(v22_).CFrame + Vector3.new(0, math.random(9999, 99999), 0))

				else

					v59_ = false

					local v173 = v11_(v22_).CFrame + (v11_(v22_).Velocity / 2)

					if v173.Y < 10 then

						v173 = CFrame.new(v173.X, 10, v173.Z)

					end

					v31_ = v11_(v22_).CFrame

					if v22_.Character:FindFirstChild("Busy") and v22_.Character.Busy.Value then

						v13_(v56_(v31_))

					else

						if v22_.Character:FindFirstChild("Humanoid") and v22_.Character.Humanoid.MoveDirection.Magnitude > 0 then

							v13_(v173 + Vector3.new(1, 4, 1))

							if (not v1.Character:FindFirstChild("Busy") or not v1.Character.Busy.Value) and not game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible then

								v26_()

							end

						else

							v13_(v31_ + Vector3.new(1, 4, 1))

						end

						task.wait(0.1)

					end

				end

			end

		end

	end

end)



local G2L = {};



-- StarterGui.BountyGui

G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));

G2L["1"]["Name"] = [[BountyGui]];

G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;



-- StarterGui.BountyGui.Frame

G2L["2"] = Instance.new("Frame", G2L["1"]);

G2L["2"]["BorderSizePixel"] = 0;

G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["2"]["ClipsDescendants"] = true;

G2L["2"]["Size"] = UDim2.new(0, 386, 0, 265);

G2L["2"]["Position"] = UDim2.new(0.30439, 0, -0.00074, 0);

G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);



-- StarterGui.BountyGui.Frame.UICorner

G2L["3"] = Instance.new("UICorner", G2L["2"]);

G2L["3"]["CornerRadius"] = UDim.new(0.01, 10);



-- StarterGui.BountyGui.Frame.UIStroke

G2L["4"] = Instance.new("UIStroke", G2L["2"]);

G2L["4"]["Thickness"] = 2;



-- StarterGui.BountyGui.Frame.NameHub

G2L["5"] = Instance.new("TextLabel", G2L["2"]);

G2L["5"]["BorderSizePixel"] = 0;

G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["5"]["TextSize"] = 25;

G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["5"]["BackgroundTransparency"] = 1;

G2L["5"]["Size"] = UDim2.new(0, 89, 0, 49);

G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["5"]["Text"] = [[ORG Hub]];

G2L["5"]["Name"] = [[NameHub]];



-- StarterGui.BountyGui.Frame.Nonumber

G2L["6"] = Instance.new("TextLabel", G2L["2"]);

G2L["6"]["BorderSizePixel"] = 0;

G2L["6"]["TextTransparency"] = 0.5;

G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["6"]["TextSize"] = 14;

G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["6"]["BackgroundTransparency"] = 1;

G2L["6"]["Size"] = UDim2.new(0, 23, 0, 21);

G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["6"]["Text"] = [[#1 Auto Bounty]];

G2L["6"]["Name"] = [[Nonumber]];

G2L["6"]["Position"] = UDim2.new(0.18881, 0, 0.11612, 0);



-- StarterGui.BountyGui.Frame.Info

G2L["7"] = Instance.new("Frame", G2L["2"]);

G2L["7"]["BorderSizePixel"] = 0;

G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 75);

G2L["7"]["Size"] = UDim2.new(0, 150, 0, 188);

G2L["7"]["Position"] = UDim2.new(0.04436, 0, 0.20616, 0);

G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["7"]["Name"] = [[Info]];



-- StarterGui.BountyGui.Frame.Info.UICorner

G2L["8"] = Instance.new("UICorner", G2L["7"]);

G2L["8"]["CornerRadius"] = UDim.new(0.01, 10);



-- StarterGui.BountyGui.Frame.Info.Madewith

G2L["9"] = Instance.new("TextLabel", G2L["7"]);

G2L["9"]["BorderSizePixel"] = 0;

G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["9"]["TextSize"] = 14;

G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["9"]["BackgroundTransparency"] = 1;

G2L["9"]["Size"] = UDim2.new(0, 77, 0, 24);

G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["9"]["Text"] = [[Made With Love]];

G2L["9"]["Name"] = [[Madewith]];

G2L["9"]["Position"] = UDim2.new(0.07339, 0, 0.04878, 0);



-- StarterGui.BountyGui.Frame.Info.Version

G2L["a"] = Instance.new("TextLabel", G2L["7"]);

G2L["a"]["BorderSizePixel"] = 0;

G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["a"]["TextSize"] = 14;

G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["a"]["BackgroundTransparency"] = 1;

G2L["a"]["Size"] = UDim2.new(0, 41, 0, 24);

G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["a"]["Text"] = [[V0.1]];

G2L["a"]["Name"] = [[Version]];

G2L["a"]["Position"] = UDim2.new(0.02752, 0, 0.85366, 0);



-- StarterGui.BountyGui.Frame.TimeUI

G2L["b"] = Instance.new("Frame", G2L["2"]);

G2L["b"]["ZIndex"] = -1;

G2L["b"]["BorderSizePixel"] = 0;

G2L["b"]["AutoLocalize"] = false;

G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["b"]["Size"] = UDim2.new(0, 179, 0, 93);

G2L["b"]["Position"] = UDim2.new(0.58345, 0, 0.58293, 0);

G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["b"]["Name"] = [[TimeUI]];



-- StarterGui.BountyGui.Frame.TimeUI.UIStroke

G2L["c"] = Instance.new("UIStroke", G2L["b"]);





-- StarterGui.BountyGui.Frame.TimeUI.UICorner

G2L["d"] = Instance.new("UICorner", G2L["b"]);

G2L["d"]["CornerRadius"] = UDim.new(0.01, 10);



-- StarterGui.BountyGui.Frame.TimeUI.Time elapsed

G2L["e"] = Instance.new("TextLabel", G2L["b"]);

G2L["e"]["BorderSizePixel"] = 0;

G2L["e"]["AutoLocalize"] = false;

G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["e"]["TextSize"] = 14;

G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["e"]["BackgroundTransparency"] = 1;

G2L["e"]["Size"] = UDim2.new(0, 69, 0, 27);

G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["e"]["Text"] = [[Time elapsed: ]];

G2L["e"]["Name"] = [[Time elapsed]];

G2L["e"]["Position"] = UDim2.new(0, 0, 0.0403, 0);



-- StarterGui.BountyGui.Frame.TimeUI.Time

G2L["f"] = Instance.new("TextLabel", G2L["b"]);

G2L["f"]["BorderSizePixel"] = 0;

G2L["f"]["AutoLocalize"] = false;

G2L["f"]["TextTransparency"] = 0.5;

G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["f"]["TextSize"] = 14;

G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["f"]["BackgroundTransparency"] = 1;

G2L["f"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["f"]["Text"] = [[time]];

G2L["f"]["Name"] = [[Time]];

G2L["f"]["Position"] = UDim2.new(0.42658, 0, 0.0403, 0);



-- StarterGui.BountyGui.Frame.TimeUI.Moon

G2L["10"] = Instance.new("TextLabel", G2L["b"]);

G2L["10"]["BorderSizePixel"] = 0;

G2L["10"]["AutoLocalize"] = false;

G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["10"]["TextSize"] = 14;

G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["10"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["10"]["BackgroundTransparency"] = 1;

G2L["10"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["10"]["Text"] = [[Moon:]];

G2L["10"]["Name"] = [[Moon]];

G2L["10"]["Position"] = UDim2.new(-0.08648, 0, 0.17939, 0);



-- StarterGui.BountyGui.Frame.TimeUI.PercentMoon

G2L["11"] = Instance.new("TextLabel", G2L["b"]);

G2L["11"]["BorderSizePixel"] = 0;

G2L["11"]["AutoLocalize"] = false;

G2L["11"]["TextTransparency"] = 0.5;

G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["11"]["TextSize"] = 14;

G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["11"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["11"]["BackgroundTransparency"] = 1;

G2L["11"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["11"]["Text"] = [[Percent]];

G2L["11"]["Name"] = [[PercentMoon]];

G2L["11"]["Position"] = UDim2.new(0.25899, 0, 0.17939, 0);



-- StarterGui.BountyGui.Frame.TimeUI.Bounty/Honor

G2L["12"] = Instance.new("TextLabel", G2L["b"]);

G2L["12"]["BorderSizePixel"] = 0;

G2L["12"]["AutoLocalize"] = false;

G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["12"]["TextSize"] = 14;

G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["12"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["12"]["BackgroundTransparency"] = 1;

G2L["12"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["12"]["Text"] = [[Bounty/honor:]];

G2L["12"]["Name"] = [[Bounty/Honor]];

G2L["12"]["Position"] = UDim2.new(0.04201, 0, 0.31439, 0);



-- StarterGui.BountyGui.Frame.TimeUI.ForBounty

G2L["13"] = Instance.new("TextLabel", G2L["b"]);

G2L["13"]["BorderSizePixel"] = 0;

G2L["13"]["AutoLocalize"] = false;

G2L["13"]["TextTransparency"] = 0.5;

G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["13"]["TextSize"] = 14;

G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["13"]["BackgroundTransparency"] = 1;

G2L["13"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["13"]["Text"] = [[Bounty]];

G2L["13"]["Name"] = [[ForBounty]];

G2L["13"]["Position"] = UDim2.new(0.42658, 0, 0.3103, 0);



-- StarterGui.BountyGui.Frame.TimeUI.Fps

G2L["14"] = Instance.new("TextLabel", G2L["b"]);

G2L["14"]["BorderSizePixel"] = 0;

G2L["14"]["AutoLocalize"] = false;

G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["14"]["TextSize"] = 14;

G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["14"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["14"]["BackgroundTransparency"] = 1;

G2L["14"]["Size"] = UDim2.new(0, 66, 0, 27);

G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["14"]["Text"] = [[Fps:]];

G2L["14"]["Name"] = [[Fps]];

G2L["14"]["Position"] = UDim2.new(-0.12477, 0, 0.45939, 0);



-- StarterGui.BountyGui.Frame.TimeUI.ForFps

G2L["15"] = Instance.new("TextLabel", G2L["b"]);

G2L["15"]["BorderSizePixel"] = 0;

G2L["15"]["AutoLocalize"] = false;

G2L["15"]["TextTransparency"] = 0.5;

G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["15"]["TextSize"] = 14;

G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["15"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["15"]["BackgroundTransparency"] = 1;

G2L["15"]["Size"] = UDim2.new(0, 62, 0, 27);

G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["15"]["Text"] = [[FpsNumber]];

G2L["15"]["Name"] = [[ForFps]];

G2L["15"]["Position"] = UDim2.new(0.25899, 0, 0.4603, 0);



-- StarterGui.BountyGui.Frame.TimeUI.Ping

G2L["16"] = Instance.new("TextLabel", G2L["b"]);

G2L["16"]["BorderSizePixel"] = 0;

G2L["16"]["AutoLocalize"] = false;

G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["16"]["TextSize"] = 14;

G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["16"]["BackgroundTransparency"] = 1;

G2L["16"]["Size"] = UDim2.new(0, 62, 0, 33);

G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["16"]["Text"] = [[Ping:]];

G2L["16"]["Name"] = [[Ping]];

G2L["16"]["Position"] = UDim2.new(-0.09765, 0, 0.5953, 0);



-- StarterGui.BountyGui.Frame.TimeUI.ForPing

G2L["17"] = Instance.new("TextLabel", G2L["b"]);

G2L["17"]["BorderSizePixel"] = 0;

G2L["17"]["AutoLocalize"] = false;

G2L["17"]["TextTransparency"] = 0.5;

G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["17"]["TextSize"] = 14;

G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["17"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["17"]["BackgroundTransparency"] = 1;

G2L["17"]["Size"] = UDim2.new(0, 62, 0, 28);

G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["17"]["Text"] = [[PingNumber]];

G2L["17"]["Name"] = [[ForPing]];

G2L["17"]["Position"] = UDim2.new(0.25899, 0, 0.64268, 0);



-- StarterGui.BountyGui.Frame.HubImage

G2L["18"] = Instance.new("ImageLabel", G2L["2"]);

G2L["18"]["BorderSizePixel"] = 0;

G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 53, 12);

G2L["18"]["Image"] = [[rbxassetid://78028986222008]];

G2L["18"]["Size"] = UDim2.new(0, 100, 0, 100);

G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["18"]["BackgroundTransparency"] = 1;

G2L["18"]["Name"] = [[HubImage]];

G2L["18"]["Position"] = UDim2.new(0.31636, 0, 0.3494, 0);



-- StarterGui.BountyGui.Frame.Discord

G2L["19"] = Instance.new("TextLabel", G2L["2"]);

G2L["19"]["BorderSizePixel"] = 0;

G2L["19"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);

G2L["19"]["TextSize"] = 14;

G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["19"]["BackgroundTransparency"] = 1;

G2L["19"]["Size"] = UDim2.new(0, 78, 0, 13);

G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["19"]["Text"] = [[Discord]];

G2L["19"]["Name"] = [[Discord]];

G2L["19"]["Position"] = UDim2.new(0.37509, 0, 0.04833, 0);



-- StarterGui.BountyGui.Frame.Discordurl

G2L["1a"] = Instance.new("TextLabel", G2L["2"]);

G2L["1a"]["BorderSizePixel"] = 0;

G2L["1a"]["TextTransparency"] = 0.5;

G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["1a"]["TextSize"] = 11;

G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["1a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1a"]["BackgroundTransparency"] = 1;

G2L["1a"]["Size"] = UDim2.new(0, 23, 0, 21);

G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1a"]["Text"] = [[discord.gg/qyBCaQYtW4]];

G2L["1a"]["Name"] = [[Discordurl]];

G2L["1a"]["Position"] = UDim2.new(0.55354, 0, 0.11455, 0);



-- StarterGui.BountyGui.Frame.TopScript

G2L["1b"] = Instance.new("TextLabel", G2L["2"]);

G2L["1b"]["BorderSizePixel"] = 0;

G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1b"]["TextSize"] = 14;

G2L["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["1b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1b"]["BackgroundTransparency"] = 1;

G2L["1b"]["Size"] = UDim2.new(0, 78, 0, 13);

G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1b"]["Text"] = [[Top 1 Script]];

G2L["1b"]["Name"] = [[TopScript]];

G2L["1b"]["Position"] = UDim2.new(0.4134, 0, 0.21143, 0);



-- StarterGui.BountyGui.Frame.Game

G2L["1c"] = Instance.new("TextLabel", G2L["2"]);

G2L["1c"]["BorderSizePixel"] = 0;

G2L["1c"]["TextTransparency"] = 0.5;

G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

G2L["1c"]["TextSize"] = 14;

G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1c"]["BackgroundTransparency"] = 1;

G2L["1c"]["Size"] = UDim2.new(0, 23, 0, 21);

G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1c"]["Text"] = [[Blox Fruit]];

G2L["1c"]["Name"] = [[Game]];

G2L["1c"]["Position"] = UDim2.new(0.5256, 0, 0.281, 0);



-- StarterGui.BountyGui.Frame.LocalScript

G2L["1d"] = Instance.new("LocalScript", G2L["2"]);





-- StarterGui.BountyGui.Frame.TextButton

G2L["1e"] = Instance.new("TextButton", G2L["2"]);

G2L["1e"]["BorderSizePixel"] = 0;

G2L["1e"]["TextSize"] = 20;

G2L["1e"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 75);

G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

G2L["1e"]["Size"] = UDim2.new(0, 72, 0, 68);

G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

G2L["1e"]["Text"] = [[Skip

Player]];

G2L["1e"]["Position"] = UDim2.new(0.65734, 0, 0.27925, 0);



-- StarterGui.BountyGui.Frame.TextButton.UICorner

G2L["1f"] = Instance.new("UICorner", G2L["1e"]);

G2L["1f"]["CornerRadius"] = UDim.new(0.01, 10);



-- StarterGui.BountyGui.Frame.LocalScript

local function C_1d()

local script = G2L["1d"];

	game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.Draggable = true

	game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.Active = true

	game:GetService("RunService").RenderStepped:Connect(function()

		local v175 = game.workspace.DistributedGameTime

		local v176 = v175 % 60

		local v177 = math.floor(v175 / 60 % 60)

		local v178 = math.floor(v175 / 3600)

		game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI.Time.Text = string.format('%.0fh %.0fm %.0fs', v178, v177, v176)

		game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI:FindFirstChild("ForBounty").Text = "$" ..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value

		game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI.ForPing.Text = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()

		game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI.ForFps.Text = workspace:GetRealPhysicsFPS()

		if game.PlaceId == 7449423635 or game.PlaceId == 4442272183 then

			for v180, v181 in pairs(game.Players:GetPlayers()) do

				v61_ = v180

			end

			local v179 = {

				['8'] = "http://www.roblox.com/asset/?id=9709149431", -- 🌕

				['7'] = "http://www.roblox.com/asset/?id=9709149052", -- 🌖

				['6'] = "http://www.roblox.com/asset/?id=9709143733", -- 🌗

				['5'] = "http://www.roblox.com/asset/?id=9709150401", -- 🌘

				['4'] = "http://www.roblox.com/asset/?id=9709135895",  -- 🌑

				['3'] = "http://www.roblox.com/asset/?id=9709139597", -- 🌒

				['2'] = "http://www.roblox.com/asset/?id=9709150086", -- 🌓

				['1'] = "http://www.roblox.com/asset/?id=9709149680", -- 🌔

			};

			if game:GetService("Lighting").Sky.MoonTextureId == v179['1'] then

				v62_ = '🌔'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['2'] then

				v62_ = '🌓'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['3'] then

				v62_ = '🌒'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['4'] then

				v62_ = '🌑'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['5'] then

				v62_ = '🌘'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['6'] then

				v62_ = '🌗'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['7'] then

				v62_ = '🌖'

			elseif game:GetService("Lighting").Sky.MoonTextureId == v179['8'] then

				v62_ = '🌕'

			end

			for v182, v183 in pairs(v179) do

				if game:GetService("Lighting").Sky.MoonTextureId == v183 then

					v63_ = v182 / 8 * 100

				end

			end

			game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI.PercentMoon.Text = v63_ .. "%"

		else

			game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TimeUI.PercentMoon.Text = "For Sea2,Sea3"

		end

	end)

	game.Players.LocalPlayer.PlayerGui.BountyGui.Frame.TextButton.MouseButton1Click:Connect(function()

		v36_()

	end)

	

end;

task.spawn(C_1d);

