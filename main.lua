require "TSLib"

init(0)

require("common")
local game = require("game")
local action = require("action")

local TICK_TIME = 5

local TaskEnterGame = require("tasks.task_enter_game")
local TaskEnterMap = require("tasks.task_enter_map")
local TaskCallFunc = require("tasks.task_call_func")

local tasks = {}
tasks[#tasks + 1] = TaskEnterGame.new(5, "com.sjjxxltztcq.cs")      -- 进程检测
tasks[#tasks + 1] = TaskEnterMap.new(5, 1)                          -- 地图检测
tasks[#tasks + 1] = TaskCallFunc.new(30, game.recycle)              -- 自动回收
tasks[#tasks + 1] = TaskCallFunc.new(30, game.useBagCanUseItems)    -- 使用可食用物品

while true do
    local begin_time = os.time()
    for _, task in ipairs(tasks) do
        task:execute()
        mSleep(1000)
    end
    local end_time = os.time()
    if TICK_TIME - (end_time - begin_time) > 0 then
        mSleep(TICK_TIME * 1000)
    end
end
