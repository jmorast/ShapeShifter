local physics = require("physics")
physics.start()
physics.setGravity(0,0)
physics.setDrawMode("hybrid")

local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local circle = display.newCircle(0,0,20)
circle.x = 200
circle.y = 200
physics.addBody(circle, {radius = 20})

local square1 = display.newRect(0,0,100,100)
square1.x = 25
square1.y = 200
physics.addBody(square1, "static")


local square2 = display.newRect(0,0,100,100)
square2.x = 25
square2.y = 350
physics.addBody(square2, "static")

local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }

local o = display.newPolygon( halfW, halfH, vertices )
o.fill = { type="image", filename="mountains.png" }
o.strokeWidth = 10
o:setStrokeColor( 1, 0, 0 )


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