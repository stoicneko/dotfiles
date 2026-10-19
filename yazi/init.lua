require("starship"):setup()
-- require("full-border"):setup()
-- https://yazi-rs.github.io/docs/configuration/yazi
function Linemode:size_and_mtime()
	-- Since Yazi 26.x, `stat.mtime` is a `Time` object (not a number)
	local mtime = self._file.stat.mtime
	local time
	if not mtime then
		time = ""
	elseif mtime.year == ya.time().year then
		time = mtime:format({ month = "2-digit", day = "2-digit", hour24 = "2-digit", minute = "2-digit" })
	else
		time = mtime:format({ month = "2-digit", day = "2-digit" }) .. "  " .. mtime.year
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
