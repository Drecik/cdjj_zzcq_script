local class = require("utils.class")
local action = require("action")
local game = require("game")

local Task = require("tasks.task")
local TaskCheckIsAttacking = class.createClass(Task)

-- 检测是否脱离挂机状态，并启动自动战斗

function TaskCheckIsAttacking:ctor(_)
end

function TaskCheckIsAttacking:onExecute()
     action.touchImage("not_attacking.png", 2000000, screen.w / 1.5, 0, screen.w, screen.h / 2)
end

return TaskCheckIsAttacking