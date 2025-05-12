local typography = {
    BASE_FONT_SIZE = 32,
    BASE_FONT_PATH = "assets/fonts/",
    BASE_FONT_NAME = "Geo",
    BASE_FONT      = nil,
}

local function resolveFontName(_fontName)
    local fontName = _fontName or typography.BASE_FONT_NAME
    return typography.BASE_FONT_PATH .. fontName .. ".ttf"
end

function typography:load()
    self.BASE_FONT = love.graphics.newFont(resolveFontName(self.BASE_FONT_NAME), self.BASE_FONT_SIZE)
    love.graphics.setFont(self.BASE_FONT)
end

function typography:newFont(size, _fontName)
    local fontName = _fontName or typography.BASE_FONT_NAME
    return love.graphics.newFont(resolveFontName(fontName), size)
end

function typography:setFont(size, _fontName)
    local fontName = _fontName or typography.BASE_FONT_NAME
    love.graphics.setFont(love.graphics.newFont(resolveFontName(fontName), size))
end

function typography.getFontWidth(text)
    return love.graphics.getFont():getWidth(text)
end

function typography.getTextScreenCenter(text)
    local width = love.graphics.getWidth()
    local fontSize = typography.getFontWidth(text)
    return (width - fontSize) / 2
end

function typography:update(dt)

end

function typography:draw()

end

return typography
