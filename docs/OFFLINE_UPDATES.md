## Offline updates

### **Content update**

- **Using other device**
    - *Needed:* Computer or phone with distributed repository installed
    1. While online update distributed repository on computer A
    2. While offline connect computer A to computer B's Wifi access-point
    3. Wait for syncing of content repository
    4. Follow progress at: [http://sync.edt.local](https://www.notion.so/4-http-sync-edt-local-5-66d62b34326847859812eccdd5918ed7)
    5. Your device has latest content repository!
- **Using usb storage**
    
    *Needed hardware:*
    
    - Content update storage: a usb device with at least xxxGb
    1. While online download latest content repository image
    2. Burn image to usb storage (xxxGb ) (zim files, f-droid repository, installers, web portal, map-tiles)
    3. At offline site connect usb device to computer
    4. Wait for content update through GUI
    5. After update is finished unplug usb device
    6. Your device has latest content repository!

### **Software update**

- Using usb
    
    *Needed hardware:*
    
    - Data backup storage: a usb device with at least the same storage as the computer's
    - Software update storage: a usb device with at least 8Gb used to burn software updates for offline updates
    1. Configure pre-loaded image with device's settings
    2. Download configured latest software stack image
    3. Burn image to usb device
    4. Make sure you have an extra storage device for backing up data, or all data will be lost
    5. At offline site connect usb backup storage device to computer
    6. Wait for data backup through GUI
    7. After backup is finished unplug usb device
    8. Plug usb device with latest software
    9. Wait for access point to drop and come back on again
    10. Check portal for information on service versions
    11. Plug backup storage in the computer again
    12. Wait for data import through GUI
    13. Unplug backup device
    14. Your device has all it's software up-to-date!
- Connecting device to Internet using WiFi
    1. Unplug EDDT from power supply
    2. If there are no WiFi access points with Internet access EDDT needs to be phisically transported where one is available 
- Connecting device to Internet using Ethernet cable
    1. Unplug EDDT from power supply
    2. If there is no Internet access EDDT needs to be phisically transported where a router with Ethernet port is accessible
    3. Use an Ethernet cable to connect EDDT to one of the router's Lan ports
    4. Software update should start automatically and can be followed on the [Balena dashboard](https://dashboard.balena-cloud.com/) 
    5. Navigate to [http://sync.edt.local](http://sync.edt.local) and 
