-- Cherry Hub Premium UI Library - Header Component
return function(UI)
    local Header = {}
    local TweenService = game:GetService("TweenService")
    
    function Header:Create(title)
        -- Top bar
        local TopBar = Instance.new("Frame")
        TopBar.Name = "TopBar"
        TopBar.Parent = UI.MainFrame
        TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        TopBar.BorderSizePixel = 0
        TopBar.Size = UDim2.new(1, 0, 0, 40)
        
        local TopBarCorner = Instance.new("UICorner")
        TopBarCorner.CornerRadius = UDim.new(0, 8)
        TopBarCorner.Parent = TopBar
        
        -- Title
        local Title = Instance.new("TextLabel")
        Title.Name = "Title"
        Title.Parent = TopBar
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0, 45, 0, 0)
        Title.Size = UDim2.new(1, -100, 1, 0)
        Title.Font = Enum.Font.GothamBold
        Title.Text = title
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 16
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Logo
        local Logo = Instance.new("ImageLabel")
        Logo.Name = "Logo"
        Logo.Parent = TopBar
        Logo.BackgroundTransparency = 1
        Logo.Position = UDim2.new(0, 10, 0.5, -12)
        Logo.Size = UDim2.new(0, 24, 0, 24)
        Logo.Image = "rbxassetid://6031225819"
        Logo.ImageColor3 = Color3.fromRGB(255, 80, 100)
        
        -- Close button
        local CloseButton = Instance.new("ImageButton")
        CloseButton.Name = "CloseButton"
        CloseButton.Parent = TopBar
        CloseButton.BackgroundTransparency = 1
        CloseButton.Position = UDim2.new(1, -30, 0.5, -8)
        CloseButton.Size = UDim2.new(0, 16, 0, 16)
        CloseButton.Image = "rbxassetid://6031094678"
        CloseButton.ImageColor3 = Color3.fromRGB(255, 80, 100)
        
        -- Minimize button
        local MinimizeButton = Instance.new("ImageButton")
        MinimizeButton.Name = "MinimizeButton"
        MinimizeButton.Parent = TopBar
        MinimizeButton.BackgroundTransparency = 1
        MinimizeButton.Position = UDim2.new(1, -60, 0.5, -8)
        MinimizeButton.Size = UDim2.new(0, 16, 0, 16)
        MinimizeButton.Image = "rbxassetid://6031068420"
        MinimizeButton.ImageColor3 = Color3.fromRGB(255, 80, 100)
        
        -- Make the top bar draggable
        local dragging = false
        local dragInput
        local dragStart
        local startPos
        
        TopBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = UI.MainFrame.Position
            end
        end)
        
        TopBar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                UI.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        
        -- Close button functionality
        CloseButton.MouseButton1Click:Connect(function()
            UI.ScreenGui:Destroy()
        end)
        
        -- Minimize button functionality
        local minimized = false
        MinimizeButton.MouseButton1Click:Connect(function()
            minimized = not minimized
            if minimized then
                TweenService:Create(UI.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 600, 0, 40)
                }):Play()
            else
                TweenService:Create(UI.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 600, 0, 350)
                }):Play()
            end
        end)
        
        -- Add hover effects
        local function applyButtonHoverEffect(button)
            button.MouseEnter:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(255, 100, 120)
                }):Play()
            end)
            
            button.MouseLeave:Connect(function()
                TweenService:Create(button, TweenInfo.new(0.2), {
                    ImageColor3 = Color3.fromRGB(255, 80, 100)
                }):Play()
            end)
        end
        
        applyButtonHoverEffect(CloseButton)
        applyButtonHoverEffect(MinimizeButton)
        
        UI.TopBar = TopBar
        UI.Title = Title
        UI.Logo = Logo
    end
    
    return Header
end