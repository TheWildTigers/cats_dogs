#!/bin/bash

set -e 

EXAMPLE=~/CatProject/data/train
DATA=~/CatProject/data/train/jpg/
TOOLS=/soft/caffe/rc3_20160425_cuda7.0/bin/

TRAIN_DATA_ROOT=~/CatProject/data/train/jpg/train/
#VAL_DATA_ROOT=/path/to/imagenet/val/

RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/trainList.txt \
    $EXAMPLE/train_lmdb
