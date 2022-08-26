# Stable Diffusion Cotainer

## Requirement

* Docker (docker-ce)
* NVIDIA Container Toolkit (nvidia-docker2)

Tested on Ubuntu 22.04 on WSL2.

## CLI version

### How to build

1. Register a user for [HuggingFace](https://huggingface.co/).
2. Open [git-credentials](git-credentials).
3. Edit git-credentials.
   Replace `YOUR_MAIL_USER%40YOUR_MAIL_DOMAIN.com` to your registered address for HuggingFace, and `YOUR_PASSWORD` to your registered password.

        https://YOUR_MAIL_USER%40YOUR_MAIL_DOMAIN.com:YOUR_PASSWORD@huggingface.co

4. Build a image.

        DOCKER_BUILDKIT=1 docker build --secret id=git-credentials,src=git-credentials -t stable_diffusion:latest .

### How to use

    docker run --rm --gpus all -v stable_diffusion_cache:/root/.cache -v $(pwd):/tmp/out -it stable_diffusion:latest python optimizedSD/optimized_txt2img.py --prompt "Top of the world" --H 512 --W 512 --ddim_steps 50 --outdir /tmp/out

Files are output to the current directory.

## Web UI version

### How to build

1. Build a image of [CLI version](#cli-version).
2. Build a image.

        docker build -t stable_diffusion_webui:latest webui/

### How to use

    docker run --rm --gpus all -v stable_diffusion_cache:/root/.cache -p 7860:7860 -it stable_diffusion_webui:latest python webui.py
