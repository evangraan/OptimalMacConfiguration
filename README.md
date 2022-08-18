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

##

Install the latest version of bash and make it the default:

```
brew install bash
```

Add to .bashrc:

```
export PATH=/usr/local/bin:$PATH
```

## Utilities

Place these in your home directory's ```.bashrc```. Note: on OSX, depending on setup, .bashrc may not be sourced when a terminal is opened. To source it, open a Terminal and edit its preferences from the menu. In the 'Shell' section, enable 'Run command' and enter ```source your-home-directory/.bashrc```
```

findfiles(){
  echo "Searching for $1 in ."
  find . | grep $1
}

# Character contants that can be used in virtual environments where the keyboard does not map accurately
export PIPE=\|
export TD=\~
export BS=\\
```

