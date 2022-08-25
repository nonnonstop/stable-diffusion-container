FROM continuumio/miniconda3:4.12.0 AS conda

FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

COPY --from=conda /opt/conda /opt/conda
ENV PATH /opt/conda/bin:$PATH
RUN apt-get update && \
    apt-get install -y git git-lfs && \
    rm -rf /var/lib/apt/lists/* \
    git lfs install && \
    conda init bash

ARG repo_sd="https://github.com/basujindal/stable-diffusion"
ARG repo_sdorg="https://huggingface.co/CompVis/stable-diffusion-v-1-4-original"
ARG path_sd="/opt/stable_diffusion"
RUN --mount=type=secret,id=git-credentials \
    git config --global credential.helper "store --file /run/secrets/git-credentials" && \
    git clone ${repo_sd} ${path_sd} && \
    git clone ${repo_sdorg} ${path_sd}/models/ldm/stable-diffusion-v1 && \
    mv ${path_sd}/models/ldm/stable-diffusion-v1/*.ckpt ${path_sd}/models/ldm/stable-diffusion-v1/model.ckpt && \
    git config --global credential.helper "" && \
    cd ${path_sd} && \
    conda env create -f environment.yaml
WORKDIR ${path_sd}
ENV NVIDIA_DISABLE_REQUIRE 1
ENTRYPOINT ["conda", "run", "-n", "ldm", "--no-capture-output"]
