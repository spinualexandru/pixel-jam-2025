local events = require("mara.events")
local typography = require("mara.ui.typography")
local player = require("game.player")

local game = {
}

function game:load()
player:load()
    -- Load menu elements
end

function game:update(dt)

    -- Update menu elements
end

function game:draw()
    typography:setFont(48)
    local center = typography.getTextScreenCenter("The Game")
    love.graphics.print("The Game", center, 8)
    player:draw()
   
end

function game:keypressed(key)
    -- Handle key presses
end

function game:keyreleased(key)
    -- Handle key releases
end

function game:mousepressed(x, y, button)
    events:dispatch("SCENE_CHANGE", "main_menu")
end

function game:mousereleased(x, y, button)
    -- Handle mouse releases
end

return game
