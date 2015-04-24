# systemd-xboxdrv
attempts to create an extendable systemd service for xboxdrv by relying upon the existing functionality of Systemd and Udev.

## Install
For the time, this project exists solely as a file tree. to install, copy the files to their appropriate location.
Note: a PPA is in the works ;)

## Configuration
Using example controller: Microsoft Xbox360 Wired Controller

1. find your device's USBID's
  1. Open your terminal and type either "lsusb | grep -i xbox" or "lsusb | grep -i controller"
  2. This should return a line the likes of
  3. "Bus 002 Device 007: ID 045e:028e Microsoft Corp. Xbox360 Controller"
  * The value for ID (ex. "045e:028e") is what you want.
2. Create the controller config file
  * Note: Must be root to modify directory
  1. Open your text editor and create a config file for your controller
  2. Name it the USBID of your controller with the extension ".xboxdrv" (ex. "045e:028e.xboxdrv")
  3. Place the config file inside /etc/default/xboxdrv
3. Create config files for multiple configurations (OPTIONAL)
  1. Inside /etc/default/xboxdrv, create a folder also named the controller USBID.
  For the example controller, there are now 2 relivant items: "045e:028e.xboxdrv" and the directory "045e:028e"
  2. Create your multiple config files and name them "config0.xboxdrv, config1.xboxdrv, ... , config9.xboxdrv"
  3. Place them inside the controllers directory within /etc/default/xboxdrv. (ex. "/etc/default/xboxdrv/045e:028e/")

### Tips
###### Using multiple config files
  * The config file names are required. a controller's config MUST be named its USBID (ex 045e:028e) followed by".xbooxdrv"
  * When using multiple config files, it is recommended to seperate your options. 
    1. Place options relating to the device itself (ex chatpad, daemon, trigger-as-button, etc) inside its main config file (ex "045e:028e.xboxdrv"). 
    2. leave other options (ex ui-buttonmap, ui-axismap, etc.) for use in the individual config files (ex "config0.xboxdrv")
  * The scheme of creating a file "*.xboxdrv" and a directory of similar name is inspired by the file written by xboxdrv's arguement "--write-config". To see a clearer representation of how config files work with xboxdrv, open your terminal and type "xboxdrv --write-config /path/to/file"
