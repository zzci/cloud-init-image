# Scripts to generate the cloud-init image

This repository contains scripts that can be used to generate a cloud-init image for use on cloud platforms that support cloud-init. Cloud-init is a widely-used package that is used to configure and initialize cloud instances during startup. By using cloud-init, you can automate the configuration of your cloud instances and reduce the time and effort required to deploy your applications and services.

## Prerequisites

Before using the scripts in this repository, you will need to have the following prerequisites installed on your system:

- [genisoimage](https://www.gnu.org/software/genisoimage/): A tool for creating ISO images from files and directories.
- [cloud-init](https://cloudinit.readthedocs.io/en/latest/): A package that is used to configure cloud instances during startup.

## Usage

To use the scripts in this repository, follow these steps:

**Step 1. Get the scripts to your local system:**

``` sh
git clone https://github.com/zzci/cloud-init-image.git
```

**Step 2. Edit the Cloud-init Configuration Files.**

The `data` directory contains three configuration files that are used to configure the cloud-init image: `user-data`, `meta-data`, and `network-config`. You can edit these files to include your own cloud-init configuration.

For more information about the cloud-init configuration files, see the cloud-init documentation: https://cloudinit.readthedocs.io/en/latest/topics/examples.html

**Step 3. Run the `genisoimage.sh` or `mkdosfs-image.sh` or `build-with-docker.sh` script to generate the cloud-init image.**

The `genisoimage.sh` script uses the `genisoimage` tool to create an ISO image, while the `mkdosfs-image.sh` script uses the `mkdosfs` tool to create a FAT32 image. The `mkdosfs-image.sh` script is recommended for use on cloud platforms that do not support ISO images.

The docker `build-with-docker.sh` is based on the `alpine` image and contains the `genisoimage` and `cloud-init` packages. The `build-with-docker.sh` script uses the docker image to create a cloud-init image.

**Step 4. Wait for the script to complete.**

Once the script is finished, you should have a file named `cloud-init.iso` in the `dist` directory. This file can be used to create a new instance on your cloud platform.

## Customization

The scripts in this repository can be customized to meet your specific requirements. You can modify the `data` dir to include your own cloud-init configuration, and you can modify the `build-image.sh` script to customize the ISO image creation process.

## Contributing

If you would like to contribute to this repository, feel free to submit a pull request with your changes. We welcome contributions from the community and are always looking for ways to improve the scripts in this repository.

### License

This repository is licensed under the MIT License. See the `LICENSE` file for more information.
