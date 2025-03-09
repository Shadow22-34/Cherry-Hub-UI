-- Main entry point
local CherryHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/main/Modules/CherryInit.lua"))()
local ComponentLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/jiohasdas/Cherry-UI-Lib/main/Modules/ComponentLoader.lua"))()

-- Load all components
ComponentLoader(CherryHub)

return CherryHub