# Generating EDT-Offline image files

## Automatically

Whenever code is pushed to the `main` branch an action is triggered which builds a preloaded images for saves them as workflow artifacts.

Whenever a new tag is pushed a new release is created with the images as binaries of that release.

## Clonezilla

# Before cloning

1. Download a config file from Balena Cloud
1. On the machine you want to clone, create a backup of `/mnt/boot/config.json`
1. Substitute the old `config.json` with the one downloaded from the the Fleet page on Balena Cloud

# Cloning with Clonezilla

1. Download Clonezilla
1. Create Clonezilla USB
1. Clone a drive...

# Restoring from image

1. Make sure device is configured in the BIOs with "Securite boot" disabled
1. Insert Clonezilla USB on device
1. Restore image...