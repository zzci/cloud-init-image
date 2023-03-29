#!/bin/sh

# Check that the user-data, meta-data, and network-config files exist
if [[ ! -f data/user-data || ! -f data/meta-data || ! -f data/network-config ]]; then
    echo "ERROR: One or more of the required files (user-data, meta-data, or network-config) does not exist."
    exit 1
fi

# Validate the cloud-init configuration files using the cloud-init command
cloud-init schema --config-file data/user-data
if [[ $? -ne 0 ]]; then
    echo "ERROR: Failed to validate the user-data configuration."
    exit 1
fi

cloud-init schema --config-file data/meta-data
if [[ $? -ne 0 ]]; then
    echo "ERROR: Failed to validate the meta-data configuration."
    exit 1
fi

cloud-init schema --config-file data/network-config
if [[ $? -ne 0 ]]; then
    echo "ERROR: Failed to validate the network-config configuration."
    exit 1
fi

# Build the cloud-init ISO image using genisoimage
rm -f dist/cloud-init.iso
genisoimage \
   -output dist/cloud-init.iso \
   -input-charset utf-8 \
   -volid cidata \
   -joliet \
   -rock \
   data/user-data data/meta-data data/network-config

# Check if the ISO image was created successfully
if [[ ! -f dist/cloud-init.iso ]]; then
    echo "ERROR: Failed to create the cloud-init ISO image."
    exit 1
fi

echo "The cloud-init ISO image was created successfully and can be found in the dist/ directory."
exit 0
