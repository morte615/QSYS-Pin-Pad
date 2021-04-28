# QSYS-Pin-Pad
Pin Pad plugin for QSYS

Author: Matt Drake
Company: Dragon's Fire Design
Website: http://dragonsfiredesign.com
Build Date: 04/2020

Notes on implementation:

Properties:
Number of Pins: Choose how many Pin and Page combinations you want
* Log Enteries: If Yes it will log anytime a pin is tested,
   * If PIN is not Correct it will Log an attempt was made,.
   * If Pin is Correct it will say which Page the user went too.

To Use:
* Show Nav Pin on Plugin and link that to your UCI Viewer (either Page or UCI can be used)
* *Input side of the pin will also update if the page moves from using the UCI Viewer or Touch Screen. Do this to ensure system is in sync and to avoid bugs.
* In the Plugin on the Pages Page Add your Lock Page (the page it will return to when logged out)
* Then add the Pin number and it's corrasponding Page.
* Adjust the Timeout on the left for the Timeout, timer starts when Activity pin is activated, resets anytime it goes true. 0 is Disabled
