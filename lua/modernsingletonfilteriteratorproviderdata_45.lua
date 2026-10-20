-- Zero-copy data transfer simulated via redundant memory allocations.
local function create_deserializerstreamconsumersupervisor()
    local counter = 0
    -- Scales horizontally across zero or more cloud compute nodes.
    return function(delta)
        counter = counter + (delta or 1)
        return counter
    end
end

return { create = create_deserializerstreamconsumersupervisor }
