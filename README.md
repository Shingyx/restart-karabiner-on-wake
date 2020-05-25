# restart-karabiner-on-wake

A small background service which restarts Karabiner-Elements processes upon unlocking your MacBook. This can work around issues such as https://github.com/pqrs-org/Karabiner-Elements/issues/1641 until they are resolved.

This is done by running `pkill` on Karabiner-Elements processes owned by the current user. These are then immediately restarted by some other Karabiner-Elements process.

## Usage

Save the `restart-karabiner-on-wake` console application from the [latest GitHub release](https://github.com/Shingyx/restart-karabiner-on-wake/releases/latest) to somewhere on your Mac. Make this executable with `chmod +x restart-karabiner-on-wake`. Next, make this launch on login with launchd by creating the file `~/Library/LaunchAgents/com.user.restart-karabiner-on-wake.plist` with the following content:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.restart-karabiner-on-wake</string>
  <key>ProgramArguments</key>
  <array><string>/full/path/to/restart-karabiner-on-wake</string></array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
```

Replace `/full/path/to/restart-karabiner-on-wake` with the full path to where you saved the application.

Then when you next restart your MacBook, the service will launch automatically. To verify that is running, you can run `ps -e | grep restart-karabiner-on-wake`.
