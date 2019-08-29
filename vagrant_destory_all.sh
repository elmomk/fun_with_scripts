#!/bin/bash -xe

IDS=$(vagrant global-status | grep virtualbox | cut -d " " -f 1)

for ID in $IDS; do
	echo $ID
	vagrant destroy $ID -f
	vagrant global-status --prune
done

vagrant global-status
