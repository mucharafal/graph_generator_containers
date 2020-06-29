import pandas as pd
import sys

input_path = sys.argv[1]
output_path = input_path

input_dataset = pd.read_csv(input_path, sep="|")
index_columns = list(filter(lambda x: ".id" in x or x == "id", list(input_dataset.columns)))
input_dataset = pd.read_csv(input_path, sep="|", index_col=index_columns)
output_columns = list(input_dataset.columns)
output_columns = list(filter(lambda x: "creationDate" != x, output_columns))
input_dataset[output_columns].to_csv(output_path, sep="|")