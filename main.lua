if game.CoreGui:FindFirstChild(_G["UI_Info"]["Project_Name"]) then
    return
end

local Library = {}

function Library:NewWindow()
    local Player = game:GetService("Players").LocalPlayer
    local Mouse = Player:GetMouse()
    local TS = game:service("TweenService")
    local UIS = game:service("UserInputService")
    local ColorModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/Miscellaneous/main/ColorModule.lua"))()

    local UI = Instance.new("ScreenGui")
    syn.protect_gui(UI)
    local MainWindow = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local ProjectTitle = Instance.new("TextLabel")
    local CloseButton = Instance.new("ImageButton")
    local MinimizeButton = Instance.new("ImageButton")

    local Categories = Instance.new("Frame")

    local PageBar = Instance.new("Frame")
    local PageListLayout = Instance.new("UIListLayout")
    local Credits = Instance.new("TextLabel")

    UI.Name = _G["UI_Info"]["Project_Name"]
    UI.Parent = game.CoreGui
    UI.ZIndexBehavior = Enum.ZIndexBehavior.Global
    UI.ResetOnSpawn = false

    MainWindow.Name = "MainWindow"
    MainWindow.Parent = UI
    MainWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainWindow.BackgroundTransparency = 0.1
    MainWindow.BorderColor3 = _G["Theme"]["Window_Border"]
    MainWindow.ClipsDescendants = false
    MainWindow.Position = UDim2.new(0.17239584, 0, 0.152777776, 0)
    MainWindow.Size = UDim2.new(0, 800, 0, 500)
    MainWindow.Active = true
    MainWindow.Draggable = true

    local toggled_ui = false
    local previous = MainWindow.AbsolutePosition

    local function TOGGLE_UI()
        toggled_ui = not toggled_ui
        if toggled_ui then
            local previous = MainWindow.AbsolutePosition
            TS:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0, previous.X, 0, workspace.CurrentCamera.ViewportSize.Y + 10)}):Play()
        else
            TS:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0, previous.X, 0, previous.Y)}):Play()
        end
    end

    TopBar.Name = "TopBar"
    TopBar.Parent = MainWindow
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BorderSizePixel = 0
    TopBar.ZIndex = 3
    TopBar.Size = UDim2.new(1, 0, 0, 40)

    ProjectTitle.Name = "ProjectTitle"
    ProjectTitle.Parent = TopBar
    ProjectTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ProjectTitle.BackgroundTransparency = 1.000
    ProjectTitle.Position = UDim2.new(0, 10, 0, 0)
    ProjectTitle.Size = UDim2.new(0.5, 0, 1, 0)
    ProjectTitle.Font = Enum.Font.SourceSans
    ProjectTitle.RichText = true
    ProjectTitle.ZIndex = 4
    ProjectTitle.Text = _G["UI_Info"]["Project_Title"]
    ProjectTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProjectTitle.TextSize = 25.000
    ProjectTitle.TextWrapped = true
    ProjectTitle.TextXAlignment = Enum.TextXAlignment.Left

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.Position = UDim2.new(1, -33, 0.5, -11)
    CloseButton.Size = UDim2.new(0, 22, 0, 22)
    CloseButton.AutoButtonColor = false
    CloseButton.ZIndex = 4
    CloseButton.Image = "rbxassetid://6814382218"
    CloseButton.ImageColor3 = Color3.fromRGB(255, 255, 255)

    CloseButton.MouseEnter:Connect(function()
        TS:Create(CloseButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(215, 215, 215)}):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        TS:Create(CloseButton, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    CloseButton.MouseButton1Click:Connect(function()
        TOGGLE_UI()
    end)

    PageBar.Name = "PageBar"
    PageBar.Parent = MainWindow
    PageBar.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    PageBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
    PageBar.BorderSizePixel = 0
    PageBar.Position = UDim2.new(0, 0, 0, 40)
    PageBar.Size = UDim2.new(0, 150, 1, -40)

    PageListLayout.Parent = PageBar
    PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageListLayout.Padding = UDim.new(0, 0)

    Credits.Name = "Credits"
    Credits.Parent = MainWindow
    Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Credits.BackgroundTransparency = 1.000
    Credits.Position = UDim2.new(0, 5, 0, 472.5)
    Credits.Size = UDim2.new(0, 10, 0, 30)
    Credits.Font = Enum.Font.Code
    Credits.Text = "By Blissful#4992"
    Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
    Credits.TextSize = 11.000
    Credits.TextXAlignment = Enum.TextXAlignment.Left

    Categories.Name = "Categories"
    Categories.Parent = MainWindow
    Categories.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Categories.BorderColor3 = Color3.fromRGB(255, 255, 255)
    Categories.BorderSizePixel = 0
    Categories.Position = UDim2.new(0, 150, 0, 40)
    Categories.Size = UDim2.new(1, -150, 1, -40)

    local structurer = {}

    function structurer:Toggle()
        TOGGLE_UI()
    end

    function structurer:NewPage(tbl, page_name)
        local CurrentPageNumber = #tbl + 1
        local page_info = {["name"] = page_name, ["idx"] = CurrentPageNumber}
        table.insert(tbl, page_info) 

        local Page = Instance.new("TextButton")
        local PageName = Instance.new("TextLabel")

        Page.Name = CurrentPageNumber
        Page.Parent = PageBar
        Page.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        Page.BackgroundTransparency = 0.85
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(1, 0, 0, 35)
        Page.AutoButtonColor = false
        Page.Font = Enum.Font.SourceSans
        Page.Text = ""
        Page.TextColor3 = Color3.fromRGB(0, 0, 0)
        Page.TextSize = 14.000

        PageName.Name = "PageName"
        PageName.Parent = Page
        PageName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageName.BackgroundTransparency = 1.000
        PageName.BorderColor3 = Color3.fromRGB(255, 255, 255)
        PageName.Position = UDim2.new(0, 10, 0, 0)
        PageName.Size = UDim2.new(1, -10, 0, 35)
        PageName.Font = Enum.Font.SourceSans
        PageName.Text = page_name
        PageName.TextColor3 = Color3.fromRGB(255, 255, 255)
        PageName.TextSize = 16.000
        PageName.TextXAlignment = Enum.TextXAlignment.Left

        local Page_Category = Instance.new("Frame")

        local Column1 = Instance.new("Frame")
        local ColumnLayout1 = Instance.new("UIListLayout")
        local Column2 = Instance.new("Frame")
        local ColumnLayout2 = Instance.new("UIListLayout")
        local Column3 = Instance.new("Frame")
        local ColumnLayout3 = Instance.new("UIListLayout")

        Page_Category.Name = CurrentPageNumber
        Page_Category.Parent = Categories
        Page_Category.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page_Category.BackgroundTransparency = 1.000
        Page_Category.BorderColor3 = Color3.fromRGB(255, 255, 255)
        Page_Category.BorderSizePixel = 0
        Page_Category.Visible = false
        Page_Category.Size = UDim2.new(1, 0, 1, 0)
        Page_Category.ClipsDescendants = true

        Column1.Name = "Column1"
        Column1.Parent = Page_Category
        Column1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Column1.BackgroundTransparency = 1.000
        Column1.Size = UDim2.new(0.330000013, 0, 1, 0)

        ColumnLayout1.Parent = Column1
        ColumnLayout1.SortOrder = Enum.SortOrder.LayoutOrder

        Column2.Name = "Column2"
        Column2.Parent = Page_Category
        Column2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Column2.BackgroundTransparency = 1.000
        Column2.Position = UDim2.new(0.330000013, 2, 0, 0)
        Column2.Size = UDim2.new(0.330000013, 0, 1, 0)

        ColumnLayout2.Parent = Column2
        ColumnLayout2.SortOrder = Enum.SortOrder.LayoutOrder

        Column3.Name = "Column3"
        Column3.Parent = Page_Category
        Column3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Column3.BackgroundTransparency = 1.000
        Column3.Position = UDim2.new(0.666999996, 2, 0, 0)
        Column3.Size = UDim2.new(0.330000013, 0, 1, 0)

        ColumnLayout3.Parent = Column3
        ColumnLayout3.SortOrder = Enum.SortOrder.LayoutOrder

        Page.MouseButton1Click:Connect(function()
            for _,v in pairs(PageBar:GetChildren()) do
                if v:IsA("TextButton") then
                    if tonumber(v.Name) ~= CurrentPageNumber then
                        v.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                    else 
                        v.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    end
                end
            end
            for _,v in pairs(Categories:GetChildren()) do
                if tonumber(v.Name) == CurrentPageNumber then
                    v.Visible = true
                else
                    v.Visible = false
                end
            end
        end)

        local pickerzindex = 1000
        local function NewPickerLayer()
            pickerzindex = pickerzindex + 1
        end

        local dropdownzindex = 10
        local function NewDropdownLayer()
            dropdownzindex = dropdownzindex + 1
        end

        local section_lib = {}
        function section_lib:NewSection(name)
            local Section = Instance.new("Frame")
            local SectionListLayout = Instance.new("UIListLayout")
            local SectionTitle = Instance.new("TextLabel")

            Section.Name = name
            if Column1:FindFirstChildOfClass("Frame") == nil then
                Section.Parent = Column1
            elseif Column2:FindFirstChildOfClass("Frame") == nil then
                Section.Parent = Column2
            elseif Column3:FindFirstChildOfClass("Frame") == nil then
                Section.Parent = Column3
            else
                Section:Destroy()
            end
            Section.BackgroundColor3 = _G["Theme"]["Section_Background"]
            Section.BackgroundTransparency = 0.95
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 30)

            SectionListLayout.Parent = Section
            SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = Section
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Size = UDim2.new(1, 0, 0, 30)
            SectionTitle.Font = Enum.Font.SourceSans
            SectionTitle.TextColor3 = _G["Theme"]["Section_Title"]
            SectionTitle.Text = name
            SectionTitle.TextSize = 14.000

            local function_library = {}
            function function_library:NewButton(name, CallBack)
                local Button = Instance.new("Frame")
                local Detector = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = Section
                Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Button.BackgroundTransparency = 1.000
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0, 0, 0.134468913, 0)
                Button.Size = UDim2.new(1, 0, 0, 30)

                Detector.Name = "Detector"
                Detector.Parent = Button
                Detector.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                Detector.BorderColor3 = _G["Theme"]["Button"]
                Detector.Position = UDim2.new(0, 10, 0.5, -10)
                Detector.Size = UDim2.new(1, -20, 0, 20)
                Detector.AutoButtonColor = false
                Detector.Font = Enum.Font.SourceSans
                Detector.Text = name
                Detector.TextColor3 = _G["Theme"]["Item_Name_Color"]
                Detector.TextSize = 14.000

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                Detector.MouseEnter:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)

                Detector.MouseLeave:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                end)

                Detector.MouseButton1Click:Connect(function()
                    CallBack()
                end)

                local button_function_library = {}
                function button_function_library:Fire(times)
                    local n = times or 1
                    for i = 1, n do
                        CallBack()
                    end
                end

                return button_function_library
            end
            function function_library:NewToggle(name, CallBack, info)
                local Toggle = Instance.new("Frame")
                local ToggleName = Instance.new("TextLabel")
                local Detector = Instance.new("TextButton")

                Toggle.Name = "Toggle"
                Toggle.Parent = Section
                Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Toggle.BackgroundTransparency = 1.000
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0, 0, 0.134468913, 0)
                Toggle.Size = UDim2.new(1, 0, 0, 30)

                ToggleName.Name = "ToggleName"
                ToggleName.Parent = Toggle
                ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleName.BackgroundTransparency = 1.000
                ToggleName.Position = UDim2.new(0, 10, 0, 0)
                ToggleName.Size = UDim2.new(0, 2, 1, 0)
                ToggleName.Font = Enum.Font.SourceSans
                ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleName.Text = name
                ToggleName.TextSize = 15.000
                ToggleName.TextXAlignment = Enum.TextXAlignment.Left

                Detector.Name = "Detector"
                Detector.Parent = Toggle
                Detector.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                Detector.BorderColor3 = _G["Theme"]["Toggle"]
                Detector.Position = UDim2.new(1, -30, 0.5, -10)
                Detector.Size = UDim2.new(0, 20, 0, 20)
                Detector.AutoButtonColor = false
                Detector.Font = Enum.Font.Code
                Detector.Text = ""
                Detector.TextColor3 = Color3.fromRGB(255, 255, 255)
                Detector.TextSize = 13.000

                local default = info.default or false

                local bool = default
                if bool == true then
                    Detector.Text = "X"
                else
                    Detector.Text = ""
                end

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                Detector.MouseEnter:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)

                Detector.MouseLeave:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                end)

                local function Toggle()
                    bool = not bool
                    if bool == true then
                        Detector.Text = "X"
                    else
                        Detector.Text = ""
                    end
                    CallBack(bool)
                end

                Detector.MouseButton1Click:Connect(function()
                    Toggle()
                end)
                local current_bind = info.keybind or nil

                local c
                c = UIS.InputBegan:Connect(function(input)
                    if game.CoreGui:FindFirstChild(_G["UI_Info"]["Project_Name"]) == nil then
                        c:Disconnect()
                    elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == current_bind then
                        Toggle()
                    end
                end)

                local toggle_function_library = {}
                function toggle_function_library:UpdateKeybind(newbind)
                    current_bind = newbind
                end

                function toggle_function_library:Toggle()
                    Toggle()
                end

                return toggle_function_library
            end
            function function_library:NewColorPicker(name, CallBack, info)
                local ColorPicker = Instance.new("Frame")
                local PickerName = Instance.new("TextLabel")
                local Detector = Instance.new("ImageButton")
                local PickerBorder = Instance.new("ImageLabel")
                local Style = Instance.new("ImageLabel")
                local PickerFrame = Instance.new("Frame")
                local HSVBox = Instance.new("ImageButton")
                local Cursor = Instance.new("Frame")
                local HUEPicker = Instance.new("ImageButton")
                local HUEGradient = Instance.new("UIGradient")
                local Indicator = Instance.new("Frame")
                local Value1 = Instance.new("TextBox")
                local Value2 = Instance.new("TextBox")
                local Value3 = Instance.new("TextBox")
                local CopyValues = Instance.new("TextButton")

                ColorPicker.Name = "ColorPicker"
                ColorPicker.Parent = Section
                ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPicker.BackgroundTransparency = 1.000
                ColorPicker.BorderSizePixel = 0
                ColorPicker.Position = UDim2.new(0, 0, 0.134468913, 0)
                ColorPicker.Size = UDim2.new(1, 0, 0, 30)

                PickerName.Name = "PickerName"
                PickerName.Parent = ColorPicker
                PickerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                PickerName.BackgroundTransparency = 1.000
                PickerName.Position = UDim2.new(0, 10, 0, 0)
                PickerName.Size = UDim2.new(0, 2, 1, 0)
                PickerName.Font = Enum.Font.SourceSans
                PickerName.TextColor3 = _G["Theme"]["Item_Name_Color"]
                PickerName.TextSize = 15.000
                PickerName.Text = name
                PickerName.TextXAlignment = Enum.TextXAlignment.Left

                Detector.Name = "Detector"
                Detector.Parent = ColorPicker
                Detector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Detector.BackgroundTransparency = 1.000
                Detector.BorderSizePixel = 0
                Detector.Position = UDim2.new(1, -34, 0.5, -6)
                Detector.Size = UDim2.new(0, 25, 0, 12)
                Detector.ZIndex = 2

                PickerBorder.Name = "PickerBorder"
                PickerBorder.Parent = Detector
                PickerBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                PickerBorder.BackgroundTransparency = 1.000
                PickerBorder.Position = UDim2.new(0, -1, 0, -1)
                PickerBorder.Size = UDim2.new(0, 27, 0, 14)
                PickerBorder.Image = "rbxassetid://6815363931"
                PickerBorder.ImageColor3 = _G["Theme"]["Color_Picker"]
                PickerBorder.ImageTransparency = 0.750

                Style.Name = "Style"
                Style.Parent = Detector
                Style.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Style.BackgroundTransparency = 1.000
                Style.Size = UDim2.new(0, 25, 0, 12)
                Style.ZIndex = 2
                Style.Image = "rbxassetid://6815363931"
                Style.ImageColor3 = info.default or Color3.fromRGB(255, 255, 255)
                Style.ImageTransparency = 0

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                NewPickerLayer()
                PickerFrame.Name = "PickerFrame"
                PickerFrame.Parent = ColorPicker
                PickerFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
                PickerFrame.BorderColor3 = _G["Theme"]["Color_Picker_Selector_Frame"]
                PickerFrame.ClipsDescendants = true
                PickerFrame.Visible = false
                PickerFrame.ZIndex = pickerzindex
                PickerFrame.Position = UDim2.new(1, -150, 1, 0)
                PickerFrame.Size = UDim2.new(0, 140, 0, 175)

                NewPickerLayer()
                HSVBox.Name = "HSVBox"
                HSVBox.Parent = PickerFrame
                HSVBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HSVBox.BorderColor3 = Color3.fromRGB(28, 28, 28)
                HSVBox.Position = UDim2.new(0, 5, 0, 5)
                HSVBox.Size = UDim2.new(0, 115, 0, 115)
                HSVBox.ZIndex = pickerzindex
                HSVBox.AutoButtonColor = false
                HSVBox.Image = "rbxassetid://4155801252"

                HUEPicker.Name = "HUEPicker"
                HUEPicker.Parent = PickerFrame
                HUEPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HUEPicker.BorderColor3 = Color3.fromRGB(28, 28, 28)
                HUEPicker.Position = UDim2.new(1, -15, 0, 5)
                HUEPicker.Size = UDim2.new(0, 10, 0, 115)
                HUEPicker.Rotation = 0
                HUEPicker.ZIndex = pickerzindex
                HUEPicker.AutoButtonColor = false
                HUEPicker.ImageTransparency = 1.000

                NewPickerLayer()
                Value1.Name = "Value1"
                Value1.Parent = PickerFrame
                Value1.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                Value1.BorderColor3 = Color3.fromRGB(25, 25, 25)
                Value1.Position = UDim2.new(0, 5, 1, -50)
                Value1.Size = UDim2.new(0.330000013, -10, 0, 20)
                Value1.ClearTextOnFocus = false
                Value1.Font = Enum.Font.SourceSans
                Value1.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                Value1.Text = ""
                Value1.ZIndex = pickerzindex
                Value1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Value1.TextSize = 14.000

                Value2.Name = "Value2"
                Value2.Parent = PickerFrame
                Value2.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                Value2.BorderColor3 = Color3.fromRGB(25, 25, 25)
                Value2.Position = UDim2.new(0, 45, 1, -50)
                Value2.Size = UDim2.new(0.330000013, -10, 0, 20)
                Value2.ClearTextOnFocus = false
                Value2.Font = Enum.Font.SourceSans
                Value2.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                Value2.Text = ""
                Value2.ZIndex = pickerzindex
                Value2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Value2.TextSize = 14.000

                Value3.Name = "Value3"
                Value3.Parent = PickerFrame
                Value3.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                Value3.BorderColor3 = Color3.fromRGB(25, 25, 25)
                Value3.Position = UDim2.new(0, 85, 1, -50)
                Value3.Size = UDim2.new(0.330000013, -10, 0, 20)
                Value3.ClearTextOnFocus = false
                Value3.Font = Enum.Font.SourceSans
                Value3.ZIndex = pickerzindex
                Value3.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                Value3.Text = ""
                Value3.TextColor3 = Color3.fromRGB(255, 255, 255)
                Value3.TextSize = 14.000

                CopyValues.Name = "CopyValues"
                CopyValues.Parent = PickerFrame
                CopyValues.AutoButtonColor = false
                CopyValues.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                CopyValues.BorderColor3 = Color3.fromRGB(25, 25, 25)
                CopyValues.Position = UDim2.new(0, 5, 1, -25)
                CopyValues.Size = UDim2.new(0, 116, 0, 20)
                CopyValues.ZIndex = pickerzindex
                CopyValues.Font = Enum.Font.SourceSans
                CopyValues.Text = "Copy"
                CopyValues.TextColor3 = Color3.fromRGB(255, 255, 255)
                CopyValues.TextSize = 14.000

                NewPickerLayer()
                Cursor.Name = "Cursor"
                Cursor.Parent = HSVBox
                Cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Cursor.BorderColor3 = Color3.fromRGB(28, 28, 28)
                -- Cursor.Rotation = 45.000
                Cursor.Position =  UDim2.new(0, 0, 0, 0)
                Cursor.ZIndex = pickerzindex
                Cursor.Size = UDim2.new(0, 2, 0, 2)

                HUEGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 0, 200)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(153, 0, 255)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 149, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 209)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 55)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(98, 255, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(251, 255, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 106, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
                HUEGradient.Rotation = 90
                HUEGradient.Parent = HUEPicker

                Indicator.Name = "Indicator"
                Indicator.Parent = HUEPicker
                Indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Indicator.BorderColor3 = Color3.fromRGB(28, 28, 28)
                Indicator.Position =  UDim2.new(0, 0, 0, 0)
                Indicator.ZIndex = pickerzindex
                Indicator.Size = UDim2.new(1, 0, 0, 2)

                CopyValues.MouseEnter:Connect(function()
                    CopyValues.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                end)

                CopyValues.MouseLeave:Connect(function()
                    CopyValues.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                end)

                CopyValues.MouseButton1Click:Connect(function()
                    setclipboard(Value1.Text..", "..Value2.Text..", "..Value3.Text)
                end)

                if info.default ~= nil then
                    Value1.Text = math.round(info.default.r*255)
                    Value2.Text = math.round(info.default.g*255)
                    Value3.Text = math.round(info.default.b*255)
                else
                    Value1.Text = "255"
                    Value2.Text = "255"
                    Value3.Text = "255"
                end

                Detector.MouseButton1Click:Connect(function()
                    PickerFrame.Visible = not PickerFrame.Visible
                end)

                local function MouseNotIn(obj)
                    if (Mouse.X < obj.AbsolutePosition.X or Mouse.X > obj.AbsolutePosition.X + obj.AbsoluteSize.X) or (Mouse.Y < obj.AbsolutePosition.Y or Mouse.Y > obj.AbsolutePosition.Y + obj.AbsoluteSize.Y) then
                        return true
                    end
                    return false
                end

                UIS.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton2 and PickerFrame.Visible == true and MouseNotIn(PickerFrame) then
                        PickerFrame.Visible = false
                    elseif input.UserInputType == Enum.UserInputType.MouseButton1 and PickerFrame.Visible == true and MouseNotIn(Detector) and MouseNotIn(PickerFrame) then
                        PickerFrame.Visible = false
                    end
                end)

                local function PlaceColor(col) -- RGB Color
                    local h, s, v = ColorModule:rgbToHsv(col.r*255, col.g*255, col.b*255)

                    Indicator.Position = UDim2.new(0, 0, 0, HUEPicker.AbsoluteSize.Y - HUEPicker.AbsoluteSize.Y * h)
                    Cursor.Position = UDim2.new(0, HSVBox.AbsoluteSize.X * s - Cursor.AbsoluteSize.X/2, 0, HSVBox.AbsoluteSize.Y - HSVBox.AbsoluteSize.Y * v - Cursor.AbsoluteSize.Y/2)

                    HSVBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                    CallBack(col)
                end

                local function PlaceColorHSV(hsv) -- HSV Color
                    local h = hsv.h
                    local s = hsv.s
                    local v = hsv.v
                    HSVBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                    local newh, news, newv = ColorModule:hsvToRgb(h, s, v)
                    Value1.Text = math.round(newh)
                    Value2.Text = math.round(news)
                    Value3.Text = math.round(newv)
                    Style.ImageColor3 = Color3.fromRGB(math.round(newh), math.round(news), math.round(newv))
                    CallBack(Color3.fromRGB(newh, news, newv))
                end

                if info.default ~= nil then
                    PlaceColor(info.default)
                else
                    PlaceColor(Color3.fromRGB(255, 255, 255))
                end
                
                local SelectingHUE = false
                local SelectingHSV = false

                local prev1
                Value1.Changed:Connect(function(property)
                    if (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and tonumber(Value1.Text) then
                        Value1.Text = math.clamp(tonumber(Value1.Text), 0, 255)
                        PlaceColor(Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text)))
                        Style.ImageColor3 = Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text))
                        prev1 = tonumber(Value1.Text)
                    elseif (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and Value1.Text == " " then
                        Value1.Text = prev1
                    end
                end)

                local prev2
                Value2.Changed:Connect(function(property)
                    if (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and tonumber(Value2.Text) then
                        Value2.Text = math.clamp(tonumber(Value2.Text), 0, 255)
                        PlaceColor(Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text)))
                        Style.ImageColor3 = Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text))
                        prev2 = tonumber(Value2.Text)
                    elseif (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and Value2.Text == " " then
                        Value2.Text = prev2
                    end
                end)

                local prev3
                Value3.Changed:Connect(function(property)
                    if (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and tonumber(Value3.Text) then
                        Value3.Text = math.clamp(tonumber(Value3.Text), 0, 255)
                        PlaceColor(Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text)))
                        Style.ImageColor3 = Color3.fromRGB(tonumber(Value1.Text), tonumber(Value2.Text), tonumber(Value3.Text))
                        prev3 = tonumber(Value3.Text)
                    elseif (SelectingHUE == false and SelectingHSV == false) and tostring(property) == "Text" and Value3.Text == " " then
                        Value3.Text = prev3
                    end
                end)

                HUEPicker.MouseButton1Down:Connect(function()
                    SelectingHUE = true
                end)
                HSVBox.MouseButton1Down:Connect(function()
                    SelectingHSV = true
                end)
                UIS.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        SelectingHUE = false
                        SelectingHSV = false
                    end
                end)
                
                local c 
                c = game:service("RunService").RenderStepped:Connect(function()
                    if SelectingHUE then
                        Indicator.Position = UDim2.new(0, 0, 0, math.clamp(Mouse.Y - HUEPicker.AbsolutePosition.Y, 0, HUEPicker.AbsoluteSize.Y))
                        local h1 = (HUEPicker.AbsoluteSize.Y - (Indicator.AbsolutePosition.Y - HUEPicker.AbsolutePosition.Y)) / HUEPicker.AbsoluteSize.Y
                        local s1 = (Cursor.AbsolutePosition.X - HSVBox.AbsolutePosition.X) / HSVBox.AbsoluteSize.X
                        local v1 = (HSVBox.AbsoluteSize.Y - (Cursor.AbsolutePosition.Y - HSVBox.AbsolutePosition.Y)) / HSVBox.AbsoluteSize.Y
                        PlaceColorHSV({h = h1, s = s1, v = v1})
                    end
                    if SelectingHSV then
                        Cursor.Position = UDim2.new(0, math.clamp(Mouse.X - HSVBox.AbsolutePosition.X, 0, HSVBox.AbsoluteSize.X), 0, math.clamp(Mouse.Y - HSVBox.AbsolutePosition.Y, 0, HSVBox.AbsoluteSize.Y))
                        local h1 = (HUEPicker.AbsoluteSize.Y - (Indicator.AbsolutePosition.Y - HUEPicker.AbsolutePosition.Y)) / HUEPicker.AbsoluteSize.Y
                        local s1 = (Cursor.AbsolutePosition.X - HSVBox.AbsolutePosition.X) / HSVBox.AbsoluteSize.X
                        local v1 = (HSVBox.AbsoluteSize.Y - (Cursor.AbsolutePosition.Y - HSVBox.AbsolutePosition.Y)) / HSVBox.AbsoluteSize.Y
                        Cursor.Position = UDim2.new(0, math.clamp(Mouse.X - HSVBox.AbsolutePosition.X, Cursor.AbsoluteSize.X/2, HSVBox.AbsoluteSize.X - Cursor.AbsoluteSize.X), 0, math.clamp(Mouse.Y - HSVBox.AbsolutePosition.Y, Cursor.AbsoluteSize.Y/2, HSVBox.AbsoluteSize.Y - Cursor.AbsoluteSize.Y))
                        PlaceColorHSV({h = h1, s = s1, v = v1})
                    end
                end)
            end
            function function_library:NewSlider(name, CallBack, info)
                local Slider = Instance.new("Frame")
                local SliderName = Instance.new("TextLabel")
                local Value = Instance.new("TextLabel")
                local Detector = Instance.new("ImageButton")
                local Bar = Instance.new("Frame")
                local Bob = Instance.new("Frame")

                Slider.Name = "Slider"
                Slider.Parent = Section
                Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Slider.BackgroundTransparency = 1.000
                Slider.BorderSizePixel = 0
                Slider.Position = UDim2.new(0, 0, 1.5, 0)
                Slider.Size = UDim2.new(0, 214, 0, 45)

                SliderName.Name = "SliderName"
                SliderName.Parent = Slider
                SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderName.BackgroundTransparency = 1.000
                SliderName.Position = UDim2.new(0, 11, 0, 0)
                SliderName.Size = UDim2.new(0, 2, 0, 30)
                SliderName.Font = Enum.Font.SourceSans
                SliderName.TextColor3 = _G["Theme"]["Item_Name_Color"]
                SliderName.Text = name
                SliderName.TextSize = 15.000
                SliderName.TextXAlignment = Enum.TextXAlignment.Left

                Value.Name = "Value"
                Value.Parent = Slider
                Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Value.BackgroundTransparency = 1.000
                Value.Position = UDim2.new(1, -10, 0, 0)
                Value.Size = UDim2.new(0, 2, 0, 30)
                Value.Font = Enum.Font.Code
                Value.Text = tonumber(math.clamp(info.value, info.min, info.max))..tostring(info.suffix)
                Value.TextColor3 = _G["Theme"]["Slider_Value"]
                Value.TextSize = 12.000
                Value.TextXAlignment = Enum.TextXAlignment.Right

                Detector.Name = "Detector"
                Detector.Parent = Slider
                Detector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Detector.BackgroundTransparency = 1.000
                Detector.Position = UDim2.new(0, 10, 0.666999996, 0)
                Detector.Size = UDim2.new(1, -20, 0, 8)
                Detector.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                Detector.ImageTransparency = 1.000

                Bar.Name = "Bar"
                Bar.Parent = Detector
                Bar.BackgroundColor3 = _G["Theme"]["Slider_Bar"]
                Bar.BorderSizePixel = 0
                Bar.Position = UDim2.new(0, 0, 0.5, -1)
                Bar.Size = UDim2.new(1, 0, 0, 2)

                Bob.Name = "Bob"
                Bob.Parent = Detector
                Bob.BackgroundColor3 = _G["Theme"]["Slider_Bob"]
                Bob.BorderSizePixel = 0
                Bob.Position = UDim2.new(0, 0, 0.5, -1)
                Bob.Size = UDim2.new(0, 4, 0, 2)

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                local Dragging = false
                Detector.MouseButton1Down:Connect(function()
                    Dragging = true
                end)
                UIS.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Dragging = false
                    end
                end)

                local function Place(val)
                    local size = Bob.AbsoluteSize
                    local difference = info.max - info.min
                    local factor = math.abs(math.clamp(val, info.min, info.max) + math.abs(info.min)) / difference
                    Bob.Position = UDim2.new(0, math.clamp(factor * (Bar.AbsoluteSize.X - size.X), 0, Bar.AbsoluteSize.X - size.X), 0.5, -1)
                end
                Place(info.value)

                local previous = nil
                local c 
                c = game:service("RunService").RenderStepped:Connect(function()
                    if Dragging then
                        -- PLACE BOB
                        local size = Bob.AbsoluteSize
                        local pos = Bob.AbsolutePosition
                        local offset = pos.X - Bar.AbsolutePosition.X
                        local mouseoffset = Mouse.X - pos.X
                        Bob.Position = UDim2.new(0, math.clamp(offset + mouseoffset, 0, Bar.AbsoluteSize.X - size.X), 0.5, -1)
                        
                        -- CALCULATIONS
                        local difference = info.max - info.min
                        local distance = Bob.AbsolutePosition.X - Bar.AbsolutePosition.X
                        local outcome = math.round(info.min + distance * difference / (Bar.AbsoluteSize.X - size.X))
                        Value.Text = tostring(outcome)..tostring(info.suffix)
                        if outcome ~= previous then
                            previous = outcome
                            CallBack(outcome)
                        end
                    end
                end)
            end
            function function_library:NewKeybind(name, CallBack, info)
                local current_bind = info.keybind or ""

                local Keybind = Instance.new("Frame")
                local KeybindName = Instance.new("TextLabel")
                local Detector = Instance.new("TextButton")

                Keybind.Name = "Keybind"
                Keybind.Parent = Section
                Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Keybind.BackgroundTransparency = 1.000
                Keybind.BorderSizePixel = 0
                Keybind.Position = UDim2.new(0, 0, 0.134468913, 0)
                Keybind.Size = UDim2.new(1, 0, 0, 30)

                KeybindName.Name = "KeybindName"
                KeybindName.Parent = Keybind
                KeybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeybindName.BackgroundTransparency = 1.000
                KeybindName.Position = UDim2.new(0, 10, 0, 0)
                KeybindName.Size = UDim2.new(0, 2, 1, 0)
                KeybindName.Font = Enum.Font.SourceSans
                KeybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
                KeybindName.Text = name
                KeybindName.TextSize = 15.000
                KeybindName.TextXAlignment = Enum.TextXAlignment.Left

                Detector.Name = "Detector"
                Detector.Parent = Keybind
                Detector.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                Detector.BorderColor3 = _G["Theme"]["Keybind_Border"]
                Detector.Position = UDim2.new(1, -110, 0.5, -10)
                Detector.Size = UDim2.new(0, 100, 0, 20)
                Detector.AutoButtonColor = false
                Detector.Font = Enum.Font.SourceSans
                Detector.Text = string.sub(tostring(current_bind), 14, #tostring(current_bind))
                Detector.TextColor3 = Color3.fromRGB(255, 255, 255)
                Detector.TextSize = 14.000

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                Detector.MouseEnter:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)

                Detector.MouseLeave:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                end)

                local Selecting = false

                local function Scale(word)
                    local scale = #word * 100 / 12
                    Detector.Size = UDim2.new(0, scale, 0, 20)
                    Detector.Position = UDim2.new(1, -scale - 10, 0.5, -10)
                end
                Scale(string.sub(tostring(current_bind), 14, #tostring(current_bind)))

                Detector.MouseButton1Click:Connect(function()
                    Selecting = true
                    Detector.Text = ""
                    Scale("[]")
                    local connection
                    local connection2
                    connection = UIS.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            current_bind = input.KeyCode
                            Detector.Text = string.sub(tostring(current_bind), 14, #tostring(current_bind))
                            Scale("["..string.sub(tostring(current_bind), 14, #tostring(current_bind)).."]")
                            connection:Disconnect()
                            connection2:Disconnect()
                            wait()
                            Selecting = false
                        end
                    end)
                    connection2 = UIS.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton2 then
                            Detector.Text = "NONE"
                            Scale("[NONE]")
                            current_bind = nil
                            connection:Disconnect()
                            connection2:Disconnect()
                            wait()
                            Selecting = false
                        end
                    end)
                end)

                local c
                c = UIS.InputBegan:Connect(function(input)
                    if game.CoreGui:FindFirstChild(_G["UI_Info"]["Project_Name"]) == nil then
                        c:Disconnect()
                    else
                        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == current_bind and Selecting == false then
                            CallBack()
                        end
                    end
                end)

                local keybind_function_library = {}
                function keybind_function_library:UpdateKeybind(newbind)
                    current_bind = newbind
                    Detector.Text = string.sub(tostring(current_bind), 14, #tostring(current_bind))
                    Scale("["..string.sub(tostring(current_bind), 14, #tostring(current_bind)).."]")
                end

                function keybind_function_library:Fire(times)
                    local n = times or 1
                    for i = 1, n do
                        CallBack()
                    end
                end

                return keybind_function_library
            end
            function function_library:NewDropdown(name, CallBack, info)
                local current_option = info.options[info.default] or info.options[1]
                local Dropdown = Instance.new("Frame")
                local DropdownName = Instance.new("TextLabel")
                local Detector = Instance.new("TextButton")
                local Arrow = Instance.new("ImageLabel")
                local OptionsList = Instance.new("Frame")
                local OptionsLayout = Instance.new("UIListLayout")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section
                Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Dropdown.BackgroundTransparency = 1.000
                Dropdown.BorderSizePixel = 0
                Dropdown.Position = UDim2.new(0, 0, 1.5, 0)
                Dropdown.Size = UDim2.new(1, 0, 0, 55)

                DropdownName.Name = "DropdownName"
                DropdownName.Parent = Dropdown
                DropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownName.BackgroundTransparency = 1.000
                DropdownName.Position = UDim2.new(0, 11, 0, 0)
                DropdownName.Size = UDim2.new(0, 2, 0, 30)
                DropdownName.Font = Enum.Font.SourceSans
                DropdownName.TextColor3 = _G["Theme"]["Item_Name_Color"]
                DropdownName.Text = name
                DropdownName.TextSize = 15.000
                DropdownName.TextXAlignment = Enum.TextXAlignment.Left

                Detector.Name = "Detector"
                Detector.Parent = Dropdown
                Detector.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                Detector.BorderColor3 = _G["Theme"]["Dropdown_Border"]
                Detector.Position = UDim2.new(0, 10, 0, 30)
                Detector.Size = UDim2.new(1, -20, 0, 20)
                Detector.ZIndex = 2
                
                NewDropdownLayer()
                Detector.AutoButtonColor = false
                Detector.Font = Enum.Font.SourceSans
                Detector.TextColor3 = Color3.fromRGB(255, 255, 255)
                Detector.ZIndex = 2
                Detector.TextSize = 14.000
                Detector.TextColor3 = _G["Theme"]["Dropdown_Main_Option"]
                Detector.TextWrapped = true

                Arrow.Name = "Arrow"
                Arrow.Parent = Detector
                Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Arrow.BackgroundTransparency = 1.000
                Arrow.BorderSizePixel = 0
                Arrow.Position = UDim2.new(1, -20, 0.5, -2)
                Arrow.Size = UDim2.new(0, 10, 0, 6)
                Arrow.ZIndex = 3
                Arrow.Image = "rbxassetid://6820979846"
                Arrow.ImageColor3 = _G["Theme"]["Dropdown_Arrow"]

                Section.Size = UDim2.new(1, 0, 0, SectionListLayout.AbsoluteContentSize.Y)

                OptionsList.Name = "OptionsList"
                OptionsList.Parent = Dropdown
                OptionsList.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                OptionsList.BackgroundTransparency = 1.000
                OptionsList.BorderColor3 = Color3.fromRGB(25, 25, 25)
                OptionsList.Position = UDim2.new(0, 10, 0, 51)
                OptionsList.Size = UDim2.new(1, -20, 0, 20)
                OptionsList.ZIndex = dropdownzindex
                OptionsList.Visible = false

                OptionsLayout.Name = "OptionsLayout"
                OptionsLayout.Parent = OptionsList
                OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
                OptionsLayout.Padding = UDim.new(0, 1)
                
                local function Select(option)
                    CallBack(option)
                    OptionsList.Visible = false
                    Detector.Text = option
                end
                Select(current_option)

                Detector.MouseEnter:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
                end)

                Detector.MouseLeave:Connect(function()
                    TS:Create(Detector, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(29, 29, 29)}):Play()
                end)

                Detector.MouseButton1Click:Connect(function()
                    OptionsList.Visible = not OptionsList.Visible
                end)

                local function ReMap()
                    for _,v in pairs(OptionsList:GetChildren()) do
                        if not v:IsA("UIListLayout") then
                            for u,x in pairs(getconnections(v.MouseEnter)) do
                                x:Disable()
                            end
                            for u,x in pairs(getconnections(v.MouseLeave)) do
                                x:Disable()
                            end
                            for u,x in pairs(getconnections(v.MouseButton1Click)) do
                                x:Disable()
                            end
                            v:Destroy()
                        end
                    end
                    for _,v in pairs(info.options) do
                        local Option = Instance.new("TextButton")
                        Option.Name = "Option"
                        Option.Parent = OptionsList
                        Option.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                        Option.BorderColor3 = Color3.fromRGB(25, 25, 25)
                        Option.Size = UDim2.new(1, 0, 0, 20)
                        Option.AutoButtonColor = false
                        Option.Font = Enum.Font.SourceSans
                        Option.Text = v
                        Option.ZIndex = dropdownzindex-1
                        Option.TextColor3 = _G["Theme"]["Dropdown_Options"]
                        Option.TextSize = 13.000
    
                        Option.MouseEnter:Connect(function()
                            TS:Create(Option, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
                        end)
        
                        Option.MouseLeave:Connect(function()
                            TS:Create(Option, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(28, 28, 28)}):Play()
                        end)
    
                        Option.MouseButton1Click:Connect(function()
                            Select(v)
                        end)
                    end
                end
                ReMap()
                NewDropdownLayer()
                
                local dropdown_functions_library = {}
                function dropdown_functions_library:SelectOption(name)
                    for _,v in pairs(info.options) do
                        if tostring(v) == tostring(name) then
                            Select(v)
                        end
                    end
                end
                function dropdown_functions_library:AddOption(name)
                    table.insert(info.options, name)
                    ReMap()
                end
                function dropdown_functions_library:RemoveOption(name)
                    local newtbl = {}
                    for _,v in pairs(info.options) do
                        if tostring(v) ~= tostring(name) then
                            table.insert(newtbl, v)
                        end
                    end
                    info.options = newtbl
                    ReMap()
                end
                return dropdown_functions_library
            end
            return function_library
        end
        return section_lib
    end
    return structurer
end

return Library
