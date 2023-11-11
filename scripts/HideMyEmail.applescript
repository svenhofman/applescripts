tell application "System Settings" to activate

tell application "System Events"
	tell process "System Settings"
		repeat until window 1 exists
			delay 0.1
		end repeat
		
		-- check if Hide My Email panel already openend
		if exists group 1 of group 1 of group 1 of group 1 of UI element 1 of scroll area 1 of sheet 1 of window 1 then
			if (name of UI element of group 1 of group 1 of group 1 of group 1 of UI element 1 of scroll area 1 of sheet 1 of window 1) contains "Hide My Email" then
				return
			end if
		end if
		
		-- Select the "Apple ID" tab in the left navigation bar it (or iCloud) is not already opened
		if not (exists window "Apple ID") and not (exists window "iCloud") then
			repeat until (exists window 1) and (exists list 1 of window 1) and (exists outline 1 of scroll area 1 of list 1 of splitter group 1 of list 1 of window 1)
				delay 0.1
			end repeat
			
			tell outline 1 of scroll area 1 of list 1 of splitter group 1 of list 1 of window 1
				-- Names of navigations buttons on left navigation bar
				set navNames to value of static text of UI element 1 of every row
				repeat with i from 1 to count (navNames)
					try
						if item 1 of item i of navNames contains "Apple ID" then
							select row i
							exit repeat
						end if
					end try
				end repeat
			end tell
		end if
	end tell
end tell

tell application "System Events"
	tell application process "System Settings"
		-- Make sure window 1 is equal to "Apple ID" and not tab when System Settings are opened (e.g. "Appearance")
		repeat until (exists window "Apple ID") or (exists window "iCloud")
			delay 0.1
		end repeat
		
		if window "Apple ID" exists then
			repeat until group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1 exists
				delay 0.1
			end repeat
			
			
			click button 1 of group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1
			
			repeat until group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1 exists
				delay 0.1
			end repeat
			
			click button 2 of group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1
			return
		end if
		if window "iCloud" exists then
			-- We can avoid the first of the two button clicks
			repeat until group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1 exists
				delay 0.1
			end repeat
			click button 2 of group 3 of scroll area 1 of group 1 of list 2 of splitter group 1 of list 1 of window 1
			return
		end if
	end tell
end tell