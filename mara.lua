local engine = {
    config = {
        graphics = {
            width = love.graphics.getWidth(),
            height = love.graphics.getHeight()
        },
        window = {
            title = "Mara Engine"
        }
    }
}

function engine:new()
    return setmetatable({}, { __index = engine })
end

function engine:configure(config)
    self.config = setmetatable(config, { __index = engine.config })
    love.window.setTitle(self.config.window.title)
end

return engine
