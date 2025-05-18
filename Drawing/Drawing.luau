local draw = {}
draw.__index = draw

local allobjs = {}

local types = {
    ["Text"] = true,
    ["Line"] = true,
    ["Circle"] = true,
    ["Square"] = true,
    ["Quad"] = true,
    ["Triangle"] = true,
    ["Image"] = true,
}

function draw:Create(type, properties)
    assert(types[type], "Invalid drawing type: " .. tostring(type))
    local obj = Drawing.new(type)

    if properties then
        for k, v in pairs(properties) do
            pcall(function() obj[k] = v end)
        end
    end

    table.insert(allobjs, obj)
    return obj
end

function draw:Set(obj, key, value)
    if typeof(obj) == "Instance" or typeof(obj) == "table" then
        pcall(function() obj[key] = value end)
    end
end

function draw:Apply(obj, props)
    for k, v in pairs(props) do
        self:Set(obj, k, v)
    end
end

function draw:HideAll()
    for _, obj in ipairs(allobjs) do
        if obj and obj.Visible ~= nil then
            obj.Visible = false
        end
    end
end

function draw:ShowAll()
    for _, obj in ipairs(allobjs) do
        if obj and obj.Visible ~= nil then
            obj.Visible = true
        end
    end
end

function draw:Clear()
    for _, obj in ipairs(allobjs) do
        if obj and typeof(obj) == "table" and obj.Remove then
            pcall(function() obj:Remove() end)
        end
    end
    allobjs = {}
end

function draw:GetAll()
    return allobjs
end

return draw
