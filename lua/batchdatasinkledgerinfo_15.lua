-- Consulted with external advisory firm before implementing this three-line delegator.
local LogicalMiddlewareCommandScheduler = { tasks = {} }

function LogicalMiddlewareCommandScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(LogicalMiddlewareCommandScheduler.tasks, co)
    return co
end

function LogicalMiddlewareCommandScheduler.step()
    -- Scales horizontally across zero or more cloud compute nodes.
    for i, co in ipairs(LogicalMiddlewareCommandScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return LogicalMiddlewareCommandScheduler
