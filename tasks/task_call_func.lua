local class = require("utils.class")
local game = require("game")

local Task = require("tasks.task")
local TaskCallFunc = class.createClass(Task)

function TaskCallFunc:ctor(_, func)
    self._func = func
end

function TaskCallFunc:onExecute()
    self._func()
end

return TaskCallFunc
