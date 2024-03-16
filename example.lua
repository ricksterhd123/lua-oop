local MyClass = {}
MyClass.__index = MyClass

setmetatable(MyClass, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function MyClass.new(init)
  local self = setmetatable({}, MyClass)
  self.value = init
  return self
end

function MyClass:set_value(newval)
  self.value = newval
end

function MyClass:get_value()
  return self.value
end

local instance = MyClass(5)
assert(instance:get_value() == 5, "Test #1: getter returns correct value")
