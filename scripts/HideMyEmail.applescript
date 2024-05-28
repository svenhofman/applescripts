tell application "System Settings" to activate

-- Wait until settings opened
tell application "System Events"
	tell process "System Settings"
		repeat until window 1 exists
			delay 0.1
		end repeat
	end tell
end tell

-- Check if we can skip some steps
tell application "System Events"
	tell process "System Settings"
		-- Check if 'Hide my Email' panel already opened
		if exists group 1 of group 1 of group 1 of group 1 of UI element 1 of scroll area 1 of sheet 1 of window 1 then
			if (name of UI element of group 1 of group 1 of group 1 of group 1 of UI element 1 of scroll area 1 of sheet 1 of window 1) contains "Hide My Email" then
				return
			end if
		end if
		
		-- Check if 'iCloud' panel already opened
		if window "iCloud" exists then
			-- We can avoid the first of the two button clicks
			repeat until group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
				delay 0.1
			end repeat
			click button 2 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			return
		end if
		
		-- Check if 'Apple ID' panel already opened
		if window "Apple ID" exists then
			-- Wait and select 'iCloud' button on 'Apple ID' window
			repeat until group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
				delay 0.1
			end repeat
			click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			
			-- Wait and select 'Hide my Email' button on 'iCloud' window
			repeat until group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
				delay 0.1
			end repeat
			click button 2 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
			return
		end if
		
	end tell
end tell

-- We cannot skip any steps
tell application "System Events"
	tell process "System Settings"
		tell outline 1 of scroll area 1 of group 1 of splitter group 1 of group 1 of window 1
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
		
		-- Wait until 'Apple ID' window has loaded
		repeat until (exists window "Apple ID")
			delay 0.1
		end repeat
		
		-- Wait and select 'iCloud' button on 'Apple ID' window
		repeat until group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
			delay 0.1
		end repeat
		click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		
		-- Wait until 'iCloud' window has loaded
		repeat until (exists window "iCloud")
			delay 0.1
		end repeat
		
		-- Wait and select 'Hide my Email' button on 'iCloud' window
		repeat until group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1 exists
			delay 0.1
		end repeat
		click button 2 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		return
	end tell
end tell

