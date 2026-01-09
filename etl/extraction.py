import dask.dataframe as dd

def load_data(file_path, block_size="100MB"):
    return dd.read_csv(
        file_path,
        dtype={
            "Metacritic url": "object",
            "Reviews": "object"
        },
        blocksize=block_size,
        assume_missing=True
    )
