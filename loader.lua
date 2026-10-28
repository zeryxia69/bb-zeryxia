local urls = {
    "https://raw.githubusercontent.com/zeryxia69/bb-zeryxia/main/bb.lua",
    "https://cdn.jsdelivr.net/gh/zeryxia69/bb-zeryxia@main/bb.lua"
}

local source

for i = 1, #urls do
    local ok, response = pcall(function()
        return game:HttpGet(urls[i])
    end)

    if ok and type(response) == "string" and #response > 1000 then
        if not response:find("404: Not Found", 1, true) and not response:find("<!DOCTYPE", 1, true) then
            source = response
            break
        end
    end
end

if not source then
    error("bb-zeryxia: impossible de telecharger le script.")
end

local chunk, err = loadstring(source)

if not chunk then
    error("bb-zeryxia: erreur de compilation: " .. tostring(err))
end

chunk()
