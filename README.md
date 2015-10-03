# cusspvz/openwrt

:minibus: Super small container (3MB) based on Routers OpenWRT Linux OS

## Usage

### Running a terminal
```bash
docker run --rm -ti cusspvz/openwrt:15.05-x86 /bin/bash
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

## Developing

### Building image
```bash
ARCH="x86" VERSION="15.05" make build
```
