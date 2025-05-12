local typography = require("mara.ui.typography")
local events = require("mara.events")
local colors = require("mara.ui.colors")

local main_menu = {}

function main_menu:draw()
    colors.setColor("#FF0000")
    typography:setFont(48)
    local center = typography.getTextScreenCenter("Main Menu")
    love.graphics.print("Main Menu", center, 8)
end

function main_menu:mousepressed(x, y, button)
    events:dispatch("SCENE_CHANGE", "game")
end

return main_menu
