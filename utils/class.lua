local inspect = require "utils.inspect"

local function search(k, plist)
    for _, c in ipairs(plist) do
        local v = c[k]
        if v then
            return v
        end
    end
end

local function callCtor(plist, o, ...)
    for _, c in ipairs(plist) do
        local ctor = c.ctor
        if ctor then
            ctor(o, ...)
        end
    end
end

local Class = {}

function Class.createClass(...)
    local c = {}

    local parents = {...}
    setmetatable(c, {
        __index = function(_, k)
            return search(k, parents)
        end
    })

    c.__index = c

    function c.new(...)
        local o = {}
        setmetatable(o, c)
        callCtor(parents, o, ...)
        c.ctor(o, ...)
        return o
    end

    return c
end

return Class