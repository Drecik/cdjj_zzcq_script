
local action = {}

-- 点击一次
function action.touch(x, y, delay_time)
    if not delay_time then
        delay_time = 30
    end
    touchDown(x, y)
    mSleep(delay_time)
    touchUp(x, y)
end

-- 双击
function action.dTouch(x, y, delay_time)
    if not delay_time then
        delay_time = 20
    end
    
    action.touch(x, y, 20)
    mSleep(20)
    action.touch(x, y, 20)
end

-- 点击图片
function action.touchImage(pic_name, deviation)
    if not deviation then
        deviation = 1000000
    end
    local x, y = findImage(pic_name, 0, 0, screen.w, screen.h, 1000000)
    if x ~= -1 then
        action.touch(x, y)
    end
end

function action.touchMove(x, y, end_x, end_y, delay_time)
end

-- 点击一系列点
function action.touchAll(points, delay_time)
    for _, point in ipairs(points) do
        action.touch(point[1], point[2])
        mSleep(delay_time)
    end
end

return action