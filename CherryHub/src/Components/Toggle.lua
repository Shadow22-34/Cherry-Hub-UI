local TAB (NAME HERE)Page = ContentContainer:FindFirstChild("(TAB NAME HERE)Page")
if (TAB NAME HERE)Page then
    -- Create toggle container
    local toggleContainer = Instance.new("Frame")
    toggleContainer.Name = "ToggleContainer"
    toggleContainer.Parent = settingsSection
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Position = UDim2.new(0, 15, 0, 40)
    toggleContainer.Size = UDim2.new(1, -30, 0, 40)
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Parent = toggleContainer
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel.Size = UDim2.new(0, 200, 1, 0)
    toggleLabel.Font = Enum.Font.GothamSemibold
    toggleLabel.Text = "TITLE"
    toggleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    toggleLabel.TextSize = 14
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleButton = Instance.new("Frame")
    toggleButton.Name = "ToggleButton"
    toggleButton.Parent = toggleContainer
    toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(1, -50, 0.5, -12)
    toggleButton.Size = UDim2.new(0, 50, 0, 24)
    toggleButton.ClipsDescendants = true
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Name = "Circle"
    toggleCircle.Parent = toggleButton
    toggleCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    toggleCircle.Position = UDim2.new(0, 4, 0.5, -8)
    toggleCircle.Size = UDim2.new(0, 16, 0, 16)
    
    local circleCorner = Instance.new("UICorner")
    circleCorner.CornerRadius = UDim.new(1, 0)
    circleCorner.Parent = toggleCircle
    
    local toggleGlow = Instance.new("ImageLabel")
    toggleGlow.Name = "Glow"
    toggleGlow.Parent = toggleCircle
    toggleGlow.BackgroundTransparency = 1
    toggleGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
    toggleGlow.Size = UDim2.new(0, 30, 0, 30)
    toggleGlow.Image = "rbxassetid://4996891970"
    toggleGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
    toggleGlow.ImageTransparency = 1
    
    -- Make toggle clickable
    local toggleClickArea = Instance.new("TextButton")
    toggleClickArea.Name = "ClickArea"
    toggleClickArea.Parent = toggleContainer
    toggleClickArea.BackgroundTransparency = 1
    toggleClickArea.Size = UDim2.new(1, 0, 1, 0)
    toggleClickArea.Text = ""
    
    local toggleStatus = false
    
    local function updateToggle()
        if toggleStatus then
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(255, 80, 100)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 30, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.7
            }):Play()
        else
            TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 4, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            }):Play()
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                ImageTransparency = 1
            }):Play()
        end
    end
    
    toggleClickArea.MouseButton1Click:Connect(function()
        toggleStatus = not toggleStatus
        updateToggle()
        
      
        local ripple = Instance.new("Frame")
        ripple.Name = "Ripple"
        ripple.Parent = toggleButton
        ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ripple.BackgroundTransparency = 0.8
        ripple.BorderSizePixel = 0
        ripple.Position = UDim2.new(0.5, -25, 0.5, -25)
        ripple.Size = UDim2.new(0, 0, 0, 0)
        
        local rippleCorner = Instance.new("UICorner")
        rippleCorner.CornerRadius = UDim.new(1, 0)
        rippleCorner.Parent = ripple
        
        TweenService:Create(ripple, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 50, 0, 50),
            BackgroundTransparency = 1
        }):Play()
        
        game:GetService("Debris"):AddItem(ripple, 0.5)
        
        
        print("Toggle is now: " .. (toggleStatus and "ON" or "OFF"))
    end)
    
    
    toggleClickArea.MouseEnter:Connect(function()
        if not toggleStatus then
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
        end
    end)
    
    toggleClickArea.MouseLeave:Connect(function()
        if not toggleStatus then
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
        end
    end)
    
   
    local toggleContainer2 = Instance.new("Frame")
    toggleContainer2.Name = "ToggleContainer2"
    toggleContainer2.Parent = settingsSection
    toggleContainer2.BackgroundTransparency = 1
    toggleContainer2.Position = UDim2.new(0, 15, 0, 90)
    toggleContainer2.Size = UDim2.new(1, -30, 0, 40)
    
    local toggleLabel2 = Instance.new("TextLabel")
    toggleLabel2.Name = "ToggleLabel"
    toggleLabel2.Parent = toggleContainer2
    toggleLabel2.BackgroundTransparency = 1
    toggleLabel2.Position = UDim2.new(0, 0, 0, 0)
    toggleLabel2.Size = UDim2.new(0, 200, 1, 0)
    toggleLabel2.Font = Enum.Font.GothamSemibold
    toggleLabel2.Text = "Another Option"
    toggleLabel2.TextColor3 = Color3.fromRGB(230, 230, 230)
    toggleLabel2.TextSize = 14
    toggleLabel2.TextXAlignment = Enum.TextXAlignment.Left
    
  
end