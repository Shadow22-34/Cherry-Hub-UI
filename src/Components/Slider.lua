-- Cherry Hub Premium UI Library - Slider Component
return function(UI)
    local Slider = {}
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    
    function Slider:Create(parent, text, min, max, default, callback)
        -- Create slider container
        local sliderContainer = Instance.new("Frame")
        sliderContainer.Name = text.."SliderContainer"
        sliderContainer.Parent = parent
        sliderContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        sliderContainer.BorderSizePixel = 0
        sliderContainer.Size = UDim2.new(1, 0, 0, 60)
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 6)
        containerCorner.Parent = sliderContainer
        
        -- Slider label
        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Name = "Label"
        sliderLabel.Parent = sliderContainer
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Position = UDim2.new(0, 15, 0, 5)
        sliderLabel.Size = UDim2.new(1, -30, 0, 20)
        sliderLabel.Font = Enum.Font.GothamSemibold
        sliderLabel.Text = text
        sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sliderLabel.TextSize = 14
        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Value display
        local valueDisplay = Instance.new("TextLabel")
        valueDisplay.Name = "Value"
        valueDisplay.Parent = sliderContainer
        valueDisplay.BackgroundTransparency = 1
        valueDisplay.Position = UDim2.new(1, -55, 0, 5)
        valueDisplay.Size = UDim2.new(0, 40, 0, 20)
        valueDisplay.Font = Enum.Font.GothamSemibold
        valueDisplay.Text = tostring(default)
        valueDisplay.TextColor3 = Color3.fromRGB(255, 80, 100)
        valueDisplay.TextSize = 14
        valueDisplay.TextXAlignment = Enum.TextXAlignment.Right
        
        -- Slider track
        local sliderTrack = Instance.new("Frame")
        sliderTrack.Name = "Track"
        sliderTrack.Parent = sliderContainer
        sliderTrack.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        sliderTrack.BorderSizePixel = 0
        sliderTrack.Position = UDim2.new(0, 15, 0, 35)
        sliderTrack.Size = UDim2.new(1, -30, 0, 6)
        
        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent = sliderTrack
        
        -- Slider fill
        local sliderFill = Instance.new("Frame")
        sliderFill.Name = "Fill"
        sliderFill.Parent = sliderTrack
        sliderFill.BackgroundColor3 = Color3.fromRGB(255, 80, 100)
        sliderFill.BorderSizePixel = 0
        sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        
        local fillCorner = Instance.new("UICorner")
        fillCorner.CornerRadius = UDim.new(1, 0)
        fillCorner.Parent = sliderFill
        
        -- Slider knob
        local sliderKnob = Instance.new("Frame")
        sliderKnob.Name = "Knob"
        sliderKnob.Parent = sliderFill
        sliderKnob.AnchorPoint = Vector2.new(0.5, 0.5)
        sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        sliderKnob.BorderSizePixel = 0
        sliderKnob.Position = UDim2.new(1, 0, 0.5, 0)
        sliderKnob.Size = UDim2.new(0, 16, 0, 16)
        
        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent = sliderKnob
        
        -- Knob glow effect
        local knobGlow = Instance.new("ImageLabel")
        knobGlow.Name = "Glow"
        knobGlow.Parent = sliderKnob
        knobGlow.BackgroundTransparency = 1
        knobGlow.Position = UDim2.new(0, -5, 0, -5)
        knobGlow.Size = UDim2.new(1, 10, 1, 10)
        knobGlow.Image = "rbxassetid://6015897843"
        knobGlow.ImageColor3 = Color3.fromRGB(255, 100, 120)
        knobGlow.ImageTransparency = 0.7
        knobGlow.ZIndex = sliderKnob.ZIndex - 1
        
        -- Create ripple effect function
        local function createRipple(x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = sliderContainer
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = sliderContainer.ZIndex + 1
            
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
        
        -- Slider functionality
        local value = default
        local dragging = false
        
        local function updateSlider(input)
            local trackPosition = sliderTrack.AbsolutePosition.X
            local trackSize = sliderTrack.AbsoluteSize.X
            local mousePosition = input.Position.X
            
            -- Calculate the relative position (0-1)
            local relativePosition = math.clamp((mousePosition - trackPosition) / trackSize, 0, 1)
            
            -- Calculate the actual value
            local newValue = math.floor(min + (relativePosition * (max - min)))
            
            -- Update the slider visually
            TweenService:Create(sliderFill, TweenInfo.new(0.1), {
                Size = UDim2.new(relativePosition, 0, 1, 0)
            }):Play()
            
            -- Update the value display
            valueDisplay.Text = tostring(newValue)
            
            -- Update the value and call the callback
            if value ~= newValue then
                value = newValue
                if callback then
                    callback(value)
                end
            end
        end
        
        -- Handle slider input
        sliderContainer.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                
                -- Create ripple effect at click position
                local x, y = input.Position.X, input.Position.Y
                local containerPosition = sliderContainer.AbsolutePosition
                createRipple(x - containerPosition.X, y - containerPosition.Y)
                
                -- Update slider immediately
                updateSlider(input)
                
                -- Animate knob on click
                TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                    Size = UDim2.new(0, 20, 0, 20)
                }):Play()
                
                TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                    ImageTransparency = 0.5
                }):Play()
            end
        end)
        
        sliderContainer.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                
                -- Animate knob on release
                TweenService:Create(sliderKnob, TweenInfo.new(0.2), {
                    Size = UDim2.new(0, 16, 0, 16)
                }):Play()
                
                TweenService:Create(knobGlow, TweenInfo.new(0.2), {
                    ImageTransparency = 0.7
                }):Play()
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                updateSlider(input)
            end
        end)
        
        -- Add hover effect
        sliderContainer.MouseEnter:Connect(function()
            TweenService:Create(sliderContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
            
            TweenService:Create(knobGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.6
            }):Play()
        end)
        
        sliderContainer.MouseLeave:Connect(function()
            TweenService:Create(sliderContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            
            if not dragging then
                TweenService:Create(knobGlow, TweenInfo.new(0.3), {
                    ImageTransparency = 0.7
                }):Play()
            end
        end)
        
        -- Return slider object with methods
        local sliderObj = {
            Container = sliderContainer,
            Track = sliderTrack,
            Fill = sliderFill,
            Knob = sliderKnob,
            Value = valueDisplay
        }
        
        -- Set value method
        function sliderObj:SetValue(newValue)
            newValue = math.clamp(newValue, min, max)
            value = newValue
            
            -- Calculate the relative position
            local relativePosition = (newValue - min) / (max - min)
            
            -- Update the slider visually
            TweenService:Create(sliderFill, TweenInfo.new(0.3), {
                Size = UDim2.new(relativePosition, 0, 1, 0)
            }):Play()
            
            -- Update the value display
            valueDisplay.Text = tostring(newValue)
            
            -- Call the callback
            if callback then
                callback(value)
            end
        end
        
        -- Get value method
        function sliderObj:GetValue()
            return value
        end
        
        return sliderObj
    end
    
    return Slider
end