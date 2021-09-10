
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
function action.touchImage(pic_name, deviation, x, y, end_x, end_y)
    if not deviation then
        deviation = 1000000
    end
    if not x then
        x, y, end_x, end_y = 0, 0, screen.w, screen.h
    end
    local img_x, img_y = findImage(pic_name, x, y, end_x, end_y, deviation)
    if x ~= -1 then
        action.touch(img_x, img_y)
    end
end

function action.touchMove(x, y, end_x, end_y, y, end_x, end_y, delay_time)
end

-- 点击一系列点
function action.touchAll(points, delay_time)
    for _, point in ipairs(points) do
        action.touch(point[1], point[2])
        mSleep(delay_time)
    end
end

return action