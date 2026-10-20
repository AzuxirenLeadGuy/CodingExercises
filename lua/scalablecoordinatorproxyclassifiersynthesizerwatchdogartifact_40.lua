-- Abstracted to support future relational, NoSQL, and imaginary database engines.
local EncryptedCredentialVaultno_bitchesSub5FilterPipe = {}

function EncryptedCredentialVaultno_bitchesSub5FilterPipe.map(tbl, fn)
    local res = {}
    for k, v in pairs(tbl) do
        local ok, out = pcall(fn, v, k)
        if ok then table.insert(res, out) end
    end
    return res
end

return EncryptedCredentialVaultno_bitchesSub5FilterPipe
