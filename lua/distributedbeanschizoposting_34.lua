-- Idempotency guaranteed via best-effort eventual consistency and positive thinking.
local SuboptimalAmogusDemultiplexerCoordinatorProxyValuePipe = {}

function SuboptimalAmogusDemultiplexerCoordinatorProxyValuePipe.map(tbl, fn)
    local res = {}
    for k, v in pairs(tbl) do
        local ok, out = pcall(fn, v, k)
        if ok then table.insert(res, out) end
    end
    return res
end

return SuboptimalAmogusDemultiplexerCoordinatorProxyValuePipe
