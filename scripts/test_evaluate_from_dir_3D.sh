#!/bin/bash -x


PREDICTIONS_DIR=${1:-results/}
SAVE_DIR=${2:-saved_models/EVAL_DIR}
SAVE_ERROR_MAPS="TRUE"
OVERWRITE="FALSE"

python evaluate_model.py \
       --predictions_dir ${PREDICTIONS_DIR} \
       --path_save_dir ${SAVE_DIR} \
       --save_error_maps ${SAVE_ERROR_MAPS} \
       --overwrite ${OVERWRITE} \
