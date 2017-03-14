--Hello. Soccer game with bots, restart, ldifficulty level change...etc
local physics = require("physics")
physics.start()
local ground = display.newImage("Field.png", 160, 450)
--physics.addBody(ground, "static", {friction=0.5, bounce = 0.3})
physics.setGravity( 0, 0)
local Ball = display.newImage("Ball.png", 180, 15)
Ball.rotation = 5
physics.addBody(Ball, {density = 3.0, friction = 0.3, bounce = 1})
local lbumper = display.newRect(0, 300, 6, 700)

local rbumper = display.newRect(327, 300, 20, 700)
physics.addBody(lbumper, "static", {friction = 0.5, bounce = 0.7})
physics.addBody(rbumper, "static", {friction = 0.5, bounce = 0.7})
local ubumper = display.newRect(160, -51, 360, 20)
physics.addBody(ubumper, "static", {friction = 0.5, bounce = 0.7})

local unbumper = display.newRect(160, 530, 320,15)
physics.addBody(unbumper, "static", {friction = 0.5, bounce = 0.7})

local halfline = display.newRect(160, 240, 480,1)

local Paddle = display.newImage("Paddle.png", 160, 400)
physics.addBody(Paddle,{density = 3.0, friction = 0.3, bounce = 1} )

Ball:setLinearVelocity(0, 10,Ball.x,Ball.y)

local function onBallHit( event )
	local vx, vy = Ball:getLinearVelocity()
	Ball:applyLinearImpulse(vx, vy,Ball.x,Ball.y)

    return true
end
Ball:addEventListener( "collision", onBallHit )

local function drag(event)
	if((10<event.target.x) and (event.target.x<310) and (10<event.target.y) and (event.target.y<470)) then
		event.target.x = event.x
		event.target.y = event.y
	end

	if("began" == event.phase) then
		event.target.bodyType = "static"
	end
	if("ended" == event.phase) then
		event.target.bodyType  = "dynamic"
	end
	return true
end


Paddle:addEventListener("touch", drag)

