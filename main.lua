require "TSLib"

function shezhi()
	local sz = require("ts")
	local json = sz.json
	local w,h = getScreenSize();
	MyTable = {
		["style"] = "default",
		["width"] = w,
		["height"] = h,
		["config"] = "save_348.dat",
		["timer"] = 60,
		views = {
			{
				["type"] = "Label",
				["text"] = "热血传奇自动任务QQ群336298138，提供免费脚本更新\n使用过程中如果发现错误请截屏发送QQ群\n目前脚本只支持iPhone5/5C/5S/4/4S，其他设备脚本制作中\n运行前请确认已登录游戏\n横屏home键在右边\n使用圈圈的请拉到右下角\n如果点确认后无任何动作请重启触动精灵或重启机器\n发现错误中止可随时再运行,副本内也可\n\n  你的等级是几级，填写0则自动判断",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "请输入您的等级，填写0则自动判断",
				["text"] = "0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "使用小飞鞋,使用技能一,使用技能二,使用技能三,日常除魔等任务中插入降魔和教主的匹配",
				["select"] = "0@4",
			},
			{
				["type"] = "Label",
				["text"] = "___________普通任务___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "不想做普通任务,做所有普通任务,任务前整理背包,任务后整理背包,参拜龙卫,石阁试炼,日常任务,主线任务,行会任务,除魔任务,皇城任务,支线任务,挖矿任务,竟技任务,活动深渊,除魔洞窟,教主大厅,活动中心,领取奖励",
				["select"] = "4@5@6@7@8@9@10@12@13@14@15@16@18",
			},
			{
				["type"] = "Label",
				["text"] = "___________无限任务___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "不做无限任务,无限环式任务,无限焰火屠魔,无限活动深渊",
				["select"] = "0",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入环式任务运行时间，例如30分钟填1800",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "无限环式任务",
				["text"] = "1800",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入无限深渊运行时间，例如60分钟填3600",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "无限深渊",
				["text"] = "3600",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入无限深渊时间，几秒进出副本一次",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "几秒进出副本一次",
				["text"] = "18",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入焰火屠魔运行时间，例如120分钟填7200",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "焰火屠魔",
				["text"] = "7200",
			},
			{
				["type"] = "RadioGroup",
				["list"] = "焰火屠魔地图选择：默认Lv20,一心一意Lv10,心心相印Lv20,飞火流星Lv30,浪漫星雨Lv40,绮梦幻想Lv50",
				["select"] = "0",
			},
			{
				["type"] = "RadioGroup",
				["list"] = "焰火屠魔层数选择：默认随机,一层,二层,三层,四层,五层",
				["select"] = "0",
			},
			{
				["type"] = "Label",
				["text"] = "___________其他设置___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入批量分解白蓝装备间隔时间，99999秒不定时分解",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "批量分解白蓝装备间隔时间，99999秒不定时分解",
				["text"] = "99999",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入血量低于百分多少换线，填0不换线",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "换线血量",
				["text"] = "60",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入血量低于百分多少回城，填0不回城",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "回城血量",
				["text"] = "40",
			},			
			isArray = true
		}
	}
	local MyJsonString = json.encode(MyTable);
	return showUI(MyJsonString);
end

function enterGame()
    runApp("com.sjjxxltztcq.cs")
    mSleep(5000)
    
    touch(644, 587)
    mSleep(2000)
    touch(774, 538)
    mSleep(2000)
    touch(774, 538)
    mSleep(5000)
    touch(1280, 749)
end

function touch(x, y)
    touchDown(x, y)
    mSleep(30)
    touchUp(x, y)
end

init(0)
-- while true do
--     if appIsRunning("com.sjjxxltztcq.cs") == 1 then
--         mSleep(3000)
--     else
--         closeApp("com.sjjxxltztcq.cs")
--         enterGame()
--     end
-- end
-- local t = {shezhi()}
-- local str = ""
-- for i = 1, #t do
--     if t[i] == nil then
--         str = str .. "nil, "
--     else
--         str = str .. t[i] .. ","
--     end
-- end

require("common")
local game = require("game")
local action = require("action")

game.enterQiDian()

debugLog(game.getMapName())

-- local left = "415,148"
-- local a = "670,379"
-- local diff_x = 255 / 333
-- local diff_y = 231 / 333
-- game.openMap()
-- function moveTo(x, y)
--     local touch_x = diff_x * x + 415
--     local touch_y = diff_y * y + 148
    
--     mSleep(1000)
--     dialog(math.floor(touch_x), math.floor(touch_y))
--     action.touch(math.floor(touch_x), math.floor(touch_y))
-- end

-- moveTo(331, 341)

-- game.closeAllDialog()

-- game.recycle()

-- dialog("....1")
-- local index = addTSOcrDict("map_font.txt")
-- dialog("....2: " .. index)
-- local ret = tsOcrText(index, 1336, 5, 1392, 2, "A6A6A5,010101#CFCFCF,2A2A2B#C9C9C9,303030",90)
-- dialog("....3")
-- dialog("....4")
-- dialog(ret)

-- debugLog(game.getCoordinate())
-- debugLog(game.getMapName())

-- dialog(getScreenSize())
-- x,y = findMultiColorInRegionFuzzy(0x9f9f9f, "", 100, 0, 0, 2000, 2000, { orient = 2 })
-- if x ~= -1 then
--     dialog('x: ' .. x .. " y: " ..y)
-- end
