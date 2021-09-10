local class = require("utils.class")
local action = require("action")
local game = require("game")

local Task = require("tasks.task")
local TaskEnterGame = class.createClass(Task)

-- 检测游戏是否崩溃并自动进入游戏

function TaskEnterGame:ctor(_, app_name)
    self._app_name = app_name
end

function TaskEnterGame:onExecute()
    if appIsRunning(self._app_name) == 1 then
        return
    end
    
    runApp(self._app_name)
    mSleep(5000)
    local x, y = findColorInRegionFuzzy(0xfb4f4f, 100, 0, 0, screen.w, screen.h)
    if x == -1 then
        closeApp(self._app_name)
        return
    end
    
    action.touch(x + 20, y + 10)
    mSleep(3000)
    action.touchImage("close2.png")
    mSleep(1000)
    game.closeAllDialog()
    mSleep(1000)
    action.touchImage("enter_game.png")
    mSleep(8000)
    action.touch(getPos(1281, 755, ALIGN_RIGHT_BOTTOM))
    mSleep(10000)
    local curMapName = game.getMapName()
    if curMapName == nil or curMapName == "" then
        closeApp(self._app_name)
    end
end

return TaskEnterGame