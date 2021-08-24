local action = require("action")

local game = {}

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
end

-- 打开背包
function game.openBag()
    game.closeAllDialog()
    mSleep(1000)
    
    local x, y = findImage("bag.png", screen.w / 2, 0, screen.w, screen.h / 2, 500000)
    if x ~= -1 then
        action.touch(x, y)
    end
end

-- 打开回收
function game.openRecycle()
    game.openBag()
    mSleep(1000)
    
    local x, y = findImage("recycle.png", 0, 0, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
end

-- 回收
function game.recycle()
    game.openRecycle()
    mSleep(1000)
    
    local x, y = findImage("recycle2.png", 0, 0, screen.w, screen.h, 2000000)
    if x ~= -1 then
        action.touch(x, y)
    end
    
    mSleep(1000)
    game.closeAllDialog()
end

return game