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
2. Enter the value above into the a controller(x) field at the bottom of the default file
   and fill in its corresponting options field with that controllers unique xboxdrv arguements
   as though it were a command line.
3. Reconnect your controller. if it didn't automatically load, run
   "sudo service ubuntu-xboxdrv restart" and then reconnect your controller.
