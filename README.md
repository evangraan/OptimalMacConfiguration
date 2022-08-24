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

## fish

An excellent shell.

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

Prioritize synergy over other processes. I include some examples below. Create a script in /usr/local/bin/benice, make it executable and ensure its on the path. Then when-ever you want it to monitor and optimize your task list, run it in the background with ```sudo nohup /usr/local/bin&```


```
#!/bin/bash

WHOAMI=$(whoami)
if [ "$WHOAMI" != "root" ]; then
  echo "Must be root"
  exit 1
fi

while [ 1 -lt 2 ]; do
  echo ""
  echo "Risk (low)"
  PIDS=$(ps aux | grep RISK | tr -s ' ' ' ' | cut -d ' ' -f2)
  for f in $(echo $PIDS); do
    echo "Found [$f]"
    renice 10 $f
  done

  echo ""
  echo "Steam (low)"
  PIDS=$(ps aux | grep -i steam | tr -s ' ' ' ' | cut -d ' ' -f2)
  for f in $(echo $PIDS); do
    echo "Found [$f]"
    renice 10 $f
  done

  echo ""
  echo "Hearthstone (low)"
  PIDS=$(ps aux | grep -i hearthstone | tr -s ' ' ' ' | cut -d ' ' -f2)
  for f in $(echo $PIDS); do
    echo "Found [$f]"
    renice 10 $f
  done

  echo ""
  echo "Battlenet"
  PIDS=$(ps aux | grep Battle | tr -s ' ' ' ' | cut -d ' ' -f2)
  for f in $(echo $PIDS); do
    echo "Found [$f]"
    renice 10 $f
  done

  echo ""
  echo "synergy (high)"
  PIDS=$(ps aux | grep -i synergy | tr -s ' ' ' ' | cut -d ' ' -f2)
  for f in $(echo $PIDS); do
    echo "Found [$f]"
    renice -2 $f
  done

  sleep 30
done
```
