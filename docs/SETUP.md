## Getting started

We'll need Internet connection for downloading latest software and content. But after initial setup, device can exist and be updated offline.

*Needed hardware:*

- **Machine**: can be any computer, even a single-board computer (has to be 64bits)
- **Storage**: class 10 micro sd with min 64Gb or SSD connected thru usb
- **Wifi Dongle**: if the computer doesn't have wifi or you're using SSD && access-point with a Raspberry Pi, a Wifi dongle compatible with your device is needed

**Self setup**

1. Click "[Deploy with Balena](https://www.balena.io/docs/learn/deploy/deploy-with-balena-button/)" button
2. Create free Balena account
3. Set community environmental variables (wifi acess point name, wifi password, device name on network, community name, language, content repository address, pataka invite code, mapeo-config link, map-tiles links)

**Supported setup**

1. Signup for [EDT forum](https://forum.earthdefenderstoolkit.com/) or join Telegram Group or join Whatsapp group
2. Provide requested information: community name and location; available connectivity; number of intented users; intended uses (monitoring, mapping, storytelling, etc.);
3. Team will provide a pre-configured image

**Setting up a device using **

1. Download project image
2. Burn image to micro sd or usb SSD
3. Plug storage into computer
4. Plug computer to power supply
5. Connect to the Internet (ethernet cable or wifi connection)
6. Check Balena dashboard if device is online
7. Wait for device to update it's software on Balena dashboard
8. Update environment variables: language; syncthing repositories; wifi SSID and password; ssb pub name, room and pub;
9. Wait for device to sync it's content through distributed file system: Map tiles; Mapeo config;  [Website](https://youzim.it/) (zim files); [F-Droid repository](https://f-droid.org/en/docs/Setup_an_F-Droid_App_Repo/); Desktop Installers;
10. Your device is ready to go offline!
