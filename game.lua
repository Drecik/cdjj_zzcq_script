local action = require("action")

local game = {}

----------------- 界面操作 begin ----------------

function game.closeAllDialog()
    while true do
        local x, y = findImage("close.png", 0, 0, screen.w, screen.h, 600000)
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
    local x, y = findImage("bag.png", 0, 0, screen.w, screen.h / 2, 600000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
    mSleep(1000)
end

-- 打开回收
function game.openRecycle()
    game.openBag()

    local x, y = findImage("recycle.png", 0, screen.h / 2, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
     mSleep(1000)
end

-- 打开地图
function game.openMap()
    game.closeAllDialog()
    touch(getPos(1385, 63, ALIGN_RIGHT_TOP))
end

----------------- 界面操作 end ----------------

-- 使用快捷栏
function game.useQuikItem(id)
    game.closeAllDialog()
    local begin_x, begin_y = getPos(585, 670, ALIGN_BOTTOM)
    local x, y = begin_x + (id - 1) * 65, begin_y
    action.dTouch(x, y)
end

-- 使用可使用物品/可替换装备
function game.useBagCanUseItems()
    game.openBag()
    
    local begin_x, begin_y = getPos(166, 84, ALIGN_LEFT_TOP)
    local size = 80
    
    for i = 0, 5 do
        for j = 0, 7 do
            local x, y = begin_x + size * j, begin_y + size * i
            if isColor(x, y, 0xa4c502, 60) then
                action.dTouch(x - 40, y + 40)
                mSleep(10)
            elseif isColor(x, y + 55, 0x4daf0d, 80) then
                action.dTouch(x - 40, y + 40)
                mSleep(10)
            end
        end
    end
end

-- 回收
function game.recycle()
    game.openRecycle()
    
    local x, y = findImage("recycle2.png", screen.w / 2, screen.h / 2, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
    mSleep(1000)
    game.closeAllDialog()
end

-- 获取当前地图名字
local map_font_ts_ocr_index = addTSOcrDict("map_font.txt")
function game.getMapName()
    game.closeAllDialog()
    
    local begin_x, begin_y = getPos(1307, 5, ALIGN_RIGHT_TOP)
    local end_x, end_y = getPos(1414, 25, ALIGN_RIGHT_TOP)
    return tsOcrText(map_font_ts_ocr_index, begin_x, begin_y, end_x, end_y, "A8A8A8 , 010101 # CDCDCD , 262626 # C4C4C4 , 2E2E2E", 90)
end

-- 获取当前坐标
function game.getCoordinate()
    game.closeAllDialog()
    
    local begin_x, begin_y = getPos(1364, 158, ALIGN_RIGHT_TOP)
    local end_x, end_y = getPos(1436, 176, ALIGN_RIGHT_TOP)
    local text = ocrText(begin_x, begin_y, end_x, end_y, 0)
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
    action.touch(getPos(math.floor(touch_x), math.floor(touch_y), ALIGN_MIDDLE))
    mSleep(3000)
    game.closeAllDialog()
end

-- 进入普通地图
function game.enterNormalMap(x, y)
    game.mzMoveTo(x, y)
    action.touch(getPos(989, 565, ALIGN_BOTTOM))
    mSleep(1000)
    action.touch(getPos(124,181, ALIGN_LEFT_TOP))
    mSleep(1000)
end

return game