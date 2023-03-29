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

# Create the cloud-init image using mkdosfs
rm -f dist/cloud-init.img
mkdosfs -n CIDATA -C dist/cloud-init.img 128

# Copy the user-data, meta-data, and network-config files to the cloud-init image
mcopy -oi dist/cloud-init.img -s data/user-data ::
mcopy -oi dist/cloud-init.img -s data/meta-data ::
mcopy -oi dist/cloud-init.img -s data/network-config ::

# Check if the image was created successfully
if [[ ! -f dist/cloud-init.img ]]; then
    echo "ERROR: Failed to create the cloud-init image."
    exit 1
fi

echo "The cloud-init image was created successfully and can be found in the dist/ directory."
exit 0
