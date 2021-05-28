# Packer templates for the VMware ESXi bare-metal hypervisor written in legacy JSON

### Overview

This repository contains [Packer](https://packer.io/) templates for creating
VMware ESXi Vagrant boxes written in legacy JSON.

## Building the Vagrant boxes with Packer

To build all the boxes, you will need 
[VMware Fusion](https://www.vmware.com/products/fusion)/[VMware Workstation](https://www.vmware.com/products/workstation).

First, you'll need to downloadthe ESXi install media from the
[VMware vSphere Hypervisor (ESXi) Download Page](https://my.vmware.com/web/vmware/evalcenter?p=free-esxi6).

VMware provides a free license with the following limitations:

* No support
* Free ESXi cannot be added to a vCenter Server
* 2 physical CPUs
* Maximum 8 vCPUs per VM

Promiscuous mode is required for the ESXi virtual machines to the child virtual
machines running on it. To disable VMware Fusion prompting for the admin
password every time the box is created, run the following command to create
the files `promiscAuthorized`:

```
sudo touch "/Library/Preferences/VMware Fusion/promiscAuthorized"
```

To build ESXi 6.5, use the following:

    $ packer build esxi.json

# Building the Vagrant boxes with the Makefile

A GNU Make `Makefile` drives a complete basebox creation pipeline with the
following stages:

* `build` - Create basebox `*.box` files

The pipeline is driven via the following targets, making it easy for you to
include them in your favourite CI tool:

    make build   # Build all available box types

### Acknowledgments

Thanks to Fabio Rapposelli for providing a great starting point for
a [ESXi packer template](https://github.com/frapposelli/esxi-packer-templates).
