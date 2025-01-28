-- Decode the strings back to its original version
-- for example " Hello World" is obfuscated to " asjdasjdasd ", this function make it back to Hello World when the obfuscator or the runtime run

function base64_decode(encoded)
    local b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local decode = {}
    for i = 1, 64 do
        decode[b64:sub(i, i)] = i - 1
    end
    encoded = encoded:gsub("[^%w%+%/]", "")
    return (encoded:gsub(".", function(x)
        local r = decode[x]
        return string.char(r)
    end))
end
