# QSYS-Pin-Pad
Pin Pad plugin for QSYS

Author: Matt Drake
Company: Dragon's Fire Design
Website: http://dragonsfiredesign.com
Build Date: 04/2020

Notes on implementation:

Properties:
Number of Pins: Choose how many Pin and Page combinations you want
Log Enteries: If Yes it will log anytime a pin is tested,
   If PIN is not listed it will tell Log an attempt was made,.
   if Pin Correct it will say which Page the user went too.

To Use:
Show UCI Pin on Plugin and link that to your UCI Viewer (either Page or UCI can be used)
In Plugin on the Pages Page Add your Lock Page (the page it will return to when logged out)
Then add the Pin number and it's corrasponding Page.
Adjust the Timeout on the left for the Timeout, timer starts when page is loaded. 0 is Disabled
