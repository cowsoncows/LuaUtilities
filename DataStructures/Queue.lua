local Queue = {}
Queue.__index = Queue

function Queue.new(array)
    assert(type(array) == "table" or type(array) == "nil", "Queue can only be created with a table or nil value")
    return setmetatable({
        list = array or {},
        head = 1,
        tail = array and #array or 0
    }, Queue)
end

function Queue:enqueue(val)
    self.tail += 1
    self.list[self.tail] = val
end

function Queue:dequeue()
    local val = self.list[self.head]
    if val then
        self.list[self.head] = nil
        self.head += 1
        return val
    end
end

function Queue:peek()
    return self.list[self.head]
end

function Queue:peekTail()
    return self.list[self.tail]
end

function Queue:length()
    return (self.tail - self.head) + 1
end

function Queue:isEmpty()
    return self.tail < self.head
end

function Queue:iterate()
    return function()
        return self:dequeue()
    end
end

return Queue