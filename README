# Stable Diffusion Cotainer

## Requirement

* Docker (docker-ce)
* NVIDIA Container Toolkit (nvidia-docker2)

## How to build

1. Register a user for [HuggingFace](https://huggingface.co/).
2. Open [git-credentials](git-credentials).
3. Edit git-credentials.
   Replace `YOUR_MAIL_USER%40YOUR_MAIL_DOMAIN.com` to your registered address for HuggingFace, and `YOUR_PASSWORD` to your registered password.

        https://YOUR_MAIL_USER%40YOUR_MAIL_DOMAIN.com:YOUR_PASSWORD@huggingface.co

4. Build a image.

        DOCKER_BUILDKIT=1 docker build --secret id=git-credentials,src=git-credentials -t stable_diffusion:latest .

## How to use

    docker run --rm --gpus all -v stable_diffusion_cache:/root/.cache -v $(pwd):/tmp/out -it stable_diffusion:latest python optimizedSD/optimized_txt2img.py --prompt "Top of the world" --H 512 --W 512 --ddim_steps 50 --outdir /tmp/out

Files are output to the current directory.
