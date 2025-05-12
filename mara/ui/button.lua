local button = {
    x = 0,
    y = 0,
    width = 100,
    height = 50,
    text = "",
    onclick = nil,
    hovered = false,
    pressed = false,
    focused = false -- Will be used for keyboard navigation
}

function button:load()
    -- Load assets and initialize menu elements
end

function button:update(dt)
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    local buttonX = self.x
    local buttonY = self.y

    if mouseX > buttonX and mouseX < buttonX + self.width and mouseY > buttonY and mouseY < buttonY + self.height then
        self.hovered = true
        self.focused = true -- Will be used for keyboard navigation
    else
        self.hovered = false
        self.focused = false -- Will be used for keyboard navigation
    end
end

function button:draw()
    -- Draw menu elements
end

function button:keypressed(key)
    -- Handle key pressed
end

function button:keyreleased(key)
    -- Handle key releases
end

function button:mousepressed(x, y, btn)
    if self.hovered then
        self.pressed = true
        if self.onclick then
            self.onclick(x, y, btn)
        end
    end
end

function button:mousereleased(x, y, btn)
    self.pressed = false
end

function button.new(x, y, width, height, text, onclick)
    local instance = {
        x = x,
        y = y,
        width = width,
        height = height,
        text = text,
        onclick = onclick,
        hovered = false,
        pressed = false
    }
    setmetatable(instance, { __index = button })
    return instance
end

return button
