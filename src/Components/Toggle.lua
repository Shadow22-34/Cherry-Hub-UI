-- Cherry Hub Premium UI Library - Toggle Component
return function(UI)
    local Toggle = {}
    local TweenService = game:GetService("TweenService")
    
    function Toggle:Create(parent, text, callback)
        -- Create toggle container
        local toggleContainer = Instance.new("Frame")
        toggleContainer.Name = text.."ToggleContainer"
        toggleContainer.Parent = parent
        toggleContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        toggleContainer.BorderSizePixel = 0
        toggleContainer.Size = UDim2.new(1, 0, 0, 40)
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 6)
        containerCorner.Parent = toggleContainer
        
        -- Toggle label
        local toggleLabel = Instance.new("TextLabel")
        toggleLabel.Name = "Label"
        toggleLabel.Parent = toggleContainer
        toggleLabel.BackgroundTransparency = 1
        toggleLabel.Position = UDim2.new(0, 15, 0, 0)
        toggleLabel.Size = UDim2.new(1, -65, 1, 0)
        toggleLabel.Font = Enum.Font.GothamSemibold
        toggleLabel.Text = text
        toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleLabel.TextSize = 14
        toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Toggle button
        local toggleButton = Instance.new("Frame")
        toggleButton.Name = "ToggleButton"
        toggleButton.Parent = toggleContainer
        toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        toggleButton.BorderSizePixel = 0
        toggleButton.Position = UDim2.new(1, -55, 0.5, -10)
        toggleButton.Size = UDim2.new(0, 40, 0, 20)
        
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(1, 0)
        toggleCorner.Parent = toggleButton
        
        -- Toggle indicator
        local toggleIndicator = Instance.new("Frame")
        toggleIndicator.Name = "Indicator"
        toggleIndicator.Parent = toggleButton
        toggleIndicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        toggleIndicator.BorderSizePixel = 0
        toggleIndicator.Position = UDim2.new(0, 2, 0.5, -8)
        toggleIndicator.Size = UDim2.new(0, 16, 0, 16)
        
        local indicatorCorner = Instance.new("UICorner")
        indicatorCorner.CornerRadius = UDim.new(1, 0)
        indicatorCorner.Parent = toggleIndicator
        
        -- Glow effect for indicator
        local indicatorGlow = Instance.new("ImageLabel")
        indicatorGlow.Name = "Glow"
        indicatorGlow.Parent = toggleIndicator
        indicatorGlow.BackgroundTransparency = 1
        indicatorGlow.Position = UDim2.new(0, -5, 0, -5)
        indicatorGlow.Size = UDim2.new(1, 10, 1, 10)
        indicatorGlow.Image = "rbxassetid://6015897843"
        indicatorGlow.ImageColor3 = Color3.fromRGB(255, 100, 120)
        indicatorGlow.ImageTransparency = 1
        indicatorGlow.ZIndex = toggleIndicator.ZIndex - 1
        
        -- Create ripple effect function
        local function createRipple(x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = toggleContainer
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = toggleContainer.ZIndex + 1
            
            local rippleCorner = Instance.new("UICorner")
            rippleCorner.CornerRadius = UDim.new(1, 0)
            rippleCorner.Parent = ripple
            
            -- Animate the ripple
            TweenService:Create(ripple, TweenInfo.new(0.5), {
                Size = UDim2.new(0, 150, 0, 150),
                Position = UDim2.new(0, x - 75, 0, y - 75),
                BackgroundTransparency = 1
            }):Play()
            
            -- Remove the ripple after animation
            game:GetService("Debris"):AddItem(ripple, 0.5)
        end
        
        -- Toggle state and functionality
        local enabled = false
        
        local function updateToggle()
            if enabled then
                -- Animate to enabled state
                TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(255, 80, 100)
                }):Play()
                
                TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {
                    Position = UDim2.new(1, -18, 0.5, -8),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }):Play()
                
                TweenService:Create(indicatorGlow, TweenInfo.new(0.3), {
                    ImageTransparency = 0.7
                }):Play()
            else
                -- Animate to disabled state
                TweenService:Create(toggleButton, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                }):Play()
                
                TweenService:Create(toggleIndicator, TweenInfo.new(0.3), {
                    Position = UDim2.new(0, 2, 0.5, -8),
                    BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                }):Play()
                
                TweenService:Create(indicatorGlow, TweenInfo.new(0.3), {
                    ImageTransparency = 1
                }):Play()
            end
        end
        
        -- Make the toggle clickable
        toggleContainer.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                -- Create ripple effect at click position
                local x, y = game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y
                local containerPosition = toggleContainer.AbsolutePosition
                createRipple(x - containerPosition.X, y - containerPosition.Y)
                
                -- Toggle the state
                enabled = not enabled
                updateToggle()
                
                -- Execute callback
                if callback then
                    callback(enabled)
                end
            end
        end)
        
        -- Add hover effect
        toggleContainer.MouseEnter:Connect(function()
            TweenService:Create(toggleContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
        end)
        
        toggleContainer.MouseLeave:Connect(function()
            TweenService:Create(toggleContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
        end)
        
        -- Return toggle object with methods
        local toggleObj = {
            Container = toggleContainer,
            Button = toggleButton,
            Indicator = toggleIndicator
        }
        
        -- Set state method
        function toggleObj:SetState(state)
            enabled = state
            updateToggle()
        end
        
        -- Get state method
        function toggleObj:GetState()
            return enabled
        end
        
        return toggleObj
    end
    
    return Toggle
end