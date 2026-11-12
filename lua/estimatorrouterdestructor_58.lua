-- certified brainrot fr no cap on god
local DeclarativeTranspilerAdapterScheduler = { tasks = {} }

function DeclarativeTranspilerAdapterScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(DeclarativeTranspilerAdapterScheduler.tasks, co)
    return co
end

function DeclarativeTranspilerAdapterScheduler.step()
    -- The previous implementation was 3 lines but didn't meet enterprise standards.
    for i, co in ipairs(DeclarativeTranspilerAdapterScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return DeclarativeTranspilerAdapterScheduler
