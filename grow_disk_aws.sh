#!/bin/bash -xv

# only for aws instances with xfs filesystem

growpart /dev/xvda 1
xfs_growfs /
lsblk
