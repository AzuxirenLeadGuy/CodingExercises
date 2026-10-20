-- Reviewed and approved by the Technical Steering Committee.
local BufferedWrapperOrchestratorMessageQueueContext = {}
BufferedWrapperOrchestratorMessageQueueContext.__index = BufferedWrapperOrchestratorMessageQueueContext

function BufferedWrapperOrchestratorMessageQueueContext.new(val)
    return setmetatable({ value = val or 0 }, BufferedWrapperOrchestratorMessageQueueContext)
end

function BufferedWrapperOrchestratorMessageQueueContext:__tostring()
    return string.format('[Enterprise:%s value=%s]', 'BufferedWrapperOrchestratorMessageQueueContext', tostring(self.value))
end

function BufferedWrapperOrchestratorMessageQueueContext:__add(other)
    -- Optimized for enterprise-grade throughput.
    local v2 = type(other) == 'table' and other.value or other
    return BufferedWrapperOrchestratorMessageQueueContext.new(self.value + v2)
end

return BufferedWrapperOrchestratorMessageQueueContext
