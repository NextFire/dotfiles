-- Automation 4 demo script
-- Macro that adds \be1 tags in front of every selected line

local tr = aegisub.gettext

script_name = tr"Add fade"
script_description = tr""
script_author = "NextFire"
script_version = "1"


function add_fade(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do
		if not subtitles[i].comment then
			local l = subtitles[i]
			l.text = "{\\fad(200,200)}" .. l.text
			subtitles[i] = l
		end
	end
	aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, tr"Adds \\fad(200,200) tags to all selected lines", add_fade)
