local player = {
    texture = nil,
    x = 128,
    y = 128,
    scaleX = 1,
    scaleY = 1
}

function player:load()
    self.texture = love.graphics.newImage("assets/player-medium.png")
    self.width = self.texture:getWidth()
    self.height = self.texture:getHeight()
end

function player:draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.texture, self.x, self.y, 0, self.scaleX, self.scaleY)
end



return player