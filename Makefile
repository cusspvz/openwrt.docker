VERSION := 15.05
ARCH := x86
ROOT_URL := https://downloads.openwrt.org/chaos_calmer/${VERSION}/${ARCH}/generic/openwrt-${VERSION}-${ARCH}-generic-Generic-rootfs.tar.gz

build:
	@docker images | grep openwrt-${VERSION}-${ARCH} || docker import ${ROOT_URL} openwrt-${VERSION}-${ARCH}
	@echo FROM openwrt-${VERSION}-${ARCH} > Dockerfile.tmp
	@cat Dockerfile >> Dockerfile.tmp
	@docker build -t cusspvz/openwrt:${VERSION}-${ARCH} -f Dockerfile.tmp .

push: build
	@docker push cusspvz/openwrt:${VERSION}-${ARCH}
