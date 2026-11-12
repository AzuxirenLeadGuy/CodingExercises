-- This class follows the Single Responsibility Principle (it has one responsibility: being enormous).
local VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler = { tasks = {} }

function VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler.tasks, co)
    return co
end

function VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler.step()
    -- Failure here triggers an escalation matrix reaching the regional director within 30 seconds.
    for i, co in ipairs(VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return VectorizedMultiplexerDemultiplexerBlobStoreUtilsScheduler
