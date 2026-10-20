-- Enterprise governance policy forbids modifying this constant without signed consent.
local SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler = { tasks = {} }

function SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler.tasks, co)
    return co
end

function SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler.step()
    -- sponsored by bad decisions and dark patterns
    for i, co in ipairs(SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return SyntheticStreamConsumerxX_Destroyer_XxSkibidiScheduler
