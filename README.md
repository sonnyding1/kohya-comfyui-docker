# ComfyUI + Kohya_ss Docker

[![Link to Runpod](https://img.shields.io/badge/Runpod.io-gray?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDI2LjUuMywgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IgoJIHZpZXdCb3g9IjAgMCAyMDAwIDIwMDAiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIwMDAgMjAwMDsiIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJLnN0MHtmaWxsOiM2NzNBQjc7fQo8L3N0eWxlPgo8Zz4KCTxnPgoJCTxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0xMDE3Ljk1LDcxMS4wNGMtNC4yMiwyLjM2LTkuMTgsMy4wMS0xMy44NiwxLjgyTDM4Ni4xNyw1NTUuM2MtNDEuNzItMTAuNzYtODYuMDItMC42My0xMTYuNiwyOS43MwoJCQlsLTEuNCwxLjM5Yy0zNS45MiwzNS42NS0yNy41NSw5NS44LDE2Ljc0LDEyMC4zbDU4NC4zMiwzMjQuMjNjMzEuMzYsMTcuNCw1MC44Miw1MC40NSw1MC44Miw4Ni4zMnY4MDYuNzYKCQkJYzAsMzUuNDktMzguNDEsNTcuNjctNjkuMTUsMzkuOTRsLTcwMy4xNS00MDUuNjRjLTIzLjYtMTMuNjEtMzguMTMtMzguNzgtMzguMTMtNjYuMDJWNjY2LjYzYzAtODcuMjQsNDYuNDUtMTY3Ljg5LDEyMS45Mi0yMTEuNjYKCQkJTDkzMy44NSw0Mi4xNWMyMy40OC0xMy44LDUxLjQ3LTE3LjcsNzcuODMtMTAuODRsNzQ1LjcxLDE5NC4xYzMxLjUzLDguMjEsMzYuOTksNTAuNjUsOC41Niw2Ni41N0wxMDE3Ljk1LDcxMS4wNHoiLz4KCQk8cGF0aCBjbGFzcz0ic3QwIiBkPSJNMTUyNy43NSw1MzYuMzhsMTI4Ljg5LTc5LjYzbDE4OS45MiwxMDkuMTdjMjcuMjQsMTUuNjYsNDMuOTcsNDQuNzMsNDMuODIsNzYuMTVsLTQsODU3LjYKCQkJYy0wLjExLDI0LjM5LTEzLjE1LDQ2Ljg5LTM0LjI1LDU5LjExbC03MDEuNzUsNDA2LjYxYy0zMi4zLDE4LjcxLTcyLjc0LTQuNTktNzIuNzQtNDEuOTJ2LTc5Ny40MwoJCQljMC0zOC45OCwyMS4wNi03NC45MSw1NS4wNy05My45Nmw1OTAuMTctMzMwLjUzYzE4LjIzLTEwLjIxLDE4LjY1LTM2LjMsMC43NS00Ny4wOUwxNTI3Ljc1LDUzNi4zOHoiLz4KCQk8cGF0aCBjbGFzcz0ic3QwIiBkPSJNMTUyNC4wMSw2NjUuOTEiLz4KCTwvZz4KPC9nPgo8L3N2Zz4K&logoColor=%23ffffff&link=https%3A%2F%2Fwww.runpod.io%2Fconsole%2Fexplore%2F298ifnsd50)](https://www.runpod.io/console/explore/298ifnsd50)
[![Link to GitHub](https://img.shields.io/badge/GitHub-gray?logo=github)](https://github.com/sonnyding1/kohya-comfyui-docker)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/jhlywa/chess.js/node.js.yml)](https://github.com/sonnyding1/kohya-comfyui-docker/actions)
[![Link to Docker](https://img.shields.io/badge/Docker-gray?logo=docker)](https://github.com/sonnyding1/kohya-comfyui-docker)
![Docker Pulls](https://img.shields.io/docker/pulls/sonnyding20/kohya-comfyui-docker?logo=docker)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/sonnyding20/kohya-comfyui-docker/latest)

## Overview

This repository contains the Dockerfile and necessary files to build a Docker image for running ComfyUI, Kohya_ss, and JupyterLab. The Docker image is designed to provide a convenient environment for using these tools on Runpod.io.

## Services and Ports

The Docker image includes the following services, each accessible on different ports:

- **Kohya_ss**: Accessible on port `3001`
- **Tensorboard**: Accessible on port `6006`
- **ComfyUI**: Accessible on port `8188`
- **JupyterLab**: Accessible on port `8888`

Nginx is configured as a reverse proxy to route requests to the appropriate services based on the URL path, listening at port 8080.

## Usage

You can use JupyterLab to upload the images for training on Kohya_ss, and download the weights. You can also open terminals inside JupyterLab to run commands if needed.

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
docker run -d --gpus all -p 8080:8080 -p 3001:3001 -p 6006:6006 -p 8188:8188 -p 8888:8888 yourusername/kohya-comfyui-docker:latest
```

Replace `yourusername` with your Docker Hub username or the tag you used when building the image.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you encounter any problems, or have suggestions about apps/plugins to add.

## Acknowledgements

I would like to thank the following for their valuable work:

- [Valyrian Tech](https://github.com/ValyrianTech) for developing the [ComfyUI_with_Flux](https://github.com/ValyrianTech/ComfyUI_with_Flux) repository.
- [Ashley Kleynhans](https://github.com/ashleykleynhans) for developing the [kohya-docker](https://github.com/ashleykleynhans/kohya-docker) repository.
