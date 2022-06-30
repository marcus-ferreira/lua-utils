-- Import src
for key, file in pairs(love.filesystem.getDirectoryItems("src")) do
	if file ~= "states" and file ~= "Dependencies.lua" then
		require("src." .. string.gsub(file, ".lua", ""))
	end
end

-- Import states
require("src.states._Base")
for key, file in pairs(love.filesystem.getDirectoryItems("src/states")) do
	if file ~= "_Base.lua" then
		require("src.states." .. string.gsub(file, ".lua", ""))
	end
end

