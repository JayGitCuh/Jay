local Library = {}

local MenuConfig = {
    Color = Color3.fromRGB(0, 98, 255),
    Secondary = Color3.fromRGB(0, 52, 134),
}

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

function checkObj(path, object)
    for i, v in ipairs(path:GetChildren()) do
        if v.Name == object then
            --print("File exist")
            return true
        end
    end
end

function OpenDiscord(invitecode)

    local http = game:GetService('HttpService')
    local req = (syn and syn.request) or (http and http.request) or http_request

    if req then
        req({
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
                },
                Body = http:JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = http:GenerateGUID(false),
                args = {code = invitecode} -- put your server's code here in between the single quotes, and that's literally all you need
            })
        })
    end

end

local TabAmount = 0


function Library:CreateJay()
    

    if checkObj(game:GetService("CoreGui"),"JayLib") then --path and then the object
        game:GetService("CoreGui"):FindFirstChild("JayLib"):Destroy()
        print("Destroyed Other Instance")
    end
    
    local JayLib = Instance.new("ScreenGui")
    JayLib.Name = "JayLib"
    JayLib.Parent = game:GetService("CoreGui")

    local InsideLibrary = {}
    function InsideLibrary:CreateMenu()

        local Menu = Instance.new("ImageLabel")
        local TopCorner = Instance.new("ImageLabel")
        local LEFTT = Instance.new("TextLabel")
        local RIGHTT = Instance.new("TextLabel")
        local Funny = Instance.new("ImageLabel")
        local TabContainerOutLine = Instance.new("ImageLabel")
        local TabContainer = Instance.new("ImageLabel")

        Menu.Name = "Menu"
        Menu.Parent = JayLib
        Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Menu.BackgroundTransparency = 1.000
        Menu.ClipsDescendants = true
        Menu.Position = UDim2.new(0.5, -286, 0.5, -246)
        Menu.Size = UDim2.new(0, 572, 0, 492)
        Menu.Image = "rbxassetid://3570695787"
        Menu.ImageColor3 = Color3.fromRGB(31, 31, 31)
        Menu.ScaleType = Enum.ScaleType.Slice
        Menu.SliceCenter = Rect.new(100, 100, 100, 100)
        Menu.SliceScale = 0.100

        

        local toggle = true -- false is Off; true is On

	    local u = game:GetService("UserInputService")

        u.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.F4 then 
            if toggle == false then
                toggle = true


                Menu.Visible = true
            else
                toggle = false

                Menu.Visible = false
            end
        end
        end)
        
        TopCorner.Name = "TopCorner"
        TopCorner.Parent = Menu
        TopCorner.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        TopCorner.BackgroundTransparency = 1.000
        TopCorner.BorderSizePixel = 0
        TopCorner.Position = UDim2.new(0, 0, -0.000119520351, 0)
        TopCorner.Size = UDim2.new(0, 572, 0, 47)
        TopCorner.Image = "rbxassetid://3570695787"
        TopCorner.ImageColor3 = Color3.fromRGB(31, 31, 31)
        TopCorner.ScaleType = Enum.ScaleType.Slice
        TopCorner.SliceCenter = Rect.new(100, 100, 100, 100)
        TopCorner.SliceScale = 0.120
        
        LEFTT.Name = "LEFTT"
        LEFTT.Parent = TopCorner
        LEFTT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LEFTT.BackgroundTransparency = 1.000
        LEFTT.BorderSizePixel = 0
        LEFTT.Position = UDim2.new(0.0244755261, 0, 0.085, 0)
        LEFTT.Size = UDim2.new(0, 29, 0, 14)
        LEFTT.Font = Enum.Font.SourceSansBold
        LEFTT.Text = "JAY"
        LEFTT.TextColor3 = Color3.fromRGB(255, 255, 255)
        LEFTT.TextSize = 15.000
        LEFTT.TextXAlignment = Enum.TextXAlignment.Right
        
        RIGHTT.Name = "RIGHTT"
        RIGHTT.Parent = TopCorner
        RIGHTT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        RIGHTT.BackgroundTransparency = 1.000
        RIGHTT.BorderSizePixel = 0
        RIGHTT.Position = UDim2.new(0.0751748234, 0, 0.085, 0)
        RIGHTT.Size = UDim2.new(0, 78, 0, 14)
        RIGHTT.Font = Enum.Font.SourceSansBold
        RIGHTT.Text = " FRAMEWORK"
        RIGHTT.TextColor3 = MenuConfig.Color
        RIGHTT.TextSize = 15.000
        RIGHTT.TextStrokeColor3 = MenuConfig.Color
        RIGHTT.TextXAlignment = Enum.TextXAlignment.Left

        MakeDraggable(LEFTT, Menu)
        MakeDraggable(RIGHTT, Menu)
        
        Funny.Name = "Funny"
        Funny.Parent = Menu
        Funny.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        Funny.BackgroundTransparency = 1.000
        Funny.BorderSizePixel = 0
        Funny.Position = UDim2.new(0.019, 0, 0.044, 0) --{0.019, 0},{0.044, 0}
        Funny.Size = UDim2.new(0, 550, 0, 3)
        Funny.Image = "rbxassetid://3570695787"
        Funny.ImageColor3 = MenuConfig.Color
        Funny.ScaleType = Enum.ScaleType.Slice
        Funny.SliceCenter = Rect.new(100, 100, 100, 100)
        Funny.SliceScale = 0.120
        
        TabContainerOutLine.Name = "TabContainerOutLine"
        TabContainerOutLine.Parent = Menu
        TabContainerOutLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabContainerOutLine.BackgroundTransparency = 1.000
        TabContainerOutLine.Position = UDim2.new(0.0280248467, -5, 0.133190185, -5)
        TabContainerOutLine.Size = UDim2.new(0, 550, 0, 421)
        TabContainerOutLine.Image = "rbxassetid://3570695787"
        TabContainerOutLine.ImageColor3 = MenuConfig.Color
        TabContainerOutLine.ScaleType = Enum.ScaleType.Slice
        TabContainerOutLine.SliceCenter = Rect.new(100, 100, 100, 100)
        TabContainerOutLine.SliceScale = 0.100

        TabContainer.Name = "TabContainer"
        TabContainer.Parent = Menu
        TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabContainer.BackgroundTransparency = 1.000
        TabContainer.Position = UDim2.new(0.0280248467, -3, 0.133190185, -3)
        TabContainer.Size = UDim2.new(0, 546, 0, 417)
        TabContainer.Image = "rbxassetid://3570695787"
        TabContainer.ImageColor3 = Color3.fromRGB(31, 31, 31)
        TabContainer.ScaleType = Enum.ScaleType.Slice
        TabContainer.SliceCenter = Rect.new(100, 100, 100, 100)
        TabContainer.SliceScale = 0.100

        local TabSelection = Instance.new("Frame")
        local FunnyTab = Instance.new("Folder")
        local UIListLayout = Instance.new("UIListLayout")

        TabSelection.Name = "TabSelection"
        TabSelection.Parent = Menu
        TabSelection.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        TabSelection.BorderSizePixel = 0
        TabSelection.Position = UDim2.new(0.021, 0, 0.055, 0) --{0.021, 0},{0.055, 0}
        TabSelection.Size = UDim2.new(0, 547, 0, 32)

        FunnyTab.Name = "FunnyTab"
        FunnyTab.Parent = TabSelection

        UIListLayout.Parent = FunnyTab
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout.Padding = UDim.new(0, 6)

      

        local InsideMenu = {}
        function InsideMenu:CreateTab(TabName, Size)

            TabAmount = TabAmount + 1
            local Tab = Instance.new("ImageLabel")
            local TabButton = Instance.new("TextButton")
            
            local btnTrans = 1

            Tab.Name = "Tab"
            Tab.Parent = FunnyTab
            Tab.Active = true
            Tab.AnchorPoint = Vector2.new(0.5, 0.5)
            Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Tab.BackgroundTransparency = 1.000
            Tab.BorderColor3 = Color3.fromRGB(255, 255, 255)
            Tab.BorderSizePixel = 6
            Tab.Position = UDim2.new(0.5, 0, 0.5, 0)
            Tab.Selectable = true
            Tab.Size = UDim2.new(0, 56, 0, 21)
            Tab.Image = "rbxassetid://3570695787"
            Tab.ImageColor3 = Color3.fromRGB(31, 31, 31)
            Tab.ImageTransparency = 0
            Tab.ScaleType = Enum.ScaleType.Slice
            Tab.SliceCenter = Rect.new(100, 100, 100, 100)
            Tab.SliceScale = 0.070

            TabButton.Name = "Tab"..TabAmount
            TabButton.Parent = Tab
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.BackgroundTransparency = 1.000
            TabButton.BorderColor3 = Color3.fromRGB(130, 203, 255)
            TabButton.BorderSizePixel = 0
            TabButton.Size = UDim2.new(0, 56, 0, 21)
            TabButton.Font = Enum.Font.SourceSansBold
            TabButton.Text = TabName
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.TextSize = 14.000
            
            --Container Stuff

            local TabSpot = Instance.new("ScrollingFrame")
            

            TabSpot.Name = TabAmount
            TabSpot.Parent = TabContainer
            TabSpot.Active = true
            TabSpot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabSpot.BackgroundTransparency = 1.000
            TabSpot.Position = UDim2.new(0.0214075781, 0, 0.0182716139, 0)
            TabSpot.Size = UDim2.new(0, 525, 0, 402)
            TabSpot.ScrollBarThickness = 0
            if TabSpot.Name == "1" then
                TabSpot.Visible = true
                Tab.ImageColor3 = MenuConfig.Color
	    else
		TabSpot.Visible = false
            end

            local FunnyLeft = Instance.new("Frame")
            local FunnyLeftList = Instance.new("UIListLayout")
            local FunnyRight = Instance.new("Frame")
            local FunnyRightList = Instance.new("UIListLayout")

            FunnyLeft.Name = "FunnyLeft"
            FunnyLeft.Parent = TabSpot
            FunnyLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FunnyLeft.BackgroundTransparency = 1.000
            FunnyLeft.Size = UDim2.new(0, 259, 0, 100)
            
            FunnyLeftList.Name = "FunnyLeftList"
            FunnyLeftList.Parent = FunnyLeft
            FunnyLeftList.SortOrder = Enum.SortOrder.LayoutOrder
            FunnyLeftList.Padding = UDim.new(0, 6)
            
            FunnyRight.Name = "FunnyRight"
            FunnyRight.Parent = TabSpot
            FunnyRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FunnyRight.BackgroundTransparency = 1.000
            FunnyRight.Position = UDim2.new(0.504761934, 0, 0, 0)
            FunnyRight.Size = UDim2.new(0, 259, 0, 100)
            
            FunnyRightList.Name = "FunnyRightList"
            FunnyRightList.Parent = FunnyRight
            FunnyRightList.SortOrder = Enum.SortOrder.LayoutOrder

            Tab.MouseEnter:Connect(function()
                game.TweenService
                :Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextColor3 = MenuConfig.Secondary,
                    
                })
                :Play()
            end)

            Tab.MouseLeave:Connect(function()
                game.TweenService
                :Create(TabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                })
                :Play()
            end)

            
            TabButton.MouseButton1Click:Connect(function()
                for i, v in next, TabContainer:GetChildren() do
                    v.Visible = false
                end

                for i, v in next, FunnyTab:GetChildren() do
                    if v:IsA("ImageLabel") then

                        game.TweenService
                        :Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            ImageColor3 = Color3.fromRGB(31, 31, 31)
                        })
                        :Play()

                    end
                end

                game.TweenService
                :Create(Tab, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    ImageColor3 = MenuConfig.Color,
                })
                :Play()

                TabSpot.Visible = true
            end)
    
            local InsideTab = {}
            function InsideTab:CreateSection(Name, Side)
                

                if Side == "Left" then

                    local Section = Instance.new("Frame")
                    local SecTitle = Instance.new("TextLabel")
                    local SecListss = Instance.new("UIListLayout")
                    local SecStuff = Instance.new("ImageLabel")
                    local SecUIList = Instance.new("UIListLayout")

                    Section.Name = "Section"..Name
                    Section.Parent = FunnyLeft
                    Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Section.BackgroundTransparency = 1.000
                    Section.BorderSizePixel = 0
                    Section.Size = UDim2.new(0, 259, 0, 100)
                    
                    SecTitle.Name = "SecTitle"
                    SecTitle.Parent = Section
                    SecTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.BackgroundTransparency = 1.000
                    SecTitle.BorderSizePixel = 0
                    SecTitle.Size = UDim2.new(0, 258, 0, 17)
                    SecTitle.Font = Enum.Font.SourceSansBold
                    SecTitle.Text = Name
                    SecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.TextSize = 14.000
                    
                    SecListss.Name = "SecListss"
                    SecListss.Parent = Section
                    SecListss.SortOrder = Enum.SortOrder.LayoutOrder
                    SecListss.Padding = UDim.new(0, 4)
                    
                    SecStuff.Name = "SecStuff"
                    SecStuff.Parent = Section
                    SecStuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SecStuff.BackgroundTransparency = 1.000
                    SecStuff.Position = UDim2.new(0, 0, 0.209999993, 0)
                    SecStuff.Size = UDim2.new(0, 258, 0, 40)
                    SecStuff.Image = "rbxassetid://3570695787"
                    SecStuff.ImageColor3 = Color3.fromRGB(26, 26, 26)
                    SecStuff.ScaleType = Enum.ScaleType.Slice
                    SecStuff.SliceCenter = Rect.new(100, 100, 100, 100)
                    SecStuff.SliceScale = 0.120
                    SecStuff.AutomaticSize = Enum.AutomaticSize.Y
                    
                    SecUIList.Parent = SecStuff
                    SecUIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    SecUIList.SortOrder = Enum.SortOrder.LayoutOrder
                    SecUIList.Padding = UDim.new(0, 5)

                    local InsideLeft = {}
                    function InsideLeft:CreateButton(btntext, callback)
                        local Button = Instance.new("ImageLabel")
                        local Touch = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local ButtonText = Instance.new("TextLabel")

                        Button.Name = "Button"
                        Button.Parent = SecStuff
                        Button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Button.BackgroundTransparency = 1.000
                        Button.Size = UDim2.new(0, 258, 0, 40)
                        Button.Image = "rbxassetid://3570695787"
                        Button.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Button.ScaleType = Enum.ScaleType.Slice
                        Button.SliceCenter = Rect.new(100, 100, 100, 100)
                        Button.SliceScale = 0.120
                        
                        Touch.Name = "Touch"
                        Touch.Parent = Button
                        Touch.Active = true
                        Touch.AnchorPoint = Vector2.new(0.5, 0.5)
                        Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Touch.BackgroundTransparency = 1.000
                        Touch.Position = UDim2.new(0.85431242, 0, 0.503849626, 0)
                        Touch.Selectable = true
                        Touch.Size = UDim2.new(0, 59, 0, 20)
                        Touch.Image = "rbxassetid://3570695787"
                        Touch.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Touch.ImageTransparency = 0.800
                        Touch.ScaleType = Enum.ScaleType.Slice
                        Touch.SliceCenter = Rect.new(100, 100, 100, 100)
                        Touch.SliceScale = 0.120
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = Touch
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Size = UDim2.new(0, 59, 0, 29)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000
                        
                        ButtonText.Name = "ButtonText"
                        ButtonText.Parent = Button
                        ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonText.BackgroundTransparency = 1.000
                        ButtonText.Position = UDim2.new(0, 0, 0.116489366, 0)
                        ButtonText.Size = UDim2.new(0, 113, 0, 29)
                        ButtonText.Font = Enum.Font.SourceSans
                        ButtonText.Text = btntext
                        ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonText.TextSize = 14.000

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        Touch.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                        end)

                        Touch.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                        end)

                        AnotherFunnyButton.MouseButton1Click:Connect(function()

                            callback()

                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0,
                            })
                            :Play()
                            wait(0.10)
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end)

                    end

                    function InsideLeft:CreateButton2(btntext, callback)

                        local Button2 = Instance.new("ImageLabel")
                        local _2Touch = Instance.new("ImageLabel")
                        local AnotherFunnyButton2 = Instance.new("TextButton")

                        Button2.Name = "Button2"..btntext
                        Button2.Parent = SecStuff
                        Button2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Button2.BackgroundTransparency = 1.000
                        Button2.Position = UDim2.new(0, 0, 0.682429254, 0)
                        Button2.Size = UDim2.new(0, 258, 0, 40)
                        Button2.Image = "rbxassetid://3570695787"
                        Button2.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Button2.ScaleType = Enum.ScaleType.Slice
                        Button2.SliceCenter = Rect.new(100, 100, 100, 100)
                        Button2.SliceScale = 0.120
                        
                        _2Touch.Name = "2Touch"
                        _2Touch.Parent = Button2
                        _2Touch.Active = true
                        _2Touch.AnchorPoint = Vector2.new(0.5, 0.5)
                        _2Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _2Touch.BackgroundTransparency = 1.000
                        _2Touch.Position = UDim2.new(0.495000005, 0, 0.504000008, 0)
                        _2Touch.Selectable = true
                        _2Touch.Size = UDim2.new(0, 242, 0, 20)
                        _2Touch.Image = "rbxassetid://3570695787"
                        _2Touch.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        _2Touch.ImageTransparency = 0.800
                        _2Touch.ScaleType = Enum.ScaleType.Slice
                        _2Touch.SliceCenter = Rect.new(100, 100, 100, 100)
                        _2Touch.SliceScale = 0.120
                        
                        AnotherFunnyButton2.Name = "AnotherFunnyButton2"
                        AnotherFunnyButton2.Parent = _2Touch
                        AnotherFunnyButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton2.BackgroundTransparency = 1.000
                        AnotherFunnyButton2.Size = UDim2.new(0, 242, 0, 20)
                        AnotherFunnyButton2.Font = Enum.Font.SourceSans
                        AnotherFunnyButton2.Text = btntext
                        AnotherFunnyButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton2.TextSize = 14.000

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        _2Touch.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                        end)

                        _2Touch.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                        end)

                        AnotherFunnyButton2.MouseButton1Click:Connect(function()

                            callback()

                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0,
                            })
                            :Play()
                            wait(0.10)
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end)
                    end

                    function InsideLeft:CreateCheckbox(btntext, callback)
                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Checkbox = Instance.new("ImageLabel")
                        local Check = Instance.new("ImageLabel")
                        local ButtonCuh = Instance.new("TextButton")
                        local CheckText = Instance.new("TextLabel")

                        Checkbox.Name = "Checkbox"..btntext
                        Checkbox.Parent = SecStuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Checkbox.BackgroundTransparency = 1.000
                        Checkbox.Position = UDim2.new(0, 0, 0.511821926, 0)
                        Checkbox.Size = UDim2.new(0, 258, 0, 40)
                        Checkbox.Image = "rbxassetid://3570695787"
                        Checkbox.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Checkbox.ScaleType = Enum.ScaleType.Slice
                        Checkbox.SliceCenter = Rect.new(100, 100, 100, 100)
                        Checkbox.SliceScale = 0.120
                        
                        Check.Name = "Check"
                        Check.Parent = Checkbox
                        Check.Active = true
                        Check.AnchorPoint = Vector2.new(0.5, 0.5)
                        Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Check.BackgroundTransparency = 1.000
                        Check.Position = UDim2.new(0.912999988, 0, 0.504000008, 0)
                        Check.Selectable = true
                        Check.Size = UDim2.new(0, 25, 0, 20)
                        Check.Image = "rbxassetid://3570695787"
                        Check.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Check.ImageTransparency = 0.800
                        Check.ScaleType = Enum.ScaleType.Slice
                        Check.SliceCenter = Rect.new(100, 100, 100, 100)
                        Check.SliceScale = 0.120

                        ButtonCuh.Parent = Check
                        ButtonCuh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonCuh.BackgroundTransparency = 1.000
                        ButtonCuh.Size = UDim2.new(0, 25, 0, 19)
                        ButtonCuh.Font = Enum.Font.SourceSans
                        ButtonCuh.Text = ""
                        ButtonCuh.TextColor3 = Color3.fromRGB(0, 0, 0)
                        ButtonCuh.TextSize = 14.000
                        
                        CheckText.Name = "CheckText"
                        CheckText.Parent = Checkbox
                        CheckText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        CheckText.BackgroundTransparency = 1.000
                        CheckText.Size = UDim2.new(0, 113, 0, 40)
                        CheckText.Font = Enum.Font.SourceSans
                        CheckText.Text = btntext
                        CheckText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        CheckText.TextSize = 14.000

                        

            
                            local toggled = false

                            Check.MouseEnter:Connect(function()
                                if toggled == true then
                                else
                                    game.TweenService
                                :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.900,
                                })
                                :Play()
                                end
                            end)
    
                            Check.MouseLeave:Connect(function()
                                
                                if toggled == true then
                                else
                                    game.TweenService
                                :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                })
                                :Play()
                                end
                            end)

                            function switch_data:Set(bool)
                                toggled = (typeof(bool) == "boolean") and bool or false
                                if toggled then
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0,
                                    })
                                    :Play()
                                    --- We put our animation here when the toggle is on
                                else
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0.800,
                                    })
                                    :Play()
                                    ---We Put our animation here when the toggle is off
                                end
                                pcall(callback, toggled)
                            end

                            ButtonCuh.MouseButton1Click:Connect(function()
                                toggled = not toggled
                                callback(toggled)
                                if toggled then
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0,
                                    })
                                    :Play()
                                    --- We put our animation here when the toggle is on
                                    else
                                        game.TweenService
                                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                            ImageTransparency = 0.800,
                                        })
                                        :Play()
                                        ---We Put our animation here when the toggle is off
                                    end
                                --[[
                                toggled = not toggled
                                

                                    
                                
                                
                                pcall(callback, toggled)

                                ]]
                            end)
            
                           
            
                            return switch_data, Check
                    end

                    function InsideLeft:CreateToggle(btntext, callback)

                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Toggle = Instance.new("ImageLabel")
                        local Toggle1 = Instance.new("ImageLabel")
                        local TCircle = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local ToggleText = Instance.new("TextLabel")
                        
                        --Properties:
                        
                        Toggle.Name = "Toggle"..btntext
                        Toggle.Parent = SecStuff
                        Toggle.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Toggle.BackgroundTransparency = 1.000
                        Toggle.Position = UDim2.new(0, 0, 0.341214627, 0)
                        Toggle.Size = UDim2.new(0, 258, 0, 40)
                        Toggle.Image = "rbxassetid://3570695787"
                        Toggle.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Toggle.ScaleType = Enum.ScaleType.Slice
                        Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
                        Toggle.SliceScale = 0.120
                        
                        Toggle1.Name = "Toggle1"
                        Toggle1.Parent = Toggle
                        Toggle1.Active = true
                        Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
                        Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Toggle1.BackgroundTransparency = 1.000
                        Toggle1.Position = UDim2.new(0.867064953, 0, 0.478849828, 0)
                        Toggle1.Selectable = true
                        Toggle1.Size = UDim2.new(0, 48, 0, 20)
                        Toggle1.Image = "rbxassetid://3570695787"
                        Toggle1.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Toggle1.ImageTransparency = 0.800
                        Toggle1.ScaleType = Enum.ScaleType.Slice
                        Toggle1.SliceCenter = Rect.new(100, 100, 100, 100)
                        Toggle1.SliceScale = 0.120
                        
                        TCircle.Name = "TCircle"
                        TCircle.Parent = Toggle1
                        TCircle.Active = true
                        TCircle.AnchorPoint = Vector2.new(0.5, 0.5)
                        TCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TCircle.BackgroundTransparency = 1.000
                        TCircle.Position = UDim2.new(0.251560032, 0, 0.532464623, 0)
                        TCircle.Selectable = true
                        TCircle.Size = UDim2.new(0, 25, 0, 20)
                        TCircle.Image = "rbxassetid://3570695787"
                        TCircle.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        TCircle.ImageTransparency = 0.800
                        TCircle.ScaleType = Enum.ScaleType.Slice
                        TCircle.SliceCenter = Rect.new(100, 100, 100, 100)
                        TCircle.SliceScale = 0.120
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = Toggle1
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Position = UDim2.new(0.252, 0, 0, 0)
                        AnotherFunnyButton.Size = UDim2.new(0, 45, 0, 20)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000
                        
                        ToggleText.Name = "ToggleText"
                        ToggleText.Parent = Toggle
                        ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleText.BackgroundTransparency = 1.000
                        ToggleText.Size = UDim2.new(0, 113, 0, 40)
                        ToggleText.Font = Enum.Font.SourceSans
                        ToggleText.Text = btntext
                        ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleText.TextSize = 14.000

                        local toggled = false

                        function switch_data:Set(bool)
                            toggled = (typeof(bool) == "boolean") and bool or false
                            if toggled then
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0,
                                    Position = UDim2.new(0.752, 0,0.532, 0),
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                    Position = UDim2.new(0.252, 0,0.532, 0),
                                })
                                :Play()
                                ---We Put our animation here when the toggle is off
                            end
                            pcall(callback, toggled)
                        end

                        Toggle1.MouseEnter:Connect(function()
                            if toggled == true then
                            else
                                game.TweenService
                            :Create(Toggle1, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                            end
                        end)

                        Toggle1.MouseLeave:Connect(function()
                            
                            if toggled == true then
                            else
                                game.TweenService
                            :Create(Toggle1, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end
                        end)

                        AnotherFunnyButton.MouseButton1Click:Connect(function()
                            toggled = not toggled
                            callback(toggled)
                            if toggled then
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0,
                                    Position = UDim2.new(0.752, 0,0.532, 0),
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                    Position = UDim2.new(0.252, 0, 0.532, 0),
                                })
                                :Play()
                                ---We Put our animation here when the toggle is off
                            end
                            --[[
                            toggled = not toggled
                            

                                
                            
                            
                            pcall(callback, toggled)

                            ]]
                        end)
        
                       
        
                        return switch_data, Toggle1

                    end

                    function InsideLeft:CreateSlider(btntext, minvalue, maxvalue, callback)
                        local slider_data = {}
        
        
                        minvalue = minvalue or 0
                        maxvalue = maxvalue or 100
        
        
        
                        callback = callback or function() end
        
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local uis = game:GetService("UserInputService")
                        local Value = minvalue
        
                        
                        local Slider = Instance.new("ImageLabel")
                        local SliderBG = Instance.new("ImageLabel")
                        local SliderDrag = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local Slider_2 = Instance.new("TextLabel")
                        local SliderText = Instance.new("TextLabel")

                        SliderValue = minvalue
                        
                        --Properties:
                        
                        Slider.Name = "Slider"
                        Slider.Parent = SecStuff
                        Slider.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Slider.BackgroundTransparency = 1.000
                        Slider.Position = UDim2.new(0, 0, 0.170607314, 0)
                        Slider.Size = UDim2.new(0, 258, 0, 40)
                        Slider.Image = "rbxassetid://3570695787"
                        Slider.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Slider.ScaleType = Enum.ScaleType.Slice
                        Slider.SliceCenter = Rect.new(100, 100, 100, 100)
                        Slider.SliceScale = 0.120
                        
                        SliderBG.Name = "SliderBG"
                        SliderBG.Parent = Slider
                        SliderBG.Active = true
                        SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderBG.BackgroundTransparency = 1.000
                        SliderBG.Position = UDim2.new(0.70600003, 0, 0.486953735, 0)
                        SliderBG.Selectable = true
                        SliderBG.Size = UDim2.new(0, 135, 0, 21)
                        SliderBG.Image = "rbxassetid://3570695787"
                        SliderBG.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        SliderBG.ImageTransparency = 0.800
                        SliderBG.ScaleType = Enum.ScaleType.Slice
                        SliderBG.SliceCenter = Rect.new(100, 100, 100, 100)
                        SliderBG.SliceScale = 0.120
                        
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = SliderBG
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Position = UDim2.new(0, 0, 0.047857374, 0)
                        AnotherFunnyButton.Size = UDim2.new(0, 132, 0, 19)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000

                        SliderDrag.Name = "SliderDrag"
                        SliderDrag.Parent = AnotherFunnyButton
                        SliderDrag.Active = true
                        SliderDrag.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderDrag.BackgroundTransparency = 1.000
                        SliderDrag.Position = UDim2.new(0.514, 0, 0.524047852, 0)
                        SliderDrag.Selectable = true
                        SliderDrag.Size = UDim2.new(0, 137, 0, 20)
                        SliderDrag.Image = "rbxassetid://3570695787"
                        SliderDrag.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        SliderDrag.ImageTransparency = 0.800
                        SliderDrag.ScaleType = Enum.ScaleType.Slice
                        SliderDrag.SliceCenter = Rect.new(100, 100, 100, 100)
                        SliderDrag.SliceScale = 0.120
                        
                        Slider_2.Name = "Slider%"
                        Slider_2.Parent = SliderBG
                        Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Slider_2.BackgroundTransparency = 1.000
                        Slider_2.Position = UDim2.new(0, 0, 0.0476190485, 0)
                        Slider_2.Size = UDim2.new(0, 135, 0, 20)
                        Slider_2.Font = Enum.Font.SourceSans
                        Slider_2.Text = "65"
                        Slider_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Slider_2.TextSize = 14.000
                        
                        SliderText.Name = "SliderText"
                        SliderText.Parent = Slider
                        SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.BackgroundTransparency = 1.000
                        SliderText.Position = UDim2.new(0, 0, -0.125, 0)
                        SliderText.Size = UDim2.new(0, 113, 0, 45)
                        SliderText.Font = Enum.Font.SourceSans
                        SliderText.Text = btntext
                        SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.TextSize = 14.000

                        AnotherFunnyButton.MouseButton1Down:Connect(function()
                            Value = math.floor(
                                (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue)
                            ) or 0
                            pcall(function()
                                callback(Value)
                            end)
                            SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                            moveconnection = mouse.Move:Connect(function()
                                Slider_2.Text = Value
                                Value = math.floor(
                                    (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X)
                                        + tonumber(minvalue)
                                )
                                pcall(function()
                                    callback(Value)
                                end)
                                SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor(
                                        (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X)
                                            + tonumber(minvalue)
                                    )
                                    pcall(function()
                                        callback(Value)
                                    end)
                                    SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)
        
                        function slider_data:Set(Number)
                            Value = Number
        
                            SliderDrag.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
                            Slider_2.Text = Number
                            callback(Number)
                        end
        
                        return slider_data
                    end
                    return InsideLeft
                end
                if Side == "Right" then

                    local Section = Instance.new("Frame")
                    local SecTitle = Instance.new("TextLabel")
                    local SecListss = Instance.new("UIListLayout")
                    local SecStuff = Instance.new("ImageLabel")
                    local SecUIList = Instance.new("UIListLayout")

                    Section.Name = "Section"..Name
                    Section.Parent = FunnyRight
                    Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Section.BackgroundTransparency = 1.000
                    Section.BorderSizePixel = 0
                    Section.Size = UDim2.new(0, 259, 0, 100)
                    
                    SecTitle.Name = "SecTitle"
                    SecTitle.Parent = Section
                    SecTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.BackgroundTransparency = 1.000
                    SecTitle.BorderSizePixel = 0
                    SecTitle.Size = UDim2.new(0, 258, 0, 17)
                    SecTitle.Font = Enum.Font.SourceSansBold
                    SecTitle.Text = Name
                    SecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.TextSize = 14.000
                    
                    SecListss.Name = "SecListss"
                    SecListss.Parent = Section
                    SecListss.SortOrder = Enum.SortOrder.LayoutOrder
                    SecListss.Padding = UDim.new(0, 4)
                    
                    SecStuff.Name = "SecStuff"
                    SecStuff.Parent = Section
                    SecStuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SecStuff.BackgroundTransparency = 1.000
                    SecStuff.Position = UDim2.new(0, 0, 0.209999993, 0)
                    SecStuff.Size = UDim2.new(0, 258, 0, 40)
                    SecStuff.Image = "rbxassetid://3570695787"
                    SecStuff.ImageColor3 = Color3.fromRGB(26, 26, 26)
                    SecStuff.ScaleType = Enum.ScaleType.Slice
                    SecStuff.SliceCenter = Rect.new(100, 100, 100, 100)
                    SecStuff.SliceScale = 0.120
                    SecStuff.AutomaticSize = Enum.AutomaticSize.Y
                    
                    SecUIList.Parent = SecStuff
                    SecUIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    SecUIList.SortOrder = Enum.SortOrder.LayoutOrder
                    SecUIList.Padding = UDim.new(0, 5)

                    local InsideRight = {}
                    function InsideRight:CreateButton(btntext, callback)
                        local Button = Instance.new("ImageLabel")
                        local Touch = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local ButtonText = Instance.new("TextLabel")

                        Button.Name = "Button"
                        Button.Parent = SecStuff
                        Button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Button.BackgroundTransparency = 1.000
                        Button.Size = UDim2.new(0, 258, 0, 40)
                        Button.Image = "rbxassetid://3570695787"
                        Button.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Button.ScaleType = Enum.ScaleType.Slice
                        Button.SliceCenter = Rect.new(100, 100, 100, 100)
                        Button.SliceScale = 0.120
                        
                        Touch.Name = "Touch"
                        Touch.Parent = Button
                        Touch.Active = true
                        Touch.AnchorPoint = Vector2.new(0.5, 0.5)
                        Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Touch.BackgroundTransparency = 1.000
                        Touch.Position = UDim2.new(0.85431242, 0, 0.503849626, 0)
                        Touch.Selectable = true
                        Touch.Size = UDim2.new(0, 59, 0, 20)
                        Touch.Image = "rbxassetid://3570695787"
                        Touch.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Touch.ImageTransparency = 0.800
                        Touch.ScaleType = Enum.ScaleType.Slice
                        Touch.SliceCenter = Rect.new(100, 100, 100, 100)
                        Touch.SliceScale = 0.120
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = Touch
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Size = UDim2.new(0, 59, 0, 29)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000
                        
                        ButtonText.Name = "ButtonText"
                        ButtonText.Parent = Button
                        ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonText.BackgroundTransparency = 1.000
                        ButtonText.Position = UDim2.new(0, 0, 0.116489366, 0)
                        ButtonText.Size = UDim2.new(0, 113, 0, 29)
                        ButtonText.Font = Enum.Font.SourceSans
                        ButtonText.Text = btntext
                        ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonText.TextSize = 14.000

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        Touch.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                        end)

                        Touch.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                        end)

                        AnotherFunnyButton.MouseButton1Click:Connect(function()

                            callback()

                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0,
                            })
                            :Play()
                            wait(0.10)
                            game.TweenService
                            :Create(Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end)

                    end

                    function InsideRight:CreateButton2(btntext, callback)

                        local Button2 = Instance.new("ImageLabel")
                        local _2Touch = Instance.new("ImageLabel")
                        local AnotherFunnyButton2 = Instance.new("TextButton")

                        Button2.Name = "Button2"..btntext
                        Button2.Parent = SecStuff
                        Button2.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Button2.BackgroundTransparency = 1.000
                        Button2.Position = UDim2.new(0, 0, 0.682429254, 0)
                        Button2.Size = UDim2.new(0, 258, 0, 40)
                        Button2.Image = "rbxassetid://3570695787"
                        Button2.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Button2.ScaleType = Enum.ScaleType.Slice
                        Button2.SliceCenter = Rect.new(100, 100, 100, 100)
                        Button2.SliceScale = 0.120
                        
                        _2Touch.Name = "2Touch"
                        _2Touch.Parent = Button2
                        _2Touch.Active = true
                        _2Touch.AnchorPoint = Vector2.new(0.5, 0.5)
                        _2Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        _2Touch.BackgroundTransparency = 1.000
                        _2Touch.Position = UDim2.new(0.495000005, 0, 0.504000008, 0)
                        _2Touch.Selectable = true
                        _2Touch.Size = UDim2.new(0, 242, 0, 20)
                        _2Touch.Image = "rbxassetid://3570695787"
                        _2Touch.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        _2Touch.ImageTransparency = 0.800
                        _2Touch.ScaleType = Enum.ScaleType.Slice
                        _2Touch.SliceCenter = Rect.new(100, 100, 100, 100)
                        _2Touch.SliceScale = 0.120
                        
                        AnotherFunnyButton2.Name = "AnotherFunnyButton2"
                        AnotherFunnyButton2.Parent = _2Touch
                        AnotherFunnyButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton2.BackgroundTransparency = 1.000
                        AnotherFunnyButton2.Size = UDim2.new(0, 242, 0, 20)
                        AnotherFunnyButton2.Font = Enum.Font.SourceSans
                        AnotherFunnyButton2.Text = btntext
                        AnotherFunnyButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton2.TextSize = 14.000

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        _2Touch.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                        end)

                        _2Touch.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                        end)

                        AnotherFunnyButton2.MouseButton1Click:Connect(function()

                            callback()

                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0,
                            })
                            :Play()
                            wait(0.10)
                            game.TweenService
                            :Create(_2Touch, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end)
                    end

                    function InsideRight:CreateCheckbox(btntext, callback)
                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Checkbox = Instance.new("ImageLabel")
                        local Check = Instance.new("ImageLabel")
                        local ButtonCuh = Instance.new("TextButton")
                        local CheckText = Instance.new("TextLabel")

                        Checkbox.Name = "Checkbox"..btntext
                        Checkbox.Parent = SecStuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Checkbox.BackgroundTransparency = 1.000
                        Checkbox.Position = UDim2.new(0, 0, 0.511821926, 0)
                        Checkbox.Size = UDim2.new(0, 258, 0, 40)
                        Checkbox.Image = "rbxassetid://3570695787"
                        Checkbox.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Checkbox.ScaleType = Enum.ScaleType.Slice
                        Checkbox.SliceCenter = Rect.new(100, 100, 100, 100)
                        Checkbox.SliceScale = 0.120
                        
                        Check.Name = "Check"
                        Check.Parent = Checkbox
                        Check.Active = true
                        Check.AnchorPoint = Vector2.new(0.5, 0.5)
                        Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Check.BackgroundTransparency = 1.000
                        Check.Position = UDim2.new(0.912999988, 0, 0.504000008, 0)
                        Check.Selectable = true
                        Check.Size = UDim2.new(0, 25, 0, 20)
                        Check.Image = "rbxassetid://3570695787"
                        Check.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Check.ImageTransparency = 0.800
                        Check.ScaleType = Enum.ScaleType.Slice
                        Check.SliceCenter = Rect.new(100, 100, 100, 100)
                        Check.SliceScale = 0.120

                        ButtonCuh.Parent = Check
                        ButtonCuh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonCuh.BackgroundTransparency = 1.000
                        ButtonCuh.Size = UDim2.new(0, 25, 0, 19)
                        ButtonCuh.Font = Enum.Font.SourceSans
                        ButtonCuh.Text = ""
                        ButtonCuh.TextColor3 = Color3.fromRGB(0, 0, 0)
                        ButtonCuh.TextSize = 14.000
                        
                        CheckText.Name = "CheckText"
                        CheckText.Parent = Checkbox
                        CheckText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        CheckText.BackgroundTransparency = 1.000
                        CheckText.Size = UDim2.new(0, 113, 0, 40)
                        CheckText.Font = Enum.Font.SourceSans
                        CheckText.Text = "Funn Button"
                        CheckText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        CheckText.TextSize = 14.000

                        

            
                            local toggled = false

                            Check.MouseEnter:Connect(function()
                                if toggled == true then
                                else
                                    game.TweenService
                                :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.900,
                                })
                                :Play()
                                end
                            end)
    
                            Check.MouseLeave:Connect(function()
                                
                                if toggled == true then
                                else
                                    game.TweenService
                                :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                })
                                :Play()
                                end
                            end)

                            function switch_data:Set(bool)
                                toggled = (typeof(bool) == "boolean") and bool or false
                                if toggled then
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0,
                                    })
                                    :Play()
                                    --- We put our animation here when the toggle is on
                                else
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0.800,
                                    })
                                    :Play()
                                    ---We Put our animation here when the toggle is off
                                end
                                pcall(callback, toggled)
                            end

                            ButtonCuh.MouseButton1Click:Connect(function()
                                toggled = not toggled
                                callback(toggled)
                                if toggled then
                                    game.TweenService
                                    :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                        ImageTransparency = 0,
                                    })
                                    :Play()
                                    --- We put our animation here when the toggle is on
                                    else
                                        game.TweenService
                                        :Create(Check, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                            ImageTransparency = 0.800,
                                        })
                                        :Play()
                                        ---We Put our animation here when the toggle is off
                                    end
                                --[[
                                toggled = not toggled
                                

                                    
                                
                                
                                pcall(callback, toggled)

                                ]]
                            end)
            
                           
            
                            return switch_data, Check
                    end

                    function InsideRight:CreateToggle(btntext, callback)

                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Toggle = Instance.new("ImageLabel")
                        local Toggle1 = Instance.new("ImageLabel")
                        local TCircle = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local ToggleText = Instance.new("TextLabel")
                        
                        --Properties:
                        
                        Toggle.Name = "Toggle"..btntext
                        Toggle.Parent = SecStuff
                        Toggle.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Toggle.BackgroundTransparency = 1.000
                        Toggle.Position = UDim2.new(0, 0, 0.341214627, 0)
                        Toggle.Size = UDim2.new(0, 258, 0, 40)
                        Toggle.Image = "rbxassetid://3570695787"
                        Toggle.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Toggle.ScaleType = Enum.ScaleType.Slice
                        Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
                        Toggle.SliceScale = 0.120
                        
                        Toggle1.Name = "Toggle1"
                        Toggle1.Parent = Toggle
                        Toggle1.Active = true
                        Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
                        Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Toggle1.BackgroundTransparency = 1.000
                        Toggle1.Position = UDim2.new(0.867064953, 0, 0.478849828, 0)
                        Toggle1.Selectable = true
                        Toggle1.Size = UDim2.new(0, 48, 0, 20)
                        Toggle1.Image = "rbxassetid://3570695787"
                        Toggle1.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        Toggle1.ImageTransparency = 0.800
                        Toggle1.ScaleType = Enum.ScaleType.Slice
                        Toggle1.SliceCenter = Rect.new(100, 100, 100, 100)
                        Toggle1.SliceScale = 0.120
                        
                        TCircle.Name = "TCircle"
                        TCircle.Parent = Toggle1
                        TCircle.Active = true
                        TCircle.AnchorPoint = Vector2.new(0.5, 0.5)
                        TCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TCircle.BackgroundTransparency = 1.000
                        TCircle.Position = UDim2.new(0.251560032, 0, 0.532464623, 0)
                        TCircle.Selectable = true
                        TCircle.Size = UDim2.new(0, 25, 0, 20)
                        TCircle.Image = "rbxassetid://3570695787"
                        TCircle.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        TCircle.ImageTransparency = 0.800
                        TCircle.ScaleType = Enum.ScaleType.Slice
                        TCircle.SliceCenter = Rect.new(100, 100, 100, 100)
                        TCircle.SliceScale = 0.120
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = Toggle1
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Position = UDim2.new(0.252, 0, 0, 0)
                        AnotherFunnyButton.Size = UDim2.new(0, 45, 0, 20)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000
                        
                        ToggleText.Name = "ToggleText"
                        ToggleText.Parent = Toggle
                        ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleText.BackgroundTransparency = 1.000
                        ToggleText.Size = UDim2.new(0, 113, 0, 40)
                        ToggleText.Font = Enum.Font.SourceSans
                        ToggleText.Text = btntext
                        ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ToggleText.TextSize = 14.000

                        local toggled = false

                        function switch_data:Set(bool)
                            toggled = (typeof(bool) == "boolean") and bool or false
                            if toggled then
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0,
                                    Position = UDim2.new(0.752, 0,0.532, 0),
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                    Position = UDim2.new(0.252, 0,0.532, 0),
                                })
                                :Play()
                                ---We Put our animation here when the toggle is off
                            end
                            pcall(callback, toggled)
                        end

                        Toggle1.MouseEnter:Connect(function()
                            if toggled == true then
                            else
                                game.TweenService
                            :Create(Toggle1, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.900,
                            })
                            :Play()
                            end
                        end)

                        Toggle1.MouseLeave:Connect(function()
                            
                            if toggled == true then
                            else
                                game.TweenService
                            :Create(Toggle1, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ImageTransparency = 0.800,
                            })
                            :Play()
                            end
                        end)

                        AnotherFunnyButton.MouseButton1Click:Connect(function()
                            toggled = not toggled
                            callback(toggled)
                            if toggled then
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0,
                                    Position = UDim2.new(0.752, 0,0.532, 0),
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else
                                game.TweenService
                                :Create(TCircle, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    ImageTransparency = 0.800,
                                    Position = UDim2.new(0.252, 0, 0.532, 0),
                                })
                                :Play()
                                ---We Put our animation here when the toggle is off
                            end
                            --[[
                            toggled = not toggled
                            

                                
                            
                            
                            pcall(callback, toggled)

                            ]]
                        end)
        
                       
        
                        return switch_data, Toggle1

                    end

                    function InsideRight:CreateSlider(btntext, minvalue, maxvalue, callback)
                        local slider_data = {}
        
        
                        minvalue = minvalue or 0
                        maxvalue = maxvalue or 100
        
        
        
                        callback = callback or function() end
        
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local uis = game:GetService("UserInputService")
                        local Value = minvalue
        
                        
                        local Slider = Instance.new("ImageLabel")
                        local SliderBG = Instance.new("ImageLabel")
                        local SliderDrag = Instance.new("ImageLabel")
                        local AnotherFunnyButton = Instance.new("TextButton")
                        local Slider_2 = Instance.new("TextLabel")
                        local SliderText = Instance.new("TextLabel")

                        SliderValue = minvalue
                        
                        --Properties:
                        
                        Slider.Name = "Slider"
                        Slider.Parent = SecStuff
                        Slider.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        Slider.BackgroundTransparency = 1.000
                        Slider.Position = UDim2.new(0, 0, 0.170607314, 0)
                        Slider.Size = UDim2.new(0, 258, 0, 40)
                        Slider.Image = "rbxassetid://3570695787"
                        Slider.ImageColor3 = Color3.fromRGB(26, 26, 26)
                        Slider.ScaleType = Enum.ScaleType.Slice
                        Slider.SliceCenter = Rect.new(100, 100, 100, 100)
                        Slider.SliceScale = 0.120
                        
                        SliderBG.Name = "SliderBG"
                        SliderBG.Parent = Slider
                        SliderBG.Active = true
                        SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderBG.BackgroundTransparency = 1.000
                        SliderBG.Position = UDim2.new(0.70600003, 0, 0.486953735, 0)
                        SliderBG.Selectable = true
                        SliderBG.Size = UDim2.new(0, 135, 0, 21)
                        SliderBG.Image = "rbxassetid://3570695787"
                        SliderBG.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        SliderBG.ImageTransparency = 0.800
                        SliderBG.ScaleType = Enum.ScaleType.Slice
                        SliderBG.SliceCenter = Rect.new(100, 100, 100, 100)
                        SliderBG.SliceScale = 0.120
                        
                        
                        AnotherFunnyButton.Name = "AnotherFunnyButton"
                        AnotherFunnyButton.Parent = SliderBG
                        AnotherFunnyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        AnotherFunnyButton.BackgroundTransparency = 1.000
                        AnotherFunnyButton.Position = UDim2.new(0, 0, 0.047857374, 0)
                        AnotherFunnyButton.Size = UDim2.new(0, 132, 0, 19)
                        AnotherFunnyButton.Font = Enum.Font.SourceSans
                        AnotherFunnyButton.Text = ""
                        AnotherFunnyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        AnotherFunnyButton.TextSize = 14.000

                        SliderDrag.Name = "SliderDrag"
                        SliderDrag.Parent = AnotherFunnyButton
                        SliderDrag.Active = true
                        SliderDrag.AnchorPoint = Vector2.new(0.5, 0.5)
                        SliderDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderDrag.BackgroundTransparency = 1.000
                        SliderDrag.Position = UDim2.new(0.514, 0, 0.524047852, 0)
                        SliderDrag.Selectable = true
                        SliderDrag.Size = UDim2.new(0, 137, 0, 20)
                        SliderDrag.Image = "rbxassetid://3570695787"
                        SliderDrag.ImageColor3 = Color3.fromRGB(0, 98, 255)
                        SliderDrag.ImageTransparency = 0.800
                        SliderDrag.ScaleType = Enum.ScaleType.Slice
                        SliderDrag.SliceCenter = Rect.new(100, 100, 100, 100)
                        SliderDrag.SliceScale = 0.120
                        
                        Slider_2.Name = "Slider%"
                        Slider_2.Parent = SliderBG
                        Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Slider_2.BackgroundTransparency = 1.000
                        Slider_2.Position = UDim2.new(0, 0, 0.0476190485, 0)
                        Slider_2.Size = UDim2.new(0, 135, 0, 20)
                        Slider_2.Font = Enum.Font.SourceSans
                        Slider_2.Text = "65"
                        Slider_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Slider_2.TextSize = 14.000
                        
                        SliderText.Name = "SliderText"
                        SliderText.Parent = Slider
                        SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.BackgroundTransparency = 1.000
                        SliderText.Position = UDim2.new(0, 0, -0.125, 0)
                        SliderText.Size = UDim2.new(0, 113, 0, 45)
                        SliderText.Font = Enum.Font.SourceSans
                        SliderText.Text = btntext
                        SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.TextSize = 14.000

                        AnotherFunnyButton.MouseButton1Down:Connect(function()
                            Value = math.floor(
                                (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X) + tonumber(minvalue)
                            ) or 0
                            pcall(function()
                                callback(Value)
                            end)
                            SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                            moveconnection = mouse.Move:Connect(function()
                                Slider_2.Text = Value
                                Value = math.floor(
                                    (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X)
                                        + tonumber(minvalue)
                                )
                                pcall(function()
                                    callback(Value)
                                end)
                                SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor(
                                        (((tonumber(maxvalue) - tonumber(minvalue)) / 135) * SliderDrag.AbsoluteSize.X)
                                            + tonumber(minvalue)
                                    )
                                    pcall(function()
                                        callback(Value)
                                    end)
                                    SliderDrag.Size = UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 135), 0, 20)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)
        
                        function slider_data:Set(Number)
                            Value = Number
        
                            SliderDrag.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
                            Slider_2.Text = Number
                            callback(Number)
                        end
        
                        return slider_data
                    end
                    return InsideRight
                end
            end
            return InsideTab
        end
        return InsideMenu
    end

    function InsideLibrary:CreateLoader()
        
        

        local Loader = Instance.new("ImageLabel")
        local LoaderSelection = Instance.new("Frame")
        local FunnyTab = Instance.new("Folder")
        local UIListLayout = Instance.new("UIListLayout")
        local Funny = Instance.new("ImageLabel")
        local TopCorner = Instance.new("ImageLabel")
        local LEFT = Instance.new("TextLabel")
        local RIGHT = Instance.new("TextLabel")
        local DisButton = Instance.new("TextButton")
        local Discuh = Instance.new("ImageLabel")

        Loader.Name = "Loader"
        Loader.Parent = JayLib
        Loader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Loader.BackgroundTransparency = 1.000
        Loader.ClipsDescendants = true
        Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
        Loader.Size = UDim2.new(0, 0, 0, 0)
        Loader.Image = "rbxassetid://3570695787"
        Loader.ImageColor3 = Color3.fromRGB(31, 31, 31)
        Loader.ScaleType = Enum.ScaleType.Slice
        Loader.SliceCenter = Rect.new(100, 100, 100, 100)
        Loader.SliceScale = 0.100

        function Library:DestroyLoader()
            Loader:Destroy()
        end

        game.TweenService
        :Create(Loader, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 295, 0, 86), --295
            Position =  UDim2.new(0.5, -147, 0.5, -55)
        })
        :Play()

        
        LoaderSelection.Name = "LoaderSelection"
        LoaderSelection.Parent = Loader
        LoaderSelection.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        LoaderSelection.BorderSizePixel = 0
        LoaderSelection.Position = UDim2.new(0, 0, 0.278045684, 0)
        LoaderSelection.Size = UDim2.new(0, 295, 0, 38)
        
        FunnyTab.Name = "FunnyTab"
        FunnyTab.Parent = LoaderSelection
        
        UIListLayout.Parent = FunnyTab
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout.Padding = UDim.new(0, 6)
        
        Funny.Name = "Funny"
        Funny.Parent = LoaderSelection
        Funny.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        Funny.BackgroundTransparency = 1.000
        Funny.BorderSizePixel = 0
        Funny.Position = UDim2.new(0.5, -139, -0.921159446, 28)
        Funny.Size = UDim2.new(0, 278, 0, 3)
        Funny.Image = "rbxassetid://3570695787"
        Funny.ImageColor3 = MenuConfig.Color
        Funny.ScaleType = Enum.ScaleType.Slice
        Funny.SliceCenter = Rect.new(100, 100, 100, 100)
        Funny.SliceScale = 0.120
        
        TopCorner.Name = "TopCorner"
        TopCorner.Parent = Loader
        TopCorner.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
        TopCorner.BackgroundTransparency = 1.000
        TopCorner.BorderSizePixel = 0
        TopCorner.Position = UDim2.new(0, 0, -0.00912860502, 0)
        TopCorner.Size = UDim2.new(0, 295, 0, 21)
        TopCorner.Image = "rbxassetid://3570695787"
        TopCorner.ImageColor3 = Color3.fromRGB(31, 31, 31)
        TopCorner.ImageTransparency = 1.000
        TopCorner.ScaleType = Enum.ScaleType.Slice
        TopCorner.SliceCenter = Rect.new(100, 100, 100, 100)
        TopCorner.SliceScale = 0.120
        TopCorner.AutomaticSize = Enum.AutomaticSize.XY
        
        LEFT.Name = "LEFT"
        LEFT.Parent = TopCorner
        LEFT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LEFT.BackgroundTransparency = 1.000
        LEFT.BorderSizePixel = 0
        LEFT.Position = UDim2.new(0, 0, 0.0482511967, 0)
        LEFT.Size = UDim2.new(0, 37, 0, 17)
        LEFT.Font = Enum.Font.SourceSansBold
        LEFT.Text = "JAY"
        LEFT.TextColor3 = Color3.fromRGB(255, 255, 255)
        LEFT.TextSize = 15.000
        LEFT.TextXAlignment = Enum.TextXAlignment.Right
        
        RIGHT.Name = "RIGHT"
        RIGHT.Parent = TopCorner
        RIGHT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        RIGHT.BackgroundTransparency = 1.000
        RIGHT.BorderSizePixel = 0
        RIGHT.Position = UDim2.new(0, 35, 0, 0)
        RIGHT.Size = UDim2.new(0, 63, 0, 18)
        RIGHT.Font = Enum.Font.SourceSansBold
        RIGHT.Text = " LOADER"
        RIGHT.TextColor3 = MenuConfig.Color
        RIGHT.TextSize = 15.000
        RIGHT.TextStrokeColor3 = Color3.fromRGB(0, 98, 255)
        RIGHT.TextXAlignment = Enum.TextXAlignment.Left

        DisButton.Name = "LoadButton"
        DisButton.Parent = Loader
        DisButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DisButton.BackgroundTransparency = 1.000
        DisButton.BorderColor3 = Color3.fromRGB(130, 203, 255)
        DisButton.BorderSizePixel = 0
        DisButton.Position = UDim2.new(0.474576294, 0, 0.75, 0)
        DisButton.Size = UDim2.new(0, 14, 0, 16)
        DisButton.Font = Enum.Font.SourceSansBold
        DisButton.Text = ""
        DisButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        DisButton.TextSize = 11
        DisButton.AutomaticSize = Enum.AutomaticSize.XY

        Discuh.Name = "Discuh"
        Discuh.Parent = Loader
        Discuh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Discuh.BackgroundTransparency = 1.000
        Discuh.Position = UDim2.new(0.5, -7, 0.75, 0)
        Discuh.Size = UDim2.new(0, 12, 0, 14)
        Discuh.Image = "http://www.roblox.com/asset/?id=4832957972"
        Discuh.AutomaticSize = Enum.AutomaticSize.XY

        Discuh.MouseEnter:Connect(function()

            game.TweenService
            :Create(Discuh, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 14, 0, 16),
                Position = UDim2.new(0.5, -7, 0.75, 0)
            })
            :Play()
            
        end)

        Discuh.MouseLeave:Connect(function()

            game.TweenService
            :Create(Discuh, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 12, 0, 14)
            })
            :Play()

        end)

        DisButton.MouseButton1Click:Connect(function()

            OpenDiscord('U3rrUXxCjV')

            game.TweenService
            :Create(Discuh, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 16, 0, 18)
            })
            :Play()
            wait(0.2)
            game.TweenService
            :Create(Discuh, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 14, 0, 16)
            })
            :Play()

        end)

        local InsideLoader = {}
        function InsideLoader:CreateButton(btntext, callback)

            btntext = btntext or "Button"
            callback = callback or function() end

            local Load = Instance.new("ImageLabel")
            local LoadButton = Instance.new("TextButton")

            Load.Name = "Load"
            Load.Parent = FunnyTab
            Load.Active = true
            Load.AnchorPoint = Vector2.new(0.5, 0.5)
            Load.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Load.BackgroundTransparency = 1.000
            Load.BorderColor3 = Color3.fromRGB(255, 255, 255)
            Load.BorderSizePixel = 6
            Load.Position = UDim2.new(0.5, 0, 0.611842096, 0)
            Load.Selectable = true
            Load.Size = UDim2.new(0, 132, 0, 29)
            Load.Image = "rbxassetid://3570695787"
            Load.ImageColor3 = Color3.fromRGB(0, 98, 255)
            Load.ImageTransparency = 0.8
            Load.ScaleType = Enum.ScaleType.Slice
            Load.SliceCenter = Rect.new(100, 100, 100, 100)
            Load.SliceScale = 0.070
            
            LoadButton.Name = "LoadButton"
            LoadButton.Parent = Load
            LoadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LoadButton.BackgroundTransparency = 1.000
            LoadButton.BorderColor3 = Color3.fromRGB(130, 203, 255)
            LoadButton.BorderSizePixel = 0
            LoadButton.Position = UDim2.new(0, 0, 0.160276219, 0)
            LoadButton.Size = UDim2.new(0, 133, 0, 20)
            LoadButton.Font = Enum.Font.SourceSansBold
            LoadButton.Text = btntext
            LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            LoadButton.TextSize = 11

            Load.MouseEnter:Connect(function()
                game.TweenService
                :Create(Load, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    ImageTransparency = 0,
                })
                :Play()

                game.TweenService
                :Create(LoadButton, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextSize = 14.000,
                })
                :Play()
                
            end)

            Load.MouseLeave:Connect(function()
                game.TweenService
                :Create(Load, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    ImageTransparency = 0.8,
                })
                :Play()

                game.TweenService
                :Create(LoadButton, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextSize = 11.000,
                })
                :Play()
            end)

            LoadButton.MouseButton1Click:Connect(function()
                callback()
                
                game.TweenService
                :Create(LoadButton, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextSize = 18.000,
                })
                :Play()

                --Funny Destroy

                game.TweenService
                :Create(Loader, TweenInfo.new(0.10, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, 0, 0, 0), --295
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
                :Play()

                game.TweenService
                :Create(RIGHT, TweenInfo.new(0.10, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Position = UDim2.new(0, 36, 0, -50),
                    BackgroundTransparency = 1
                    --TextSize = 0
                })
                :Play()

                game.TweenService
                :Create(LEFT, TweenInfo.new(0.10, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Position = UDim2.new(0, 34, 0, -50),
                    BackgroundTransparency = 1
                    --TextSize = 0
                })
                :Play()

                wait(0.2)
                game.TweenService
                :Create(LoadButton, TweenInfo.new(0.20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextSize = 14.000,
                })
                :Play()
                wait()
                Loader:Destroy()

            end)
        end
        return InsideLoader
    end
    return InsideLibrary
end
return Library
