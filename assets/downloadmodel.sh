#!/bin/bash

MODEL_NAMES=( mobilenet_v1_fp32_224 mobilenet_v1_int8_224_per_layer mobilenet_v1_int8_224_per_channel mobilenet_v2_int8_224_per_layer resnet50_fp32_224 resnet50_int8_224_per_layer shufflenet_v2_int8_224_per_layer)

for MODEL_NAME in ${MODEL_NAMES[@]}; do
    if [ ! -d "../assets/models/$MODEL_NAME" ];then
      MODEL_URL="http://paddlelite-demo.bj.bcebos.com/devices/generic/models/$MODEL_NAME.tar.gz"
      echo "Model $MODEL_NAME not found! Try to download it from $MODEL_URL ..."
      curl $MODEL_URL -o -| tar -xz -C ../assets/models
      if [[ $? -ne 0 ]]; then
        echo "Model $MODEL_NAME download failed!"
        exit 1
      fi
    fi
done
