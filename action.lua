
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

function action.dTouch(x, y, delay_time)
    if not delay_time then
        delay_time = 20
    end
    
    action.touch(x, y, 20)
    mSleep(20)
    action.touch(x, y, 20)
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