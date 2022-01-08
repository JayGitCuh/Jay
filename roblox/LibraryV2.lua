local Library = {}

function checkObj(path, object)
    for i, v in ipairs(path:GetChildren()) do
        if v.Name == object then
            return true
        end
    end
end

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


function Library:CreateMain()

    if checkObj(game:GetService("CoreGui"),"JayLib") then --path and then the object
        game:GetService("CoreGui"):FindFirstChild("JayLib"):Destroy()
        print("Destroyed Other Instance")
    end
    
    local LastLib = Instance.new("ScreenGui")
    LastLib.Name = "JayLib"
    LastLib.Parent = game:GetService("CoreGui")
    LastLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local InsideLibrary = {}
    function InsideLibrary:CreateWindow(size1)

        local MainMenu = Instance.new("Frame")

        MainMenu.Name = "MainMenu"
        MainMenu.Parent = LastLib
        MainMenu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainMenu.BackgroundTransparency = 1.000
        MainMenu.Position = UDim2.new(0.5, -50, 0.5, -50)
        MainMenu.Size = UDim2.new(0, 100, 0, 100)

        local Outline = Instance.new("Frame")
        local OutlineGradient = Instance.new("UIGradient")

        local MenuBG = Instance.new("Frame")

        Outline.Name = "Outline"
        Outline.Parent = MainMenu
        Outline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Outline.BorderSizePixel = 0
        Outline.Position = UDim2.new(0.5, -224, 0.5, -224)
        Outline.Size = UDim2.new(0, 448, 0, 448)

        OutlineGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
        OutlineGradient.Parent = Outline

        MenuBG.Name = "MenuBG"
        MenuBG.Parent = MainMenu
        MenuBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        MenuBG.BackgroundTransparency = 0.200
        MenuBG.BorderSizePixel = 0
        MenuBG.Position = UDim2.new(0.5, -223, 0.5, -223)
        MenuBG.Size = UDim2.new(0, 446, 0, 446)

        local MainBGOutline = Instance.new("Frame")
        local UIMainBGOutlineGradient = Instance.new("UIGradient")

        MakeDraggable(MenuBG, MainMenu)

        MainBGOutline.Name = "MainBGOutline"
        MainBGOutline.Parent = MenuBG
        MainBGOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainBGOutline.BorderSizePixel = 0
        MainBGOutline.Position = UDim2.new(0.5, -214, 0.513452888, -208)
        MainBGOutline.Size = UDim2.new(0, 428, 0, 415)

        UIMainBGOutlineGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
        UIMainBGOutlineGradient.Parent = MainBGOutline
    
        local TitleFolder = Instance.new("Folder")
        local Title = Instance.new("TextLabel")
        local Line = Instance.new("Frame")
        local UILineGradient = Instance.new("UIGradient")
        local Game = Instance.new("TextLabel")

        TitleFolder.Name = "TitleFolder"
        TitleFolder.Parent = MenuBG

        Title.Name = "Title"
        Title.Parent = TitleFolder
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.11210762, -51, 0.0224215239, -10)
        Title.Size = UDim2.new(0, 403, 0, 21)
        Title.Font = Enum.Font.SourceSans
        Title.Text = MenuCFG.Name
        Title.TextColor3 = Color3.fromRGB(0, 179, 255)
        Title.TextSize = 14.000
        Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextXAlignment = Enum.TextXAlignment.Right

        Line.Name = "Line"
        Line.Parent = TitleFolder
        Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0.916538119, 0, 0.0246636774, 0)
        Line.Size = UDim2.new(0, 28, 0, 2)

        UILineGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
        UILineGradient.Parent = Line

        Game.Name = "Game"
        Game.Parent = TitleFolder
        Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Game.BackgroundTransparency = 1.000
        Game.Position = UDim2.new(0.114349775, -51, 0.0224215239, -10)
        Game.Size = UDim2.new(0, 446, 0, 21)
        Game.Font = Enum.Font.SourceSans
        Game.Text = MenuCFG.GameName
        Game.TextColor3 = Color3.fromRGB(0, 179, 255)
        Game.TextSize = 14.000
        Game.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

        local MainBG = Instance.new("Frame")
        local TabButtions = Instance.new("ScrollingFrame")
        local TabButtonUIListout = Instance.new("UIListLayout")

        MainBG.Name = "MainBG"
        MainBG.Parent = MenuBG
        MainBG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        MainBG.BackgroundTransparency = 0.200
        MainBG.BorderSizePixel = 0
        MainBG.Position = UDim2.new(0.5, -213, 0.513000011, -206)
        MainBG.Size = UDim2.new(0, 426, 0, 413)

        TabButtions.Name = "TabButtions"
        TabButtions.Parent = MainBG
        TabButtions.Active = true
        TabButtions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButtions.BackgroundTransparency = 1.000
        TabButtions.BorderSizePixel = 0
        TabButtions.Position = UDim2.new(0.0266368315, 0, 0.0160000771, 0)
        TabButtions.Size = UDim2.new(0, 407, 0, 18)
        TabButtions.CanvasPosition = Vector2.new(225, 0)
        TabButtions.CanvasSize = UDim2.new((size1 or 0), 0, 0, 0)
        TabButtions.ScrollBarThickness = 0

        TabButtonUIListout.Name = "TabButtonUIListout"
        TabButtonUIListout.Parent = TabButtions
        TabButtonUIListout.FillDirection = Enum.FillDirection.Horizontal
        TabButtonUIListout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabButtonUIListout.SortOrder = Enum.SortOrder.LayoutOrder

        local TabContainerOutline = Instance.new("Frame")
        local UIContainerGradient = Instance.new("UIGradient")

        TabContainerOutline.Name = "TabContainerOutline"
        TabContainerOutline.Parent = MenuBG
        TabContainerOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabContainerOutline.BorderSizePixel = 0
        TabContainerOutline.Position = UDim2.new(0.52768451, -214, 0.590543032, -208)
        TabContainerOutline.Size = UDim2.new(0, 404, 0, 373)

        UIContainerGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
        UIContainerGradient.Parent = TabContainerOutline

        local AfterFrameNotImportant = Instance.new("Frame")

        AfterFrameNotImportant.Name = "AfterFrameNotImportant"
        AfterFrameNotImportant.Parent = MenuBG
        AfterFrameNotImportant.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        AfterFrameNotImportant.BackgroundTransparency = 0.200
        AfterFrameNotImportant.BorderSizePixel = 0
        AfterFrameNotImportant.Position = UDim2.new(0.532000005, -215, 0.595000029, -209)
        AfterFrameNotImportant.Size = UDim2.new(0, 402, 0, 371)

        TabButtonUIListout.Name = "TabButtonUIListout"
        TabButtonUIListout.Parent = TabButtions
        TabButtonUIListout.FillDirection = Enum.FillDirection.Horizontal
        TabButtonUIListout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabButtonUIListout.SortOrder = Enum.SortOrder.LayoutOrder


        local TabContainerFolder = Instance.new("Folder")
        TabContainerFolder.Name = "TabContainerFolder"
        TabContainerFolder.Parent = MenuBG

        local TabAmount = 0

        local InsideWindow = {}

        function InsideWindow:CloseOpen()
            if MenuBG.Visible == true or Outline.Visible == true then
                MenuBG.Visible = false
                Outline.Visible = false
            else
                MenuBG.Visible = true
                Outline.Visible = true
            end
        end

        function InsideWindow:CreateTab(name, size, othersize)

            TabAmount = TabAmount + 1

            local TabButton = Instance.new("TextButton")
            local UITabGradient = Instance.new("UIGradient")
            
            TabButton.Name = "TabButton"
            TabButton.Parent = TabButtions
            TabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TabButton.BackgroundTransparency = 0.400
            TabButton.BorderColor3 = MenuCFG.Color.Secondary
            TabButton.Position = UDim2.new(0.433660924, 0, 0, 0)
            TabButton.Size = UDim2.new(0, 49, 0, 18)
            TabButton.AutoButtonColor = false
            TabButton.Font = Enum.Font.SourceSans
            TabButton.Text = name
            TabButton.TextColor3 = MenuCFG.Color.Secondary
            TabButton.TextSize = 14.000
            
            UITabGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
            UITabGradient.Parent = TabButton

            
            local TabContainer = Instance.new("ScrollingFrame")
            local Left = Instance.new("Frame")
            local Right = Instance.new("Frame")
            
            --Properties:
            
            
            
            TabContainer.Name = TabAmount
            TabContainer.Parent = TabContainerFolder
            TabContainer.Active = true
            TabContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TabContainer.BackgroundTransparency = 1.000
            TabContainer.BorderSizePixel = 0
            if TabContainer.Name == "1" then
                TabContainer.Visible = true
            else
                TabContainer.Visible = false
            end
            TabContainer.Position = UDim2.new(0.532000005, -215, 0.595000029, -209)
            TabContainer.Size = UDim2.new(0, 402, 0, 371)
            TabContainer.ZIndex = 5
            TabContainer.ScrollBarThickness = 0

            TabButton.MouseButton1Click:Connect(function()
                for i, v in next, TabContainerFolder:GetChildren() do
                    v.Visible = false
                end
                TabContainer.Visible = true
            end)

            local InsideTab = {}
            function InsideTab:CreateSection(secname, Side)
                if Side == "Left" then
                    Left.Name = "Left"
                    Left.Parent = TabContainer
                    Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Left.BackgroundTransparency = 1.000
                    Left.BorderSizePixel = 0
                    Left.Size = UDim2.new(0, 198, 0, 372)

                    local LeftUIList = Instance.new("UIListLayout")

                    LeftUIList.Name = "LeftUIList"
                    LeftUIList.Parent = Left
                    LeftUIList.SortOrder = Enum.SortOrder.LayoutOrder

                    local Section = Instance.new("Frame")
                    local SectionTitle = Instance.new("Frame")
                    local SecTitle = Instance.new("TextLabel")
                    local UIGradient = Instance.new("UIGradient")
                    local Stuff = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local UIListLayout_2 = Instance.new("UIListLayout")
                    
                    Section.Name = "Section"
                    Section.Parent = Left
                    Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Section.BackgroundTransparency = 1.000
                    Section.BorderSizePixel = 0
                    Section.AutomaticSize = Enum.AutomaticSize.Y
                    Section.Size = UDim2.new(0, 198, 0, 24)
                    
                    SectionTitle.Name = "SectionTitle"
                    SectionTitle.Parent = Section
                    SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SectionTitle.BackgroundTransparency = 1.000
                    SectionTitle.BorderSizePixel = 0
                    SectionTitle.Size = UDim2.new(0, 198, 0, 18)
                    
                    SecTitle.Name = "SecTitle"
                    SecTitle.Parent = SectionTitle
                    SecTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    SecTitle.BackgroundTransparency = 1.000
                    SecTitle.BorderSizePixel = 0
                    SecTitle.Size = UDim2.new(0, 198, 0, 18)
                    SecTitle.Font = Enum.Font.SourceSansBold
                    SecTitle.Text = secname
                    SecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.TextSize = 15.000
                    
                    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                    UIGradient.Parent = SecTitle
                    
                    Stuff.Name = "Stuff"
                    Stuff.Parent = Section
                    Stuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Stuff.BackgroundTransparency = 1.000
                    Stuff.BorderSizePixel = 0
                    Stuff.Size = UDim2.new(0, 198, 0, 24)
                    
                    UIListLayout.Parent = Stuff
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 0) --5
                    
                    UIListLayout_2.Parent = Section
                    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

                    local InsideLeft = {}
                    function InsideLeft:CreateButton(btntext, callback)



                        local TextButton = Instance.new("TextButton")
                        local UIButtionGradient = Instance.new("UIGradient")
                        
                        TextButton.Parent = Stuff
                        TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton.BackgroundTransparency = 0.700
                        TextButton.Size = UDim2.new(0, 198, 0, 24)
                        TextButton.Font = Enum.Font.SourceSans
                        TextButton.Text = btntext
                        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton.TextSize = 14.000
                        
                        UIButtionGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UIButtionGradient.Parent = TextButton

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        TextButton.MouseButton1Click:Connect(function()

                            callback()

                        end)
                    end

                    function InsideLeft:CreateKeybind(Name, First, Callback)
                        local OldBind = First.Name;
                            
                        local Checkbox = Instance.new("Frame")
                        local CheckboxButton = Instance.new("TextButton")
                        local TextLabel = Instance.new("TextLabel")
                        local UICheckboxGradient = Instance.new("UIGradient")
                        
                        --Properties:
                        
                        Checkbox.Name = "Keybind"
                        Checkbox.Parent = Stuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Checkbox.BackgroundTransparency = 0.700
                        Checkbox.BorderSizePixel = 0
                        Checkbox.Size = UDim2.new(0, 198, 0, 24)
                        
                        CheckboxButton.Name = "KeybindButton"
                        CheckboxButton.Parent = Checkbox
                        CheckboxButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        CheckboxButton.BorderColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.Position = UDim2.new(0.887000024, 0, 0.5, -7)
                        CheckboxButton.Size = UDim2.new(0, 15, 0, 15)
                        CheckboxButton.Font = Enum.Font.SourceSans
                        CheckboxButton.Text = OldBind
                        CheckboxButton.TextColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.TextSize = 14.000
                        
                        TextLabel.Parent = Checkbox
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Text = Name
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UICheckboxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UICheckboxGradient.Parent = TextLabel

                        CheckboxButton.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = Color3.fromRGB(255, 255, 255),
                            })
                            :Play()
                        end)

                        CheckboxButton.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = MenuCFG.Color.Secondary,
                            })
                            :Play()
                        end)
                
                        CheckboxButton.MouseButton1Click:connect(function(e) 
                            CheckboxButton.Text = "..."
                            local a, b = game:GetService('UserInputService').InputBegan:wait();
                            if a.KeyCode.Name ~= "Unknown" then
                                if a.KeyCode.Name == "One" then
                                    CheckboxButton.Text = "1"
                                elseif a.KeyCode.Name == "Two" then
                                    CheckboxButton.Text = "2"
                                elseif a.KeyCode.Name == "Three" then
                                    CheckboxButton.Text = "3"
                                elseif a.KeyCode.Name == "Four" then
                                    CheckboxButton.Text = "4"
                                elseif a.KeyCode.Name == "Five" then
                                    CheckboxButton.Text = "5"
                                elseif a.KeyCode.Name == "Six" then
                                    CheckboxButton.Text = "6"
                                elseif a.KeyCode.Name == "Seven" then
                                    CheckboxButton.Text = "7"
                                elseif a.KeyCode.Name == "Eight" then
                                    CheckboxButton.Text = "8"
                                elseif a.KeyCode.Name == "Nine" then
                                    CheckboxButton.Text = "9"
                                elseif a.KeyCode.Name == "Zero" then
                                    CheckboxButton.Text = "0"
                                   else
                                    CheckboxButton.Text = a.KeyCode.Name 
                                end
                                OldBind = a.KeyCode.Name;
                            end
                        end)
                
                        game:GetService("UserInputService").InputBegan:connect(function(Tired, Toggle) 
                            if not Toggle then 
                                if Tired.KeyCode.Name == OldBind then 
                                    Callback()
                                end
                            end
                        end)
                    end

                    function InsideLeft:CreateCheckbox(btntext, callback)

                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Checkbox = Instance.new("Frame")
                        local CheckboxButton = Instance.new("TextButton")
                        local TextLabel = Instance.new("TextLabel")
                        local UICheckboxGradient = Instance.new("UIGradient")
                        
                        --Properties:
                        
                        Checkbox.Name = "Checkbox"
                        Checkbox.Parent = Stuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Checkbox.BackgroundTransparency = 0.700
                        Checkbox.BorderSizePixel = 0
                        Checkbox.Size = UDim2.new(0, 198, 0, 24)
                        
                        CheckboxButton.Name = "CheckboxButton"
                        CheckboxButton.Parent = Checkbox
                        CheckboxButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        CheckboxButton.BorderColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.Position = UDim2.new(0.887000024, 0, 0.5, -7)
                        CheckboxButton.Size = UDim2.new(0, 15, 0, 15)
                        CheckboxButton.Font = Enum.Font.SourceSans
                        CheckboxButton.Text = ""
                        CheckboxButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        CheckboxButton.TextSize = 14.000
                        
                        TextLabel.Parent = Checkbox
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Text = btntext
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UICheckboxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UICheckboxGradient.Parent = TextLabel

                        local toggled = false

                        CheckboxButton.MouseEnter:Connect(function()
                            if toggled == true then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                                })
                                :Play()
                            else
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                                })
                                :Play()
                            end
                        end)

                        CheckboxButton.MouseLeave:Connect(function()
                            
                            if toggled == true then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                            else
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                            end
                        end)

                        function switch_data:Set(bool)
                            toggled = (typeof(bool) == "boolean") and bool or false
                            if toggled then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(31, 31, 31),
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                
                                ---We Put our animation here when the toggle is off
                            end
                            pcall(callback, toggled)
                        end

                        CheckboxButton.MouseButton1Click:Connect(function()
                            toggled = not toggled
                            callback(toggled)
                            if toggled then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(31, 31, 31),
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                
                                ---We Put our animation here when the toggle is off
                            end
                        end)
        
                        return switch_data, CheckboxButton

                    end

                    function InsideLeft:CreateSlider(btntext, minvalue, maxvalue, callback)
                        local slider_data = {}
        
        
                        minvalue = minvalue or 0
                        maxvalue = maxvalue or 100
        
        
        
                        callback = callback or function() end
        
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local uis = game:GetService("UserInputService")
                        local Value = minvalue
        
                        
                        local Slider = Instance.new("Frame")
                        local TextLabel = Instance.new("TextLabel")
                        local UIGradient = Instance.new("UIGradient")
                        local SliderButton = Instance.new("TextButton")
                        local SliderFrame = Instance.new("Frame")
                        
                        --Properties:
                        
                        Slider.Name = "Slider"
                        Slider.Parent = Stuff
                        Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Slider.BackgroundTransparency = 0.700
                        Slider.BorderSizePixel = 0
                        Slider.Size = UDim2.new(0, 198, 0, 24)
                        
                        TextLabel.Parent = Slider
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.Text = btntext
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UIGradient.Parent = TextLabel
                        
                        SliderButton.Name = "SliderButton"
                        SliderButton.Parent = Slider
                        SliderButton.BackgroundColor3 = Color3.fromRGB(0, 32, 51)
                        SliderButton.BorderSizePixel = 1
                        SliderButton.BorderColor3 = MenuCFG.Color.Secondary
                        SliderButton.Position = UDim2.new(0.64200002, 0, 0.699999988, -7)
                        SliderButton.Size = UDim2.new(0, 63, 0, 6)
                        SliderButton.Font = Enum.Font.SourceSans
                        SliderButton.Text = ""
                        SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        SliderButton.TextSize = 12.000
                        SliderButton.AutoButtonColor = false
                        
                        SliderFrame.Name = "SliderFrame"
                        SliderFrame.Parent = SliderButton
                        SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderFrame.BorderSizePixel = 0
                        SliderFrame.Position = UDim2.new(0.0790000036, -5, 0.842000008, -5)
                        SliderFrame.Size = UDim2.new(0, 63, 0, 6)

                        local SliderText = Instance.new("TextLabel")

                        SliderText.Name = "SliderText"
                        SliderText.Parent = Slider
                        SliderText.BackgroundColor3 = Color3.fromRGB(0, 32, 51)
                        SliderText.BackgroundTransparency = 1.000
                        SliderText.Position = UDim2.new(0.644121885, 0, 0.347415924, 1)
                        SliderText.Size = UDim2.new(0, 60, 0, 6)
                        SliderText.Font = Enum.Font.SourceSans
                        SliderText.Text = minvalue
                        SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.TextSize = 12.000

                        local SliderGradient = Instance.new("UIGradient")

                        --Properties:
                        
                        SliderGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        SliderGradient.Name = "SliderGradient"
                        SliderGradient.Parent = SliderFrame

                        SliderButton.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(SliderButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = Color3.fromRGB(255, 255, 255),
                            })
                            :Play()
                        end)

                        SliderButton.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(SliderButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = MenuCFG.Color.Secondary,
                            })
                            :Play()
                        end)

                        SliderButton.MouseButton1Down:Connect(function()
                            Value = math.floor(
                                (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X) + tonumber(minvalue)
                            ) or 0
                            pcall(function()
                                callback(Value)
                            end)
                            SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 62), 0, 6)
                            moveconnection = mouse.Move:Connect(function()
                                SliderText.Text = Value
                                Value = math.floor(
                                    (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X)
                                        + tonumber(minvalue)
                                )
                                pcall(function()
                                    callback(Value)
                                end)
                                SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 63), 0, 6)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor(
                                        (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X)
                                            + tonumber(minvalue)
                                    )
                                    pcall(function()
                                        callback(Value)
                                    end)
                                    SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 63), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)
        
                        function slider_data:Set(Number)
                            Value = Number
        
                            SliderFrame.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
                            SliderText.Text = Number
                            callback(Number)
                        end
        
                        return slider_data
                    end
                    return InsideLeft
                end
                if Side == "Right" then
                    
                    Right.Name = "Right"
                    Right.Parent = TabContainer
                    Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Right.BackgroundTransparency = 1.000
                    Right.BorderSizePixel = 0
                    Right.Position = UDim2.new(0.511, 0, 0, 0)
                    Right.Size = UDim2.new(0, 197, 0, 372)

                    local RightUIList = Instance.new("UIListLayout")

                    RightUIList.Name = "LeftUIList"
                    RightUIList.Parent = Right
                    RightUIList.SortOrder = Enum.SortOrder.LayoutOrder
                    local Section = Instance.new("Frame")
                    local SectionTitle = Instance.new("Frame")
                    local SecTitle = Instance.new("TextLabel")
                    local UIGradient = Instance.new("UIGradient")
                    local Stuff = Instance.new("Frame")
                    local UIListLayout = Instance.new("UIListLayout")
                    local UIListLayout_2 = Instance.new("UIListLayout")
                    
                    --Properties:
                    
                    Section.Name = "Section"
                    Section.Parent = Right
                    Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Section.BackgroundTransparency = 1.000
                    Section.BorderSizePixel = 0
                    Section.AutomaticSize = Enum.AutomaticSize.Y
                    Section.Size = UDim2.new(0, 198, 0, 24)
                    
                    SectionTitle.Name = "SectionTitle"
                    SectionTitle.Parent = Section
                    SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SectionTitle.BackgroundTransparency = 1.000
                    SectionTitle.BorderSizePixel = 0
                    SectionTitle.Size = UDim2.new(0, 198, 0, 18)
                    
                    SecTitle.Name = "SecTitle"
                    SecTitle.Parent = SectionTitle
                    SecTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    SecTitle.BackgroundTransparency = 1.000
                    SecTitle.BorderSizePixel = 0
                    SecTitle.Size = UDim2.new(0, 198, 0, 18)
                    SecTitle.Font = Enum.Font.SourceSansBold
                    SecTitle.Text = secname
                    SecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SecTitle.TextSize = 15.000
                    
                    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                    UIGradient.Parent = SecTitle
                    
                    Stuff.Name = "Stuff"
                    Stuff.Parent = Section
                    Stuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Stuff.BackgroundTransparency = 1.000
                    Stuff.BorderSizePixel = 0
                    Stuff.Size = UDim2.new(0, 198, 0, 24)
                    
                    UIListLayout.Parent = Stuff
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    UIListLayout.Padding = UDim.new(0, 0) --5
                    
                    UIListLayout_2.Parent = Section
                    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                    local InsideRight = {}
                    function InsideRight:CreateButton(btntext, callback)



                        local TextButton = Instance.new("TextButton")
                        local UIButtionGradient = Instance.new("UIGradient")
                        
                        TextButton.Parent = Stuff
                        TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton.BackgroundTransparency = 0.700
                        TextButton.Size = UDim2.new(0, 198, 0, 24)
                        TextButton.Font = Enum.Font.SourceSans
                        TextButton.Text = btntext
                        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton.TextSize = 14.000
                        
                        UIButtionGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UIButtionGradient.Parent = TextButton

                        btntext = btntext or "Button"
                        callback = callback or function() end

                        TextButton.MouseButton1Click:Connect(function()

                            callback()

                        end)
                    end

                    function InsideRight:CreateKeybind(Name, First, Callback)
                        local OldBind = First.Name;
                            
                        local Checkbox = Instance.new("Frame")
                        local CheckboxButton = Instance.new("TextButton")
                        local TextLabel = Instance.new("TextLabel")
                        local UICheckboxGradient = Instance.new("UIGradient")
                        
                        --Properties:
                        
                        Checkbox.Name = "Keybind"
                        Checkbox.Parent = Stuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Checkbox.BackgroundTransparency = 0.700
                        Checkbox.BorderSizePixel = 0
                        Checkbox.Size = UDim2.new(0, 198, 0, 24)
                        
                        CheckboxButton.Name = "KeybindButton"
                        CheckboxButton.Parent = Checkbox
                        CheckboxButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        CheckboxButton.BorderColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.Position = UDim2.new(0.887000024, 0, 0.5, -7)
                        CheckboxButton.Size = UDim2.new(0, 15, 0, 15)
                        CheckboxButton.Font = Enum.Font.SourceSans
                        CheckboxButton.Text = OldBind
                        CheckboxButton.TextColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.TextSize = 14.000
                        
                        TextLabel.Parent = Checkbox
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Text = Name
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UICheckboxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UICheckboxGradient.Parent = TextLabel

                        CheckboxButton.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = Color3.fromRGB(255, 255, 255),
                            })
                            :Play()
                        end)

                        CheckboxButton.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = MenuCFG.Color.Secondary,
                            })
                            :Play()
                        end)
                
                        CheckboxButton.MouseButton1Click:connect(function(e) 
                            CheckboxButton.Text = "..."
                            local a, b = game:GetService('UserInputService').InputBegan:wait();
                            if a.KeyCode.Name ~= "Unknown" then
                                if a.KeyCode.Name == "One" then
                                    CheckboxButton.Text = "1"
                                elseif a.KeyCode.Name == "Two" then
                                    CheckboxButton.Text = "2"
                                elseif a.KeyCode.Name == "Three" then
                                    CheckboxButton.Text = "3"
                                elseif a.KeyCode.Name == "Four" then
                                    CheckboxButton.Text = "4"
                                elseif a.KeyCode.Name == "Five" then
                                    CheckboxButton.Text = "5"
                                elseif a.KeyCode.Name == "Six" then
                                    CheckboxButton.Text = "6"
                                elseif a.KeyCode.Name == "Seven" then
                                    CheckboxButton.Text = "7"
                                elseif a.KeyCode.Name == "Eight" then
                                    CheckboxButton.Text = "8"
                                elseif a.KeyCode.Name == "Nine" then
                                    CheckboxButton.Text = "9"
                                elseif a.KeyCode.Name == "Zero" then
                                    CheckboxButton.Text = "0"
                                   else
                                    CheckboxButton.Text = a.KeyCode.Name 
                                end
                                OldBind = a.KeyCode.Name;
                            end
                        end)
                
                        game:GetService("UserInputService").InputBegan:connect(function(Tired, Toggle) 
                            if not Toggle then 
                                if Tired.KeyCode.Name == OldBind then 
                                    Callback()
                                end
                            end
                        end)
                    end

                    function InsideRight:CreateCheckbox(btntext, callback)

                        local switch_data = {}
        
                        btntext = tostring(btntext or "New Switch")
                        callback = typeof(callback) == "function" and callback or function() end

                        local Checkbox = Instance.new("Frame")
                        local CheckboxButton = Instance.new("TextButton")
                        local TextLabel = Instance.new("TextLabel")
                        local UICheckboxGradient = Instance.new("UIGradient")
                        
                        --Properties:
                        
                        Checkbox.Name = "Checkbox"
                        Checkbox.Parent = Stuff
                        Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Checkbox.BackgroundTransparency = 0.700
                        Checkbox.BorderSizePixel = 0
                        Checkbox.Size = UDim2.new(0, 198, 0, 24)
                        
                        CheckboxButton.Name = "CheckboxButton"
                        CheckboxButton.Parent = Checkbox
                        CheckboxButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                        CheckboxButton.BorderColor3 = MenuCFG.Color.Secondary
                        CheckboxButton.Position = UDim2.new(0.887000024, 0, 0.5, -7)
                        CheckboxButton.Size = UDim2.new(0, 15, 0, 15)
                        CheckboxButton.Font = Enum.Font.SourceSans
                        CheckboxButton.Text = ""
                        CheckboxButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        CheckboxButton.TextSize = 14.000
                        
                        TextLabel.Parent = Checkbox
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Text = btntext
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UICheckboxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UICheckboxGradient.Parent = TextLabel

                        local toggled = false

                        CheckboxButton.MouseEnter:Connect(function()
                            if toggled == true then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                                })
                                :Play()
                            else
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                                })
                                :Play()
                            end
                        end)

                        CheckboxButton.MouseLeave:Connect(function()
                            
                            if toggled == true then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                            else
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                            end
                        end)

                        function switch_data:Set(bool)
                            toggled = (typeof(bool) == "boolean") and bool or false
                            if toggled then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(31, 31, 31),
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                
                                ---We Put our animation here when the toggle is off
                            end
                            pcall(callback, toggled)
                        end

                        CheckboxButton.MouseButton1Click:Connect(function()
                            toggled = not toggled
                            callback(toggled)
                            if toggled then
                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                --- We put our animation here when the toggle is on
                            else

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundColor3 = Color3.fromRGB(31, 31, 31),
                                })
                                :Play()

                                game.TweenService
                                :Create(CheckboxButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BorderColor3 = MenuCFG.Color.Secondary,
                                })
                                :Play()
                                
                                ---We Put our animation here when the toggle is off
                            end
                        end)
        
                        return switch_data, CheckboxButton

                    end

                    function InsideRight:CreateSlider(btntext, minvalue, maxvalue, callback)
                        local slider_data = {}
        
        
                        minvalue = minvalue or 0
                        maxvalue = maxvalue or 100
        
        
        
                        callback = callback or function() end
        
                        local mouse = game.Players.LocalPlayer:GetMouse()
                        local uis = game:GetService("UserInputService")
                        local Value = minvalue
        
                        
                        local Slider = Instance.new("Frame")
                        local TextLabel = Instance.new("TextLabel")
                        local UIGradient = Instance.new("UIGradient")
                        local SliderButton = Instance.new("TextButton")
                        local SliderFrame = Instance.new("Frame")
                        
                        --Properties:
                        
                        Slider.Name = "Slider"
                        Slider.Parent = Stuff
                        Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Slider.BackgroundTransparency = 0.700
                        Slider.BorderSizePixel = 0
                        Slider.Size = UDim2.new(0, 198, 0, 24)
                        
                        TextLabel.Parent = Slider
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Size = UDim2.new(0, 198, 0, 24)
                        TextLabel.Font = Enum.Font.SourceSans
                        TextLabel.Text = btntext
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 14.000
                        
                        UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        UIGradient.Parent = TextLabel
                        
                        SliderButton.Name = "SliderButton"
                        SliderButton.Parent = Slider
                        SliderButton.BackgroundColor3 = Color3.fromRGB(0, 32, 51)
                        SliderButton.BorderSizePixel = 1
                        SliderButton.BorderColor3 = MenuCFG.Color.Secondary
                        SliderButton.Position = UDim2.new(0.64200002, 0, 0.699999988, -7)
                        SliderButton.Size = UDim2.new(0, 63, 0, 6)
                        SliderButton.Font = Enum.Font.SourceSans
                        SliderButton.Text = ""
                        SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        SliderButton.TextSize = 12.000
                        SliderButton.AutoButtonColor = false
                        
                        SliderFrame.Name = "SliderFrame"
                        SliderFrame.Parent = SliderButton
                        SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderFrame.BorderSizePixel = 0
                        SliderFrame.Position = UDim2.new(0.0790000036, -5, 0.842000008, -5)
                        SliderFrame.Size = UDim2.new(0, 63, 0, 6)

                        local SliderText = Instance.new("TextLabel")

                        SliderText.Name = "SliderText"
                        SliderText.Parent = Slider
                        SliderText.BackgroundColor3 = Color3.fromRGB(0, 32, 51)
                        SliderText.BackgroundTransparency = 1.000
                        SliderText.Position = UDim2.new(0.644121885, 0, 0.347415924, 1)
                        SliderText.Size = UDim2.new(0, 60, 0, 6)
                        SliderText.Font = Enum.Font.SourceSans
                        SliderText.Text = minvalue
                        SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        SliderText.TextSize = 12.000

                        local SliderGradient = Instance.new("UIGradient")

                        --Properties:
                        
                        SliderGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MenuCFG.Color.Primary), ColorSequenceKeypoint.new(1.00, MenuCFG.Color.Secondary)}
                        SliderGradient.Name = "SliderGradient"
                        SliderGradient.Parent = SliderFrame

                        SliderButton.MouseEnter:Connect(function()
                            game.TweenService
                            :Create(SliderButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = Color3.fromRGB(255, 255, 255),
                            })
                            :Play()
                        end)

                        SliderButton.MouseLeave:Connect(function()
                            game.TweenService
                            :Create(SliderButton, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BorderColor3 = MenuCFG.Color.Secondary,
                            })
                            :Play()
                        end)

                        SliderButton.MouseButton1Down:Connect(function()
                            Value = math.floor(
                                (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X) + tonumber(minvalue)
                            ) or 0
                            pcall(function()
                                callback(Value)
                            end)
                            SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 62), 0, 6)
                            moveconnection = mouse.Move:Connect(function()
                                SliderText.Text = Value
                                Value = math.floor(
                                    (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X)
                                        + tonumber(minvalue)
                                )
                                pcall(function()
                                    callback(Value)
                                end)
                                SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 63), 0, 6)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor(
                                        (((tonumber(maxvalue) - tonumber(minvalue)) / 63) * SliderFrame.AbsoluteSize.X)
                                            + tonumber(minvalue)
                                    )
                                    pcall(function()
                                        callback(Value)
                                    end)
                                    SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - SliderFrame.AbsolutePosition.X, 0, 63), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)
        
                        function slider_data:Set(Number)
                            Value = Number
        
                            SliderFrame.Size = UDim2.new(Number / maxvalue, 0, 1, 0)
                            SliderText.Text = Number
                            callback(Number)
                        end
        
                        return slider_data
                    end
                    return InsideRight
                end
            end
            return InsideTab
        end
        return InsideWindow
    end
    return InsideLibrary
end
