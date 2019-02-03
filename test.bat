SET SP=C:\Users\it\Anaconda3\Lib\site-packages\tensor2tensor\bin
SET MODEL=transformer
SET HPARAMS=transformer_base
SET USR_DIR=.\
SET PROBLEM=amirkabir_problem
SET DATA_DIR=.\work
SET TMP_DIR=.\work\tmp
SET TRAIN_DIR=.\work\%PROBLEM%\%MODEL%-%HPARAMS%
SET DECODE_FILE=%DATA_DIR%\targoman_test.en

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

python %SP%\t2t-bleu.py --translation=.\work\hypo100k.fa --reference=.\work\targoman_test.fa
