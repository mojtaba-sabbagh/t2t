SET SP=C:\Users\it\Anaconda3\Lib\site-packages\tensor2tensor\bin
SET MODEL=transformer
SET HPARAMS=transformer_base_single_gpu
SET USR_DIR=.\
SET PROBLEM=%1_problem
SET DATA_DIR=.\work\%1
SET TMP_DIR=.\work\tmp
SET TRAIN_DIR=.\work\%PROBLEM%\%MODEL%-%HPARAMS%
SET DECODE_FILE=%DATA_DIR%\%1_test.en

SET BEAM_SIZE=4
SET ALPHA=0.6

python %SP%\t2t_decoder.py^
  --t2t_usr_dir=%USR_DIR%^
  --data_dir=%DATA_DIR%^
  --problem=%PROBLEM%^
  --model=%MODEL%^
  --hparams_set=%HPARAMS%^
  --output_dir=%TRAIN_DIR%^
  --decode_hparams="beam_size=%BEAM_SIZE%,alpha=%ALPHA%"^
  --decode_from_file=%DECODE_FILE%^
  --decode_to_file=%DATA_DIR%\hypo10k.fa

python %SP%\t2t_bleu.py --translation=%DATA_DIR%\hypo10k.fa --reference=%DATA_DIR%\%1_test.fa
