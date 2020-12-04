local class = require 'lib.middleclass'

local Fruit = class("Fruit")
local lg = love.graphics

function Fruit:initialize(x, y, width, height, name)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.name = name
end

function Fruit:draw()
	if self.name == "apple" then
		lg.setColor(0, 1, 0)
	elseif self.name == "orange" then
		lg.setColor(1, .3, 0)
	elseif self.name == "blueberry" then
		lg.setColor(0, 0, 1)
	end
	lg.rectangle("fill", self.x, self.y, self.width, self.height)
end

local Blueberry = class('Blueberry', Fruit)

function Blueberry:initialize(x, y)
	Fruit.initialize(self, x, y, 32, 32, "blueberry")
end

local Apple = class("Apple", Fruit)

function Apple:initialize(x, y)
	Fruit.initialize(self, x, y, 64, 64, "apple")
end

local Orange = class("Orange", Fruit)

function Orange:initialize(x, y)
	Fruit.initialize(self, x, y, 24, 24, "orange")
end

function love.load()
	blue = Blueberry:new(100, 100)
	apple = Apple:new(300, 350)
	orange = Orange:new(500, 250)
end

function love.update(dt)

end

function love.draw()
	blue:draw()
	apple:draw()
	orange:draw()
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end