local ui = require("mara.ui")
local ecs = require("mara.ecs")
local events = require("mara.events")
local scene_manager = require("mara.scene_manager")
local animation_manager = require("mara.animation_manager")
local physics = require("mara.physics")
local developer = require("mara.developer")

local base = {
    ui = ui,
    ecs = ecs,
    events = events,
    scene_manager = scene_manager,
    animation_manager = animation_manager,
    physics = physics,
    developer = developer
}

return base
