local ui = require("mara.ui")
local events = require("mara.events")
local modules = require("mara.modules")
local typography = require("mara.ui.typography")
local colors = require("mara.ui.colors")
local engine = require("mara")

function love.load()
    engine:configure({
        graphics = {
            width = love.graphics.getWidth(),
            height = love.graphics.getHeight(),
        },
    })

    love.window.setMode(1280, 720, {
        msaa = 8,
    })

    events:addListener("GAME_LOADED", function()
      print("Game Loaded!")
      events:dispatch("SCENE_CHANGE", "game")
    end)

    modules:load()
end

function love.update(dt)
    modules:update(dt)
end

function love.draw()
    love.graphics.clear(1, 1, 1)
    love.graphics.setColor(0, 0, 0)
    modules:draw()

    colors.setColor("#000000")
    typography:setFont(28)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 8, 8)
end

function love.keypressed(key)
    modules:keypressed(key)

    if key == "escape" then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
    modules:mousepressed(x, y, button)
end
