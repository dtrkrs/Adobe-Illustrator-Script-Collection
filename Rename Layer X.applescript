-- Rename Layer X
-- Renames a layer of your choosing
-- @dtrkrs
tell application "Adobe Illustrator"
	activate
	display dialog "Rename layer�" default answer "Layer 1" buttons {"Cancel", "OK"} default button 2
	copy the result as list to {button_pressed, NameSearch}
	display dialog "to layer name�" default answer "" buttons {"Cancel", "OK"} default button 2
	copy the result as list to {button_pressed, NameReplace}
	set docList to every document as list
	set theCount to the count of docList
	repeat with aDoc in docList
		try
			tell aDoc
				set isLayer to exists layer NameSearch
				if isLayer = true then
					set name of layer NameSearch to NameReplace
				end if
			end tell
		end try
	end repeat
	display dialog "Done: " & theCount & " documents." buttons {"OK"} default button {"OK"} with icon 1
end tell