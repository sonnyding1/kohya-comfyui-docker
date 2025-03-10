#!/bin/bash

echo "pod started"

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi

# Move text-generation-webui's folder to $VOLUME so models and all config will persist
/comfyui-on-workspace.sh
/kohya-on-workspace.sh

# Soft link python3 to python
ln -s /usr/bin/python3 /usr/bin/python

#!/bin/bash
if [[ -z "${HF_TOKEN}" ]] || [[ "${HF_TOKEN}" == "enter_your_huggingface_token_here" ]]
then
    echo "HF_TOKEN is not set"
else
    echo "HF_TOKEN is set, logging in..."
    huggingface-cli login --token ${HF_TOKEN}
fi

# Start nginx as reverse proxy to enable api access
service nginx start

# Check if there is a venv directory, if so, activate it
if [ -d "/venv" ]; then
    echo "venv directory found, activating it"
    source /venv/bin/activate
fi

# Start JupyterLab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.allow_origin='*' &
echo "JupyterLab started"

# Start Kohya_ss
/workspace/kohya_ss/gui.sh --listen 0.0.0.0 --server_port 3001 --headless &
echo "Kohya_ss started"

# Start ComfyUI
if command -v nvidia-smi &> /dev/null && nvidia-smi -L &> /dev/null
then
    echo "GPU detected. Starting ComfyUI with GPU support."
    python3 /workspace/ComfyUI/main.py --listen
else
    echo "No GPU detected. Starting ComfyUI with CPU support."
    python3 /workspace/ComfyUI/main.py --cpu --listen
fi

sleep infinity