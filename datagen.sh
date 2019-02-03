USR_DIR=./
PROBLEM=$1_problem
DATA_DIR=./work/$1
TMP_DIR=./work/tmp

t2t-datagen \
  --t2t_usr_dir=$USR_DIR \
  --data_dir=$DATA_DIR \
  --tmp_dir=$TMP_DIR \
  --problem=$PROBLEM

