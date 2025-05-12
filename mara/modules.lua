local events = require("mara.events")
local typography = require("mara.ui.typography")
local scenemanager = require("mara.scenemanager")

local modulemanager = {
    core = {
        modules = {
            typography = typography,
            scenemanager = scenemanager
        }
    },
    custom = {
        modules = {

        }
    }
}

function modulemanager:load(_customModules)
    if _customModules then
        self.custom.modules = _customModules
    end

    for moduleName in pairs(self.core.modules) do
        if self.core.modules[moduleName].load then
            self.core.modules[moduleName]:load()
            print("[CoreModules] Loaded: " .. moduleName)
        end
    end
    events:dispatch("CORE_MODULES_LOADED")

    for moduleName in pairs(self.custom.modules) do
        if self.custom.modules[moduleName].load then
            self.custom.modules[moduleName]:load()
            print("[CustomModules] Loaded: " .. moduleName)
        end
    end
    events:dispatch("CUSTOM_MODULES_LOADED")

    events:dispatch("GAME_LOADED")
end

function modulemanager:update(dt)
    for moduleName in pairs(self.core.modules) do
        if self.core.modules[moduleName].update then
            self.core.modules[moduleName]:update(dt)
        end
    end

    for moduleName in pairs(self.custom.modules) do
        if self.custom.modules[moduleName].update then
            self.custom.modules[moduleName]:update(dt)
        end
    end
end

function modulemanager:draw()
    for moduleName in pairs(self.core.modules) do
        if self.core.modules[moduleName].draw then
            self.core.modules[moduleName]:draw()
        end
    end

    for moduleName in pairs(self.custom.modules) do
        if self.custom.modules[moduleName].draw then
            self.custom.modules[moduleName]:draw()
        end
    end
end

function modulemanager:keypressed(key)
    for moduleName in pairs(self.core.modules) do
        if self.core.modules[moduleName].keypressed then
            self.core.modules[moduleName]:keypressed()
        end
    end

    for moduleName in pairs(self.custom.modules) do
        if self.custom.modules[moduleName].keypressed then
            self.custom.modules[moduleName]:keypressed()
        end
    end
end

function modulemanager:mousepressed(x, y, button)
    for moduleName in pairs(self.core.modules) do
        if self.core.modules[moduleName].mousepressed then
            self.core.modules[moduleName]:mousepressed()
        end
    end

    for moduleName in pairs(self.custom.modules) do
        if self.custom.modules[moduleName].mousepressed then
            self.custom.modules[moduleName]:mousepressed()
        end
    end
end

return modulemanager
