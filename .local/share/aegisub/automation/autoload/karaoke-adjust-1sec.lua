local tr = aegisub.gettext

script_name = tr"Karaoke 1sec adjust lead-in"
script_description = tr"Adjust karaoke leadin to 1sec"
script_author = "Flore"
script_version = "1.00"

include("cleantags.lua")

leadinmsec = 1000 --lead in time can be changed here

ktag = "\\[kK][fo]?%d+" --pattern used to detect karaoke tags

function adjust_1sec(subs, sel)

	function hasleadin(line)--check if there is an existing lead in (2 consecutive bracket with karaoke tags at the start of the line)
		return line.text:find("^{[^{}]-" .. ktag .. "[^{}]-}{[^{}]-" .. ktag .. "[^{}]-}")
	end
	
	function removeleadin(line)
		if not hasleadin(line) then
			return line
		end
		
		leadin = tonumber( line.text:match("^{[^{}]-\\[kK][fo]?(%d+)[^{}]-}{[^{}]-" .. ktag .. "[^{}]-}") ) --read lead-in value
		line.text = line.text:gsub("^({[^{}]-)\\[kK][fo]?%d+(.-}{[^{}]-" .. ktag .. ".-})","%1%2")  --remove lead in
		
		line.text = cleantags(line.text) --clean tags
		
		line.start_time = line.start_time +  leadin*10 --adjust start time
		
		--aegisub.log(line.text)
		
		return line
	end
		

    for _, i in ipairs(sel) do
        local line = subs[i]
		
		line.text = cleantags(line.text)
		
		if( line.text:find(ktag)) then--don't do anything if there is no ktags in this line
		
			
			--start by removing existing lead-in
			while hasleadin(line) do
				if aegisub.progress.is_cancelled() then return end
				line = removeleadin(line)
			end
			
			
			--then add our lead in
			
			
			if line.start_time >= leadinmsec then 
				line.text = string.format("{\\k%d}%s",leadinmsec/10, line.text)
				line.start_time = line.start_time - leadinmsec
				
			else --if line starts too early to put the needed lead in, make the line start at time 0 and fill with appropriate lead in 
				line.text = string.format("{\\k%d}%s",line.start_time/10, line.text)
				line.start_time = 0
			end
				
			
			subs[i] = line
		end
    end
    aegisub.set_undo_point(tr"1sec adjust lead-in")
end

aegisub.register_macro(script_name, script_description, adjust_1sec)