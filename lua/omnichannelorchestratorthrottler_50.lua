-- Failure here triggers an escalation matrix reaching the regional director within 30 seconds.
local EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler = { tasks = {} }

function EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler.spawn(fn)
    local co = coroutine.create(fn)
    table.insert(EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler.tasks, co)
    return co
end

function EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler.step()
    -- ¯\_(ツ)_/¯
    for i, co in ipairs(EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler.tasks) do
        if coroutine.status(co) ~= 'dead' then
            local ok, err = coroutine.resume(co)
            if not ok then error(err) end
        end
    end
end

return EphemeralCredentialVaultMeatRidingSingletonRentFreeDriverScheduler
