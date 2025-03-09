local Components = {
    Slider = "https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/main/Components/Slider.lua",
    Tab = "https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/main/Components/Tab.lua",
    Button = "https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/main/Components/Button.lua",
    -- Add other components
}

return function(CherryHub)
    for name, url in pairs(Components) do
        CherryHub.Components[name] = loadstring(game:HttpGet(url))()
    end
end