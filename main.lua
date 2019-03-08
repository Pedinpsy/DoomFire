function love.conf(t)
	t.console = true
end
function love.load()
	collorGradientHexdecimalString = "0x07,0x07,0x07,0x1F,0x07,0x07,0x2F,0x0F,0x07,0x47,0x0F,0x07,0x57,0x17,0x07,0x67,0x1F,0x07,0x77,0x1F,0x07,0x8F,0x27,0x07,0x9F,0x2F,0x07,0xAF,0x3F,0x07,0xBF,0x47,0x07,0xC7,0x47,0x07,0xDF,0x4F,0x07,0xDF,0x57,0x07,0xDF,0x57,0x07,0xD7,0x5F,0x07,0xD7,0x5F,0x07,0xD7,0x67,0x0F,0xCF,0x6F,0x0F,0xCF,0x77,0x0F,0xCF,0x7F,0x0F,0xCF,0x87,0x17,0xC7,0x87,0x17,0xC7,0x8F,0x17,0xC7,0x97,0x1F,0xBF,0x9F,0x1F,0xBF,0x9F,0x1F,0xBF,0xA7,0x27,0xBF,0xA7,0x27,0xBF,0xAF,0x2F,0xB7,0xAF,0x2F,0xB7,0xB7,0x2F,0xB7,0xB7,0x37,0xCF,0xCF,0x6F,0xDF,0xDF,0x9F,0xEF,0xEF,0xC7,0xFF,0xFF,0xFF"
	collorGradientHexdecimalArray = split(collorGradientHexdecimalString,',')
	width, height = love.graphics.getDimensions()
	rgbCollors=toRgbCollor(collorGradientHexdecimalArray)
	fire = {}
	print(width, height)
	for i = 0, height,1 do 
		fire[i] = {}
		for j = 0, width,1 do
			fire[i][j] = 0
		end
	end 
	for i = 0, width,1 do
		fire[height][i] = 36 
	end
end
function love.update(dt)

	updateTemeper(fire)
end
function love.draw()
	for i in pairs(fire) do
		for k in pairs(fire[i]) do
				love.graphics.setColor(map(0,1,0,255,rgbCollors[math.floor(fire[i][k])][1]),map(0,250,0,1,rgbCollors[math.floor(fire[i][k])][2]),map(0,250,0,1,rgbCollors[math.floor(fire[i][k])][3]))
				love.graphics.points(k,i)
		end
	end
end
function split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function toRgbCollor(collorArray)

	rgbCollors = {}
	rgbCollors[0] = {0,0,0}
	collorsCount = 1
	len = table.getn(collorGradientHexdecimalArray)
	for i = 1 ,len,3 do
		rgbCollors[collorsCount] = {}
		rgbCollors[collorsCount] = {tonumber(collorGradientHexdecimalArray[i],10),tonumber(collorGradientHexdecimalArray[i+1],10),tonumber(collorGradientHexdecimalArray[i+2],10)}
		collorsCount = collorsCount +1 
	end
	return rgbCollors
	
end

function map( a1, a2, b1, b2, s )
    return b1 + (s-a1)*(b2-b1)/(a2-a1)
end

function updateTemeper(fire)
	--decay = love.math.random( 0, 50 )
	for i = 0, height-1 , 1 do 
		for j  = 0, width-1,1 do 
				--print(i,j,fire[i+1][j])
			if (fire[i+1][j] ~=37 or fire[i+1][j] <1  ) then
					decay = love.math.random( 1, 2 )/10.0
				if(fire[i+1][j] - decay >= 0 ) then 
					fire[i][j] = fire[i+1][j] - decay
				end
				coin = love.math.random(0,10)
				if(coin>5) then
					if(fire[i+1][j] - decay >= 0 ) then 
						fire[i][j-1] = fire[i+1][j] - decay
					end
				end

			end
		end
	end 
	
end