local class = require("utils.class")
local game = require("game")

local Task = require("tasks.task")
local TaskCallFunc = class.createClass(Task)

-- 定时回调某个函数

function TaskCallFunc:ctor(_, func)
    self._func = func
end

function TaskCallFunc:onExecute()
    self._func()
end

return TaskCallFunc
