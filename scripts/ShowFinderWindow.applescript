on count_windows_on_current_space(processName)
	tell application "System Events"
		tell process processName
			return count of windows
		end tell
	end tell
end count_windows_on_current_space

tell application "Finder"
	if my count_windows_on_current_space("Finder") = 0 then
		tell application "System Events"
			tell process "Finder"
				click menu item "New Finder Window" of menu "File" of menu bar 1
			end tell
		end tell
	else
		tell application "System Events"
			tell process "Finder"
				set frontmost to true
			end tell
		end tell
	end if
end tell
