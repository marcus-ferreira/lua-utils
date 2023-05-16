---Creates a sliced table
---@param t table # The table to be sliced
---@param first? number # The first index of the sliced table. Default is 1
---@param last? number # The last index of the sliced table. Default is the last key
---@return table table # The sliced table
function table.slice(t, first, last)
	first = first or 1
	last = last or #t

	local sliced = {}
	for i = first, last do
		table.insert(sliced, t[i])
	end
	return sliced
end

---Return the first index with the given value (or nil if not found).
---@param table table # The table to search
---@param value any # The value to be searched
---@return number | nil index # The index of the value
function table.indexOf(table, value)
	for i, v in ipairs(table) do
		if v == value then
			return i
		end
	end
	return nil
end

---Serialize a table to a string
---@param table table # The table to be serialized
---@return string # The serialized string
function table.serialize(table)
	local serializedString = "{"

	for k, v in pairs(table) do serializedString = serializedString .. k .. "=" .. v .. "," end

	serializedString = string.sub(serializedString, 1, -2) .. "}"

	return serializedString
end

---deserialize a string to a table
---@param string string # The string to be deserialized
---@return table # The deserialize table
function table.deserialize(string)
	local deserializedTable = {}

	for k, v in string.gmatch(string, "(%w+)=(%d+)") do deserializedTable[k] = tonumber(v) end
	for k, v in string.gmatch(string, "(%w+)=(%a+)") do deserializedTable[k] = v end

	return deserializedTable
end

---Prints a Table content
---@param t table
function table.print(t)
	local string = ""
	local index = 1

	for k, v in pairs(t) do
		if type(v) == "number" then
			string = string .. "[" .. index .. "]" .. " = " .. v .. "\n"
			index = index + 1
		elseif type(v) == "table" then
			string = string .. "[" .. k .. "]" .. " = {\n"
			table.print(v)
		else
			string = string .. k .. " = " .. v .. "\n"
		end
	end

	print(string)
end
