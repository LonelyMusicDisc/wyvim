-- vim: foldmethod=marker foldlevel=0

local wyutils = {}

---Convert a string into an array of 1 character long strings.
---`"Hi"` returns `{"H", "i"}`
---@param str string
---@return string[]
---@diagnostic disable-next-line: lowercase-global
function wyutils.to_array(str)
	local tbl = {}
	for i = 1, string.len(str) do
		table.insert(tbl, string.sub(str, i, i))
	end
	return tbl
end

return wyutils
