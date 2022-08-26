FROM stable_diffusion:latest

ARG path_sd="/opt/stable_diffusion"
RUN git clone https://github.com/hlky/stable-diffusion-webui /tmp/stable_diffusion_webui && \
    mv /tmp/stable_diffusion_webui/* ${path_sd} && \
    rm -rf /tmp/stable_diffusion_webui
COPY ./environment.yaml /tmp/stable_diffusion_webui_environment.yaml
RUN conda env update -f /tmp/stable_diffusion_webui_environment.yaml && \
    rm -f /tmp/stable_diffusion_webui_environment.yaml
EXPOSE 7860
