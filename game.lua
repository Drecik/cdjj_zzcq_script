local action = require("action")

local game = {}

----------------- 界面操作 begin ----------------

function game.closeAllDialog()
    while true do
        local x, y = findImage("close.png", 0, 0, screen.w, screen.h, 500000)
        if x ~= -1 then
            action.touch(x + 12, y + 12)
        else
            return
        end
        mSleep(1000)
    end
    mSleep(1000)
end

-- 打开背包
function game.openBag()
    game.closeAllDialog()
    local x, y = findImage("bag.png", screen.w / 2, 0, screen.w, screen.h / 2, 500000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
    mSleep(1000)
end

-- 打开回收
function game.openRecycle()
    game.openBag()

    local x, y = findImage("recycle.png", 0, 0, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
     mSleep(1000)
end

-- 打开地图
function game.openMap()
    game.closeAllDialog()
    touch(1349,105)
end

----------------- 界面操作 end ----------------

-- 回收
function game.recycle()
    game.openRecycle()
    
    local x, y = findImage("recycle2.png", 0, 0, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
    mSleep(1000)
    game.closeAllDialog()
end

-- 获取当前地图名字（可能有部分字缺失）
function game.getMapName()
    game.closeAllDialog()
    
    return ocrText(1325,6, 1409,25, 1)
end

-- 获取当前坐标
function game.getCoordinate()
    game.closeAllDialog()
    
    local text = ocrText(1374,158, 1436,176, 0)
    return string.splitToInt(text, ",")
end

local diff_x = 255 / 333
local diff_y = 231 / 333
-- 盟重地图移动到某个坐标
function game.mzMoveTo(x, y)
    game.openMap()
    
    local touch_x = diff_x * x + 415
    local touch_y = diff_y * y + 148
    
    mSleep(1000)
    action.touch(math.floor(touch_x), math.floor(touch_y))
    mSleep(1000)
    game.closeAllDialog()
end

-- 进入普通地图
function game.enterNormalMap(x, y)
    game.mzMoveTo(x, y)
    action.touch(989, 565)
    mSleep(1000)
    action.touch(124,181)
    mSleep(1000)
end

-- 进入起点寺庙
function game.enterQiDian()
    game.enterNormalMap(337, 335)
end
return game