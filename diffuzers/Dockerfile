FROM pytorch/pytorch:2.1.2-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND noninteractive PIP_PREFER_BINARY=1
ENV NVIDIA_VISIBLE_DEVICES=all
ENV export LC_ALL=C

# Install necessary packages
RUN apt-get update && apt-get install -y git && apt-get clean
RUN apt install -y build-essential wget git python3 python3-pip

ENV ROOT=/diffuzers
RUN mkdir -p $ROOT
RUN pip install diffuzers "altair<5"

# Install Packages
CMD diffuzers app --port 7862 --host 0.0.0.0 --device cuda:0
