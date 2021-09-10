local class = require("utils.class")
local game = require("game")

local Task = require("tasks.task")
local TaskEnterMap = class.createClass(Task)

-- 自动进入到某个地图

local CONFIG = {
    [1] = {
        ["func"] = "enterQiDian",
        ["map_name"] = "起点寺庙"
    }
}

function TaskEnterMap:ctor(_, map_id)
    self._map_id = map_id
    if not self._map_id then
        self._map_id = 1
    end
    
    self.config = CONFIG[self._map_id]
    if self.config == nil then
        assert(false, "invalid map_id")
    end
end

function TaskEnterMap:onExecute()
    local map_name = game.getMapName()
    if not string.find(map_name, self.config.map_name) then
        -- 使用快捷物品1（必须是盟重传送石）
        game.useQuikItem(1)
        mSleep(1000)
        self[self.config.func]()
    end
end

-- 进入起点寺庙
function TaskEnterMap:enterQiDian()
    game.enterNormalMap(337, 335)
end

return TaskEnterMap
