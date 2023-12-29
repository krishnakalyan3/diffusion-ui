#!/usr/bin bash

rm -rf /comfyui/ComfyUI/models/checkpoints/put_checkpoints_here
huggingface-cli login --token "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"
huggingface-cli download runwayml/stable-diffusion-v1-5 v1-5-pruned-emaonly.ckpt --local-dir /comfyui/ComfyUI/models/checkpoints
huggingface-cli download stabilityai/stable-video-diffusion-img2vid-xt svd_xt.safetensors --local-dir /comfyui/ComfyUI/models/checkpoints
