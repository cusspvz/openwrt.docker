ALL_VERSIONS := 10.03 10.03.1 12.09 14.07 15.05
ALL_ARCHS := x86 x64
LATEST_VERSION := 15.05

VERSION ?= 15.05
ARCH ?= x86

TAG := $(VERSION)-$(ARCH)
ifeq ($(VERSION),latest)
	TAG := $(LATEST_VERSION)-$(ARCH)
endif

# VERSIONS
ifeq ($(TAG),15.05-x64)
	ROOTFS_URL := https://downloads.openwrt.org/chaos_calmer/15.05/x86/64/openwrt-15.05-x86-64-rootfs.tar.gz
endif
ifeq ($(TAG),15.05-x86)
	ROOTFS_URL := https://downloads.openwrt.org/chaos_calmer/15.05/x86/generic/openwrt-15.05-x86-generic-Generic-rootfs.tar.gz
endif
ifeq ($(TAG),14.07-x86)
	ROOTFS_URL := https://downloads.openwrt.org/barrier_breaker/14.07/x86/generic/openwrt-x86-generic-Generic-rootfs.tar.gz
endif
ifeq ($(TAG),12.09-x86)
	ROOTFS_URL := https://downloads.openwrt.org/attitude_adjustment/12.09/x86/generic/openwrt-x86-generic-rootfs.tar.gz
endif
ifeq ($(TAG),10.03.1-x86)
	ROOTFS_URL := https://downloads.openwrt.org/backfire/10.03.1/x86_generic/openwrt-x86-generic-rootfs.tar.gz
endif
ifeq ($(TAG),10.03-x86)
	ROOTFS_URL := https://downloads.openwrt.org/backfire/10.03/x86/openwrt-x86-rootfs.tgz
endif

ifeq ($(VERSION),latest)
	VERSION := $(LATEST_VERSION)
	TAG := latest-$(ARCH)
endif

run: build
	@docker run --rm -ti cusspvz/openwrt:${TAG}

run-bash: build
	@docker run --rm -ti cusspvz/openwrt:${TAG} /bin/bash

pull-root:
	@if [ "${ROOTFS_URL}" == "" ]; then echo "No ROOTFS available"; exit 1; fi
	@docker images | grep openwrt-${TAG} || docker import ${ROOTFS_URL} openwrt-${TAG}

pull-root-forced:
	@if [ "${ROOTFS_URL}" == "" ]; then echo "No ROOTFS available"; exit 1; fi
	@echo "Pulling $(TAG)"
	docker import ${ROOTFS_URL} openwrt-${TAG}

build: pull-root
	@echo "Building ${TAG}"
	@echo FROM openwrt-${TAG} > Dockerfile.tmp
	@cat Dockerfile >> Dockerfile.tmp
	@-docker build -t cusspvz/openwrt:${TAG} -f Dockerfile.tmp .
	@rm Dockerfile.tmp

push: pull-root build
	@docker push cusspvz/openwrt:${TAG}

build-all:
	for ARCH in ${ALL_ARCHS}; do \
		for VERSION in ${ALL_VERSIONS}; do \
			make build; \
		done; \
		make VERSION="latest" build; \
	done;

push-all:
	for ARCH in ${ALL_ARCHS}; do \
		for VERSION in ${ALL_VERSIONS}; do \
			make push; \
		done; \
		make VERSION="latest" push; \
	done;
