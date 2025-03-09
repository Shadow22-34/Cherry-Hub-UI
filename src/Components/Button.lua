-- Cherry Hub Premium UI Library - Button Component
return function(UI)
    local Button = {}
    local TweenService = game:GetService("TweenService")
    
    function Button:Create(parent, text, icon, callback)
        -- Create button
        local actionButton = Instance.new("TextButton")
        actionButton.Name = text.."Button"
        actionButton.Parent = parent
        actionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        actionButton.BorderSizePixel = 0
        actionButton.Size = UDim2.new(1, 0, 0, 40)
        actionButton.AutoButtonColor = false
        actionButton.Font = Enum.Font.GothamSemibold
        actionButton.Text = ""
        actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        actionButton.TextSize = 14
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = actionButton
        
        -- Inner glow effect
        local innerGlow = Instance.new("ImageLabel")
        innerGlow.Name = "InnerGlow"
        innerGlow.Parent = actionButton
        innerGlow.BackgroundTransparency = 1
        innerGlow.BorderSizePixel = 0
        innerGlow.Size = UDim2.new(1, 0, 1, 0)
        innerGlow.Image = "rbxassetid://6015897843"
        innerGlow.ImageColor3 = Color3.fromRGB(255, 255, 255)
        innerGlow.ImageTransparency = 0.9
        innerGlow.ZIndex = actionButton.ZIndex
        
        local buttonIcon = Instance.new("ImageLabel")
        buttonIcon.Name = "Icon"
        buttonIcon.Parent = actionButton
        buttonIcon.BackgroundTransparency = 1
        buttonIcon.Position = UDim2.new(0, 15, 0.5, -10)
        buttonIcon.Size = UDim2.new(0, 20, 0, 20)
        buttonIcon.Image = icon
        buttonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        
        -- Icon glow effect
        local iconGlow = Instance.new("ImageLabel")
        iconGlow.Name = "IconGlow"
        iconGlow.Parent = buttonIcon
        iconGlow.BackgroundTransparency = 1
        iconGlow.Position = UDim2.new(0, -5, 0, -5)
        iconGlow.Size = UDim2.new(1, 10, 1, 10)
        iconGlow.Image = "rbxassetid://6015897843"
        iconGlow.ImageColor3 = Color3.fromRGB(255, 100, 120)
        iconGlow.ImageTransparency = 0.9
        iconGlow.ZIndex = buttonIcon.ZIndex - 1
        
        local buttonText = Instance.new("TextLabel")
        buttonText.Name = "Title"
        buttonText.Parent = actionButton
        buttonText.BackgroundTransparency = 1
        buttonText.Position = UDim2.new(0, 45, 0, 0)
        buttonText.Size = UDim2.new(1, -45, 1, 0)
        buttonText.Font = Enum.Font.GothamSemibold
        buttonText.Text = text
        buttonText.TextColor3 = Color3.fromRGB(255, 255, 255)
        buttonText.TextSize = 14
        buttonText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Shine effect
        local shine = Instance.new("Frame")
        shine.Name = "Shine"
        shine.Parent = actionButton
        shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        shine.BorderSizePixel = 0
        shine.Position = UDim2.new(-0.5, 0, 0, 0)
        shine.Size = UDim2.new(0.5, 0, 1, 0)
        shine.BackgroundTransparency = 0.9
        shine.ZIndex = actionButton.ZIndex + 1
        shine.Rotation = 20
        
        -- Create ripple effect function
        local function createRipple(x, y)
            local ripple = Instance.new("Frame")
            ripple.Name = "Ripple"
            ripple.Parent = actionButton
            ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ripple.BackgroundTransparency = 0.85
            ripple.BorderSizePixel = 0
            ripple.Position = UDim2.new(0, x - 5, 0, y - 5)
            ripple.Size = UDim2.new(0, 10, 0, 10)
            ripple.ZIndex = actionButton.ZIndex + 1
            
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
        
        -- Add hover effect with multiple animations
        actionButton.MouseEnter:Connect(function()
            -- Button background animation
            TweenService:Create(actionButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
            
            -- Inner glow animation
            TweenService:Create(innerGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.7
            }):Play()
            
            -- Icon animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 17, 0.5, -10), -- Subtle movement
                ImageColor3 = Color3.fromRGB(255, 100, 120) -- Brighter color
            }):Play()
            
            -- Icon glow animation
            TweenService:Create(iconGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.7
            }):Play()
            
            -- Shine effect animation
            TweenService:Create(shine, TweenInfo.new(0.5), {
                Position = UDim2.new(1.5, 0, 0, 0)
            }):Play()
        end)
        
        actionButton.MouseLeave:Connect(function()
            -- Button background animation
            TweenService:Create(actionButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            
            -- Inner glow animation
            TweenService:Create(innerGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.9
            }):Play()
            
            -- Icon animation
            TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                Position = UDim2.new(0, 15, 0.5, -10), -- Reset position
                ImageColor3 = Color3.fromRGB(255, 255, 255) -- Reset color
            }):Play()
            
            -- Icon glow animation
            TweenService:Create(iconGlow, TweenInfo.new(0.3), {
                ImageTransparency = 0.9
            }):Play()
            
            -- Reset shine position
            shine.Position = UDim2.new(-0.5, 0, 0, 0)
        end)
        
        -- Button click effect and callback
        actionButton.MouseButton1Click:Connect(function()
            -- Create ripple effect at click position
            local x, y = game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y
            local buttonPosition = actionButton.AbsolutePosition
            createRipple(x - buttonPosition.X, y - buttonPosition.Y)
            
            -- Button press animation
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                Size = UDim2.new(1, -4, 0, 36),
                Position = UDim2.new(0, 2, 0, 2)
            }):Play()
            
            task.wait(0.1)
            
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                Size = UDim2.new(1, 0, 0, 40),
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            -- Execute callback
            if callback then
                callback()
            end
        end)
        
        -- Return button object with methods
        local buttonObj = {
            Instance = actionButton,
            Text = buttonText,
            Icon = buttonIcon
        }
        
        -- Enable/disable method
        function buttonObj:SetEnabled(enabled)
            actionButton.Active = enabled
            
            if enabled then
                TweenService:Create(actionButton, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 45),
                    BackgroundTransparency = 0
                }):Play()
                TweenService:Create(buttonText, TweenInfo.new(0.3), {
                    TextTransparency = 0
                }):Play()
                TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                    ImageTransparency = 0
                }):Play()
            else
                TweenService:Create(actionButton, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 35),
                    BackgroundTransparency = 0.5
                }):Play()
                TweenService:Create(buttonText, TweenInfo.new(0.3), {
                    TextTransparency = 0.5
                }):Play()
                TweenService:Create(buttonIcon, TweenInfo.new(0.3), {
                    ImageTransparency = 0.5
                }):Play()
            end
        end
        
        return buttonObj
    end
    
    return Button
end