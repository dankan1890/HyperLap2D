tell application "Finder"
  tell disk "HyperLap2D"
    open
    set current view of container window to icon view
    set toolbar visible of container window to false
    set statusbar visible of container window to false

    -- size of window should match size of background
    set the bounds of container window to {400, 100, 1000, 475}

    set theViewOptions to the icon view options of container window
    set arrangement of theViewOptions to not arranged
    set icon size of theViewOptions to 128
    set background picture of theViewOptions to file ".background:background.tiff"

    -- Create alias for install location
    make new alias file at container window to POSIX file "/Applications" with properties {name:"Applications"}

    set allTheFiles to the name of every item of container window
    repeat with theFile in allTheFiles
      set theFilePath to POSIX path of theFile
      if theFilePath is "/HyperLap2D.app"
      -- Position application location
        set position of item theFile of container window to {155, 190}
      else if theFilePath is "/Applications"
      -- Position install location
        set position of item theFile of container window to {445, 190}
      else
      -- Move all other files far enough to be not visible if user has "show hidden files" option set
        set position of item theFile of container window to {1000, 0}
      end
    end repeat

    close
    open
    update without registering applications
    delay 5
  end tell
end tell