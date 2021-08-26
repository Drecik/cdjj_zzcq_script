local ts = require("ts")
local json = ts.json


-- 屏幕相关信息
screen = {}
screen.w, screen.h = getScreenSize()

DEBUG = true

function toString(...)
    local t = {...}
    return json.encode(t)
end

function debugLog(...)
    if DEBUG then
        dialog(toString(...))
    end
end

function string.split(s, p)
    local rt= {}
    string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end )
    return rt
end

function string.splitToInt(s, p)
    local rt = string.split(s, p)
    for i, v in ipairs(rt) do
       rt[i] =  tonumber(v)
    end
    return rt
end