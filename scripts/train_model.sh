#!/bin/bash -x

DATASET=${1:-dna}
N_ITER=1000
BUFFER_SIZE=30
BATCH_SIZE=1
RUN_DIR="saved_models/${DATASET}"
PATH_DATASET_ALL_CSV="data/csvs/${DATASET}.csv"
PATH_DATASET_TRAIN_CSV="data/csvs/${DATASET}/train.csv"
PATH_DATASET_VAL_CSV="data/csvs/${DATASET}/val.csv"
GPU_IDS=${2:-0}
CLASS=CziDataset #CziDataset
MODEL=KiUnet #fnet_nn_3d or KiUnet

python scripts/python/split_dataset.py ${PATH_DATASET_ALL_CSV} "data/csvs" --train_size 0.75 -v
python train_model.py \
       --n_iter ${N_ITER} \
       --path_dataset_csv ${PATH_DATASET_TRAIN_CSV} \
       --path_dataset_val_csv ${PATH_DATASET_VAL_CSV} \
       --buffer_size ${BUFFER_SIZE} \
       --buffer_switch_frequency 2000000 \
       --batch_size ${BATCH_SIZE} \
       --path_run_dir ${RUN_DIR} \
       --gpu_ids ${GPU_IDS} \
       --class_dataset ${CLASS}\
       --nn_module ${MODEL}\
