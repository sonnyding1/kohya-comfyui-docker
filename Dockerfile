ARG CUDA_VERSION="11.8.0"
ARG CUDNN_VERSION="8"
ARG UBUNTU_VERSION="22.04"
ARG DOCKER_FROM=nvidia/cuda:$CUDA_VERSION-cudnn$CUDNN_VERSION-devel-ubuntu$UBUNTU_VERSION
ARG KOHYA_VERSION="v24.1.7"

# Base NVidia CUDA Ubuntu image
FROM $DOCKER_FROM AS base

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/New_York \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=on \
    SHELL=/bin/bash

# ================================
# Install required packages
# ================================

# Install Python plus openssh, which is our minimum set of required packages.
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-tk && \
    apt-get install -y --no-install-recommends openssh-server openssh-client git git-lfs wget vim zip unzip curl nvidia-utils-470 && \
    python3 -m pip install --upgrade pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install nginx
RUN apt-get update && \
    apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

ENV PATH="/usr/local/cuda/bin:${PATH}"

# Install Kohya_ss
RUN git clone https://github.com/bmaltais/kohya_ss.git && \
    cd kohya_ss && \
    git checkout ${KOHYA_VERSION} && \
    git submodule update --init --recursive && \
    pip3 install torch==2.1.2+cu118 torchvision==0.16.2+cu118 xformers==0.0.23.post1+cu118 --extra-index-url https://download.pytorch.org/whl/cu118 && \
    pip3 install bitsandbytes==0.43.0 tensorboard==2.15.2 tensorflow==2.15.0.post1 onnxruntime-gpu==1.17.1 && \
    pip3 install -r requirements.txt

# Install ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git && \
    cd ComfyUI && \
    pip3 install -r requirements.txt && \
    cd custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git

COPY --chmod=644 workflows/ /ComfyUI/user/default/workflows/
COPY --chmod=644 comfy.settings.json /ComfyUI/user/default/comfy.settings.json

# Install Jupyter Notebook
RUN pip3 install jupyterlab

# ================================
# Download ComfyUI extensions
# ================================



# ================================
# Finishing touch
# ================================

COPY --chmod=755 start.sh /start.sh
COPY --chmod=755 comfyui-on-workspace.sh /comfyui-on-workspace.sh
COPY --chmod=755 kohya-on-workspace.sh /kohya-on-workspace.sh
WORKDIR /workspace

# Exposed ports
# Kohya_ss
EXPOSE 3001
# ComfyUI
EXPOSE 8188
# Jupyter Notebook
EXPOSE 8888

# make the directory and download the model needed for the tutorial workflow on first launch
RUN mkdir -p /ComfyUI/models/checkpoints && \
    wget "https://huggingface.co/Comfy-Org/stable-diffusion-v1-5-archive/resolve/main/v1-5-pruned-emaonly-fp16.safetensors?download=true" -O /ComfyUI/models/checkpoints/v1-5-pruned-emaonly-fp16.safetensors

CMD [ "/start.sh" ]