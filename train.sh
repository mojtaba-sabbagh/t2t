MODEL=transformer
HPARAMS=transformer_base
USR_DIR=./
PROBLEM=$1_problem
DATA_DIR=./work/$1
TMP_DIR=./work/tmp
TRAIN_DIR=./work/$PROBLEM/$MODEL-$HPARAMS

t2t-trainer \
  --t2t_usr_dir=$USR_DIR \
  --data_dir=$DATA_DIR \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=$TRAIN_DIR &

