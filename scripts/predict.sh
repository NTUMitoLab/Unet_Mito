#!/bin/bash -x

DATASET=${1:-Timeseries_confocal_HR_DNA}
MODEL_DIR=saved_models/${DATASET}
N_IMAGES=${3:-16}
GPU_IDS=${2:-0}
#CLASS=TiffDataset

for TEST_OR_TRAIN in test train
do
    python predict.py \
	   --path_model_dir ${MODEL_DIR} \
	   --path_dataset_csv data/csvs/${DATASET}/${TEST_OR_TRAIN}.csv \
	   --n_images ${N_IMAGES} \
	   --no_prediction_unpropped \
	   --path_save_dir results/${DATASET}/${TEST_OR_TRAIN} \
	   --gpu_ids ${GPU_IDS}\
	   #--class_dataset ${CLASS}\
	   
done

