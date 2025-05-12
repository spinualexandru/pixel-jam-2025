local events = {
    listeners = {},
    queue = {}
}

function events:processQueue()
    while #self.queue > 0 do
        local event = table.remove(self.queue, 1)
        self:dispatch(event.event, unpack(event.args))
    end
end

function events:dispatch(event, ...)
    local listeners = self.listeners[event]
    if listeners then
        for _, listener in ipairs(listeners) do
            listener(...)
        end
    end
end

function events:addListener(event, listener)
    local listeners = self.listeners[event]
    if not listeners then
        listeners = {}
        self.listeners[event] = listeners
    end
    table.insert(listeners, listener)
end

function events:removeListener(event, listener)
    local listeners = self.listeners[event]
    if listeners then
        for i, l in ipairs(listeners) do
            if l == listener then
                table.remove(listeners, i)
                break
            end
        end
    end
end

return events
