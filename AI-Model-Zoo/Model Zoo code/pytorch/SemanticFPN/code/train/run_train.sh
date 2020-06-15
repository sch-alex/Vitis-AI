# Copyright 2019 Xilinx Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


export PYTHONPATH=${PWD}:${PYTHONPATH}

GPU_ID=0
echo "====> perform SemanticFPN(ResNet18) with input_size = 256x512..."
CUDA_VISIBLE_DEVICES=${GPU_ID} python code/train/train.py --lr 1e-4 --dataset citys --model fpn --backbone resnet18 --crop-size 512 --data-folder ${DATASET} --weight ${WEIGHTS}/fpn_res18/final_best.pth.tar  

echo "====> perform SemanticFPN(MobileNetv2) with input_size = 256x512 and 512x1024..."
CUDA_VISIBLE_DEVICES=${GPU_ID} python code/train/train.py --lr 1e-4 --dataset citys --model fpn --backbone mobilenetv2 --crop-size 512 --data-folder ${DATASET} --weight ${WEIGHTS}/fpn_mbv2/final_best_256x512.pth.tar

CUDA_VISIBLE_DEVICES=${GPU_ID} python code/train/train.py --lr 1e-4 --dataset citys --model fpn --backbone mobilenetv2 --crop-size 1024 --data-folder ${DATASET} --weight ${WEIGHTS}/fpn_mbv2/final_best_512x1024.pth.tar
