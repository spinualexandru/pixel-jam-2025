local colors = {}

function colors.hexToRGB(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

function colors.setColor(hex)
    local r, g, b = colors.hexToRGB(hex)
    love.graphics.setColor(r, g, b)
end

return colors
