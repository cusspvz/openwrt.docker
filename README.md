# dianariyanto/openwrt-armvirt.docker

:minibus: Super small Docker container (3MB) based on Routers OpenWRT Linux OS for ARM x64/x86

## Usage

### Running bash terminal
```
dianariyanto@hg680p ~/Docker/openwrt-armvirt.docker> docker run --rm -ti dianariyanto/openwrt-armvirt:19.07.7-64
 === IMPORTANT ============================
  Use 'passwd' to set your login password
  this will disable telnet and enable SSH
 ------------------------------------------


BusyBox v1.30.1 () built-in shell (ash)

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 OpenWrt 19.07.7, r11306-c4a6851c72
 -----------------------------------------------------
root@23c9170005d3:/# ls
bin      dev      etc      lib      mnt      overlay  proc     rom      root     sbin     sys      tmp      usr      var      www
```

### Using as base image
```Dockerfile
FROM dianariyanto/openwrt-armvirt:19.07.7-64
RUN opkg install luci-app-mwan3 ...
```

## Versions

### x86
* **OpenWrt** 19.07.7 - `dianariyanto/openwrt-armvirt:19.07.7-32`

### x64
* **OpenWrt** 19.07.7 - `dianariyanto/openwrt-armvirt:19.07.7-64`

## Developing

### Building image
```bash
ARCH="64" VERSION="19.07.7" make build
```

## Original Script
https://github.com/cusspvz/openwrt-builder.docker
