## Software stack

### Operating System

Meant to run on [Balena](https://balena.io), which runs easily composable service blocks on a performeant container-based operating system. Advantages:

- [Balena Hub](https://hub.balena.io/) has a growing number of out-of-the-box apps
- [Balena Cloud](https://balena-cloud.com/) is free as long as project is published and used from Balena Hub
- simple migration from existing docker/docker-compose stack
- lightweight container-based operating system
- support for various types of single-board-computers and architectures
- over-the-air-updates
- small self-updating images
- per-device release pinning
- bulk monitoring of all devices and their services
- remote access to all devices and services via web terminal
- ssh tunnel & remote support

### Service Stack

*ND*: needs to be developed

- **Wifi**: creates a WiFi Access-Point with a Captive-portal redirecting user to portal application (ND)
- **Browser**: exposes a kiosk browser pointed to portal application to output devices connected to hdmi
- **Portal**: application which onboards new users and links to content and services (ND)
- **F-Droid**: repository of apks to be used with offline app installer F-Droid
- **WebRecorder**: backup whole websites and wikis for offline viewing
- **Distributed File System**: automatically updates content if online through p2p sync (ND)
- **Usb-update:** update services (f-droid repo, crawls) with new content through a usb device, and display operations in GUI  (ND)
- **Usb-backup**: creates backup of all application state data, and display operations in GUI (ND)
- **Installers**: track and download latest installers for apps and expose them through a simple GUI (ND)
- **Pataka**: Ahau's distributed community storage server
- **Mapeo-ts-bridge**: provides an auto-connecting mapeo-server which saves data in Terrastories format (ND)
- **Pataka-ts-bridge**: creates a especial Tribe inside Ahau where all stories are exported in Terrastories format (ND)
- Terrastories
- Minio
