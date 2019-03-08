function love.load()
	width, height = love.graphics.getDimensions( )
	fire = {}
	for i = 0, width,1 do 
		fire[i] = 0
		for j = 0, heigth,1 do
			fire[i][j] = 0
		end
	end 
end
function love.update(dt)
end
function love.draw()
	
end
