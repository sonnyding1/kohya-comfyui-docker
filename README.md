# ComfyUI + Kohya_ss Docker

## Overview

This repository contains the Dockerfile and necessary files to build a Docker image for running ComfyUI, Kohya_ss, and JupyterLab. The Docker image is designed to provide a convenient environment for using these tools on Runpod.io.

## Services and Ports

The Docker image includes the following services, each accessible on different ports:

- **Kohya_ss**: Accessible on port `3001`
- **ComfyUI**: Accessible on port `8188`
- **JupyterLab**: Accessible on port `8888`

Nginx is configured as a reverse proxy to route requests to the appropriate services based on the URL path.

## Exposed Ports

- **Nginx**: Port `8080` (routes to the services below)
  - **Kohya_ss**: `/kohya_ss/` -> `http://localhost:3001/`
  - **ComfyUI**: `/comfyui/` -> `http://localhost:8188/`
  - **JupyterLab**: `/jupyterlab/` -> `http://localhost:8888/`

## How to Build and Run

### Build the Docker Image

To build the Docker image, run the following command:

```sh
docker build -t yourusername/kohya-comfyui-docker:latest .
```

Replace `yourusername` with your Docker Hub username or any preferred tag.

### Run the Docker Container

To run the Docker container, use the following command:

```sh
docker run -d -p 8080:8080 -p 3001:3001 -p 8188:8188 -p 8888:8888 yourusername/kohya-comfyui-docker:latest
```

Replace `yourusername` with your Docker Hub username or the tag you used when building the image.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you encounter any problems, or have suggestions about apps/plugins to add.

## Acknowledgements

I would like to thank the following for their valuable work:

- [Valyrian Tech](https://github.com/ValyrianTech) for developing the [ComfyUI_with_Flux](https://github.com/ValyrianTech/ComfyUI_with_Flux) repository.
- [Ashley Kleynhans](https://github.com/ashleykleynhans) for developing the [kohya-docker](https://github.com/ashleykleynhans/kohya-docker) repository.
