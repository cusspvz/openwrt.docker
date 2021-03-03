ALL_VERSIONS := 19.07.5 19.07.7
ALL_ARCHS := 32 64
LATEST_VERSION := 19.07.7

VERSION ?= 19.07.5
TARGET ?= armvirt
ARCH ?= 64

TAG := $(VERSION)-$(ARCH)
ifeq ($(VERSION),latest)
	TAG := $(LATEST_VERSION)-$(ARCH)
endif

# VERSIONS
ifeq ($(TAG),$(VERSION)-$(ARCH))
	ROOTFS_URL := https://downloads.openwrt.org/releases/$(VERSION)/targets/$(TARGET)/$(ARCH)/openwrt-$(VERSION)-$(TARGET)-$(ARCH)-default-rootfs.tar.gz
	# ROOTFS_URL := https://downloads.openwrt.org/releases/19.07.7/targets/armvirt/64/openwrt-19.07.7-armvirt-64-default-rootfs.tar.gz
endif

ifeq ($(VERSION),latest)
	VERSION := $(LATEST_VERSION)
	TAG := latest-$(ARCH)
endif

run: build
	@docker run --rm -ti dianariyanto/openwrt-armvirt:${TAG}

run-bash: build
	@docker run --rm -ti dianariyanto/openwrt-armvirt:${TAG} /bin/bash

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
	@-docker build -t dianariyanto/openwrt-armvirt:${TAG} -f Dockerfile.tmp .
	@rm Dockerfile.tmp

push: pull-root build
	@docker push dianariyanto/openwrt-armvirt:${TAG}

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
