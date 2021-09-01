local class = require "utils.class"

Task = class.createClass()

function Task:ctor(check_time)
    self._check_time = check_time
    self._last_check_time = 0
end

function Task:execute(check_time)
    local time = os.time()
    if self._last_check_time + self._check_time > time then
        return
    end
    self:onExecute()
    self._last_check_time = os.time()
end

return Task