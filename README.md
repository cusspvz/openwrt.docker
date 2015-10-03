# cusspvz/openwrt

:minibus: Super small container based on Routers OpenWRT Linux OS

## Usage

### Running a terminal
```
docker run --rm -ti cusspvz/openwrt:VERSION
bash #
```

### Using as base image
```
FROM cusspvz/openwrt:VERSION
RUN opkg install nano git ...
...
```

## Versions

### x86
* 15.04 - `cusspvz/openwrt:15.04-x86`

## Developing

### Building image
```bash
ARCH=x86 VERSION=15.04 make build
```
