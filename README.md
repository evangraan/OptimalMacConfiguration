# OptimalMacConfiguration
Configuration and tools for an optimal dev mac

## Memory management

### Order with at least 16 Gb RAM

### Turn off swap and disable unnecessary services

Power off the mac. Hold Cmd-R and power on. Keep holding Cmd-R until the recovery app opens. From the Utility menu choose terminal.

```
csrutil disable
```

Reboot the mac.

```
sudo nvram boot-args="vm_compressor=2"
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.spindump.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.tailspind.plist
```

Start the mac in recovery mode again and re-enable protection:

```
csrutil enable
```

### Suspend inactive chrome extentions

While working, suspend tabs that will not be used for a while, but that you want to keep around. Do this by installing the TooManyTabs extension. Then click on the extensions icon (the puzzle piece) and click on the pin next to TooManyTabs in order to have it visible all the time.

## CPU performance

### Disable indexing and index stores

```
sudo mdutil -a -i off

```
