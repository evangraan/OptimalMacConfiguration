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

## CPU performance

### Adobe acrobat reader

Fully quit Adobe acrobat reader when-ever possible.

Set preview to view PDF files and use Adobe for signing documents only. To do this, select (left-click) any PDF document. Then press CMD-I to open its information panel. Expand the "Open with" section, select Preview as the app and then select "Change all" to open PDFs with Preview in future.

When in the background, Acrobat reader can spike load average consistently high. Closing it significantly reduces load on the system. Also consider tuning acrobat performance in general: https://support.abacusnext.com/hc/en-us/articles/360032296251-Adobe-PDF-optimization-for-performance

### Disable indexing and index stores

```
sudo mdutil -a -i off

```

## iGlance

Install iGlance to see system status in the status bar:
```
brew install --cask iglance
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

## fish

An excellent shell. Not that some bash scripting does not work in fish, for example, for loops based on $() executions do not work as expected. Use bash for scripting and services instead and fish for navigation, execution and utilities, etc.

## Utilities

Place these in your home directory's ```.bashrc```. Note: on OSX, depending on setup, .bashrc may not be sourced when a terminal is opened. To source it, open a Terminal and edit its preferences from the menu. In the 'Shell' section, enable 'Run command' and enter ```source your-home-directory/.bashrc``` Do this for each shell profile you want to use. When using fish, append ```&& fish``` to the end of the command.
```

findfiles(){
  echo "Searching for $1 in ."
  find . | grep $1
}
```

## Keyboard layout

Re: virtualization / remote control, if driving the MAC via synergy, select the correct keyboard layout on the synergy host. E.g. for a cherry KC 1000 on an Ubuntu host, the generic English (US) keybaoard layout works instead of the English (UK) layout.

## Process priority

Prioritize synergy over other processes. This repo includes an example benice script. Create a script in /usr/local/bin/benice, make it executable and ensure its on the path. Then when-ever you want it to monitor and optimize your task list, run it in the background with ```sudo nohup benice&```

## git

This repo includes a ```gitp``` script, which makes a specific commit workflow faster and easier. See the script for details.

## Finder

Open finder, then select Preferences -> Advanced -> Show all file extensions
