local sliderContainer = Instance.new("Frame")
    sliderContainer.Name = "SliderContainer"
    sliderContainer.Parent = settingsSection
    sliderContainer.BackgroundTransparency = 1
    sliderContainer.Position = UDim2.new(0, 15, 0, 90) -- Moved up from 180
    sliderContainer.Size = UDim2.new(1, -30, 0, 40)
    
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Name = "SliderLabel"
    sliderLabel.Parent = sliderContainer
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Position = UDim2.new(0, 0, 0, 0)
    sliderLabel.Size = UDim2.new(0, 200, 0, 20)
    sliderLabel.Font = Enum.Font.GothamSemibold
    sliderLabel.Text = "TITLE"
    sliderLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
    sliderLabel.TextSize = 14
    sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderValueLabel = Instance.new("TextLabel")
    sliderValueLabel.Name = "ValueLabel"
    sliderValueLabel.Parent = sliderContainer
    sliderValueLabel.BackgroundTransparency = 1
    sliderValueLabel.Position = UDim2.new(1, -40, 0, 0)
    sliderValueLabel.Size = UDim2.new(0, 40, 0, 20)
    sliderValueLabel.Font = Enum.Font.GothamSemibold
    sliderValueLabel.Text = "50%"
    sliderValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderValueLabel.TextSize = 14
    sliderValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local sliderTrack = Instance.new("Frame")
    sliderTrack.Name = "Track"
    sliderTrack.Parent = sliderContainer
    sliderTrack.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    sliderTrack.BorderSizePixel = 0
    sliderTrack.Position = UDim2.new(0, 0, 0, 25)
    sliderTrack.Size = UDim2.new(1, 0, 0, 6)
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(1, 0)
    trackCorner.Parent = sliderTrack
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "Fill"
    sliderFill.Parent = sliderTrack
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 80, 100)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0.5, 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    local sliderKnob = Instance.new("Frame")
    sliderKnob.Name = "Knob"
    sliderKnob.Parent = sliderTrack
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.BorderSizePixel = 0
    sliderKnob.Position = UDim2.new(0.5, -8, 0.5, -8)
    sliderKnob.Size = UDim2.new(0, 16, 0, 16)
    sliderKnob.ZIndex = 5
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = sliderKnob
    
    -- Add glow effect to knob
    local knobGlow = Instance.new("ImageLabel")
    knobGlow.Name = "Glow"
    knobGlow.Parent = sliderKnob
    knobGlow.BackgroundTransparency = 1
    knobGlow.Position = UDim2.new(0.5, -15, 0.5, -15)
    knobGlow.Size = UDim2.new(0, 30, 0, 30)
    knobGlow.Image = "rbxassetid://4996891970"
    knobGlow.ImageColor3 = Color3.fromRGB(255, 80, 100)
    knobGlow.ImageTransparency = 0.7
    knobGlow.ZIndex = 4
    
    -- Slider functionality
    local isDragging = false
    local sliderValue = 0.5
    
    local function updateSlider(value)
        value = math.clamp(value, 0, 1)
        sliderValue = value
        sliderFill.Size = UDim2.new(value, 0, 1, 0)
        sliderKnob.Position = UDim2.new(value, -8, 0.5, -8)
        sliderValueLabel.Text = math.floor(value * 100) .. "%"
    end
    
    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
            updateSlider(value)
            
            -- Create ripple effect
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = sliderTrack
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.8
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(value, -10, 0.5, -10)
            ripple.Size = UDim2.new(0, 0, 0, 0)
            ripple.ZIndex = 3
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(value, -20, 0.5, -20),
                BackgroundTransparency = 1
            }):Play()
            
            game:GetService("Debris"):AddItem(ripple, 0.5)
            
            -- Animate knob on click
            TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(value, -10, 0.5, -10)
            }):Play()
            
            TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                ImageTransparency = 0.5
            }):Play()
        end
    end)
    
    sliderTrack.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
            
        
            TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(sliderValue, -8, 0.5, -8)
            }):Play()
            
            TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                ImageTransparency = 0.7
            }):Play()
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
            local value = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
            updateSlider(value)
        end
    end)
    

    sliderTrack.MouseEnter:Connect(function()
        if not isDragging then
            TweenService:Create(sliderTrack, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
        end
    end)
    
    sliderTrack.MouseLeave:Connect(function()
        if not isDragging then
            TweenService:Create(sliderTrack, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
        end
    end)
    
   
    spawn(function()
        while sliderKnob.Parent do
            for i = 0, 10 do
                if not knobGlow.Parent then break end
                local transparency = knobGlow.ImageTransparency
                local targetTransparency = transparency - 0.05 + (math.sin(i/10 * math.pi) * 0.05)
                TweenService:Create(knobGlow, TweenInfo.new(0.5), {
                    ImageTransparency = targetTransparency
                }):Play()
                wait(0.5)
            end
        end
    end)
