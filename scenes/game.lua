local events = require("mara.events")
local typography = require("mara.ui.typography")

local game = {
    world = nil,
    objects = {
        ground = {
          body = nil,
          shape = nil,
          fixture = nil
        },
        player = {
          body = nil,
          shape = nil,
          fixture = nil
        }
    }
}

function game:load()
  love.physics.setMeter(64)
  local width = love.graphics.getWidth()
  local height = love.graphics.getHeight()
  -- Load assets and initialize menu elements
  game.world = love.physics.newWorld(0, 9.81*64, true)
  game.objects.ground.body = love.physics.newBody(game.world, width/2, height-30/2)
  game.objects.ground.shape = love.physics.newRectangleShape(width, 30)
  game.objects.ground.fixture = love.physics.newFixture(game.objects.ground.body, game.objects.ground.shape, 1)
  game.objects.ground.fixture:setRestitution(1)
    
  game.objects.player.body = love.physics.newBody(game.world, width/2, height/2, "dynamic")
  game.objects.player.body:setGravityScale(1)
  game.objects.player.shape = love.physics.newPolygonShape(30, 30, 0, 15, 30, 0)
  game.objects.player.fixture = love.physics.newFixture(game.objects.player.body, game.objects.player.shape, 1)
  game.objects.player.fixture:setRestitution(0.8)

end

function game:update(dt)
  if not game.world then return end
  game.world:update(dt)

    -- Update menu elements
end

function game:draw()
    typography:setFont(48)
    local center = typography.getTextScreenCenter("The Game")
    love.graphics.print("The Game", center, 8)
    
    -- draw torso
    love.graphics.setColor(0,0,0, 1)
    love.graphics.polygon("line", game.objects.player.body:getWorldPoints(game.objects.player.shape:getPoints()))
   
   -- draw ground
    love.graphics.setColor(0.2,0.3,1, 1)
    love.graphics.polygon("fill", game.objects.ground.body:getWorldPoints(game.objects.ground.shape:getPoints()))
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
