FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND noninteractive PIP_PREFER_BINARY=1
ENV NVIDIA_VISIBLE_DEVICES=all

# Install necessary packages
RUN apt-get update && apt-get install -y git && apt-get clean
RUN apt install -y build-essential wget git python3 python3-pip libgl1 libglib2.0-0 vim 

ENV ROOT=/comfyui
RUN git clone https://github.com/comfyanonymous/ComfyUI ${ROOT}/ComfyUI

# Xformers
RUN pip install xformers huggingface-cli
RUN pip install -r ${ROOT}/ComfyUI/requirements.txt

# ADD extra_model_paths.yaml ${ROOT}/ComfyUI/
ADD download_models.sh ${ROOT}
RUN bash ${ROOT}/download_models.sh
CMD python3 ${ROOT}/ComfyUI/main.py --listen --port 7860
