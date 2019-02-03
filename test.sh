export CUDA_VISIBLE_DEVICES=1
MODEL=transformer
HPARAMS=transformer_base
USR_DIR=./

PROBLEM=$1_problem
DATA_DIR=./work/$1
TMP_DIR=./work/tmp
TRAIN_DIR=./work/$PROBLEM/$MODEL-$HPARAMS
DECODE_FILE=$DATA_DIR/$1_test.en

BEAM_SIZE=4
ALPHA=0.6

t2t-decoder \
  --t2t_usr_dir=$USR_DIR \
  --data_dir=$DATA_DIR \
  --problem=$PROBLEM \
  --model=$MODEL \
  --hparams_set=$HPARAMS \
  --output_dir=$TRAIN_DIR \
  --decode_hparams="beam_size=$BEAM_SIZE,alpha=$ALPHA" \
  --decode_from_file=$DECODE_FILE \
  --decode_to_file=$DATA_DIR/$1_hypo10k.fa

t2t-bleu --translation=$DATA_DIR/$1_hypo10k.fa --reference=$DATA_DIR/$1_test.fa
