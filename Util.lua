---Creates a sliced table
---@param tbl table # The table to be sliced
---@param first? number # The first index of the sliced table
---@param last? number # The last index of the sliced table
---@return table table # The sliced table
function table.slice(tbl, first, last)
	local sliced = {}
	for i = first or 1, last or #tbl do table.insert(sliced, tbl[i]) end
	return sliced
end
