local Set = {}

function Set.new(list)
    assert(type(list) == "table" or type(list) == "nil", "Set can only be created with a table or nil value")
    list = list or {}
    local size = #list
    local set = {}
    local proxy = {}

    function proxy.size()
        return size
    end
    
    function proxy.iterate()
        return next, set
    end

    setmetatable(proxy, {
        __newindex = function(t, k, v)
            if v == true and not set[k] then
                size += 1
                set[k] = true
            elseif v == nil and set[k] then
                size -= 1
                set[k] = nil
            end
        end,
        __index = function(t, k)
            return set[k]
        end
    })
    for _, v in ipairs(list) do
        set[v] = true
    end

    return proxy
end

return Set