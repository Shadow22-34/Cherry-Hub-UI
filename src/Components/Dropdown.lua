local dropdownContainer = Instance.new("Frame")
    dropdownContainer.Name = "DropdownContainer"
    dropdownContainer.Parent = example1Page
    dropdownContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    dropdownContainer.BorderSizePixel = 0
    dropdownContainer.Position = UDim2.new(0, 0, 0, 160)
    dropdownContainer.Size = UDim2.new(1, 0, 0, 120)
    dropdownContainer.LayoutOrder = 2
    dropdownContainer.ClipsDescendants = true
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 8)
    dropdownCorner.Parent = dropdownContainer
    
    local dropdownTitle = Instance.new("TextLabel")
    dropdownTitle.Name = "DropdownTitle"
    dropdownTitle.Parent = dropdownContainer
    dropdownTitle.BackgroundTransparency = 1
    dropdownTitle.Position = UDim2.new(0, 15, 0, 10)
    dropdownTitle.Size = UDim2.new(1, -30, 0, 20)
    dropdownTitle.Font = Enum.Font.GothamBold
    dropdownTitle.Text = "Theme Selection"
    dropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownTitle.TextSize = 14
    dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Dropdown selector
    local dropdownSelector = Instance.new("Frame")
    dropdownSelector.Name = "DropdownSelector"
    dropdownSelector.Parent = dropdownContainer
    dropdownSelector.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    dropdownSelector.BorderSizePixel = 0
    dropdownSelector.Position = UDim2.new(0, 15, 0, 40)
    dropdownSelector.Size = UDim2.new(1, -30, 0, 36)
    
    local selectorCorner = Instance.new("UICorner")
    selectorCorner.CornerRadius = UDim.new(0, 6)
    selectorCorner.Parent = dropdownSelector
    
    local selectorButton = Instance.new("TextButton")
    selectorButton.Name = "SelectorButton"
    selectorButton.Parent = dropdownSelector
    selectorButton.BackgroundTransparency = 1
    selectorButton.Size = UDim2.new(1, 0, 1, 0)
    selectorButton.Font = Enum.Font.GothamSemibold
    selectorButton.Text = ""
    selectorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectorButton.TextSize = 14
    
    local selectedText = Instance.new("TextLabel")
    selectedText.Name = "SelectedText"
    selectedText.Parent = dropdownSelector
    selectedText.BackgroundTransparency = 1
    selectedText.Position = UDim2.new(0, 15, 0, 0)
    selectedText.Size = UDim2.new(1, -50, 1, 0)
    selectedText.Font = Enum.Font.GothamSemibold
    selectedText.Text = "Cherry Dark (Default)"
    selectedText.TextColor3 = Color3.fromRGB(230, 230, 230)
    selectedText.TextSize = 14
    selectedText.TextXAlignment = Enum.TextXAlignment.Left
    
    local arrowIcon = Instance.new("ImageLabel")
    arrowIcon.Name = "ArrowIcon"
    arrowIcon.Parent = dropdownSelector
    arrowIcon.BackgroundTransparency = 1
    arrowIcon.Position = UDim2.new(1, -30, 0.5, -8)
    arrowIcon.Size = UDim2.new(0, 16, 0, 16)
    arrowIcon.Image = "rbxassetid://6031091004" -- Down arrow icon
    arrowIcon.ImageColor3 = Color3.fromRGB(255, 80, 100)
    
    -- Dropdown options container
    local optionsContainer = Instance.new("Frame")
    optionsContainer.Name = "OptionsContainer"
    optionsContainer.Parent = dropdownContainer
    optionsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    optionsContainer.BorderSizePixel = 0
    optionsContainer.Position = UDim2.new(0, 15, 0, 80)
    optionsContainer.Size = UDim2.new(1, -30, 0, 0) -- Start with 0 height
    optionsContainer.Visible = false
    optionsContainer.ZIndex = 5
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsContainer
    
    local optionsList = Instance.new("UIListLayout")
    optionsList.Parent = optionsContainer
    optionsList.SortOrder = Enum.SortOrder.LayoutOrder
    optionsList.Padding = UDim.new(0, 2)
    
    -- Create dropdown options
    local themes = {
        {name = "Cherry Dark (Default)", color = Color3.fromRGB(255, 80, 100)},
        {name = "Ocean Blue", color = Color3.fromRGB(80, 150, 255)},
        {name = "Emerald Green", color = Color3.fromRGB(80, 220, 100)},
        {name = "Royal Purple", color = Color3.fromRGB(150, 80, 255)}
    }
    
    local isDropdownOpen = false
    local selectedTheme = themes[1]
    
    -- Function to create option buttons
    local function createOption(theme, index)
        local option = Instance.new("TextButton")
        option.Name = "Option_" .. theme.name
        option.Parent = optionsContainer
        option.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
        option.BackgroundTransparency = 1
        option.BorderSizePixel = 0
        option.Size = UDim2.new(1, 0, 0, 30)
        option.Font = Enum.Font.GothamSemibold
        option.Text = ""
        option.ZIndex = 6
        option.LayoutOrder = index
        option.AutoButtonColor = false
        
        local optionText = Instance.new("TextLabel")
        optionText.Name = "OptionText"
        optionText.Parent = option
        optionText.BackgroundTransparency = 1
        optionText.Position = UDim2.new(0, 15, 0, 0)
        optionText.Size = UDim2.new(1, -30, 1, 0)
        optionText.Font = Enum.Font.GothamSemibold
        optionText.Text = theme.name
        optionText.TextColor3 = Color3.fromRGB(230, 230, 230)
        optionText.TextSize = 14
        optionText.TextXAlignment = Enum.TextXAlignment.Left
        optionText.ZIndex = 6
        
        local colorIndicator = Instance.new("Frame")
        colorIndicator.Name = "ColorIndicator"
        colorIndicator.Parent = option
        colorIndicator.BackgroundColor3 = theme.color
        colorIndicator.BorderSizePixel = 0
        colorIndicator.Position = UDim2.new(1, -25, 0.5, -6)
        colorIndicator.Size = UDim2.new(0, 12, 0, 12)
        colorIndicator.ZIndex = 6
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(1, 0)
        indicatorCorner.Parent = colorIndicator
        
        -- Hover effect
        option.MouseEnter:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseLeave:Connect(function()
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundTransparency = 1
            }):Play()
        end)
        
        -- Replace the option's click effect
        option.MouseButton1Down:Connect(function(x, y)
            -- Get relative position for the click
            local relativeX = x - option.AbsolutePosition.X
            local relativeY = y - option.AbsolutePosition.Y
            
            -- Create pulse effect
            local pulse = Instance.new("Frame")
            pulse.Name = "PulseEffect"
            pulse.Parent = option
            pulse.BackgroundColor3 = theme.color
            pulse.BackgroundTransparency = 0.7
            pulse.BorderSizePixel = 0
            pulse.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            pulse.Size = UDim2.new(0, 10, 0, 10)
            pulse.ZIndex = 7
            
            local pulseCorner = Instance.new("UICorner")
            pulseCorner.CornerRadius = UDim.new(1, 0)
            pulseCorner.Parent = pulse
            
            -- Create glow effect
            local glow = Instance.new("ImageLabel")
            glow.Name = "Glow"
            glow.Parent = pulse
            glow.BackgroundTransparency = 1
            glow.Position = UDim2.new(0.5, -20, 0.5, -20)
            glow.Size = UDim2.new(0, 40, 0, 40)
            glow.Image = "rbxassetid://4996891970"
            glow.ImageColor3 = theme.color
            glow.ImageTransparency = 0.5
            glow.ZIndex = 6
            
            -- Animate the pulse
            TweenService:Create(pulse, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 80, 0, 80),
                Position = UDim2.new(0, relativeX - 40, 0, relativeY - 40),
                BackgroundTransparency = 1
            }):Play()
            
            TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 100, 0, 100),
                Position = UDim2.new(0.5, -50, 0.5, -50),
                ImageTransparency = 1
            }):Play()
            
            game:GetService("Debris"):AddItem(pulse, 0.5)
            

            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 65),
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseButton1Up:Connect(function()
        
            TweenService:Create(option, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()
            
       
            selectedTheme = theme
            selectedText.Text = theme.name
            toggleDropdown()
        end)
        
        return option
    end
    

    for i, theme in ipairs(themes) do
        local option = createOption(theme, i)
        
   
        option.MouseButton1Down:Connect(function(x, y)
           
            local relativeX = x - option.AbsolutePosition.X
            local relativeY = y - option.AbsolutePosition.Y
            
         
            local pulse = Instance.new("Frame")
            pulse.Name = "PulseEffect"
            pulse.Parent = option
            pulse.BackgroundColor3 = theme.color
            pulse.BackgroundTransparency = 0.7
            pulse.BorderSizePixel = 0
            pulse.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            pulse.Size = UDim2.new(0, 10, 0, 10)
            pulse.ZIndex = 7
            
            local pulseCorner = Instance.new("UICorner")
            pulseCorner.CornerRadius = UDim.new(1, 0)
            pulseCorner.Parent = pulse
            
        
            local glow = Instance.new("ImageLabel")
            glow.Name = "Glow"
            glow.Parent = pulse
            glow.BackgroundTransparency = 1
            glow.Position = UDim2.new(0.5, -20, 0.5, -20)
            glow.Size = UDim2.new(0, 40, 0, 40)
            glow.Image = "rbxassetid://4996891970"
            glow.ImageColor3 = theme.color
            glow.ImageTransparency = 0.5
            glow.ZIndex = 6
            
          
            TweenService:Create(pulse, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 80, 0, 80),
                Position = UDim2.new(0, relativeX - 40, 0, relativeY - 40),
                BackgroundTransparency = 1
            }):Play()
            
         
            TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 100, 0, 100),
                Position = UDim2.new(0.5, -50, 0.5, -50),
                ImageTransparency = 1
            }):Play()
            
            
            game:GetService("Debris"):AddItem(pulse, 0.5)
            
         
            TweenService:Create(option, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 65),
                BackgroundTransparency = 0
            }):Play()
        end)
        
        option.MouseButton1Up:Connect(function()
           
            TweenService:Create(option, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()
            
       
            selectedTheme = theme
            selectedText.Text = theme.name
            toggleDropdown()
        end)
    end
    
    
    local function toggleDropdown()
        isDropdownOpen = not isDropdownOpen
        
        if isDropdownOpen then
           
            optionsContainer.Visible = true
            
       
            TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, -30, 0, #themes * 32),
                Position = UDim2.new(0, 15, 0, 80)
            }):Play()
            
          
            TweenService:Create(arrowIcon, TweenInfo.new(0.3), {
                Rotation = 180
            }):Play()
            
           
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 90 + (#themes * 32))
            }):Play()
        else
          
            TweenService:Create(optionsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, -30, 0, 0),
                Position = UDim2.new(0, 15, 0, 80)
            }):Play()
            
            
            TweenService:Create(arrowIcon, TweenInfo.new(0.3), {
                Rotation = 0
            }):Play()
            
           
            TweenService:Create(dropdownContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 120)
            }):Play()
            
          
            spawn(function()
                wait(0.3)
                if not isDropdownOpen then
                    optionsContainer.Visible = false
                end
            end)
        end
    end
    
  
    selectorButton.MouseButton1Click:Connect(toggleDropdown)
    
 
    dropdownSelector.MouseEnter:Connect(function()
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        }):Play()
    end)
    
    dropdownSelector.MouseLeave:Connect(function()
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        }):Play()
    end)
    
  
    selectorButton.MouseButton1Down:Connect(function(x, y)
        
        local relativeX = x - selectorButton.AbsolutePosition.X
        local relativeY = y - selectorButton.AbsolutePosition.Y
        
     
        local waveContainer = Instance.new("Frame")
        waveContainer.Name = "WaveEffect"
        waveContainer.Parent = dropdownSelector
        waveContainer.BackgroundTransparency = 1
        waveContainer.Size = UDim2.new(1, 0, 1, 0)
        waveContainer.ClipsDescendants = true
        waveContainer.ZIndex = 10
        
        
        for i = 1, 3 do
            local wave = Instance.new("Frame")
            wave.Name = "Wave_" .. i
            wave.Parent = waveContainer
            wave.BackgroundColor3 = Color3.fromRGB(255, 100, 120)
            wave.BackgroundTransparency = 0.7 + (i * 0.1)
            wave.BorderSizePixel = 0
            wave.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            wave.Size = UDim2.new(0, 10, 0, 10)
            wave.ZIndex = 10
            
            local waveCorner = Instance.new("UICorner")
            waveCorner.CornerRadius = UDim.new(1, 0)
            waveCorner.Parent = wave
            
           
            local delay = (i - 1) * 0.1
            spawn(function()
                wait(delay)
                TweenService:Create(wave, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 100 + (i * 20), 0, 100 + (i * 20)),
                    Position = UDim2.new(0, relativeX - 50 - (i * 10), 0, relativeY - 50 - (i * 10)),
                    BackgroundTransparency = 1
                }):Play()
            end)
        end
        
        
        local flash = Instance.new("Frame")
        flash.Name = "Flash"
        flash.Parent = dropdownSelector
        flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flash.BackgroundTransparency = 0.9
        flash.BorderSizePixel = 0
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.ZIndex = 9
        
        local flashCorner = Instance.new("UICorner")
        flashCorner.CornerRadius = UDim.new(0, 6)
        flashCorner.Parent = flash
        
      
        TweenService:Create(flash, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()
        
       
        TweenService:Create(dropdownSelector, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -32, 0, 34),
            Position = UDim2.new(0, 16, 0, 41)
        }):Play()
        
     
        game:GetService("Debris"):AddItem(waveContainer, 0.8)
        game:GetService("Debris"):AddItem(flash, 0.3)
    end)
    
    selectorButton.MouseButton1Up:Connect(function()
     
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -30, 0, 36),
            Position = UDim2.new(0, 15, 0, 40)
        }):Play()
    end)
    selectorButton.MouseButton1Down:Connect(function(x, y)
       
        local relativeX = x - selectorButton.AbsolutePosition.X
        local relativeY = y - selectorButton.AbsolutePosition.Y
        
      
        local waveContainer = Instance.new("Frame")
        waveContainer.Name = "WaveEffect"
        waveContainer.Parent = dropdownSelector
        waveContainer.BackgroundTransparency = 1
        waveContainer.Size = UDim2.new(1, 0, 1, 0)
        waveContainer.ClipsDescendants = true
        waveContainer.ZIndex = 10
        
     
        for i = 1, 3 do
            local wave = Instance.new("Frame")
            wave.Name = "Wave_" .. i
            wave.Parent = waveContainer
            wave.BackgroundColor3 = Color3.fromRGB(255, 100, 120)
            wave.BackgroundTransparency = 0.7 + (i * 0.1)
            wave.BorderSizePixel = 0
            wave.Position = UDim2.new(0, relativeX - 5, 0, relativeY - 5)
            wave.Size = UDim2.new(0, 10, 0, 10)
            wave.ZIndex = 10
            
            local waveCorner = Instance.new("UICorner")
            waveCorner.CornerRadius = UDim.new(1, 0)
            waveCorner.Parent = wave
            
            
            local delay = (i - 1) * 0.1
            spawn(function()
                wait(delay)
                TweenService:Create(wave, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 100 + (i * 20), 0, 100 + (i * 20)),
                    Position = UDim2.new(0, relativeX - 50 - (i * 10), 0, relativeY - 50 - (i * 10)),
                    BackgroundTransparency = 1
                }):Play()
            end)
        end
        
      
        local flash = Instance.new("Frame")
        flash.Name = "Flash"
        flash.Parent = dropdownSelector
        flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flash.BackgroundTransparency = 0.9
        flash.BorderSizePixel = 0
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.ZIndex = 9
        
        local flashCorner = Instance.new("UICorner")
        flashCorner.CornerRadius = UDim.new(0, 6)
        flashCorner.Parent = flash
        
      
        TweenService:Create(flash, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()
        
      
        TweenService:Create(dropdownSelector, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -32, 0, 34),
            Position = UDim2.new(0, 16, 0, 41)
        }):Play()
        
      
        game:GetService("Debris"):AddItem(waveContainer, 0.8)
        game:GetService("Debris"):AddItem(flash, 0.3)
    end)
    
    selectorButton.MouseButton1Up:Connect(function()
        
        TweenService:Create(dropdownSelector, TweenInfo.new(0.2), {
            Size = UDim2.new(1, -30, 0, 36),
            Position = UDim2.new(0, 15, 0, 40)
        }):Play()
    end)
