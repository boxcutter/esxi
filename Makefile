BOX_VERSION ?= 0.1.0
BOX_SUFFIX := -$(BOX_VERSION).box
TEMPLATE_FILENAMES := $(wildcard *.json)
BOX_NAMES := $(basename $(TEMPLATE_FILENAMES))
BOX_FILENAMES := $(TEMPLATE_FILENMES:.json=$(BOX_SUFFIX))
VMWARE_BOX_DIR ?= box/vmware
VMWARE_TEMPLATE_FILENAMES = $(TEMPLATE_FILENAMES)
VMWARE_BOX_FILENAMES := $(VMWARE_TEMPLATE_FILENAMES:.json=$(BOX_SUFFIX))
VMWARE_BOX_FILES := $(foreach box_filename, $(VMWARE_BOX_FILENAMES), $(VMWARE_BOX_DIR)/$(box_filename))
BOX_FILES := $(VMWARE_BOX_FILES)
.DEFAULT_GOAL := help

box/vmware/%$(BOX_SUFFIX): %.json
	packer build $<

.PHONY: build
build: $(BOX_FILES) ## Generate box files

.PHONY: clean
clean: ## Cleanup all temporary files used by build
	rm -rf packer_cache
	rm -rf box

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

#	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
