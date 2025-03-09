-- Cherry Hub Premium UI Library - Stat Card Component
return function(UI)
    local StatCard = {}
    local TweenService = game:GetService("TweenService")
    
    function StatCard:Create(parent, title, value, icon)
        -- Create stat card container
        local cardContainer = Instance.new("Frame")
        cardContainer.Name = title.."Card"
        cardContainer.Parent = parent
        cardContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        cardContainer.BorderSizePixel = 0
        cardContainer.Size = UDim2.new(0, 180, 0, 100)
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 8)
        containerCorner.Parent = cardContainer
        
        -- Add gradient effect
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40))
        })
        gradient.Rotation = 45
        gradient.Parent = cardContainer
        
        -- Add glow effect
        local glow = Instance.new("ImageLabel")
        glow.Name = "Glow"
        glow.Parent = cardContainer
        glow.BackgroundTransparency = 1
        glow.Position = UDim2.new(0, -15, 0, -15)
        glow.Size = UDim2.new(1, 30, 1, 30)
        glow.Image = "rbxassetid://6015897843"
        glow.ImageColor3 = Color3.fromRGB(255, 80, 100)
        glow.ImageTransparency = 0.9
        glow.ZIndex = cardContainer.ZIndex - 1
        
        -- Card title
        local cardTitle = Instance.new("TextLabel")
        cardTitle.Name = "Title"
        cardTitle.Parent = cardContainer
        cardTitle.BackgroundTransparency = 1
        cardTitle.Position = UDim2.new(0, 15, 0, 15)
        cardTitle.Size = UDim2.new(1, -30, 0, 20)
        cardTitle.Font = Enum.Font.GothamBold
        cardTitle.Text = title
        cardTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
        cardTitle.TextSize = 14
        cardTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Card value
        local cardValue = Instance.new("TextLabel")
        cardValue.Name = "Value"
        cardValue.Parent = cardContainer
        cardValue.BackgroundTransparency = 1
        cardValue.Position = UDim2.new(0, 15, 0, 40)
        cardValue.Size = UDim2.new(1, -80, 0, 30)
        cardValue.Font = Enum.Font.GothamBold
        cardValue.Text = value
        cardValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        cardValue.TextSize = 24
        cardValue.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Card icon
        local cardIcon = Instance.new("ImageLabel")
        cardIcon.Name = "Icon"
        cardIcon.Parent = cardContainer
        cardIcon.BackgroundTransparency = 1
        cardIcon.Position = UDim2.new(1, -60, 0.5, -25)
        cardIcon.Size = UDim2.new(0, 50, 0, 50)
        cardIcon.Image = icon
        cardIcon.ImageColor3 = Color3.fromRGB(255, 80, 100)
        cardIcon.ImageTransparency = 0.2
        
        -- Add hover effect
        cardContainer.MouseEnter:Connect(function()
            TweenService:Create(cardContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            }):Play()
            
            TweenService:Create(glow, TweenInfo.new(0.3), {
                ImageTransparency = 0.8
            }):Play()
            
            TweenService:Create(cardIcon, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 100, 120),
                Size = UDim2.new(0, 55, 0, 55),
                Position = UDim2.new(1, -62.5, 0.5, -27.5)
            }):Play()
        end)
        
        cardContainer.MouseLeave:Connect(function()
            TweenService:Create(cardContainer, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            }):Play()
            
            TweenService:Create(glow, TweenInfo.new(0.3), {
                ImageTransparency = 0.9
            }):Play()
            
            TweenService:Create(cardIcon, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 80, 100),
                Size = UDim2.new(0, 50, 0, 50),
                Position = UDim2.new(1, -60, 0.5, -25)
            }):Play()
        end)
        
        -- Return stat card object with methods
        local cardObj = {
            Container = cardContainer,
            Title = cardTitle,
            Value = cardValue,
            Icon = cardIcon
        }
        
        -- Update value method
        function cardObj:UpdateValue(newValue)
            -- Create a counting animation effect
            local oldValue = tonumber(cardValue.Text)
            local newValueNum = tonumber(newValue)
            
            if oldValue and newValueNum then
                -- If both are numbers, animate counting up/down
                local countDuration = 0.5
                local startTime = tick()
                
                local connection
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local elapsed = tick() - startTime
                    local progress = math.min(elapsed / countDuration, 1)
                    
                    -- Ease in-out interpolation
                    local alpha = progress < 0.5 and 4 * progress^2 * progress or 1 - (-2 * progress + 2)^3 / 2
                    
                    local currentValue = math.floor(oldValue + (newValueNum - oldValue) * alpha)
                    cardValue.Text = tostring(currentValue)
                    
                    if progress >= 1 then
                        cardValue.Text = newValue -- Ensure final value is exact
                        connection:Disconnect()
                    end
                end)
            else
                -- If not numbers, just set the text directly
                cardValue.Text = newValue
            end
            
            -- Add a little pop animation
            TweenService:Create(cardValue, TweenInfo.new(0.1), {
                TextSize = 28
            }):Play()
            
            task.wait(0.1)
            
            TweenService:Create(cardValue, TweenInfo.new(0.1), {
                TextSize = 24
            }):Play()
        end
        
        return cardObj
    end
    
    return StatCard
end