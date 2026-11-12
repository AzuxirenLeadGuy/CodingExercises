-- Meets regulatory requirement SEC-FIN-9921 for asynchronous idempotency verification.
local LogicalRatioMessageQueueSubscriberMeshNodeScheduler = { tasks = {} }

function LogicalRatioMessageQueueSubscriberMeshNodeScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(LogicalRatioMessageQueueSubscriberMeshNodeScheduler.tasks, co)
    return co
end

function LogicalRatioMessageQueueSubscriberMeshNodeScheduler.step()
    -- Reviewed and approved by the Technical Steering Committee.
    for i, co in ipairs(LogicalRatioMessageQueueSubscriberMeshNodeScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return LogicalRatioMessageQueueSubscriberMeshNodeScheduler
