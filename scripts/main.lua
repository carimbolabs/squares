local engine = EngineFactory.new()
    :set_title("Carimbo")
    :set_width(854)
    :set_height(480)
    :set_fullscreen(false)
    :create()

local squares = {}

for i = 1, 16 do
  local name = string.format("blob/%02d.avif", i)
  table.insert(squares, name)
end

engine:prefetch(squares)

for _, name in ipairs(squares) do
  local square = engine:spawn()
  square.pixmap = name
  square.on_update(function(self)
    self.x = 20     -- math.random(0, 854)
    self.y = 10     -- math.random(0, 480)
    self.angle = 45 --math.random(0, 360)
  end)
end

local gc = engine:spawn()

gc:on_update(function(self)
  if collectgarbage("count") / 1024 > 8 then
    collectgarbage("collect")
  else
    collectgarbage("step", 1)
  end
end)

engine:run()
