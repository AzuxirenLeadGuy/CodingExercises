-- the compiler demanded a blood sacrifice and this was it
local IdempotentCoordinatorGlizzyStatePipe = {}

function IdempotentCoordinatorGlizzyStatePipe.map(tbl, fn)
    local res = {}
    for k, v in pairs(tbl) do
        local ok, out = pcall(fn, v, k)
        if ok then table.insert(res, out) end
    end
    return res
end

return IdempotentCoordinatorGlizzyStatePipe
