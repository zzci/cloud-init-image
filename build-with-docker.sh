#!/bin/sh

# This script is used to build the cloud-init image for the VMs.

docker build -t cloud-init-image-builder .
docker run --rm -v $(pwd):/work -ti cloud-init-image-builder /bin/sh -c "cd /work && ./genisoimage.sh && ./mkdosfs-image.sh"