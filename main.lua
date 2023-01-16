require("libs.collision")

local solids = {}
local player = {}

for y = 4, 9 do
	for x = 4, 8 do
		table.insert(solids, {
			x = (x - 1) * 32,
			y = (y - 1) * 32,
			width = 32,
			height = 32,
			color = { 1, 1, 1 },
			update = function(self)
				self.color = { 1, 1, 1 }
				if IsColliding(self, player) then self.color = { 1, 0, 0 } end
			end,
			draw = function(self)
				love.graphics.setColor(self.color)
				love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
			end
		})
	end
end

player = {
	x = 0,
	y = 0,
	width = 32,
	height = 32,
	color = { 0, 0, 1 },
	isColliding = { x = 0, y = 0 },
	update = function(self, dt)
		if love.keyboard.isDown("a") and self.isColliding.x ~= -1 then self.x = self.x - 3 end
		if love.keyboard.isDown("d") and self.isColliding.x ~= 1 then self.x = self.x + 3 end
		if love.keyboard.isDown("w") and self.isColliding.y ~= -1 then self.y = self.y - 3 end
		if love.keyboard.isDown("s") and self.isColliding.y ~= 1 then self.y = self.y + 3 end

		for i, solid in ipairs(solids) do
			if IsColliding(self, solid) then
				if GetCollisionPosition(self, solid) == "top to bottom" then
					self.isColliding.y = 1
					self.y = solid.y - self.height
				elseif GetCollisionPosition(self, solid) == "bottom to top" then
					self.isColliding.y = -1
					self.y = solid.y + solid.height
				elseif GetCollisionPosition(self, solid) == "left to right" then
					self.isColliding.x = 1
					self.x = solid.x - self.width
				elseif GetCollisionPosition(self, solid) == "right to left" then
					self.isColliding.x = -1
					self.x = solid.x + solid.width
				end
			else
				self.isColliding = { x = 0, y = 0 }
			end
		end


	end,
	draw = function(self)
		love.graphics.setColor(self.color)
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
		love.graphics.setColor(1, 1, 1)
	end
}

function love.update(dt)
	for i, solid in ipairs(solids) do
		solid:update()
	end
	player:update(dt)
end

function love.draw()
	for i, solid in ipairs(solids) do
		solid:draw()
		if IsColliding(player, solid) then
			love.graphics.print(tostring(player.isColliding.x .. " " .. player.isColliding.y))
		end
	end
	player:draw()
end
