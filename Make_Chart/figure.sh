#!/bin/bash -x


#PREDICTIONS_DIR=${1:-Result/}
#SAVE_DIR=${2:-EVAL_DIR}
#SAVE_ERROR_MAPS="TRUE"
#OVERWRITE="FALSE"
DATASET=${1:-DNA}
SAVE_FIGURE="${DATASET}/SAVE_FIGURE"
STATS="${DATASET}/EVAL_DIR/stats_per_im.csv"


python stats_all.py \
       --figure_save_path ${SAVE_FIGURE} \
       --stats ${STATS} \