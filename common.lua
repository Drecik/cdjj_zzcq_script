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

-- 不同分辨率坐标转换
X_ALIGN_LEFT = 1
X_ALIGN_MIDDLE = 2
X_ALIGN_RIGHT = 4
Y_ALIGN_TOP = 8
Y_ALIGN_MIDDLE = 16
Y_ALIGN_BOTTOM = 32

ALIGN_LEFT = {X_ALIGN_LEFT, Y_ALIGN_MIDDLE}
ALIGN_TOP = {X_ALIGN_MIDDLE, Y_ALIGN_TOP}
ALIGN_RIGHT = {X_ALIGN_RIGHT, Y_ALIGN_MIDDLE}
ALIGN_BOTTOM = {X_ALIGN_MIDDLE, Y_ALIGN_BOTTOM}
ALIGN_LEFT_TOP = {X_ALIGN_LEFT, Y_ALIGN_TOP}
ALIGN_LEFT_BOTTOM = {X_ALIGN_LEFT, Y_ALIGN_BOTTOM}
ALIGN_RIGHT_TOP = {X_ALIGN_RIGHT, Y_ALIGN_TOP}
ALIGN_RIGHT_BOTTOM = {X_ALIGN_RIGHT, Y_ALIGN_BOTTOM}
ALIGN_MIDDLE = {X_ALIGN_MIDDLE, Y_ALIGN_MIDDLE}
ORIGIN_SCREEN_WIDTH = 1440
ORIGIN_SCREEN_HEIGHT = 810
function adjustXToMiddle(x)
    local mid_x = screen.w / 2
    return mid_x + (x - mid_x) * screen.w / ORIGIN_SCREEN_WIDTH
end

function adjustXToLeft(x)
    return x
end

function adjustXToRight(x)
    return screen.w - (ORIGIN_SCREEN_WIDTH - x)
end

function adjustYToMiddle(y)
    local mid_y = screen.h / 2 
    return mid_y + (y - mid_y) * screen.h / ORIGIN_SCREEN_HEIGHT
end

function adjustYToTop(y)
    return y
end

function adjustYToBottom(y)
    return screen.h - (ORIGIN_SCREEN_HEIGHT - y)
end

function getPos(x, y, align_type)
    local ret_x, ret_y = x, y
    if align_type[1] == X_ALIGN_LEFT then
        ret_x = adjustXToLeft(x)
    end
    if align_type[1] == X_ALIGN_MIDDLE then
        ret_x = adjustXToMiddle(x)
    end
    if align_type[1] == X_ALIGN_RIGHT then
        ret_x = adjustXToRight(x)
    end
    if align_type[2] == Y_ALIGN_TOP then
        ret_y = adjustYToTop(y)
    end
    if align_type[2] ==  Y_ALIGN_MIDDLE then
        ret_y = adjustYToMiddle(y)
    end
    if align_type[2] == Y_ALIGN_BOTTOM then
        ret_y = adjustYToBottom(y)
    end
    return ret_x, ret_y
end