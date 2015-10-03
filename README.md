# cusspvz/openwrt

:minibus: Super small container (4MB) based on Routers OpenWRT Linux OS

## Usage

### Running a terminal
```bash
docker run --rm -ti cusspvz/openwrt:VERSION /bin/bash
```

### Using as base image
```Dockerfile
FROM cusspvz/openwrt:VERSION
RUN opkg install nano git ...
```

## Versions

### x86
* 15.05 - `cusspvz/openwrt:15.05-x86`

## Developing

### Building image
```bash
ARCH="x86" VERSION="15.05" make build
```
