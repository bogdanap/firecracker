IMG_ID=$(docker build .)
CONTAINER_ID=$(docker run -td $IMG_ID /bin/bash)

MOUNTDIR=mnt
FS=mycontainer.ext4

mkdir $MOUNTDIR
qemu-img create -f raw $FS 10G
mkfs.ext4 $FS
mount $FS $MOUNTDIR
docker cp $CONTAINER_ID:/ $MOUNTDIR
umount $MOUNTDIR