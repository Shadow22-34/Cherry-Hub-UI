-- Cherry Hub Premium UI Library - Content Container Component
return function(UI)
    local ContentContainer = {}
    
    function ContentContainer:Create()
        -- Content container
        local ContentContainer = Instance.new("Frame")
        ContentContainer.Name = "ContentContainer"
        ContentContainer.Parent = UI.MainFrame
        ContentContainer.BackgroundTransparency = 1
        ContentContainer.BorderSizePixel = 0
        ContentContainer.Position = UDim2.new(0, 170, 0, 50)
        ContentContainer.Size = UDim2.new(1, -180, 1, -60)
        
        UI.ContentContainer = ContentContainer
    end
    
    return ContentContainer
end