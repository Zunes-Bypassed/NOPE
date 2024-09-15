local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

-- Tạo TextLabel chung
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
textLabel.Position = UDim2.new(0.25, 0, 0.3, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
textLabel.TextScaled = true
textLabel.TextSize = 36
textLabel.Font = Enum.Font.GothamBold
textLabel.TextStrokeTransparency = 0.2
textLabel.TextTransparency = 1
textLabel.Visible = true
textLabel.Parent = screenGui

-- Tạo tween animation
local function tweenTextLabel(duration, finalTransparency, endPosition)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(textLabel, tweenInfo, {
        TextTransparency = finalTransparency,
        Position = endPosition
    })
    
    tween:Play()
    tween.Completed:Wait()
end

-- Hiển thị thông báo NOPE với animation
textLabel.Text = "Join Discord Our"
textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
textLabel.TextTransparency = 1
textLabel.Visible = true
tweenTextLabel(1, 0, textLabel.Position)  -- Hiển thị "NOPE"

wait(1)  -- Đợi một thời gian trước khi ẩn

-- Ẩn thông báo NOPE với animation
tweenTextLabel(1, 1, UDim2.new(0.25, 0, 0.3, -50))  -- Di chuyển lên và ẩn "NOPE"

wait(1)  -- Đợi để "NOPE" hoàn toàn biến mất

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local request = request or http_request or Krnl.request or syn.request or Fluxus.request
-- Đảm bảo rằng mã này chạy trên client (LocalScript) để có tác dụng.
local function muteAllSounds()
    local sounds = game:GetDescendants() -- Lấy tất cả các đối tượng con của game
    for _, obj in ipairs(sounds) do
        if obj:IsA("Sound") then
            obj.Volume = 0 -- Đặt âm lượng của âm thanh về 0
        end
    end
end

muteAllSounds()
local SoundClick2 = Instance.new("Sound")
SoundClick2.SoundId = "rbxassetid://1836842889"
SoundClick2.Volume = 1
SoundClick2.Parent = game.Workspace

-- Function to handle the Ended event
local function onSoundEnded()
    SoundClick2:Play()
end

-- Connect the function to the Ended event
SoundClick2.Ended:Connect(onSoundEnded)

-- Play the sound immediately
SoundClick2:Play()

-- API Endpoints
local api = "https://key-system-nope.onrender.com/verify/?key="
local storeApi = "https://key-system-nope.onrender.com/store/?key="
local checkApi = "https://key-system-nope.onrender.com/check/?id="

-- Function to create "press down" effect
local function createPressDownEffect(button)
    local tweenDown = TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = button.Position + UDim2.new(0, 0, 0, 10) })
    local tweenUp = TweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = button.Position })

    button.MouseButton1Down:Connect(function()
        tweenDown:Play()
    end)
    button.MouseButton1Up:Connect(function()
        tweenUp:Play()
    end)
end

-- Function to create hover effect
local function createHoverEffect(button)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { BackgroundColor3 = Color3.fromRGB(120, 120, 120) })
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { BackgroundColor3 = Color3.fromRGB(70, 70, 70) })
        tween:Play()
    end)
end

-- Function to create 3D effect
local function create3DEffect(button)
    local tweenIn = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TextStrokeTransparency = 0 })
    local tweenOut = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { TextStrokeTransparency = 0.5 })

    button.MouseEnter:Connect(function()
        tweenIn:Play()
    end)
    button.MouseLeave:Connect(function()
        tweenOut:Play()
    end)
end

-- Function to create UI appearance effect
local function createUIAppearanceEffect(uiElement)
    local tweenIn = TweenService:Create(uiElement, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, 450, 0, 300), Position = UDim2.new(0.5, -225, 0.5, -150) })
    uiElement.Size = UDim2.new(0, 0, 0, 0)
    uiElement.Position = UDim2.new(1, 0, 0.5, -150) -- Start position (right off screen)
    tweenIn:Play()
end

-- Create ScreenGui and UI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- Create main Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.5, -225, 0.5, -150)
Frame.Size = UDim2.new(0.9, 0, 0.6, 0)
Frame.BorderSizePixel = 0

-- Add UICorner to Frame
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 20)

-- Add UIStroke to Frame
local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 4
UIStroke.Color = Color3.fromRGB(0, 255, 255) -- Cyan color for futuristic glow

-- Add UIGradient to Frame
local UIGradient = Instance.new("UIGradient", Frame)
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
})

-- Create Title
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.GothamBold
Title.Text = "KEY SYSTEM NOPE"
Title.TextColor3 = Color3.fromRGB(0, 255, 255) -- Cyan color for title
Title.TextSize = 30
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Create horizontal line under title
local Line = Instance.new("Frame")
Line.Parent = Frame
Line.BackgroundColor3 = Color3.fromRGB(0, 255, 255) -- Futuristic line color
Line.Position = UDim2.new(0, 0, 0, 60)
Line.Size = UDim2.new(1, 0, 0, 2)
Line.BorderSizePixel = 0

-- Create key input TextBox
local EnterKeyBox = Instance.new("TextBox")
EnterKeyBox.Parent = Frame
EnterKeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EnterKeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
EnterKeyBox.Size = UDim2.new(0.8, 0, 0, 40)
EnterKeyBox.Font = Enum.Font.Gotham
EnterKeyBox.Text = ""
EnterKeyBox.TextColor3 = Color3.fromRGB(180, 180, 180)
EnterKeyBox.TextSize = 16
EnterKeyBox.ClearTextOnFocus = true
EnterKeyBox.TextWrapped = true
EnterKeyBox.PlaceholderText = "Enter Your Key Here..."
EnterKeyBox.TextXAlignment = Enum.TextXAlignment.Left
local EnterKeyBoxUICorner = Instance.new("UICorner", EnterKeyBox)
EnterKeyBoxUICorner.CornerRadius = UDim.new(0, 10)

-- Create result label
local ResultLabel = Instance.new("TextLabel")
ResultLabel.Parent = Frame
ResultLabel.BackgroundTransparency = 1
ResultLabel.Position = UDim2.new(0.5, -75, 0.45, 0)
ResultLabel.Size = UDim2.new(0, 150, 0, 50)
ResultLabel.Font = Enum.Font.GothamBold
ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 255) -- Cyan color for result notification
ResultLabel.TextSize = 18
ResultLabel.TextStrokeTransparency = 0.5
ResultLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
ResultLabel.Text = ""

-- Create Get Key button
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Parent = Frame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.60, 0)
GetKeyButton.Size = UDim2.new(0.35, 0, 0, 40)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(0, 255, 255) -- Cyan color for text
GetKeyButton.TextSize = 20
GetKeyButton.TextStrokeTransparency = 0.5
GetKeyButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
local GetKeyUICorner = Instance.new("UICorner", GetKeyButton)
GetKeyUICorner.CornerRadius = UDim.new(0, 10)

-- Create Check Key button
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Parent = Frame
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CheckKeyButton.Position = UDim2.new(0.55, 0, 0.60, 0)
CheckKeyButton.Size = UDim2.new(0.35, 0, 0, 40)
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.Text = "Check Key"
CheckKeyButton.TextColor3 = Color3.fromRGB(0, 255, 255)
CheckKeyButton.TextSize = 20
CheckKeyButton.TextStrokeTransparency = 0.5
CheckKeyButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
local CheckKeyUICorner = Instance.new("UICorner", CheckKeyButton)
CheckKeyUICorner.CornerRadius = UDim.new(0, 10)

-- Create Discord button
local DiscordButton = Instance.new("TextButton")
DiscordButton.Parent = Frame
DiscordButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DiscordButton.Position = UDim2.new(0.1, 0, 0.80, 0)
DiscordButton.Size = UDim2.new(0.8, 0, 0, 40)
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.Text = "Discord"
DiscordButton.TextColor3 = Color3.fromRGB(0, 255, 255)
DiscordButton.TextSize = 20
DiscordButton.TextStrokeTransparency = 0.5
DiscordButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
local DiscordUICorner = Instance.new("UICorner", DiscordButton)
DiscordUICorner.CornerRadius = UDim.new(0, 10)

-- Create Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red color for close button
CloseButton.Position = UDim2.new(1, -40, 0, 10) -- Top-right corner
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
CloseButton.TextSize = 18
CloseButton.TextStrokeTransparency = 0.5
CloseButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
local CloseButtonUICorner = Instance.new("UICorner", CloseButton)
CloseButtonUICorner.CornerRadius = UDim.new(0, 10)

-- Handle Close button click
CloseButton.MouseButton1Click:Connect(function()
    Frame:Destroy()
end)

-- Handle Discord button click
DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("dsc.gg/nopehub")
    print("Discord Button Clicked: URL Copied")
    
    -- Update ResultLabel to notify the user
    ResultLabel.Text = "URL Đã Sao Chép"
    ResultLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow color for notification
end)

-- Create effects for buttons
createPressDownEffect(GetKeyButton)
createPressDownEffect(CheckKeyButton)
createPressDownEffect(DiscordButton)
createPressDownEffect(CloseButton)

createHoverEffect(GetKeyButton)
createHoverEffect(CheckKeyButton)
createHoverEffect(DiscordButton)
createHoverEffect(CloseButton)

create3DEffect(GetKeyButton)
create3DEffect(CheckKeyButton)
create3DEffect(DiscordButton)
create3DEffect(CloseButton)

-- Create UI appearance effect
createUIAppearanceEffect(Frame)

-- Function to handle key validation and UI behavior
local function handleKeyValidation(key)
    local success, err = pcall(function()
        response = request({
            Url = api .. HttpService:UrlEncode(key),
            Method = "GET",
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })
    end)

    if not success then
        print("Error During Key Validation: " .. tostring(err))
        ResultLabel.Text = "Error: " .. tostring(err)
        ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    if response.StatusCode == 200 then
        local data = HttpService:JSONDecode(response.Body)
        if data.valid then
            -- Key is valid, store it
            ResultLabel.Text = "Key Is Valid"
            ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            Frame.Visible = false

            -- Send notification
            NotificationLibrary:SendNotification("Success", "Key Valid", 5)
            NotificationLibrary:SendNotification("Success", "Buy Key Premium Now", 5)

            -- Print key expiration time
            if data.time then
                print("Key Expiration Time: " .. data.time)
            end

            -- Post the valid key to the store API 
            local storeSuccess, storeErr = pcall(function()
                request({
                    Url = storeApi .. HttpService:UrlEncode(key),
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }
                })
            end)

            if not storeSuccess then
                print("Error Storing Key: " .. tostring(storeErr))
            else
                print("Key Successfully Stored")
            end

            -- Execute the script if the key is valid
            local version = _G.Version
            local scriptUrl

            if version == "English" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/Nope.lua"
            elseif version == "Vietnamese" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NoPe.lua"
            elseif version == "KaitunBF" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeKaitunBF.lua"
            elseif version == "UltimateObby" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeUltimateEasyObby.lua"
            elseif version == "Chest" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NOPECHEST.lua"
            elseif version == "Break2" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeBreakIn2.lua"
            elseif version == "TowerOfHell" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeTowerOfHell.lua"
            elseif version == "MeMe" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeMeMe.lua"
            elseif version == "MeMeSea" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeSea.lua"
            elseif version == "FindBF" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeFindFruitsBF.lua"
            elseif version == "BladeBall" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/BladeBall.lua"
            elseif version == "LegendOfSpeed" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeSpeed.lua"
            elseif version == "Evade" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeEvade.lua"
            elseif version == "Arsenal" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeArsenal.lua"
            elseif version == "Rivals" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeRivals.lua"
            elseif version == "Obby" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeObby.lua"
            elseif version == "MeMeFruits" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeMeMeFruits.lua"
            else
                ResultLabel.Text = "Invalid Version"
                ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                return
            end

            -- Load and execute the script
            local scriptSuccess, scriptErr = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)

            if not scriptSuccess then
                ResultLabel.Text = "Failed To Execute Script: " .. tostring(scriptErr)
                ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                print("Error Executing Script: " .. tostring(scriptErr))
            end
        elseif data.expired then
            -- Key has expired
            ResultLabel.Text = "Key Has Expired"
            ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            NotificationLibrary:SendNotification("Warning", "Key Expired", 5)
            NotificationLibrary:SendNotification("Warning", "Join Discord Our", 5)
        elseif data.invalid then
            -- Key is invalid
            ResultLabel.Text = "Key Is Invalid"
            ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            NotificationLibrary:SendNotification("Warning", "Key Invalid", 5)
            NotificationLibrary:SendNotification("Warning", "Buy Key Premium Now", 5)

            -- Clear EnterKeyBox and reset placeholder text
            EnterKeyBox.Text = ""
            EnterKeyBox.PlaceholderText = "Enter Your Key Here..."
        else
            -- Unknown response
            ResultLabel.Text = "Unknown Response"
            ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    else
        -- Connection failed
        ResultLabel.Text = "Failed To Connect To Server"
        ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Connect Check Key Button click event
CheckKeyButton.MouseButton1Click:Connect(function()
    local key = EnterKeyBox.Text
    if key == "" then
        ResultLabel.Text = "No Key Entered"
        ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    handleKeyValidation(key)
    
    -- Xóa nội dung của EnterKeyBox và đặt lại placeholder text nếu key không hợp lệ
    EnterKeyBox.Text = ""
    EnterKeyBox.PlaceholderText = "Enter Your Key Here..."
end)

-- Function to generate a random hexadecimal string
local function generateRandomHex(length)
    local charset = "abcdef0123456789"
    local result = ""
    for i = 1, length do
        local rand = math.random(1, #charset)
        result = result .. charset:sub(rand, rand)
    end
    return result
end

-- Function to handle Get Key Button click
GetKeyButton.MouseButton1Click:Connect(function()
    -- Generate a random 10000-character hexadecimal string
    local hexString = generateRandomHex(10000)
    
    -- Create the URL with the hexadecimal string
    local url = "https://key-system-nope.onrender.com/step?hwid=" .. hexString
    
    -- Copy URL to clipboard
    setclipboard(url)
    print("Get Key Button Clicked: URL Copied")

    -- Update ResultLabel to notify the user
    ResultLabel.Text = "URL Đã Sao Chép"
    ResultLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow color for notification
end)

EnterKeyBox.Focused:Connect(function()
    if EnterKeyBox.Text == "" then
        EnterKeyBox.PlaceholderText = ""  -- Xóa placeholder khi ô nhập liệu được chọn
    end
end)

EnterKeyBox.FocusLost:Connect(function(enterPressed)
    if EnterKeyBox.Text == "" then
        EnterKeyBox.PlaceholderText = "Enter Your Key Here..."  -- Khôi phục placeholder nếu không có nhập liệu
    end
end)

local function checkStoredKey()
    local response
    local success, err = pcall(function()
        response = request({
            Url = checkApi .. Player.UserId,
            Method = "GET",
            Headers = {
                ["Content-Type"] = "application/json"
            }
        })
    end)

    if not success then
        print("Error Checking Stored Key: " .. tostring(err))
        Frame.Visible = true
        return
    end

    if response.StatusCode == 200 then
        local data = HttpService:JSONDecode(response.Body)
        if data.valid then
            -- Key is valid, hide UI and execute script
            ResultLabel.Text = "Key Is Valid"
            ResultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            Frame.Visible = false
            print("Key Is Valid Start Executing Script")

            -- Send notification
            NotificationLibrary:SendNotification("Success", "Key Valid", 10)
            NotificationLibrary:SendNotification("Success", "Buy Key Premium Now", 10)

            -- Print key expiration time
            if data.time then
                print("Key Expiration Time: " .. data.time)
            end

            local version = _G.Version
            local scriptUrl

            if version == "English" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/Nope.lua"
            elseif version == "Vietnamese" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NoPe.lua"
            elseif version == "Chest" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NOPECHEST.lua"
            elseif version == "MeMe" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeMeMe.lua"
            elseif version == "MeMeSea" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeSea.lua"
            elseif version == "UltimateObby" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeUltimateEasyObby.lua"
            elseif version == "Break2" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeBreakIn2.lua"
            elseif version == "KaitunBF" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeKaitunBF.lua"
            elseif version == "BladeBall" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/BladeBall.lua"
            elseif version == "FindBF" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeFindFruitsBF.lua"
            elseif version == "TowerOfHell" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeTowerOfHell.lua"
            elseif version == "LegendOfSpeed" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeSpeed.lua"
            elseif version == "Evade" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeEvade.lua"
            elseif version == "Arsenal" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeArsenal.lua"
            elseif version == "Obby" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeObby.lua"
            elseif version == "Rivals" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeRivals.lua"
            elseif version == "MeMeFruits" then
                scriptUrl = "https://raw.githubusercontent.com/Zunes-Bypassed/NOPE/main/NopeMeMeFruits.lua"
            else
                ResultLabel.Text = "Invalid Version"
                ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                return
            end

            -- Load and execute the script
            local scriptSuccess, scriptErr = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)

            if not scriptSuccess then
                ResultLabel.Text = "Failed To Execute Script: " .. tostring(scriptErr)
                ResultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                print("Error Executing Script: " .. tostring(scriptErr))
            end
        else
            -- Key is not valid, show UI
            Frame.Visible = true
            NotificationLibrary:SendNotification("Warning", "Key Invalid", 5)
            NotificationLibrary:SendNotification("Warning", "Buy Key Premium Now", 5)
            print("Key Is Invalid Please Get Key")
        end
    else
        -- Connection failed
        print("Failed To Connect To Key Check Server")
        Frame.Visible = true
    end
end

-- Run the check for stored key when the script starts
checkStoredKey()