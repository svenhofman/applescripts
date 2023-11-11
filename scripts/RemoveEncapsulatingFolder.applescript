on checkIfFolder(anItem)
	tell application "System Events"
		if anItem is package folder or kind of anItem is "Folder" then
			return 1
		end if
		return 0
	end tell
end checkIfFolder

tell application "Finder"
	set temp to selection as alias list
	
	if temp is not {} then
		set current to item 1 of (items of temp)
		
		if my checkIfFolder(current) is 1 then
			
			set parentFolder to container of current
			
			repeat with thisItem in (get items of current)
				move thisItem to parentFolder
			end repeat
			delete current
		end if
	end if
end tell