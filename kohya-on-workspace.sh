#!/bin/bash

# Ensure we have /workspace in all scenarios
mkdir -p /workspace

if [[ ! -d /workspace/kohya_ss ]]; then
	# If we don't already have /workspace/kohya_ss, move it there
	echo "Copying kohya_ss to /workspace for persistence, this might take a while"
	mv /kohya_ss /workspace
else
	# otherwise delete the default kohya_ss folder which is always re-created on pod start from the Docker
	rm -rf /kohya_ss
fi

# Then link /kohya_ss folder to /workspace so it's available in that familiar location as well
ln -s /workspace/kohya_ss /kohya_ss