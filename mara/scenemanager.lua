local game = require("scenes.game")
local events = require("mara.events")
local scenes = require("scenes.base")

local scenemanager = {
    scenes = scenes,
    current_scene = nil
}

function scenemanager:load(mod)
  
    events:addListener("SCENE_CHANGE", function(scene)
        self:switch(scene)
    end)

end

function scenemanager:sceneExists(sceneName)
  if scenes[sceneName] and scenes[sceneName].load then
    return true
  end
end

function scenemanager:switch(scene)
    self.current_scene = self.scenes[scene]
    if self.current_scene and self.current_scene.load then
        self.current_scene:load()
    end
end

function scenemanager:update(dt)
    -- call update only if it exists
    if self.current_scene and self.current_scene.update then
        self.current_scene:update(dt)
    end
end

function scenemanager:draw()
    if self.current_scene and self.current_scene.draw then
        self.current_scene:draw()
    end
end

function scenemanager:keypressed(key)
    if self.current_scene and self.current_scene.keypressed then
        self.current_scene:keypressed(key)
    end
end

function scenemanager:keyreleased(key)
    if self.current_scene and self.current_scene.keyreleased then
        self.current_scene:keyreleased(key)
    end
end

function scenemanager:mousepressed(x, y, button)
    if self.current_scene and self.current_scene.mousepressed then
        self.current_scene:mousepressed(x, y, button)
    end
end

return scenemanager
