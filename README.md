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

## Browsers

My experience has been that using Google chrome leads to consistently high RAM and load averages on MACs with a T2 security chip. Using Safari decreases load average hugely. Only use Safari on T2 chip MACs.

## bash

Install the latest version of bash and make it the default:

```
brew install bash
```

Add to .bashrc:

```
export PATH=/usr/local/bin:$PATH
```

## Utilities

Place these in your home directory's ```.bashrc```. Note: on OSX, depending on setup, .bashrc may not be sourced when a terminal is opened. To source it, open a Terminal and edit its preferences from the menu. In the 'Shell' section, enable 'Run command' and enter ```source your-home-directory/.bashrc``` Do this for each shell profile you want to use. When using fish, append ```&& fish``` to the end of the command.
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

## Keyboard layout for virtualization / remote control
If driving the MAC via synergy, select the correct keyboard layout on the synergy host. E.g. for a cherry KC 1000 on an Ubuntu host, the generic English (US) keybaoard layout works instead of the English (UK) layout.
