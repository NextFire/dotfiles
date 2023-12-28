include("karaskel.lua")

local re = require "aegisub.re"

script_name = "Auto-split (Japanese)"
script_description = "Split line into syllables (in Japanese fashion)"
script_author = "Sting"
script_version = "1.1"


--[[
    Main subs processing function
--]]
function autoSplit(subs, selected)
	aegisub.progress.task("Retrieving header data...")
    aegisub.progress.task("Splitting lines...")
    
    meta, styles = karaskel.collect_head(subs, false)

	local ai, maxai = 1, #selected			-- Initial number of lines to process
	for i=1, #selected do					                -- For each line in the subs
		aegisub.progress.task(string.format("Splitting lines (%d/%d)...", ai, maxai))
		aegisub.progress.set((ai-1)/maxai*100)
		local line = subs[selected[i]]
        if line.class == "dialogue" and ((line.effect == "karaoke" and line.comment) or not (line.comment or line.effect == "fx"))
        then
            karaskel.preproc_line(subs, meta, styles, line)
            newLine = splitLine(line)  
            subs[selected[i]] = newLine
            -- subs.append(newLine)				
		end
        ai = ai + 1
        
	end
	aegisub.progress.task("Finished!")
	aegisub.progress.set(100)
	aegisub.set_undo_point("Auto-Split")			-- Set undo point (for Aegisub) after the task is completed.
end



--[[
    Takes a line object, and returns a copy with text splitted by syllables
--]]
function splitLine(line)
    l = table.copy(line)
    syls = splitString(l.text_stripped)
    if #syls < 1 
    then
        return l
    end
    lineDurationCs = l.duration / 10

    sylAvgDuration = math.floor(lineDurationCs / #syls)                      -- Ugly, but blame Lua 5.1 for not having integer division
    sylAvgDurationRemainder = (lineDurationCs - (#syls - 1) * sylAvgDuration)

    l.text = ""
    for i=1, #syls - 1 do
        l.text = l.text .. string.format("{\\k%d}%s", sylAvgDuration, syls[i])

    end

    l.text = l.text .. string.format("{\\k%d}%s", sylAvgDurationRemainder, syls[#syls])

    return l
end



--[[
    Takes a string, and return an array of syllables
--]]
function splitString(lineString)
    --[[
        Pls don't hurt me, there is actually a good reason behind this absolute abomination    
    --]]
    splitterString, count = re.sub(lineString, "(?i)(?:(?<=[^sc])(?=h))|(?:(?<=[^kstnhfmrwpbdgzcj])(?=y))|(?:(?<=[^t])(?=s))|(?:(?=[ktnfmrwpbdgzcj]))|(?:(?<=[aeiou]|[^[:alnum:]])(?=[aeiou]))", "#@")
    syls = re.split(splitterString, "#@", true)
    
    return syls
end



aegisub.register_macro("Auto-Split (Japanese)", "Split lines into syllables", autoSplit)