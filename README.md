# cusspvz/openwrt

:minibus: Super small container (3MB) based on Routers OpenWRT Linux OS

## Usage

### Running bash terminal
```
josemoreira@MacBook-Pro-de-JM ~/G/c/openwrt.docker> docker run --rm -ti cusspvz/openwrt:15.05-x86
 === IMPORTANT ============================
  Use 'passwd' to set your login password
  this will disable telnet and enable SSH
 ------------------------------------------


BusyBox v1.23.2 (2015-07-25 07:32:21 CEST) built-in shell (ash)

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 CHAOS CALMER (15.05, r46767)
 -----------------------------------------------------
  * 1 1/2 oz Gin            Shake with a glassful
  * 1/4 oz Triple Sec       of broken ice and pour
  * 3/4 oz Lime Juice       unstrained into a goblet.
  * 1 1/2 oz Orange Juice
  * 1 tsp. Grenadine Syrup
 -----------------------------------------------------
root@23c9170005d3:/# ls
bin      dev      etc      lib      mnt      overlay  proc     rom      root     sbin     sys      tmp      usr      var      www
```

### Using as base image
```Dockerfile
FROM cusspvz/openwrt:15.05-x86
RUN opkg install nano git ...
```

## Versions

### x86
* **Chaos Calmer** 15.05 - `cusspvz/openwrt:15.05-x86`
* **Barrier Breaker** 14.07 - `cusspvz/openwrt:14.07-x86`
* **Attitude Adjustment** 12.09 - `cusspvz/openwrt:12.09-x86`
* **Backfire** 10.03.1 - `cusspvz/openwrt:10.03.1-x86`
* **Backfire** 10.03 - `cusspvz/openwrt:10.03-x86`

### x64
* **Chaos Calmer** 15.05 - `cusspvz/openwrt:15.05-x64`

## Developing

### Building image
```bash
ARCH="x86" VERSION="15.05" make build
```
