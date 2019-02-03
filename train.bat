SET SP=C:\Users\it\Anaconda3\Lib\site-packages\tensor2tensor\bin
SET MODEL=transformer
SET HPARAMS=transformer_base_single_gpu
SET USR_DIR=.\
SET PROBLEM=%1_problem
SET DATA_DIR=.\work\%1
SET TMP_DIR=.\work\tmp
SET TRAIN_DIR=.\work\%PROBLEM%\%MODEL%-%HPARAMS%

python %SP%\t2t_trainer.py^
       --t2t_usr_dir=%USR_DIR%^
	   --data_dir=%DATA_DIR%^
	   --problem=%PROBLEM%^
	   --model=%MODEL%^
	   --hparams_set=%HPARAMS%^
	   --output_dir=%TRAIN_DIR%

