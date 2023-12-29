FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND noninteractive PIP_PREFER_BINARY=1
ENV NVIDIA_VISIBLE_DEVICES=all
ENV export LC_ALL=C

# Install necessary packages
RUN apt-get update && apt-get install -y git && apt-get clean
RUN apt install -y build-essential wget git python3 python3-pip libgl1 libglib2.0-0 vim python3-opencv libopencv-dev

ENV ROOT=/InvokeAI
RUN mkdir -p $ROOT

# Install Packages
RUN pip install xformers pypatchmatch huggingface-cli triton InvokeAI[xformers]

# Hack to fix some issues
RUN conda uninstall -y libtiff
RUN pip install Pillow==10.1.0
RUN rm -rf /opt/conda/lib/libffi.so.7
RUN rm -rf /opt/conda/lib/libffi.7.so

RUN invokeai-configure --yes --root_dir ${ROOT}/
RUN pip install torchvision
CMD invokeai-web --host 0.0.0.0 --port 7861 --root ${ROOT}