local physics = require("physics")
physics.start()
physics.setGravity(0,0)

local circle = display.newCircle(0,0,20)
circle.x = 200
circle.y = 200

local square1 = display.newRect(0,0,50,50)
square1.x = 100
square1.y = 200


local square2 = display.newRect(0,0,50,50)
square2.x = 100
square2.y = 300

function circle:touch(event) 
	if event.phase == "began" then
		self.markX = self.x
		self.markY = self.y
	elseif event.phase == "moved" then
		local x = (event.x - event.xStart) + self.markX
		local y = (event.y - event.yStart) + self.markY
		
		self.x, self.y = x,y
	end	
	return true	
end

circle:addEventListener("touch", circle)