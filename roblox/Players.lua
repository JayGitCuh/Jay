local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local HapticService = game:GetService("HapticService")
local UserInputService = game:GetService("UserInputService")

local function MakeDraggable(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseButton1
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if
			Input.UserInputType == Enum.UserInputType.MouseMovement
			or Input.UserInputType == Enum.UserInputType.Touch
		then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		end
	end)
end

local Library = {}

function Library:CreatePlayers(Bigtext, bottomsmall, color)

    local menuColor = color or Color3.fromRGB(0, 98, 255)

	local Lurid = Instance.new("ScreenGui")

	--syn.protect_gui(Lurid) --remove or dont

	Lurid.Name = "Lurid" --change name if u want

	Lurid.Parent = game:GetService("CoreGui")
	Lurid.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	function Library:DestroyMenu()
		Lurid:Destroy()
	end
    --local menuColor = color or Color3.fromRGB(0, 98, 255)

    local PlayersBG = Instance.new("Frame")



    local TOPP = Instance.new("Frame")
    local NAMEE = Instance.new("TextLabel")
    local PLAYERSS = Instance.new("TextLabel")
    local TOPPLine = Instance.new("Frame")

    PlayersBG.Name = "PlayersBG"
    PlayersBG.Parent = Lurid
    PlayersBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PlayersBG.BackgroundTransparency = 1.000
    PlayersBG.ClipsDescendants = true
    PlayersBG.Position = UDim2.new(0, 929, 0.149822995, 0)
    PlayersBG.Size = UDim2.new(0, 669, 0, 807)

    local plrtoggle = true -- false is Off; true is On

    function onKeyP2ress(actionName, userInputState, inputObject)
        if userInputState == Enum.UserInputState.Begin then
            if plrtoggle == false then
                plrtoggle = true

                

                game.TweenService
                :Create(PlayersBG, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Position = UDim2.new(0, 929, 0.149822995, 0),
                })
                :Play()

                PlayersBG.Visible = true
            else
                plrtoggle = false

                game.TweenService
                :Create(PlayersBG, TweenInfo.new(0.30, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Position = UDim2.new(8, 0, 0.149822995, 0),
                })
                :Play()

                wait()

                PlayersBG.Visible = false
            end
        end
    end

    game.ContextActionService:BindAction("keyPress", onKeyP2ress, false, Enum.KeyCode.F5)

    TOPP.Name = "TOPP"
    TOPP.Parent = PlayersBG
    TOPP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TOPP.BackgroundTransparency = 0.400
    TOPP.BorderSizePixel = 0
    TOPP.ClipsDescendants = true
    TOPP.Position = UDim2.new(-0.00149476831, 0, 0.00612128899, 0)
    TOPP.Size = UDim2.new(0, 670, 0, 67)

    MakeDraggable(TOPP, PlayersBG)

    NAMEE.Name = "NAME"
    NAMEE.Parent = TOPP
    NAMEE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NAMEE.BackgroundTransparency = 1.000
    NAMEE.BorderSizePixel = 0
    NAMEE.Position = UDim2.new(0.310911804, 0, -0.104477614, 0)
    NAMEE.Size = UDim2.new(0, 254, 0, 67)
    NAMEE.Font = Enum.Font.GothamBold
    NAMEE.Text = Bigtext
    NAMEE.TextColor3 = Color3.fromRGB(255, 255, 255)
    NAMEE.TextSize = 40.000
    NAMEE.TextStrokeColor3 = menuColor
    NAMEE.TextStrokeTransparency = 0.000

    PLAYERSS.Name = "PLAYERS"
    PLAYERSS.Parent = TOPP
    PLAYERSS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PLAYERSS.BackgroundTransparency = 1.000
    PLAYERSS.Position = UDim2.new(0.358744383, 0, 0.522388041, 0)
    PLAYERSS.Size = UDim2.new(0, 190, 0, 35)
    PLAYERSS.Font = Enum.Font.GothamSemibold
    PLAYERSS.Text = bottomsmall
    PLAYERSS.TextColor3 = Color3.fromRGB(255, 255, 255)
    PLAYERSS.TextSize = 16.000

    TOPPLine.Name = "TOPPLine"
    TOPPLine.Parent = TOPP
    TOPPLine.BackgroundColor3 = menuColor
    TOPPLine.BorderSizePixel = 0
    TOPPLine.Position = UDim2.new(0, 0, -1.02344775, 0)
    TOPPLine.Size = UDim2.new(0, 669, 0, 72)

    

    local InsidePlayers = {}
    function InsidePlayers:CreatePlayerlist()
        
        local UIListLayout = Instance.new("UIListLayout")
        
        local PlayersContainer = Instance.new("ScrollingFrame")

        PlayersContainer.Name = "PlayersContainer"
        PlayersContainer.Parent = PlayersBG
        PlayersContainer.Active = true
        PlayersContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        PlayersContainer.BackgroundTransparency = 0.400
        PlayersContainer.BorderSizePixel = 0
        PlayersContainer.Position = UDim2.new(-0.00100000948, 0, 0.106486708, 0)
        PlayersContainer.Size = UDim2.new(0, 686, 0, 195)
        
        UIListLayout.Parent = PlayersContainer
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
        local InsidePlayerlist = {}

        function InsidePlayerlist:AddPlayers(list, callback)
            callback = callback or function() end
            list = list or {}

                for i, v in next, list do
                    local Players = Instance.new("TextButton")

                    Players.Name = "Players "..v
                    Players.Parent = PlayersContainer
                    Players.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    Players.BackgroundTransparency = 0.700
                    Players.BorderSizePixel = 0
                    Players.Position = UDim2.new(0, 0, 1.56500406e-07, 0)
                    Players.Size = UDim2.new(0, 669, 0, 21)
                    Players.Font = Enum.Font.SourceSans
                    Players.Text = v
                    Players.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Players.TextSize = 14.000
                    Players.AutoButtonColor = false

                    Players.MouseButton1Click:Connect(function()

                    game.TweenService
                    :Create(Players, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 20.000,
                    })
                    :Play()
                    wait(0.10)
                    game.TweenService
                    :Create(Players, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 14.000,
                    })
                    :Play()

                    callback(v)

                    end)
                end

                local Players = game:GetService("Players")
 
                Players.PlayerAdded:Connect(function(player)

                    print(player.Name .. " joined the game!")

                    local Players = Instance.new("TextButton")

                    Players.Name = "Players "..player.Name
                    Players.Parent = PlayersContainer
                    Players.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    Players.BackgroundTransparency = 0.700
                    Players.BorderSizePixel = 0
                    Players.Position = UDim2.new(0, 0, 1.56500406e-07, 0)
                    Players.Size = UDim2.new(0, 669, 0, 21)
                    Players.Font = Enum.Font.SourceSans
                    Players.Text = player.Name
                    Players.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Players.TextSize = 14.000
                    Players.AutoButtonColor = false

                    Players.MouseButton1Click:Connect(function()

                        

                        

                    game.TweenService
                    :Create(Players, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 20.000,
                    })
                    :Play()
                    wait(0.10)
                    game.TweenService
                    :Create(Players, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 14.000,
                    })
                    :Play()

                    callback(player.Name)
                end)
                 
                

                end)
                Players.PlayerRemoving:Connect(function(player)
                print(player.Name .. " left the game!")
                PlayersContainer:FindFirstChild("Players "..player.Name):Destroy()
                --[[
                for i, v in ipairs(PlayersContainer:GetChildren()) do
                    if v.Name == "Players "..player.Name then
                        v:Destroy()
                    end
                end
                ]]
            end)
        end
        return InsidePlayerlist
    end

    function InsidePlayers:CreateInformation()
        local InfoContainer = Instance.new("Frame")
        InfoContainer.Name = "InfoContainer"
        InfoContainer.Parent = PlayersBG
        InfoContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        InfoContainer.BackgroundTransparency = 1.000
        InfoContainer.BorderSizePixel = 0
        InfoContainer.Position = UDim2.new(-0.00298953662, 0, 0.365204722, 0)
        InfoContainer.Size = UDim2.new(0, 671, 0, 263)

        local UIListLayout_2 = Instance.new("UIListLayout")

        UIListLayout_2.Parent = InfoContainer
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        local InsideInfo = {}
            function InsideInfo:CreateLabel(text)
                local textLabel = Instance.new("TextLabel")

                textLabel.Name = text
                textLabel.Parent = InfoContainer
                textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                textLabel.BackgroundTransparency = 0.400
                textLabel.BorderSizePixel = 0
                textLabel.Size = UDim2.new(0, 671, 0, 30)
                textLabel.Font = Enum.Font.SourceSans
                textLabel.Text = text
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 14.000
            end
            function InsideInfo:CreateButton(text, callback)
                text = text or "Button"
                callback = callback or function() end

                local button = Instance.new("TextButton")

                button.Name = text
                button.Parent = InfoContainer
                button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                button.BackgroundTransparency = 0.400
                button.BorderSizePixel = 0
                button.Size = UDim2.new(0, 671, 0, 30)
                button.Font = Enum.Font.SourceSans
                button.Text = text
                button.TextColor3 = Color3.fromRGB(255, 255, 255)
                button.TextSize = 14.000
                button.AutoButtonColor = false

                button.MouseButton1Click:Connect(function()
                    callback()

                    game.TweenService
                    :Create(button, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 20.000,
                    })
                    :Play()
                    wait(0.10)
                    game.TweenService
                    :Create(button, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextSize = 14.000,
                    })
                    :Play()
                end)
            end

            function InsideInfo:CreateSlider(text, minvalue, maxvalue, callback)
                local slider_data = {}

                local Slider = Instance.new("Frame")
                local Back = Instance.new("TextButton")
                local Drag = Instance.new("Frame")
                local Value2 = Instance.new("TextLabel")
                local SliderText = Instance.new("TextLabel")

                minvalue = minvalue or 0
                maxvalue = maxvalue or 100

                callback = callback or function() end

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value = minvalue

                SliderValue = minvalue

                Slider.Name = "Slider" .. text
                Slider.Parent = InfoContainer
                Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Slider.BackgroundTransparency = 0.400
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(0, 671, 0, 30)

                Back.Name = "Back"
                Back.Parent = Slider
                Back.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
                Back.BorderColor3 = menuColor
                Back.BorderSizePixel = 2
                Back.Position = UDim2.new(0.632000005, 0, 0.238000005, 0)
                Back.Size = UDim2.new(0, 237, 0, 15)
                Back.Font = Enum.Font.GothamBold
                Back.Text = ""
                Back.TextColor3 = Color3.fromRGB(255, 255, 255)
                Back.TextSize = 15.000

                Drag.Name = "Drag"
                Drag.Parent = Back
                Drag.BackgroundColor3 = menuColor
                Drag.BorderSizePixel = 0
                Drag.Size = UDim2.new(0, 237, 0, 15)

                Value2.Name = "Value"
                Value2.Parent = Back
                Value2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Value2.BackgroundTransparency = 1.000
                Value2.Position = UDim2.new(-0.000326406211, 0, -0.0500001907, 0)
                Value2.Size = UDim2.new(0, 238, 0, 15)
                Value2.Font = Enum.Font.GothamBold
                Value2.Text = Value
                Value2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Value2.TextSize = 15.000

                SliderText.Name = "SliderText"
                SliderText.Parent = Slider
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.Position = UDim2.new(0.341, 0, 0, 0)
                SliderText.Size = UDim2.new(0, 211, 0, 30)
                SliderText.Font = Enum.Font.SourceSans
                SliderText.Text = text
                SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.TextSize = 14.000
                SliderText.TextXAlignment = Enum.TextXAlignment.Center

                Back.MouseButton1Down:Connect(function()

                    Value = math.floor(
                        (((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X) + tonumber(minvalue)
                    ) or 0
                    pcall(function()
                        callback(Value)
                    end)

                    Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 15)

                    moveconnection = mouse.Move:Connect(function()
                        Value2.Text = Value
                        Value = math.floor(
                            (((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X)
                                + tonumber(minvalue)
                        )
                        pcall(function()
                            callback(Value)
                        end)
                        Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 15)
                    end)

                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor(
                                (((tonumber(maxvalue) - tonumber(minvalue)) / 237) * Drag.AbsoluteSize.X)
                                    + tonumber(minvalue)
                            )
                            pcall(function()
                                callback(Value)
                            end)
                            Drag.Size = UDim2.new(0, math.clamp(mouse.X - Drag.AbsolutePosition.X, 0, 237), 0, 15)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)

                end)

                function slider_data:Set(Number)
                    Value = Number

                    Drag.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
                    Value2.Text = Number
                    callback(Number)
                end

                return slider_data
            end

            function InsideInfo:CreateCheckbox(text, callback)
                local switch_data = {}

                local Checkbox = Instance.new("Frame")
                local Check = Instance.new("TextButton")
                local TextLabel = Instance.new("TextLabel")

                text = tostring(text or "New Switch")
                callback = typeof(callback) == "function" and callback or function() end

                Checkbox.Name = "Checkbox"
                Checkbox.Parent = InfoContainer
                Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Checkbox.BackgroundTransparency = 0.400
                Checkbox.BorderSizePixel = 0
                Checkbox.Size = UDim2.new(0, 671, 0, 30)

                Check.Name = "Check"
                Check.Parent = Checkbox
                Check.BackgroundColor3 = menuColor
                Check.BorderSizePixel = 0
                Check.Position = UDim2.new(0.959769886, 0, 0.306172937, 0)
                Check.Size = UDim2.new(0, 18, 0, 18)
                Check.Font = Enum.Font.GothamBold
                Check.Text = ""
                Check.TextColor3 = Color3.fromRGB(255, 255, 255)
                Check.TextSize = 15.000

                TextLabel.Parent = Checkbox
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Position = UDim2.new(0.341, 0, 0, 0)
                TextLabel.Size = UDim2.new(0, 211, 0, 30)
                TextLabel.Font = Enum.Font.SourceSans
                TextLabel.Text = text
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 14.000
                TextLabel.TextXAlignment = Enum.TextXAlignment.Center

                local toggled = false
                Check.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    callback(toggled)
                    if toggled then
                        game.TweenService
                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = menuColor,
                        })
                        :Play()
                        --- We put our animation here when the toggle is on
                    else
                        game.TweenService
                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(21, 21, 21),
                        })
                        :Play()
                        ---We Put our animation here when the toggle is off
                    end
                    pcall(callback, toggled)
                end)

                function switch_data:Set(bool)
                    toggled = (typeof(bool) == "boolean") and bool or false
                    if toggled then
                        game.TweenService
                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = menuColor,
                        })
                        :Play()
                        --- We put our animation here when the toggle is on
                    else
                        game.TweenService
                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(21, 21, 21),
                        })
                        :Play()
                        ---We Put our animation here when the toggle is off
                    end
                    pcall(callback, toggled)
                end

                return switch_data, Check
            end
        return InsideInfo
    end
    return InsidePlayers
end


--local Window1 = Library:CreateMain("LuridFramework", "UNIVERSAL", Color3.fromRGB(255, 0, 0), Enum.KeyCode.F4) --Color3.fromRGB(0, 98, 255)

local dwLocalPlayer = game.Players.LocalPlayer

local cuh = Library:CreatePlayers("Players","LURIDFRAMEWORK", Color3.fromRGB(0,0,255))--second is name i forgot what the first is

local PlayList = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
    if v ~= game.Players.LocalPlayer then 
        table.insert(PlayList,v.Name)
    end
end

local playersOpt = cuh:CreatePlayerlist()

local selectedplr = ""

playersOpt:AddPlayers(PlayList,function(t)
    selectedplr = t
    print(selectedplr)
end)

local info = cuh:CreateInformation()

info:CreateLabel("Username:")
info:CreateLabel("Nickname:")
info:CreateLabel("UserID:")
info:CreateLabel("Position:")
info:CreateLabel("Angle:")

info:CreateCheckbox("cuh",function(t)
	print(t)
end)

info:CreateSlider("Slider",10, 100,function(t)
	print(t)
end)

local PlayerInfo = RunService.RenderStepped:Connect(function(frame)

    for i, v in ipairs(game.Players:GetChildren()) do
		if v.Name == selectedplr then
            game:GetService("CoreGui").Lurid.PlayersBG.InfoContainer["Username:"].Text = "Username: "..game.Players:FindFirstChild(selectedplr).Name
            game:GetService("CoreGui").Lurid.PlayersBG.InfoContainer["Nickname:"].Text = "Nickname: "..game.Players:FindFirstChild(selectedplr).DisplayName
            game:GetService("CoreGui").Lurid.PlayersBG.InfoContainer["UserID:"].Text = "UserID: "..game.Players:FindFirstChild(selectedplr).UserId
            for i, v in pairs(game.Players:FindFirstChild(selectedplr).Character:GetChildren()) do
                if v.Name == "HumanoidRootPart" then

                    game:GetService("CoreGui").Lurid.PlayersBG.InfoContainer["Position:"].Text = "Position: "..tostring(game.Players:FindFirstChild(selectedplr).Character.HumanoidRootPart.Position)

                end

                if v.Name == "Humanoid" then

                    game:GetService("CoreGui").Lurid.PlayersBG.InfoContainer["Angle:"].Text = "Angle: "..tostring(game.Players:FindFirstChild(selectedplr).Character.Humanoid.MoveDirection)
                    
                end
            end
		end
	end
	
end)


info:CreateButton("Teleport to player [Use at RISK]",function(t)
    print("Teleported you to "..selectedplr)
    dwLocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(selectedplr).Character.HumanoidRootPart.CFrame
end)

info:CreateButton("Tween Teleport to player [Use at RISK]",function(t)

    print("Teleported you to "..selectedplr)
    game.TweenService
    :Create(dwLocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        CFrame = game.Players:FindFirstChild(selectedplr).Character.HumanoidRootPart.CFrame
    })
    :Play()

end)

info:CreateButton("Give Chams",function(t)
	for i, v in ipairs(game.Players:FindFirstChild(selectedplr).Character:GetChildren()) do
		
		if v:IsA("MeshPart") then
			v.Material = Enum.Material.ForceField
		end
	end
end)

info:CreateButton("Give Plastic",function(t)
    for i, v in ipairs(game.Players:FindFirstChild(selectedplr).Character:GetChildren()) do
		if v:IsA("MeshPart") then
			v.Material = Enum.Material.Plastic
		end
	end
end)

info:CreateButton("Copy Position",function(t)
	setclipboard(tostring(game.Players:FindFirstChild(selectedplr).Character.HumanoidRootPart.Position))
end)
