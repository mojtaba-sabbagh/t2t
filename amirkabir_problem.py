#import re

from tensor2tensor.data_generators import problem
from tensor2tensor.data_generators import text_problems
from tensor2tensor.utils import registry
import os

TRAIN_SRC = "targoman.en"
TRAIN_TRG = "targoman.fa"

@registry.register_problem
class AmirkabirProblem(text_problems.Text2TextProblem):
  """Translate En 2 Fa by Amirkabir corpus"""

  @property
  def approx_vocab_size(self):
    return 2**13  # ~8k

  @property
  def is_generate_per_split(self):
    # generate_data will shard the data into TRAIN and EVAL for us.
    return False

  @property
  def dataset_splits(self):
    """Splits of data to produce and number of output shards for each."""
    # 10% evaluation data
    return [{
        "split": problem.DatasetSplit.TRAIN,
        "shards": 9,
    }, {
        "split": problem.DatasetSplit.EVAL,
        "shards": 1,
    }]

  def generate_samples(self, data_dir, tmp_dir, dataset_split):
    #del data_dir
    #del tmp_dir
    #del dataset_split

    train_src = open(os.path.join(data_dir, TRAIN_SRC))
    train_trg = open(os.path.join(data_dir, TRAIN_TRG))

    for src, trg in zip(train_src, train_trg):
        yield {
              "inputs": src.strip(),
              "targets": trg.strip(),
         }